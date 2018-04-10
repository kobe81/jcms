package com.jcms.pojo.dto;

import java.util.Date;
import java.util.List;

/**
 * @Author: ZYJ
 * @Description: 订单
 * @CreateDate: 2018/4/5 11:19
 * @UpdateUser: ZYJ
 * @UpdateUser: 2018/4/5 11:19
 * @UpdateRemark: 更新说明
 * @Version: 1.0
 **/
public class OrderDto {

    private Long id;
    private Date orderTime;
    private Long userId;
    private Integer state;
    private Long hotelId;
    private String hotelName;
    private String hotelType;
    private List<OrderItemDto> item;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Date getOrderTime() {
        return orderTime;
    }

    public void setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public List<OrderItemDto> getItem() {
        return item;
    }

    public void setItem(List<OrderItemDto> item) {
        this.item = item;
    }

    public Long getHotelId() {
        return hotelId;
    }

    public void setHotelId(Long hotelId) {
        this.hotelId = hotelId;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public String getHotelType() {
        return hotelType;
    }

    public void setHotelType(String hotelType) {
        this.hotelType = hotelType;
    }
}
