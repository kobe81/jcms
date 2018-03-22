package com.jcms.mapper.hotel;

import com.jcms.pojo.dto.HotelDto;
import com.jcms.pojo.entity.hotel.HotelEntity;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HotelEntityMapper {

    int deleteByPrimaryKey(Long id);

    int insert(HotelEntity record);

    HotelEntity selectByPrimaryKey(Long id);

    List<HotelDto> selectAll(@Param("hotelName") String hotelName, @Param("level") Integer level, @Param("type") String type);

    int updateByPrimaryKey(HotelEntity record);
}