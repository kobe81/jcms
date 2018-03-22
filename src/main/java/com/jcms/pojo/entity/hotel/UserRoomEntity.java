package com.jcms.pojo.entity.hotel;

import java.util.Date;

public class UserRoomEntity {
    private Long id;

    private Long userId;

    private Long hotelId;

    private Long roomId;

    private Integer numbers;

    private Date stayInTime;

    private Integer days;

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
}