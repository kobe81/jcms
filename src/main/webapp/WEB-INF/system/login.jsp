<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/resources/amazeui/assets/css/amazeui.min.css"/>
<title>登录页面</title>
</head>
<body>
<div class="am-g">
  <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
    <form method="post" class="am-form">
      <label for="username">账号:</label>
      <input type="text" name="username" id="username" value="">
      <br>
      <label for="password">密码:</label>
      <input type="password" name="" id="password" value="">
      <br>
      <label for="remember-me">
        <input id="remember-me" type="checkbox">
        记住密码
      </label>
      <br />
      <div class="am-cf">
        <input type="submit" onclick="login.dologin()" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
        <input type="submit" value="忘记密码 ^_^? " class="am-btn am-btn-default am-btn-sm am-fr">
      </div>
    </form>
</div>
</div>
<script type="text/javascript" src="/resources/statics/js/sys/login.js"></script>
</body>
</html>