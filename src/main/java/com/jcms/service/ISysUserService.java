package com.jcms.service;

import java.util.List;

import com.jcms.pojo.dto.SysRoleDto;
import com.jcms.pojo.entity.sys.SysUserEntity;

public interface ISysUserService {
	/**
	 * @Author: ZYJ
	 * @Description: 保存用户
	 * @param:  entity
	 * @return: java.lang.Integer
	 * @Date: 2018/1/15 21:48
	 * @Exception:
	 **/
	Integer saveSysUser(SysUserEntity entity) throws Exception;

	/**
	 * @Author: ZYJ
	 * @Description: 查询用户列表
	 * @param:
	 * @return: java.util.List<com.jcms.pojo.entity.sys.SysUserEntity>
	 * @Date: 2018/1/15 21:48
	 * @Exception:
	 **/
	 List<SysUserEntity> listSysUser();

	/**
	 * @Author: ZYJ
	 * @Description: 删除指定用户
	 * @param:   ids
	 * @return: java.lang.Integer
	 * @Date: 2018/1/15 21:48
	 * @Exception:
	 **/
	Integer deleteSysUser(List<String> ids) throws RuntimeException;
	/**
	 * @Author: ZYJ
	 * @Description: 修改用户信息
	 * @param:  * @param entity
	 * @return: java.lang.Integer
	 * @Date: 2018/1/15 21:49
	 * @Exception:
	 **/
	Integer updataSysUser(SysUserEntity entity) throws RuntimeException;
	/**
	 * @Author: ZYJ
	 * @Description: 根据用户名称获取指定用户
	 * @param:  userName
	 * @return: com.jcms.pojo.entity.sys.SysUserEntity
	 * @Date: 2018/1/15 21:50
	 * @Exception:
	 **/
	SysUserEntity getForUserName(String userName);
	/**
	 * @Author: ZYJ
	 * @Description: 根据用户名获取用户角色
	 * @param:  username
	 * @return: java.lang.String
	 * @Date: 2018/1/16 20:19
	 * @Exception:
	 **/
	public List<SysRoleDto> getRoleForUser(String username);
}
