<%@ page import="com.jcms.pojo.entity.sys.SysUserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% SysUserEntity user = (SysUserEntity)request.getSession().getAttribute("user");%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<link href="${ctx}/resources/amazeui/assets/css/amazeui.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="${ctx}/resources/amazeui/assets/css/app.css">
<link href="${ctx}/resources/showtemp/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${ctx}/resources/showtemp/css/style.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/resources/layer/theme/default/layer.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="${ctx}/resources/showtemp/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/resources/showtemp/js/responsiveslides.min.js"></script>
<script src="${ctx}/resources/layer/layer.js"></script>
<script src="${ctx}/resources/amazeui/assets/js/amazeui.min.js"></script>
<script src="${ctx}/resources/statics/js/sys/login.js"></script>
<script>
    var ctx="${ctx}";
</script>
<style type="text/css">
    .login{
        margin-top: -65px;
        float: right;
        margin-right: 30px;
    }
    .tq2345{
        margin-top: -85px;
        float: right;
        margin-right: 145px;
    }
    .bg{
        background: url("${ctx}/resources/showtemp/background/bg0.jpg") no-repeat center center fixed;
    }
</style>
<div class="header">
    <div class="container">
        <div class="top-header">
            <div class="logo">
                <h1><a href="${ctx}/">江西·婺源</a></h1>
            </div>
            <div class="top-menu">
                <ul>
                    <li><a href="${ctx}/" class="active">主页</a></li>
                    <li><a href="${ctx}/scenic/jump/scenic_show">玩转婺源</a></li>
                    <li><a href="${ctx}/hotel/jump/hotel">酒店预订</a></li>
                    <li><a href="${ctx}/scenic/jump/scenic_show">线路规划</a></li>
                    <li><a href="${ctx}/scenic/jump/scenic_discuss">景点点评</a></li>
                    <li><a href="">关于婺源</a></li>
                </ul>
                <!--script-nav-->
                <script>
                    $(".top-menu ul li").click(function(e){
                        $(".top-menu ul li").find("a").attr("class","");
                        $(this).find("a").attr("class","active");
                    });
                </script>
            </div>
        </div>
    </div>
    <div class="tq2345">
        <iframe allowtransparency="true" frameborder="0" width="255" height="64" scrolling="no" src="//tianqi.2345.com/plugin/widget/index.htm?s=2&z=3&t=1&v=2&d=1&bd=0&k=&f=&ltf=009944&htf=cc0000&q=0&e=0&a=0&c=57993&w=255&h=64&align=center"></iframe>
    </div>
    <div id="login" class="login">
        <c:if test="${user ==null}">
        <a href="javascript:login.doloign()">登录</a>&nbsp;|&nbsp;
        <a href="javascript:login.register()">注册</a>
        </c:if>
        <c:if test="${user !=null}">
            <a href="javascript:login.doloign()" id="userId" val="${user.id}">${user.username}</a>&nbsp;|&nbsp;
            <a href="javascript:login.logout()">退出</a>
        </c:if>
    </div>
</div>
