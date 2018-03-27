package com.jcms.service;

import com.jcms.pojo.dto.SysRoleDto;

import java.util.List;

public interface ISysUserRoleService {
    /**
     * @Author: hontong
     * @Description: 根据用户名获取用户角色
     * @param:  username
     * @return: java.lang.String
     * @Date: 2018/1/16 20:19
     * @Exception: 
     **/
    public List<SysRoleDto> getRoleForUser(String username);
}
