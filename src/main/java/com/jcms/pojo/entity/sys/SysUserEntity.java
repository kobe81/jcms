package com.jcms.pojo.entity.sys;

import com.jcms.config.CommonConstant;

public class SysUserEntity {
	 /** 主键 */ 
	private Long id;
	/**
	 * 用户名
 	 */
	private String username;
	/**
	 * 手机号
	 */
	private String telephone;
	/**
	 * 电子邮件
	 */
	private String email= CommonConstant.DEFAULT_VALUE;
	/**
	 * 密码
 	 */
	private String password;
	 /** 状态 
	  * 0:删除  1：正常
	  * */ 
	private String status="1";
	/**
	 * 备注
	 */
	private String remark=CommonConstant.DEFAULT_VALUE;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id == null ? null : id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password == null ? null : password.trim();
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone == null ? null : telephone.trim();
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email == null ? null : email.trim();
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
}