package com.jcms.mapper.scenic;

import com.jcms.pojo.dto.ScenicDiscussDto;
import com.jcms.pojo.entity.scenic.ScenicDiscussEntity;
import com.jcms.pojo.entity.sys.SysFileEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScenicDiscussEntityMapper {

    int deleteByPrimaryKey(Long id);

    int insert(ScenicDiscussEntity record);

    ScenicDiscussEntity selectByPrimaryKey(Long id);

    List<ScenicDiscussEntity> selectAll();

    List<ScenicDiscussDto> selectDiscuss(@Param("scenicId") Long scenicId);

    int updateByPrimaryKey(ScenicDiscussEntity record);

    List<String> getFile(@Param("joinId")Long joinId);

    int saveFile(SysFileEntity entity);
}