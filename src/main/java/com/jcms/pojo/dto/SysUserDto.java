package com.jcms.pojo.dto;

import java.time.LocalDateTime;
import java.util.Date;

public class SysUserDto {
	
	/**
	 * 用户账号
	 */
	private String username;
	/**
	 * 用户密码
	 */
	private String password;
	
	/**
	 * 登录时间
	 */
	private LocalDateTime loginTime;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public LocalDateTime getLoginTime() {
		return loginTime;
	}
	public void setLoginTime(LocalDateTime loginTime) {
		this.loginTime = loginTime;
	}
	
}
