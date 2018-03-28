package com.jcms.pojo.dto;


import com.jcms.config.CommonConstant;

import java.time.LocalDateTime;

public class SysUserDto {
	
	/**
	 * 用户名/手机号
	 */
	private String number;
	/**
	 * 用户密码
	 */
	private String password;
	
	/**
	 * 是否记住密码
	 */
	private Boolean rememberPsd= CommonConstant.NOT_SELECT;

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getRememberPsd() {
		return rememberPsd;
	}

	public void setRememberPsd(Boolean rememberPsd) {
		this.rememberPsd = rememberPsd;
	}
}
