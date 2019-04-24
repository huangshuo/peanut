<%--
  Created by IntelliJ IDEA.
  User: huangs
  Date: 2019/4/23
  Time: 17:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="zh-CN">
<head>
  <meta charset="utf-8" />
  <title>登录</title>

  <script src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
  <script src="${pageContext.request.contextPath}/resources/js/amazeui.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/amazeui.min.css">

  <style>
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 30px;
    }
    .header p {
      font-size: 14px;
    }
  </style>
</head>
<body>
<div class="header">
  <div class="am-g">
    <h1>花生娱乐后台管理系统</h1>
  </div>
  <hr />
</div>
<div class="am-g">
  <div class="am-u-lg-4 am-u-md-8 am-u-sm-centered">
    <form method="post" class="am-form">
      <div class="am-input-group am-input-group-primary">
        <span class="am-input-group-label"><i class="am-icon-user am-icon-fw"></i></span>
        <input type="text" id="username" name="username" class="am-form-field" placeholder="请输入用户名">
      </div>
      <br />
      <div class="am-input-group am-input-group-primary">
        <span class="am-input-group-label"><i class="am-icon-lock am-icon-fw"></i></span>
        <input type="password" id="password" name="password" class="am-form-field" placeholder="请输入密码">
      </div>
      <br />
      <div class="am-cf">
        <input type="submit" name="" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
      </div>
    </form>
    <hr>
    <p>© 2019 花生娱乐</p>
  </div>

  </div>
</body>
</html>