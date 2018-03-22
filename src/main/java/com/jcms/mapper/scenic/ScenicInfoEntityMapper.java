package com.jcms.mapper.scenic;

import com.jcms.pojo.dto.ScenicInfoDto;
import com.jcms.pojo.entity.scenic.ScenicInfoEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ScenicInfoEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(ScenicInfoEntity record);

    ScenicInfoDto selectByPrimaryKey(@Param("id") Long id);

    List<ScenicInfoDto> selectAll();

    int updateByPrimaryKey(ScenicInfoEntity record);
}