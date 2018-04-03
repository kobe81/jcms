<%@ page import="com.jcms.pojo.entity.sys.SysUserEntity" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% SysUserEntity user = (SysUserEntity) request.getSession().getAttribute("user");%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<link href="${ctx}/resources/amazeui/assets/css/amazeui.min.css" rel="stylesheet" type="text/css"/>
<link rel="stylesheet" href="${ctx}/resources/amazeui/assets/css/app.css">
<link href="${ctx}/resources/showtemp/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="${ctx}/resources/showtemp/css/style.css" rel="stylesheet" type="text/css"/>
<link href="${ctx}/resources/layer/theme/default/layer.css" rel="stylesheet" type="text/css"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<script src="${ctx}/resources/showtemp/js/jquery-1.11.1.min.js"></script>
<script src="${ctx}/resources/showtemp/js/responsiveslides.min.js"></script>
<script src="${ctx}/resources/layer/layer.js"></script>
<script src="${ctx}/resources/amazeui/assets/js/amazeui.min.js"></script>
<link rel="stylesheet" href="${ctx}/resources/statics/regist_login/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${ctx}/resources/statics/regist_login/css/login.css"/>
<script src="http://libs.baidu.com/jquery/1.10.2/jquery.min.js"></script>
<script src="${ctx}/resources/statics/regist_login/bootstrap/js/bootstrap.min.js"></script>
<script src="${ctx}/resources/statics/js/sys/login.js"></script>

<script>
    var ctx = "${ctx}";
</script>
<style type="text/css">
    .login {
        margin-top: -65px;
        float: right;
        margin-right: 30px;
    }

    .tq2345 {
        margin-top: -68px;
        float: right;
        margin-right: 145px;
    }

    .bg {
        background: url("${ctx}/resources/showtemp/background/bg0.jpg") no-repeat center center fixed;
    }
</style>
<%-- 登录，注册页面 --%>
<script>
    $(document).ready(function () {
        //打开会员登录
        $("#Login_start_").click(function () {
            $("#regist_container").hide();
            $("#_close").show();
            $("#_start").animate({
                left: '350px',
                height: '520px',
                width: '400px'
            }, 500, function () {
                $("#login_container").show(500);
                $("#_close").animate({
                    height: '40px',
                    width: '40px'
                }, 500);
            });
        });
        //打开会员注册
        $("#Regist_start_").click(function () {
            $("#login_container").hide();
            $("#_close").show();
            $("#_start").animate({
                left: '350px',
                height: '520px',
                width: '400px'
            }, 500, function () {
                $("#regist_container").show(500);
                $("#_close").animate({
                    height: '40px',
                    width: '40px'
                }, 500);
            });
        });
        //关闭
        $("#_close").click(function () {

            $("#_close").animate({
                height: '0px',
                width: '0px'
            }, 500, function () {
                $("#_close").hide(500);
                $("#login_container").hide(500);
                $("#regist_container").hide(500);
                $("#_start").animate({
                    left: '0px',
                    height: '0px',
                    width: '0px'
                }, 500);
            });
        });
        //去 注册
        $("#toRegist").click(function () {
            $("#login_container").hide(500);
            $("#regist_container").show(500);
        });
        //去 登录
        $("#toLogin").click(function () {
            $("#regist_container").hide(500);
            $("#login_container").show(500);
        });
    });
