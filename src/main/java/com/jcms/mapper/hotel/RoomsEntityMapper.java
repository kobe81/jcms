package com.jcms.mapper.hotel;

import com.jcms.pojo.dto.OrderDto;
import com.jcms.pojo.dto.RoomsDto;
import com.jcms.pojo.entity.hotel.RoomsEntity;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface RoomsEntityMapper {

    int deleteByPrimaryKey(Long id);

    int insert(RoomsEntity record);

    RoomsEntity selectByPrimaryKey(Long id);

    List<RoomsEntity> selectAll();

    int updateByPrimaryKey(RoomsEntity record);

    List<RoomsEntity> getRoomForHotel(Long hotelId);

    int saveReserve(RoomsDto dto) throws Exception;

    int saveOrder(OrderDto dto) throws Exception;

    int updateRooms(@Param("id") Long id,@Param("numbers") Integer numbers)throws Exception;

    Long getOrder(@Param("userId") Long userId,@Param("hotelId") Long hotelId);

    int updateOrder(@Param("orderId") Long orderId,@Param("orderTime")Date orderTime);
}