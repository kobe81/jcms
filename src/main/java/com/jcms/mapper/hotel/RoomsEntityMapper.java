package com.jcms.mapper.hotel;

import com.jcms.pojo.dto.RoomsDto;
import com.jcms.pojo.entity.hotel.RoomsEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface RoomsEntityMapper {

    int deleteByPrimaryKey(Long id);

    int insert(RoomsEntity record);

    RoomsEntity selectByPrimaryKey(Long id);

    List<RoomsEntity> selectAll();

    int updateByPrimaryKey(RoomsEntity record);

    List<RoomsEntity> getRoomForHotel(Long hotelId);

    int saveReserve(RoomsDto dto) throws Exception;

    int updateRooms(@Param("id") Long id,@Param("numbers") Integer numbers)throws Exception;
}