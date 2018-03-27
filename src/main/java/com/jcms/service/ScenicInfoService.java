package com.jcms.service;

import com.jcms.pojo.dto.ScenicInfoDto;
import com.jcms.pojo.entity.scenic.ScenicInfoEntity;

import java.util.List;

/**
 * @Author: hontong
 * @Description: 景区服务
 * @CreateDate: 2018/3/8 20:57
 * @UpdateUser: hontong
 * @UpdateUser: 2018/3/8 20:57
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
public interface ScenicInfoService {

    /**
     * 获取所有的景点
     * @return
     */
    public List<ScenicInfoDto> getScenics();

    /**
     * 获取景点详情
     * @param id
     * @return
     */
    public ScenicInfoDto getScenicInfo(Long id);
}
