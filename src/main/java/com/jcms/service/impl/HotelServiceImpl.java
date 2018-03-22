package com.jcms.service.impl;

import com.jcms.mapper.hotel.HotelEntityMapper;
import com.jcms.mapper.hotel.RoomsEntityMapper;
import com.jcms.pojo.dto.HotelDto;
import com.jcms.pojo.dto.HotelInfoDto;
import com.jcms.pojo.dto.RoomsDto;
import com.jcms.pojo.entity.hotel.HotelEntity;
import com.jcms.pojo.entity.hotel.RoomsEntity;
import com.jcms.service.HotelService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: ZYJ
 * @Description: TODO
 * @CreateDate: 2018/3/15 20:46
 * @UpdateUser: ZYJ
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
    public List<HotelDto> getHotelList(String hotelName, Integer level, String type) {
        return mapper.selectAll(hotelName,level,type);
    }

    @Override
    public Map<String,Object> getHoteInfo(Long id) {
        Map<String,Object> infos=new HashMap<>();
        //获取酒店详情
        HotelEntity hotel=mapper.selectByPrimaryKey(id);
        infos.put("hotel",hotel);
        //获取酒店房间
        List<RoomsEntity> rooms=roomsMapper.getRoomForHotel(id);
        infos.put("rooms",rooms);
        return infos;
    }

    @Override
    public void saveReserve(RoomsDto dto) throws Exception {
        roomsMapper.saveReserve(dto);
        //修改剩余房间数
        int nums=dto.getAllNumbers()-dto.getNumbers();
        roomsMapper.updateRooms(dto.getRoomId(),nums);
    }
}
