package com.jcms.service;

import com.jcms.pojo.dto.HotelDto;
import com.jcms.pojo.dto.HotelInfoDto;
import com.jcms.pojo.dto.RoomsDto;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @Author: hontong
 * @Description: 酒店服务
 * @CreateDate: 2018/3/15 20:37
 * @UpdateUser: hontong
 * @UpdateUser: 2018/3/15 20:37
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
public interface HotelService {

    /**
     * 查询酒店列表
     * @param hotelName
     * @param level
     * @param type
     * @return
     */
    public List<HotelDto> getHotelList(String hotelName,Integer level,String type);
    /**
     * 查询酒店详情
     * @param id
     * @return
     */
    public Map<String,Object> getHoteInfo(Long id);

    /**
     * 酒店预订
     * @param dto
     * @throws Exception
     */
    public void saveReserve(RoomsDto dto) throws Exception;

}
