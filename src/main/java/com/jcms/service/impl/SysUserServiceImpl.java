package com.jcms.service.impl;

import java.util.List;

import javax.annotation.Resource;

import com.jcms.pojo.dto.SysRoleDto;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.jcms.mapper.sys.SysUserMapper;
import com.jcms.pojo.entity.sys.SysUserEntity;
import com.jcms.service.ISysUserService;

@Service
public class SysUserServiceImpl implements ISysUserService {
	private static Logger log = LoggerFactory.getLogger(SysUserServiceImpl.class);
	
	@Resource
	private SysUserMapper sysmapper;
	
	public Integer saveSysUser(SysUserEntity entity) {
		log.info("进入系统用户保存");
		return sysmapper.insert(entity);
	}
	
	public Integer deleteSysUser(List<String> ids) {
		// TODO Auto-generated method stub
		return null;
	}

	
	public Integer updataSysUser(SysUserEntity entity) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public SysUserEntity getForUserName(String userName) {
		return sysmapper.getForUserName(userName);
	}

	@Override
	public SysUserEntity getForTelephone(String telephone) {
		return sysmapper.getForTelephone(telephone);
	}

}
