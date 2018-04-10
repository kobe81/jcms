<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>酒店订单</title>
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

            border-bottom: 3px solid #5599dd;
        }
        .roomlist{

            margin-top: 10px;
        }
        .roomInfo{
            border: 1px solid #DDD;
            min-height: 185px;
            margin-top: 5px;
        }
        .but{
            padding: 8px;
        }
        .am-datepicker-dropdown{
            z-index: 90000000;
        }
        .am-list {
            margin-bottom: 0rem !important;
        }
        .orderName{
            height: 35px;
            padding: 8px;
            font-size: 15px;
        }
        .orderitem ul li{
            background: #f5f5f5;
            min-height: 70px;
        }
        .orderitem ul li a{
            text-decoration:none;
            margin: 5px;
        }
        .itemLeft{
            width: 85%;
            float: left;
            padding: 15px;
        }
        .itemRight{
            width: 15%;
            float: right;
            padding: 24px;
        }
    </style>
</head>
<body>
<!--header-->
<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>
<!--header-->
<div class="container">

    <div class="room">
        <div class="roomtype">
            <div style="float: left;font-size: 20px;">我的订单</div>
            <div style="width: 80%;font-size: 12px;">
            <ul class="am-nav am-nav-pills">
                <li class="am-active" val="0"><a href="javascript:void(0);">未完成</a></li>
                <li val="1"><a href="javascript:void(0);">已完成</a></li>
            </ul>
            </div>
        </div>
        <div class="roomMain">
            <div id="order" class="roomlist"></div>
        </div>
    </div>
</div>
<!--footer-->
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
<!--footer-->
<script src="${ctx}/resources/statics/js/hotel_order.js"></script>
</body>
</html>
