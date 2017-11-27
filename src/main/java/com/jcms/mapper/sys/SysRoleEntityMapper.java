package com.jcms.mapper.sys;

import com.jcms.pojo.entity.sys.SysRoleEntity;
import java.util.List;

public interface SysRoleEntityMapper {
    int deleteByPrimaryKey(String id);

    int insert(SysRoleEntity record);

    SysRoleEntity selectByPrimaryKey(String id);

    List<SysRoleEntity> selectAll();

    int updateByPrimaryKey(SysRoleEntity record);
}