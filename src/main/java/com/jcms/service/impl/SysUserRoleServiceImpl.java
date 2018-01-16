package com.jcms.service.impl;

import com.jcms.pojo.dto.SysRoleDto;
import com.jcms.service.ISysUserRoleService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: ZYJ
 * @Description: 用户角色
 * @CreateDate: 2018/1/16 20:23
 * @UpdateUser: ZYJ
 * @UpdateUser: 2018/1/16 20:23
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
@Service
public class SysUserRoleServiceImpl implements ISysUserRoleService {

    public List<SysRoleDto> getRoleForUser(String username) {
        return null;
    }
}
