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
  <script src="${pageContext.request.contextPath}/resources/js/semantic.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/semantic.min.css">

  <style type="text/css">
    body {
      background-color: #DADADA;
    }
    body > .grid {
      height: 100%;
    }
    .column {
      max-width: 450px;
    }
  </style>
  <script>
    $(function() {
      var loginForm = $('#loginForm');
      $('#submitButton').on('click', function () {
        $.ajax({
          url: '${pageContext.request.contextPath}/login',
          type: 'POST',
          data: loginForm.serialize(),
          success: function(serverResponse) {
            // 登录成功
            if (serverResponse.code === 200) {
            } else {
              // 用户状态为不可用
              if (serverResponse.code === 404) {
                $('#usernameField').addClass('error');
              } else {
                // 用户名或密码错误
                $('.field').addClass('error');
              }
            }
          },
          dataType: 'json'
        })
      });
    })
  </script>

</head>
<body>

<div class="ui middle aligned center aligned grid">
  <div class="column">
    <form class="ui large form" id="loginForm">
      <div class="ui stacked segment">
        <div id="usernameField" class="field">
          <div class="ui left icon input">
            <i class="user icon"></i>
            <input type="text" name="username" placeholder="用户名">
          </div>
        </div>
        <div class="field">
          <div class="ui left icon input">
            <i class="lock icon"></i>
            <input type="password" name="password" placeholder="密码">
          </div>
        </div>
        <div id="submitButton" class="ui fluid large teal button">登录</div>
      </div>
    </form>
  </div>
</div>

</body>

</html>