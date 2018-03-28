package com.jcms.service;

import java.util.List;

import com.jcms.pojo.dto.SysRoleDto;
import com.jcms.pojo.entity.sys.SysUserEntity;

public interface ISysUserService {
	/**
	 * @Author: hontong
	 * @Description: 保存用户
	 * @param:  entity
	 * @return: java.lang.Integer
	 * @Date: 2018/1/15 21:48
	 * @Exception:
	 **/
	Integer saveSysUser(SysUserEntity entity) throws Exception;

	/**
	 * @Author: hontong
	 * @Description: 删除指定用户
	 * @param:   ids
	 * @return: java.lang.Integer
	 * @Date: 2018/1/15 21:48
	 * @Exception:
	 **/
	Integer deleteSysUser(List<String> ids) throws RuntimeException;
	/**
	 * @Author: hontong
	 * @Description: 修改用户信息
	 * @param:  * @param entity
	 * @return: java.lang.Integer
	 * @Date: 2018/1/15 21:49
	 * @Exception:
	 **/
	Integer updataSysUser(SysUserEntity entity) throws RuntimeException;
	/**
	 * @Author: hontong
	 * @Description: 根据用户名称获取指定用户
	 * @param:  userName
	 * @return: com.jcms.pojo.entity.sys.SysUserEntity
	 * @Date: 2018/1/15 21:50
	 * @Exception:
	 **/
	SysUserEntity getForUserName(String userName);

	/**
	 * 根据手机号查询用户
	 * @param telephone
	 * @return
	 */
	SysUserEntity getForTelephone(String telephone);
}
