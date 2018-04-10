package com.jcms.pojo.entity.sys;

public class SysRoleEntity {
	 /** 主键 */ 
	private String id;
	 /** 角色名称 */ 
	private String roleName;
	 /** 描述 */ 
	private String remark;
	 /** 状态 */ 
	private String status;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id == null ? null : id.trim();
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName == null ? null : roleName.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}