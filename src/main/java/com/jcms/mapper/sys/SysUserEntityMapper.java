package com.jcms.mapper.sys;

import java.util.List;

import com.jcms.pojo.entity.sys.SysUserEntity;

public interface SysUserEntityMapper {
	
    int deleteByPrimaryKey(String id);

    int insert(SysUserEntity entity);

    SysUserEntity selectByPrimaryKey(String id);

    List<SysUserEntity> selectAll();

    int updateByPrimaryKey(SysUserEntity entity);
}