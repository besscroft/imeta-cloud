package com.besscroft.pisces.admin.service;

import com.besscroft.pisces.admin.domain.dto.ResourceDto;
import com.besscroft.pisces.admin.entity.Resource;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;
import java.util.Map;
import java.util.Set;

import static org.junit.jupiter.api.Assertions.assertNotNull;

/**
 * @Description
 * @Author Bess Croft
 * @Date 2022/3/17 21:18
 */
@Slf4j
@SpringBootTest
public class ResourceServiceTest {

    @Autowired
    private ResourceService resourceService;
    @Autowired
    private ObjectMapper objectMapper;

    @Test
    @DisplayName("初始化资源角色规则测试")
    void initRoleResourceMap() throws JsonProcessingException {
        Map<String, List<String>> roleResourceMap = resourceService.initRoleResourceMap();
        assertNotNull(roleResourceMap, "获取资源角色规则失败！");
        log.info("初始化资源角色规则测试成功:{}", objectMapper.writeValueAsString(roleResourceMap));
    }

    @Test
    @DisplayName("获取资源列表（分页）方法测试")
    void getResourceListPage() throws JsonProcessingException {
        Integer pageNumber = 1;
        Integer pageSize = 10;
        String queryKey = "";
        List<Resource> listPage = resourceService.getResourceListPage(pageNumber, pageSize, queryKey);
        assertNotNull(listPage);
        log.info("获取资源列表（分页）方法测试成功:{}", objectMapper.writeValueAsString(listPage));
    }

    @Test
    @DisplayName("获取所有资源树方法测试")
    void getAll() throws JsonProcessingException {
        List<ResourceDto> resourceDtoList = resourceService.getAll();
        assertNotNull(resourceDtoList);
        log.info("获取所有资源树方法测试成功:{}", objectMapper.writeValueAsString(resourceDtoList));
    }

    @Test
    @DisplayName("根据角色 id 获取资源 id 列表测试")
    void getIdsByRoleId() throws JsonProcessingException {
        Long roleId = 2L;
        Set<Long> ids = resourceService.getIdsByRoleId(roleId);
        assertNotNull(ids);
        log.info("根据角色 id 获取资源 id 列表测试成功:{}", objectMapper.writeValueAsString(ids));
    }

}
