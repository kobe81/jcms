package com.jcms.pojo.dto;

/**
 * @Author: hontong
 * @Description: 角色Dto
 * @CreateDate: 2018/1/16 20:32
 * @UpdateUser: hontong
 * @UpdateUser: 2018/1/16 20:32
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
public class SysRoleDto {
    /** 主键 */
    private String id;
    /** 角色名称 */
    private String roleName;
    /** 描述 */
    private String remark;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "SysRoleDto{" +
                "id='" + id + '\'' +
                ", roleName='" + roleName + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
