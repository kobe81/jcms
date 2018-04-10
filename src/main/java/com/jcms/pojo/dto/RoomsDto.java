package com.jcms.pojo.dto;

import java.math.BigDecimal;
import java.util.Date;

public class RoomsDto {
    private Long id;

    private Long hotelId;

    private Long roomId;

    private Long userId;

    private Long orderId;

    private Integer mans;

    private String roomType;

    private BigDecimal roomPrice;

    private String remark;

    private Integer numbers;

    private Integer allNumbers;

    private Integer days;

    private Date inTime;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getHotelId() {
        return hotelId;
    }

    public void setHotelId(Long hotelId) {
        this.hotelId = hotelId;
    }

    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType == null ? null : roomType.trim();
    }

    public BigDecimal getRoomPrice() {
        return roomPrice;
    }

    public void setRoomPrice(BigDecimal roomPrice) {
        this.roomPrice = roomPrice;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getNumbers() {
        return numbers;
    }

    public void setNumbers(Integer numbers) {
        this.numbers = numbers;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public Integer getDays() {
        return days;
    }

    public void setDays(Integer days) {
        this.days = days;
    }

    public Date getInTime() {
        return inTime;
    }

    public void setInTime(Date inTime) {
        this.inTime = inTime;
    }

    public Long getRoomId() {
        return roomId;
    }

    public void setRoomId(Long roomId) {
        this.roomId = roomId;
    }

    public Integer getAllNumbers() {
        return allNumbers;
    }

    public void setAllNumbers(Integer allNumbers) {
        this.allNumbers = allNumbers;
    }

    public Integer getMans() {
        return mans;
    }

    public void setMans(Integer mans) {
        this.mans = mans;
    }

    public Long getOrderId() {
        return orderId;
    }

    public void setOrderId(Long orderId) {
        this.orderId = orderId;
    }
}