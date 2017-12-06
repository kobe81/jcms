package com.jcms.mapper.sys;

import com.jcms.pojo.entity.sys.SysPermissionEntity;
import java.util.List;

public interface SysPermissionMapper {
    int deleteByPrimaryKey(String id);

	int insert(SysPermissionEntity record);

	SysPermissionEntity selectByPrimaryKey(String id);

	List<SysPermissionEntity> selectAll();

	int updateByPrimaryKey(SysPermissionEntity record);

}