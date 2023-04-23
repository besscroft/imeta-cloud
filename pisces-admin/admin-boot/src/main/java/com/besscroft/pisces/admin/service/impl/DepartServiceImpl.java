package com.besscroft.pisces.admin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.besscroft.pisces.admin.converter.DepartConverterMapper;
import com.besscroft.pisces.admin.domain.dto.DepartDictDto;
import com.besscroft.pisces.admin.domain.dto.DepartDto;
import com.besscroft.pisces.admin.domain.dto.DepartTreeDto;
import com.besscroft.pisces.framework.common.entity.Depart;
import com.besscroft.pisces.admin.event.ClearCacheEvent;
import com.besscroft.pisces.admin.mapper.DepartMapper;
import com.besscroft.pisces.admin.service.DepartService;
import com.besscroft.pisces.framework.common.constant.SystemDictConstants;
import com.github.pagehelper.PageHelper;
import lombok.RequiredArgsConstructor;
import org.springframework.context.ApplicationEventPublisher;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.lang.NonNull;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.Assert;
import org.springframework.util.CollectionUtils;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @Description 部门服务实现类
 * @Author Bess Croft
 * @Date 2022/2/5 12:39
 */
@Service
@RequiredArgsConstructor
public class DepartServiceImpl extends ServiceImpl<DepartMapper, Depart> implements DepartService {

    private final RedisTemplate<String, Object> redisTemplate;
    private final ApplicationEventPublisher eventPublisher;

    @Override
    public List<DepartDto> getDepartListPage(Integer pageNum, Integer pageSize, String queryKey) {
        PageHelper.startPage(pageNum, pageSize);
        List<DepartDto> departDtos = new ArrayList<>();
        List<Depart> departList = this.baseMapper.selectAllByQueryKey(queryKey);
        if (!CollectionUtils.isEmpty(departList)) {
            departDtos = DepartConverterMapper.INSTANCE.DepartToDepartDtoList(departList);
            // 处理菜单
            departDtos = getDepartDtos(departDtos);
        }
        return departDtos;
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void deleteDepart(@NonNull Long departId) {
        eventPublisher.publishEvent(new ClearCacheEvent(SystemDictConstants.DEPART));
        Assert.isTrue(this.baseMapper.deleteById(departId) > 0, "删除部门失败！");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void addDepart(@NonNull Depart depart) {
        eventPublisher.publishEvent(new ClearCacheEvent(SystemDictConstants.DEPART));
        Assert.isTrue(this.baseMapper.insert(depart) > 0, "新增部门失败！");
    }

    @Override
    @Transactional(rollbackFor = Exception.class)
    public void updateDepart(@NonNull Depart depart) {
        eventPublisher.publishEvent(new ClearCacheEvent(SystemDictConstants.DEPART));
        Assert.isTrue(this.baseMapper.updateById(depart) > 0, "更新部门失败！");
    }

    @Override
    public List<DepartDictDto> getDepartDict() {
        List<DepartDictDto> departDictDtoList = (List<DepartDictDto>) redisTemplate.opsForValue().get(SystemDictConstants.DEPART);
        if (CollectionUtils.isEmpty(departDictDtoList)) {
            synchronized (this) {
                departDictDtoList = (List<DepartDictDto>) redisTemplate.opsForValue().get(SystemDictConstants.DEPART);
                if (CollectionUtils.isEmpty(departDictDtoList)) {
                    List<Depart> departList = this.list();
                    departDictDtoList = departList.stream().map(depart -> {
                        DepartDictDto departDictDto = new DepartDictDto();
                        departDictDto.setDepartId(depart.getId());
                        departDictDto.setDepartName(depart.getName());
                        return departDictDto;
                    }).collect(Collectors.toList());
                    redisTemplate.opsForValue().set(SystemDictConstants.DEPART, departDictDtoList);
                }
            }
        }
        return departDictDtoList;
    }

    @Override
    public List<DepartTreeDto> getUserDepartList() {
        List<Depart> departList = this.baseMapper.selectAllByQueryKey("");
        if (CollectionUtils.isEmpty(departList)) {
            return new ArrayList<>();
        }
        List<DepartDto> departDtoList = DepartConverterMapper.INSTANCE.DepartToDepartDtoList(departList);
        departDtoList = getDepartDtos(departDtoList);
        return DepartConverterMapper.INSTANCE.DepartDtoToDepartTreeDtoList(departDtoList);
    }

    /**
     * 部门树层级处理
     * @param departDtoList 部门
     * @return 部门
     */
    private List<DepartDto> getDepartDtos(@NonNull List<DepartDto> departDtoList) {
        List<DepartDto> parentDeparts = departDtoList.stream().filter(departDto -> departDto.getParentId() == 0).collect(Collectors.toList());
        if (CollectionUtils.isEmpty(parentDeparts)) {
            return parentDeparts;
        }
        List<DepartDto> departDtos = departDtoList.stream().filter(departDto -> departDto.getParentId() != 0).collect(Collectors.toList());
        parentDeparts.forEach(departDto -> {
            List<DepartDto> childDepart = getChildDepart(departDto.getId(), departDtos);
            departDto.setChildren(childDepart);
        });
        return parentDeparts;
    }

    /**
     * 部门递归
     * @param departId 部门 id
     * @param departDtoList 子部门集合
     * @return 菜单
     */
    private List<DepartDto> getChildDepart(@NonNull Long departId, @NonNull List<DepartDto> departDtoList) {
        List<DepartDto> departDtos = departDtoList.stream().filter(departDto -> departDto.getParentId() == departId).collect(Collectors.toList());
        departDtos.forEach(departDto -> {
            List<DepartDto> childDepart = getChildDepart(departDto.getId(), departDtoList);
            departDto.setChildren(childDepart);
        });
        return departDtos;
    }

}
