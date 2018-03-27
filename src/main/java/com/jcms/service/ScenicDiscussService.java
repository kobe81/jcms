package com.jcms.service;

import com.jcms.pojo.dto.ScenicDiscussDto;
import com.jcms.pojo.entity.scenic.ScenicDiscussEntity;

import java.util.List;

/**
 * @Author: hontong
 * @Description: 景点点评
 * @CreateDate: 2018/3/23 22:43
 * @UpdateUser: hontong
 * @UpdateUser: 2018/3/23 22:43
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
public interface ScenicDiscussService {

    /**
     * 获取景点点评
     * @param scenicId
     * @return
     */
    public List<ScenicDiscussDto> getDiscuss(Long scenicId);

    public void saveDiscuss(ScenicDiscussEntity discussEntity,String files,String path) throws Exception;
}
