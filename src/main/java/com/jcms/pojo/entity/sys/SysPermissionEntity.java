package com.jcms.pojo.entity.sys;

public class SysPermissionEntity {
	 /** 主键 */ 
	private String id;
	 /** 父ID */ 
	private String pid;
	 /** 菜单名称 */ 
	private String permissionName;
	 /** 类型 */ 
	private String type;
	 /** 菜单地址 */ 
	private String menuPath;
	 /** 状态 */ 
	private String status;
	 /** 顺序 */ 
	private Integer order;
	 /** 图标 */ 
	private String icon;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id == null ? null : id.trim();
	}

	public String getPid() {
		return pid;
	}

	public void setPid(String pid) {
		this.pid = pid == null ? null : pid.trim();
	}

	public String getPermissionName() {
		return permissionName;
	}

	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName == null ? null : permissionName.trim();
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type == null ? null : type.trim();
	}

	public String getMenuPath() {
		return menuPath;
	}

	public void setMenuPath(String menuPath) {
		this.menuPath = menuPath == null ? null : menuPath.trim();
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status == null ? null : status.trim();
	}

	public Integer getOrder() {
		return order;
	}

	public void setOrder(Integer order) {
		this.order = order;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon == null ? null : icon.trim();
	}
}