<%--
  Created by IntelliJ IDEA.
  User: huangs
  Date: 2019/4/25
  Time: 18:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>游戏管理</title>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/amazeui.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/amazeui.min.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css" />
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/echarts.min.js" ></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shine.js" ></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr-2.8.3.js" ></script>
  <script type="text/javascript">
    $(function () {
      var tbody = $('#tbody');
      $.ajax({
        url: "${pageContext.request.contextPath}/backend/game/list",
        type: 'GET',
        data: {
          'pageNum': 1,
          'pageSize': 10
        },
        dataType: 'json',
        success: function (serverResponse) {
          if (serverResponse.code === 200) {
            var pageInfo = serverResponse.data;
            var gameList = pageInfo.pageData;
            for (var index in gameList) {
              var game = gameList[index];
              if (game.platform === 1) {
                game.platform = '<span class="am-icon-apple am-vertical-align-middle"></span>'
              } else if (game.platform === 2) {
                game.platform = '<span class="am-icon-android am-text-middle"></span>'
              } else {
                game.platform = '<span class="am-icon-apple am-text-middle">&nbsp;</span><span class="am-icon-android am-text-middle"></span>'
              }
              if (game.gameStatus === 1) {
                game.gameStatus = '<span class="am-badge am-badge-success am-radius am-vertical-align-middle">可用</span>'
              } else {
                game.gameStatus = '<span class="am-badge am-badge-danger am-radius am-vertical-align-middle">不可用</span>'
              }
              tbody.append($('<tr>' +
                '<td class="table-lg">'+ game.name +'</td>' +
                '<td class="table-lg">'+ game.title +'</td>' +
                '<td class="table-md">'+ game.downloadCount +'</td>' +
                '<td class="table-md">'+ game.gameSize +'</td>' +
                '<td class="table-sm am-vertical-align">'+ game.gameStatus +'</td>' +
                '<td class="table-md">'+ game.gameTypeId +'</td>' +
                '<td class="table-sm am-vertical-align">'+ game.platform +'</td>' +
                '<td class="table-md">'+ game.recommendType +'</td>' +
                '<td>' +
                '<button class="am-btn am-btn-primary am-btn-sm" onclick="modifyGame('+ game.name +')">' +
                '<span class="am-icon-pencil-square-o"></span> 编辑</button>' +
                '<button class="am-btn am-btn-danger am-btn-sm am-hide-sm-only" onclick="deletegame('+ game.name +')">' +
                '<span class="am-icon-trash-o"></span> 删除</button>' +
                '</td>' +
                '</tr>'))
            }
          }
        }
      });
      function modifyGame(name) {
        alert('modify' + name);
      }
      function deleteGame(game) {
        alert('delete' + name)
      }
    })
  </script>
  <style>
    #tbody td {
      height: 30px;
    }
    .table-sm {
      width: 8%;
    }
    .table-md {
      width: 10%;
    }
    .table-lg {
      width: 15%;
    }
  </style>
</head>
<body>
  <table class="am-table am-table-bordered am-table-centered am-table-radius am-table-striped am-table-hover .am-text-nowrap">
    <tr class="am-primary">
      <th class="table-lg">名称</th>
      <th class="table-md">标题</th>
      <th class="table-md">下载量</th>
      <th class="table-sm">大小(M)</th>
      <th class="table-sm">状态</th>
      <th class="table-md">分类</th>
      <th class="table-sm">平台类型</th>
      <th class="table-sm">推荐类型</th>
      <th class="table-lg">操作</th>
    </tr>
    <tbody id="tbody">
    </tbody>
  </table>
    <ul class="am-pagination">
      <li class="am-disabled"><a href="#">&laquo;</a></li>
      <li class="am-active"><a href="#">1</a></li>
      <li><a href="#">&raquo;</a></li>
    </ul>
</body>
</html>
