package com.jcms.pojo.dto;

import java.math.BigDecimal;
import java.util.Date;

public class OrderItemDto {
    private Long id;

    private Long userId;

    private Long hotelId;

    private Long roomId;

    private Integer numbers;

    private Date stayInTime;

    private Integer days;

    private Integer mans;

    private Long orderId;

    private String roomType;

    private BigDecimal price;

    private String remark;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Long getHotelId() {
        return hotelId;
    }

    public void setHotelId(Long hotelId) {
        this.hotelId = hotelId;
    }

    public Long getRoomId() {
        return roomId;
    }

    public void setRoomId(Long roomId) {
        this.roomId = roomId;
    }

    public Integer getNumbers() {
        return numbers;
    }

    public void setNumbers(Integer numbers) {
        this.numbers = numbers;
    }

    public Date getStayInTime() {
        return stayInTime;
    }

    public void setStayInTime(Date stayInTime) {
        this.stayInTime = stayInTime;
    }

    public Integer getDays() {
        return days;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }

    public Integer getMans() {
        return mans;
    }

    public void setMans(Integer mans) {
        this.mans = mans;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }
}