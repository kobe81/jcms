package com.jcms.service;

import java.util.List;

import com.jcms.pojo.sys.sysUserEntity;

public interface ISysUserService {
	
	Integer saveSysUser(sysUserEntity entity) throws Exception;

	List<sysUserEntity> listSysUser();

	Integer deleteSysUser(List<String> ids) throws RuntimeException;

	Integer updataSysUser(sysUserEntity entity) throws RuntimeException;
}
