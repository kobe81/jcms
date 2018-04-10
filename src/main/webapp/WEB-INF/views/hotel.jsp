<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>酒店</title>
    <style type="text/css">
        .hotel{
            min-height:1000px;
        }
        .mt{margin-top: 100px;}
        .mt10{margin-top: 10px;}
        .left{
            height: 500px;
            float: left;
            width: 38%;
            border: 1px solid #2F79DB;
        }
        .right{
            float: right;
            width: 60%;
        }
        .table{
            text-align: center;
            width: 100%;
            margin-top: 10px;
        }
        .tit{
            background: #3983E5;
            color: #fff;
            margin-bottom: 20px;
            height: 50px;
            font-size: 25px;
        }
        .right .pic{
            height: 165px;
            border: 1px solid #5599dd;
        }
        .hot{
            font-size: 20px;
            border-bottom: 3px solid #5599dd;
        }
        .list{
            min-height: 700px;
            max-height: 700px;
            overflow-y: auto;
        }
        .list li{
            min-height: 150px;
        }
        .listimg{
            width: 30%;
            float: left;
        }
        .info{
            float: right;
            width: 70%;
        }
        .info .ml{
            width: 70%;
            float: left;
        }
        .info .price{
            width: 20%;
            float: right;
        }
        .color_y{
            color: #F37B1D;
        }
    </style>

</head>
<body>
<!--header-->
<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>
<!--header-->
<div class="hotel container">
<div class="mt left am-radius">
    <div class="tit">
    <span style="margin-left: 20px;">酒店搜索</span>
    </div>
    <form class="am-form am-form-horizontal">

        <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">酒店名称</label>
            <div class="am-u-sm-9">
                <input type="text" id="name" class="am-form-field" placeholder="输入酒店名称">
            </div>
        </div>
        <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">酒店星级</label>
            <div class="am-u-sm-9">
                <select id="level">
                    <option value="">不限</option>
                    <option value="1">一星级</option>
                    <option value="2">二星级</option>
                    <option value="3">三星级</option>
                    <option value="4">四星级</option>
                    <option value="5">五星级</option>
                </select>
            </div>
        </div>
        <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">酒店类型</label>
            <div class="am-u-sm-9">
                <select id="type">
                    <option value="">不限</option>
                    <option value="民宿">民宿</option>
                    <option value="连锁">连锁</option>
                    <option value="国际">国际</option>
                    <option value="青旅">青旅</option>
                </select>
            </div>
        </div>
        <div class="am-form-group">
            <label class="am-u-sm-3 am-form-label">价格</label>
            <div class="am-u-sm-9">
                <select id="price">
                    <option value="">不限</option>
                    <option value="100-200">100-200</option>
                    <option value="200-300">200-300</option>
                    <option value="300-400">300-400</option>
                    <option value="400">400以上</option>
                </select>
            </div>
        </div>
        <div class="am-form-group">
            <div class="am-u-sm-12 am-u-sm-offset-9">
                <button type="button" onclick="hotel.init_list('query')" class="am-btn am-btn-primary am-radius">搜&nbsp;&nbsp;索</button>
            </div>
        </div>
    </form>
</div>
<div class="mt right">
    <div class="pic">
        <img src="${ctx}/resources/showtemp/background/hotel.jpg" class="am-img-thumbnail am-radius"/>
    </div>
    <div class="mt10">
        <div class="hot">
            热门酒店
        </div>
        <%--酒店列表--%>
        <div class="list">
            <ul id="hotellist" class="am-list am-list-static"></ul>
                <div>
                <ul data-am-widget="pagination" class="am-pagination am-pagination-default" style="display: none;">

                    <li class="am-pagination-first ">
                        <a href="javascript:hotel.page('first')">第一页</a>
                    </li>

                    <li class="am-pagination-prev">
                        <a href="javascript:hotel.page('pgup')">上一页</a>
                    </li>

                    <li class="am-pagination-next ">
                        <a href="javascript:hotel.page('pgdn')" class="">下一页</a>
                    </li>

                    <li class="am-pagination-last ">
                        <a href="javascript:hotel.page('end')" class="">最末页</a>
                    </li>
                </ul>
        </div>
        </div>
    </div>
</div>
</div>
<!--footer-->
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
<!--footer-->
<script src="${ctx}/resources/statics/js/hotel.js"></script>
</body>
</html>
