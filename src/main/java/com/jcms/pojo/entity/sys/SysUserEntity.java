package com.jcms.pojo.entity.sys;

public class SysUserEntity {
	 /** 主键 */ 
	private String id;
	 /** 账号 */ 
	private String username;
	 /** 昵称 */ 
	private String nickname;
	 /** 密码 */ 
	private String password;
	 /** 联系电话 */ 
	private String telephone;
	 /** 电子邮件 */ 
	private String email;
	 /** 用户类型 */ 
	private String type;
	 /** 状态 
	  * 0:删除  1：正常  2：锁定  3：未启用
	  * */ 
	private String status;
	/** 备注 */ 
	private String remark;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username == null ? null : username.trim();
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname == null ? null : nickname.trim();
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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