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
            min-height: 200px;
            max-height: 800px;
            overflow-y: auto;
            float: left;
            width: 30%;
            border: 1px solid #2F79DB;
        }
        .right{
            float: right;
            width: 68%;
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
            min-height: 300px;
            max-height: 1000px;
            overflow-y: auto;
            border:1px solid #dedede;
        }
        .am-nav>li>a {
            padding: .4em 1em;
            border-radius: 0;
            color: #0e90d2;
            font-size: 20px;
        }
        .info_pic{
            float: left;
            width: 240px;
        }
        .info_text{
            float: right;
            width: 65%;
            padding: 10px;
        }
        .discuss{
            min-height: 300px;
            border: 1px solid #dedede;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .discuss .tool{
            min-height: 30px;
            margin: 2px;
        }

        .fileInputContainer{
            background:url(${ctx}/resources/statics/img/picture.png) no-repeat;
            position:relative;
            height: 30px;
            width: 35px;
            cursor:pointer;
        }
        .fileInput{
            height: 30px;
            width: 35px;
            position:absolute;
            right:0;
            top:0;
            opacity: 0;
            filter:alpha(opacity=0);
            cursor:pointer;
        }
    </style>

</head>
<body>
<!--header-->
<jsp:include page="/WEB-INF/common/header.jsp"></jsp:include>
<!--header-->
<div class="hotel container">
<div class="mt left am-radius">
    <div class="">
        <ul class="am-nav">
            <li class="am-nav-header">景点</li>
            <c:forEach var="scenic" items="${scenics}">
                <li id="${scenic.id}"><a href="javascript:discuss.getInfo(${scenic.id})">${scenic.title}</a></li>
            </c:forEach>
        </ul>
    </div>
</div>
<div class="mt right">
    <div class="pic">
        <div class="info_pic">
            <img src="${ctx}/resources/showtemp/showImg/chq.jpg" class="am-img-thumbnail am-radius">
        </div>
        <div class="info_text">
            <span id="scenic_remark"></span>
            <a href="" class="button" style="float: right;margin-top: 50px;">了解更多</a>
        </div>
    </div>
    <div class="mt10">
        <div class="hot">
            全部评论（<label id="total"></label>）
        </div>
        <%--酒店列表--%>
        <div class="list">
            <ul id="discuss_list" class="am-comments-list am-comments-list-flip" style="margin-bottom: 10px;"></ul>
        </div>
        <div class="discuss" >
            <div class="tool">
            <div class="fileInputContainer">
                <c:if test="${user ==null}">
                    <input class="fileInput" disabled="disabled" accept="image/png, image/jpeg, image/gif, image/jpg" type="file" id="file" onchange="discuss.upload()"/>
                </c:if>
                <c:if test="${user !=null}">
                    <input class="fileInput" accept="image/png, image/jpeg, image/gif, image/jpg" type="file" id="file" onchange="discuss.upload()"/>
                </c:if>
            </div>
            </div>
            <div>
                <c:if test="${user ==null}">
                    <textarea style="width: 100%;" disabled="disabled" rows="10" id="content" placeholder="没有登录，评论请先登录"></textarea>
                </c:if>
                <c:if test="${user !=null}">
                    <textarea style="width: 100%;" rows="10" id="content" placeholder="一字千金"></textarea>
                </c:if>
            </div>
            <div id="piclist" style="border-bottom: 1px solid #dedede;margin-top: 5px;display: none;"></div>
            <div style="margin-left: 660px;padding: 5px;">
                <c:if test="${user ==null}">
                    <button type="button" disabled="disabled" class="am-btn am-btn-warning">发表评论</button>
                </c:if>
                <c:if test="${user !=null}">
                    <button type="button" onclick="discuss.send_discuss()" class="am-btn am-btn-warning">发表评论</button>
                </c:if>

            </div>
        </div>
    </div>
</div>
</div>
<!--footer-->
<jsp:include page="/WEB-INF/common/footer.jsp"></jsp:include>
<!--footer-->
<script src="${ctx}/resources/statics/js/discuss.js"></script>
</body>
</html>
