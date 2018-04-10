package com.jcms.test;

import com.jcms.pojo.dto.HotelDto;
import com.jcms.service.impl.HotelServiceImpl;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * @author hongtong
 * date: 2018/4/9
 */
public class HotelTest {

    @Autowired
    private HotelServiceImpl hotelService;

    @Test
    public void hotelTest() {
        List<HotelDto> list = hotelService.getHotelList("测试", null, "", "");
        for(HotelDto hotelDto:list){
            System.out.println("1111111111111111111"+hotelDto.toString());
        }
    }
}
