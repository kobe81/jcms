package com.jcms.mapper.scenic;

import com.jcms.pojo.entity.sys.SysFileEntity;
import java.util.List;

public interface SysFileEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(SysFileEntity record);

    SysFileEntity selectByPrimaryKey(Long id);

    List<SysFileEntity> selectAll();

    int updateByPrimaryKey(SysFileEntity record);
}