package com.jcms.mapper.scenic;

import com.jcms.pojo.entity.scenic.ScenicDiscussEntity;
import java.util.List;

public interface ScenicDiscussEntityMapper {

    int deleteByPrimaryKey(Long id);

    int insert(ScenicDiscussEntity record);

    ScenicDiscussEntity selectByPrimaryKey(Long id);

    List<ScenicDiscussEntity> selectAll();

    int updateByPrimaryKey(ScenicDiscussEntity record);
}