package com.jcms.service;

import java.util.List;

import com.jcms.pojo.entity.sys.SysUserEntity;

public interface ISysUserService {
	
	Integer saveSysUser(SysUserEntity entity) throws Exception;

	List<SysUserEntity> listSysUser();

	Integer deleteSysUser(List<String> ids) throws RuntimeException;

	Integer updataSysUser(SysUserEntity entity) throws RuntimeException;
}
