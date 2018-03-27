package com.jcms.service.impl;

import com.jcms.mapper.scenic.ScenicInfoEntityMapper;
import com.jcms.pojo.dto.ScenicInfoDto;
import com.jcms.pojo.entity.scenic.ScenicInfoEntity;
import com.jcms.service.ScenicInfoService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: hontong
 * @Description: 景点详情展示
 * @CreateDate: 2018/3/11 13:46
 * @UpdateUser: hontong
 * @UpdateUser: 2018/3/11 13:46
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
@Service
public class ScenicInfoServiceImpl implements ScenicInfoService{

    @Resource
    private ScenicInfoEntityMapper mapper;

    @Override
    public List<ScenicInfoDto> getScenics() {
        return mapper.selectAll();
    }

    @Override
    public ScenicInfoDto getScenicInfo(Long id) {
        return mapper.selectByPrimaryKey(id);
    }
}
