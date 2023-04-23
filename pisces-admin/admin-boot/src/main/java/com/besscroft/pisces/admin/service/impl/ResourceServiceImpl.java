package com.besscroft.pisces.admin.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.besscroft.pisces.admin.domain.dto.ResourceDto;
import com.besscroft.pisces.admin.domain.dto.RoleResourceRelationDto;
import com.besscroft.pisces.admin.event.ClearCacheEvent;
import com.besscroft.pisces.admin.mapper.DictMapper;
import com.besscroft.pisces.admin.mapper.ResourceCategoryMapper;
import com.besscroft.pisces.admin.mapper.ResourceMapper;
import com.besscroft.pisces.admin.mapper.RoleMapper;
import com.besscroft.pisces.admin.service.ResourceService;
import com.besscroft.pisces.framework.common.entity.*;
import com.besscroft.pisces.framework.common.constant.AuthConstants;
import com.besscroft.pisces.framework.common.enums.DictGroupEnum;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import lombok.SneakyThrows;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;

import java.util.*;
import java.util.stream.Collectors;

/**
 * @Description 资源服务实现类
 * @Author Bess Croft
 * @Date 2022/2/5 12:38
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class ResourceServiceImpl extends ServiceImpl<ResourceMapper, Resource> implements ResourceService {

    private final RedisTemplate<String, Object> redisTemplate;
    private final RoleMapper roleMapper;
    private final ResourceCategoryMapper resourceCategoryMapper;
    private final DictMapper dictMapper;
    private final static ObjectMapper objectMapper = new ObjectMapper();
    private final ApplicationEventPublisher eventPublisher;

    @Override
    @SneakyThrows
    public Map<String, List<String>> initRoleResourceMap() {
        Map<String,List<String>> roleResourceMap = new TreeMap<>();
        List<Resource> resourceList = this.list();
        List<Role> roleList = roleMapper.selectList(new QueryWrapper<>());
        List<RoleResourceRelationDto> roleResourceRelationList = roleMapper.findRoleResourceRelation();
        for (Resource resource: resourceList) {
            Set<Long> roleIds = roleResourceRelationList.stream().filter(item ->
                            item.getResourceId().equals(resource.getId())
                    ).map(RoleResourceRelationDto::getRoleId)
                    .collect(Collectors.toSet());
            List<String> roleNames = roleList.stream().filter(item ->
                    roleIds.contains(item.getId())
            ).map(item ->
                    // 格式:ROLE_{roleId}_{roleName}
                    AuthConstants.AUTHORITY_PREFIX + item.getId() + "_" + item.getRoleName()
            ).collect(Collectors.toList());
            // 查询资源分组字典
            List<Dict> dictList = dictMapper.selectAllByGroup(DictGroupEnum.RESOURCE.getValue());
            // key为访问路径/资源路径，value为角色
            dictList.forEach(dict -> {
                if (dict.getKey().equals(resource.getRouteKey())) {
                    roleResourceMap.put("/" + dict.getValue() + resource.getUrl(), roleNames);
                }
            });
        }
        redisTemplate.delete(AuthConstants.PERMISSION_RULES_KEY);
        redisTemplate.opsForHash().putAll(AuthConstants.PERMISSION_RULES_KEY, roleResourceMap);
        log.info("权限初始化成功.[RoleResourceMap={}]", objectMapper.writeValueAsString(roleResourceMap));
        return roleResourceMap;
    }

    @Override
    public List<Resource> getResourceListPage(Integer pageNum, Integer pageSize, String queryKey) {
        PageHelper.startPage(pageNum, pageSize);
        return this.baseMapper.selectAllByQueryKey(queryKey);
    }

    @Override
    public List<ResourceDto> getAll() {
        List<ResourceCategory> resourceCategoryList = resourceCategoryMapper.selectList(new QueryWrapper<>());
        List<Resource> resourceList = this.list();
        return getResourceDto(resourceCategoryList, resourceList);
    }

    @Override
    public Set<Long> getIdsByRoleId(@NonNull Long roleId) {
        List<Resource> resourceList = this.baseMapper.findAllByRoleId(roleId);
        return resourceList.stream().map(Resource::getId).collect(Collectors.toSet());
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteResource(@NonNull Long resourceId) {
        // 监听事务，资源信息逻辑删除事务提交后，删除角色资源缓存
        eventPublisher.publishEvent(new ClearCacheEvent(AuthConstants.PERMISSION_RULES_KEY));
        Assert.isTrue(this.baseMapper.deleteById(resourceId) > 0, "资源假删除失败！");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addResource(@NonNull Resource resource) {
        Assert.isTrue(this.baseMapper.insert(resource) > 0, "新增资源失败！");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateResource(@NonNull Resource resource) {
        // 监听事务，资源信息更新事务提交后，删除角色资源缓存
        eventPublisher.publishEvent(new ClearCacheEvent(AuthConstants.PERMISSION_RULES_KEY));
        Assert.isTrue(this.baseMapper.updateById(resource) > 0, "更新资源失败！");
    }

    /**
     * 资源树处理
     * @param categoryList 资源类别集合
     * @param resourceList 资源集合
     * @return 资源树
     */
    private List<ResourceDto> getResourceDto(@NonNull List<ResourceCategory> categoryList, @NonNull List<Resource> resourceList) {
        List<ResourceDto> resourceDtoList = new ArrayList<>();
        categoryList.forEach(resourceCategory -> {
            ResourceDto dto = new ResourceDto();
            dto.setName(resourceCategory.getCategoryName());
            dto.setDescription(resourceCategory.getDescription());
            // 获取子资源树
            List<ResourceDto> resources = resourceList.stream()
                    .filter(resource -> resource.getCategoryId() == resourceCategory.getId())
                    .map(resource -> {
                        ResourceDto resourceDto = new ResourceDto();
                        resourceDto.setId(resource.getId());
                        resourceDto.setUrl(resource.getUrl());
                        resourceDto.setName(resource.getName());
                        resourceDto.setDescription(resource.getDescription());
                        return resourceDto;
                    })
                    .collect(Collectors.toList());
            dto.setChildren(resources);
            resourceDtoList.add(dto);
        });
        return resourceDtoList;
    }

}
