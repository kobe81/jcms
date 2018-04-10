package com.jcms.service.impl;

import com.jcms.mapper.hotel.HotelEntityMapper;
import com.jcms.mapper.hotel.RoomsEntityMapper;
import com.jcms.pojo.dto.HotelDto;
import com.jcms.pojo.dto.HotelInfoDto;
import com.jcms.pojo.dto.OrderDto;
import com.jcms.pojo.dto.RoomsDto;
import com.jcms.pojo.entity.hotel.HotelEntity;
import com.jcms.pojo.entity.hotel.RoomsEntity;
import com.jcms.service.HotelService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import javax.annotation.Resource;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: hontong
 * @Description:
 * @CreateDate: 2018/3/15 20:46
 * @UpdateUser: hontong
 * @UpdateUser: 2018/3/15 20:46
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
@Service
public class HotelServiceImpl implements HotelService {

    @Resource
    private HotelEntityMapper mapper;

    @Resource
    private RoomsEntityMapper roomsMapper;

    @Override
    public List<HotelDto> getHotelList(String hotelName, Integer level, String type,String price) {
        String[] prices=new String[]{};
        if (null!=price&&!"".equals(price)){
            prices=price.split("-");
            if (prices.length<2){
                return mapper.selectAll(hotelName,level,type,prices[0],null);
            }else{
                return mapper.selectAll(hotelName,level,type,prices[0],prices[1]);
            }

        }else{
            return mapper.selectAll(hotelName,level,type,null,null);
        }
    }

    @Override
    public Map<String,Object> getHoteInfo(Long id) {
        Map<String,Object> infos=new HashMap<>();
        //获取酒店详情
        HotelEntity hotel=mapper.selectByPrimaryKey(id);
        infos.put("hotel",hotel);
        //获取轮播展示图片
        List<String> files=mapper.getHotelFile(id);
        infos.put("pics",files);
        //获取酒店房间
        List<RoomsEntity> rooms=roomsMapper.getRoomForHotel(id);
        infos.put("rooms",rooms);
        return infos;
    }

    @Override
    public void saveReserve(RoomsDto dto) throws Exception {
        //查找订单，如果没有就先生成订单
        Long orderId=roomsMapper.getOrder(dto.getUserId(),dto.getHotelId());
        if(null==orderId){
        //新增一个订单
            OrderDto orderDto=new OrderDto();
            orderDto.setOrderTime(new Date());
            orderDto.setState(0);
            orderDto.setUserId(dto.getUserId());
            orderDto.setHotelId(dto.getHotelId());
            roomsMapper.saveOrder(orderDto);
            orderId=orderDto.getId();
        }else{
            //修改订单时间
            roomsMapper.updateOrder(orderId,new Date());
        }
        dto.setOrderId(orderId);
        roomsMapper.saveReserve(dto);
        //修改剩余房间数
        int nums=dto.getAllNumbers()-dto.getNumbers();
        roomsMapper.updateRooms(dto.getRoomId(),nums);
    }
}
