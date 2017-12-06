package com.jcms.mapper.sys;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.jcms.pojo.entity.sys.SysUserEntity;

public interface SysUserMapper {
	
    int deleteByPrimaryKey(String id);

    int insert(SysUserEntity entity);

    SysUserEntity selectByPrimaryKey(String id);

    List<SysUserEntity> selectAll();

    int updateByPrimaryKey(SysUserEntity entity);
    
    SysUserEntity getForUserName(@Param("userName") String userName);
}