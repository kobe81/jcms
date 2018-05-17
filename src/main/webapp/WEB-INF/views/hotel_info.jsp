<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>酒店</title>
    <style type="text/css">
        .room{
            margin-bottom: 20px;
        }
        .roomMain{
            max-height: 600px;
            overflow-y: auto;
        }
        .pic_show{
                height: 300px;
                overflow: hidden;
        }
        .hotel_title{
            margin-top: 20px;
        }
        .hotel_title p{
            padding: 10px;
        }
        .roomtype{
            font-size: 20px;
            border-bottom: 3px solid #5599dd;
        }
        .roomlist{

            margin-top: 10px;
        }
        .roomInfo{
            border: 1px solid #DDD;
            min-height: 185px;
        }
        .roomInfo p{
            padding: 5px;
            margin-top: 10px;
            margin-left: 10px;
        }
        .but{
            float: right;
            width: 10%;
            margin-top: 10px;
        }
        .but button{
            margin-top: 100px;
        }
        .am-datepicker-dropdown{
            z-index: 90000000;
        }
    </style>
</head>
<body>
<!--header-->
<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>
<!--header-->
<div class="container">
    <div class="hotel_title">
        <h1>${info.hotel.hotelName}</h1>
        <p>地址:<label>${info.hotel.address}</label></p>
    </div>
    <div style="width: 50%">
        <div data-am-widget="slider" class="am-slider am-slider-default pic_show" data-am-slider='{}' >
            <ul class="am-slides">
                <c:forEach items="${info.pics}" var="pics">
                <li>
                    <img src="${ctx}${pics}">

                </li>
                </c:forEach>
            </ul>
        </div>
    </div>
    <div class="room">
        <div class="roomtype">房型</div>
        <div class="roomMain">
        <c:forEach items="${info.rooms}" var="room">
            <div class="roomlist">
                <div class="roomInfo">
                    <div style="float: left;width: 80%;">
                        <p style="color: #37D;font-size: 20px;">${room.roomType}</p>
                        <p>每间床位数：${room.beds}</p>
                        <p>剩余可住房间数：${room.numbers}</p>
                        <p>房间介绍：${room.remark}</p>
                    </div>
                    <div class="but">
                        <label>￥：<label style="color: #F37B1D;">${room.roomPrice}</label></label>
                        <button type="button" ${room.numbers>0?' ':'disabled'} onclick="hotel_info.reserve(${info.hotel.id},${room.id},${room.numbers},${room.beds})" class="am-btn am-btn-xs am-btn-warning">马上预订</button>
                    </div>
                </div>
            </div>
        </c:forEach>
        </div>
    </div>
</div>
<!--footer-->
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
<!--footer-->
<script src="${ctx}/resources/statics/js/hotel_info.js"></script>
</body>
</html>