</script>

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
                    <li><a href="${ctx}/scenic/jump/path_planning">线路规划</a></li>
                    <li><a href="${ctx}/scenic/jump/scenic_discuss">景点点评</a></li>
                    <li><a href="">旅游天气</a></li>
                </ul>
                <!--script-nav-->
                <script>
                    $(".top-menu ul li").click(function (e) {
                        $(".top-menu ul li").find("a").attr("class", "");
                        $(this).find("a").attr("class", "active");
                    });
                </script>
            </div>
        </div>
    </div>
    <div class="tq2345">
        <iframe allowtransparency="true" frameborder="0" width="255" height="64" scrolling="no"
                src="//tianqi.2345.com/plugin/widget/index.htm?s=2&z=3&t=1&v=2&d=1&bd=0&k=000000&f=000000&ltf=009944&htf=cc0000&q=0&e=0&a=0&c=60498&w=255&h=64&align=center"></iframe>
    </div>

    <div id="login" class="login">
        <c:if test="${user ==null}">
            <a id="Login_start_" class="btn btn-danger" style="width:50px;height:40px;border-radius: 0;">登陆</a>
            <a id="Regist_start_" class="btn btn-success" style="width:50px;height:40px;border-radius: 0;">注册</a>
        </c:if>
        <c:if test="${user !=null}">
            <a href="/in" class="btn btn-success" id="userId" val="${user.id}">${user.username}</a>&nbsp;|&nbsp;
            <a href="javascript:logout()" class="btn btn-success">退出</a>
        </c:if>
    </div>
    <!-- 会员登录  -->
    <!--<div id='Login_start' style="position: absolute;" >-->
    <div id='_start'>
        <div id='_close' style="display: none;">
            <span class="glyphicon glyphicon-remove"></span>
        </div>
        <br/>
        <!--登录框-->
        <div id="login_container">
            <div id="lab1">
                <span id="lab_login">会员登录</span>
                <span id="lab_toRegist">
						&emsp;还没有账号&nbsp;
						<span id='toRegist' style="color: #EB9316;cursor: pointer;">立即注册</span>
					</span>
            </div>
            <div style="width:330px;">
                <span id="lab_type1">手机号/账号登陆</span>
            </div>
            <div id="form_container1">
                <br/>
                <input type="text" class="form-control" placeholder="手机号/用户名" id="login_number" value="admin"/>
                <input type="password" class="form-control" placeholder="密码" id="login_password"/>
                <input type="button" onclick="login()" value="登录" class="btn btn-success" id="login_btn"/>
                <span id="rememberOrfindPwd">
						<span>
							<input id="remember" type="checkbox" style="margin-bottom: -1.5px;"/>
						</span>
					<span style="color:#000000">
							记住密码&emsp;&emsp;&emsp;&emsp;
						</span>
					<span style="color:#000000">
							忘记密码
						</span>
					</span>
            </div>

            <div style="display:block;width:330px;height：40px;">
                <span id="lab_type2">使用第三方直接登陆</span>
            </div>
            <div style="width:330px;height:100px;border-bottom: 1px solid #FFFFFF;">
                <br/>
                <button id="login_QQ" type="button" class="btn btn-info">
                    <img src="${ctx}/resources/statics/regist_login/img/qq32.png" style="width:20px;margin-top:-4px;"/>&emsp;QQ登录
                </button>
                <button id="login_WB" type="button" class="btn btn-danger">
                    <img src="${ctx}/resources/statics/regist_login/img/sina32.png"
                         style="width:20px;margin-top:-4px;"/>&emsp;微博登录
                </button>
            </div>
        </div>
        <!-- 会员注册 -->
        <div id='regist_container' style="display: none;">
            <div id="lab1">
                <span id="lab_login">会员注册</span>
                <span id="lab_toLogin">
						&emsp;已有账号&nbsp;
						<span id='toLogin' style="color: #EB9316;cursor: pointer;">立即登录</span>
					</span>
            </div>
            <div id="form_container2" style="padding-top: 25px;">

                <input type="text" class="form-control" value="admin" placeholder="用户名" id="regist_account"/>
                <input type="password" class="form-control" placeholder="密码" id="regist_password1"/>
                <input type="password" class="form-control" placeholder="确认密码" id="regist_password2"/>
                <input type="text" class="form-control" placeholder="手机号" id="regist_phone"/>
                <input type="text" class="form-control" placeholder="邮箱" id="regist_email"/>
                <input type="text" class="form-control" placeholder="验证码" id="regist_vcode"/>
                <!--<button id="getVCode" type="button" class="btn btn-success" >获取验证码</button>-->
                <input id="getVCode" type="button" class="btn btn-success" value="点击发送验证码" onclick="sendCode(this)"/>

            </div>
            <input type="button" value="注册" class="btn btn-success" id="regist_btn" onclick="register()"/>
        </div>
    </div>

</div>

