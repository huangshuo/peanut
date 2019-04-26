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

  <script type="text/javascript">
    $(function () {
      var myForm = $('#myForm');
      var usernameDiv = $('#usernameDiv');
      var passwordDiv = $('#passwordDiv');
      var username = $('#username');
      var password = $('#password');
      var inputAlert = $('#inputAlert');
      var button = $('button');

      username.on('input', function () {
        clearError();
      });

      password.on('input', function () {
        clearError();
      });

      myForm.on('submit', function (e) {
        // 阻止form自带的submit事件
        e.preventDefault();
        button.addClass('btn-loading-example');
        if (username.val().trim() === '') {
          usernameDiv.addClass('am-form-error');
          inputAlert.html("用户名不能为空");
          inputAlert.show();
          button.addClass('am-disabled');
        } else if (password.val().trim() === '') {
          passwordDiv.addClass('am-form-error');
          inputAlert.html("密码不能为空");
          inputAlert.show();
          button.addClass('am-disabled');
        } else {
          // 加载
          button.html('<i class="am-icon-spinner am-icon-spin"></i>');
          $.ajax({
            url: '${pageContext.request.contextPath}/backend/login',
            type: 'POST',
            data: myForm.serialize(),
            dataType: 'json',
            success: function (data) {
              button.html('登录');
              // 登录失败
              if (data.code !== 200) {
                inputAlert.html(data.msg);
                inputAlert.show();
              } else {
                window.self.location = "${pageContext.request.contextPath}/static/home.jsp";
              }
            }
          })
        }
      });
      function clearError() {
        usernameDiv.removeClass('am-form-error');
        passwordDiv.removeClass('am-form-error');
        inputAlert.hide();
        button.removeClass('am-disabled');
      }
    })
  </script>

  <style>
    #main {
      height: 100%;
      background: url("${pageContext.request.contextPath}/resources/img/background.jpg");
    }
    .header {
      text-align: center;
    }
    .header h1 {
      font-size: 200%;
      color: #333;
      margin-top: 100px;
    }
    .am-alert {
      text-align: center;
      padding: 5px;
    }
    form {
      margin-top: 100px;
      padding: 30px 10px 30px 10px;
      border-radius: 5px;
      box-shadow: grey 1px 1px;
      background-color: white;
    }
    .am-input-group {
      margin-top: 10px;
    }
    fieldset {
      margin-bottom: 0;
    }
  </style>
</head>
<body>
<div id="main">
  <div class="am-container">
    <div class="header">
      <div class="am-g">
        <h1>花生娱乐&reg;管理平台</h1>
      </div>
    </div>
    <div class="am-g">
      <div class="am-u-lg-5 am-u-md-8 am-u-sm-centered">
        <form id="myForm" class="am-form">
          <fieldset>
            <div id="usernameDiv" class="am-input-group am-radius">
              <span class="am-input-group-label"><i class="am-icon-user am-icon-fw"></i></span>
              <input type="text" id="username" name="username" class="am-form-field" placeholder="请输入用户名">
            </div>
            <br />
            <div id="passwordDiv" class="am-input-group am-radius">
              <span class="am-input-group-label"><i class="am-icon-lock am-icon-fw"></i></span>
              <input type="password" id="password" name="password" class="am-form-field" placeholder="请输入密码">
            </div>
            <br />
            <button type="submit" class="am-btn am-btn-primary am-btn-block am-radius">登录</button>
            <div id="inputAlert" class="am-alert am-alert-danger am-radius" data-am-alert hidden="hidden"></div>
          </fieldset>
        </form>
      </div>
    </div>
  </div>
</div>
</body>
</html>