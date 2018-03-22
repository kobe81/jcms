package com.jcms.mapper.hotel;

import com.jcms.pojo.entity.hotel.UserRoomEntity;
import java.util.List;

public interface UserRoomEntityMapper {
    int deleteByPrimaryKey(Long id);

    int insert(UserRoomEntity record);

    UserRoomEntity selectByPrimaryKey(Long id);

    List<UserRoomEntity> selectAll();

    int updateByPrimaryKey(UserRoomEntity record);
}