package com.jcms.mapper.sys;

import com.jcms.pojo.sys.sysUserEntity;
import java.util.List;

public interface SysUserEntityMapper {
	
    int deleteByPrimaryKey(String id);

    int insert(sysUserEntity entity);

    sysUserEntity selectByPrimaryKey(String id);

    List<sysUserEntity> selectAll();

    int updateByPrimaryKey(sysUserEntity entity);
}