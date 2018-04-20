package com.jcms.service.impl;

import com.jcms.mapper.hotel.OrderMapper;
import com.jcms.mapper.hotel.RoomsEntityMapper;
import com.jcms.pojo.dto.OrderDto;
import com.jcms.pojo.dto.OrderItemDto;
import com.jcms.pojo.entity.hotel.RoomsEntity;
import com.jcms.service.OrderService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * @Author: hongtong
 * @Description: 订单
 * @CreateDate: 2018/4/5 13:57
 * @UpdateUser: hongtong
 * @UpdateUser: 2018/4/5 13:57
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
@Service
public class OrderServiceImpl implements OrderService {

    @Resource
    private OrderMapper orderMapper;

    @Resource
    private RoomsEntityMapper roomsMapper;

    @Override
    public List<OrderDto> getOrder(Long userId,Integer state) {
       List<OrderDto> orders=orderMapper.getOrder(userId,state);
        for (OrderDto order:orders) {
            List<OrderItemDto> item=orderMapper.getOrderItem(order.getId());
            order.setItem(item);
        }
        return orders;
    }

    @Override
    public void delOrder(Long orderId) throws Exception {
        //修改剩余房间数
        List<OrderItemDto> items=orderMapper.getOrderItem(orderId);
        for (OrderItemDto item:items) {
            RoomsEntity rooms=roomsMapper.selectByPrimaryKey(item.getRoomId());
            int nums=item.getNumbers()+rooms.getNumbers();
            roomsMapper.updateRooms(item.getRoomId(),nums);
        }
        orderMapper.delOrder(orderId);
        orderMapper.delOrderALL(orderId);
    }

    @Override
    public void delOrderDetail(Long detailId,Long roomId,Integer nums,Long orderId) throws Exception {
        //修改剩余房间数
        RoomsEntity rooms=roomsMapper.selectByPrimaryKey(roomId);
        int num=nums+rooms.getNumbers();
        roomsMapper.updateRooms(roomId,num);
        orderMapper.delOrderDetail(detailId);
        //如果没有订单了删除
        List<OrderItemDto> item=orderMapper.getOrderItem(orderId);
        if (item.size()<=0){
            orderMapper.delOrder(orderId);
        }

    }
}
