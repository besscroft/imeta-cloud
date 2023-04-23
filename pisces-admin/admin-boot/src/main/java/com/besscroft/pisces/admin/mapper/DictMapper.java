package com.besscroft.pisces.admin.mapper;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.besscroft.pisces.framework.common.entity.Dict;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @Description 字典 Mapper 接口
 * @Author Bess Croft
 * @Date 2022/8/5 14:20
 */
public interface DictMapper extends BaseMapper<Dict> {

    /**
     * 根据字典分组查询字典列表
     * @param groupName 字典分组名称
     * @return 字典列表
     */
    List<Dict> selectAllByGroup(@Param("groupName") String groupName);

    /**
     * 根据查询参数查询所有数据
     * @param queryKey 查询参数
     * @return 字典列表
     */
    List<Dict> selectAllByQueryKey(@Param("queryKey") String queryKey);

}
