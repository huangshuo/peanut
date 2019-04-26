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
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/handlebars.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/amazeui.widgets.helper.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/amazeui.dialog.min.js"></script>
  <script type="text/javascript">
    // 加载表格
    function loadGameList(pageNum, pageSize, tbody) {
      tbody.empty();
      var gameListPageInfo = {totalPage: null, totalRow: null};
      $.ajax({
        url: "${pageContext.request.contextPath}/backend/game/list",
        type: 'GET',
        data: {
          'pageNum': pageNum,
          'pageSize': pageSize
        },
        dataType: 'json',
        async: false,
        success: function (serverResponse) {
          if (serverResponse.code === 200) {
            var pageInfo = serverResponse.data;
            var gameList = pageInfo.pageData;
            for (var index in gameList) {
              var game = gameList[index];
              var platform;
              var gameStatus;
              if (game.platform === 1) {
                platform = '<span class="am-icon-apple am-vertical-align-middle"></span>'
              } else if (game.platform === 2) {
                platform = '<span class="am-icon-android am-vertical-align-middle"></span>'
              } else {
                platform = '<span class="am-icon-apple am-vertical-align-middle">&nbsp;</span><span class="am-icon-android am-vertical-align-middle"></span>'
              }
              if (game.gameStatus === 1) {
                gameStatus = '<span class="am-badge am-badge-success am-radius am-vertical-align-middle">启用</span>'
              } else {
                gameStatus = '<span class="am-badge am-badge-danger am-radius am-vertical-align-middle">下线</span>'
              }
              tbody.append($('<tr id="'+ game.name +'">' +
                '<td class="table-lg am-vertical-align"><span class="am-vertical-align-middle">'+ game.name +'</span></td>' +
                '<td class="table-lg am-vertical-align"><span class="am-vertical-align-middle">'+ game.title +'</span></td>' +
                '<td class="table-md am-vertical-align"><span class="am-vertical-align-middle">'+ game.downloadCount +'</span></td>' +
                '<td class="table-md am-vertical-align"><span class="am-vertical-align-middle">'+ game.gameSize +'</span></td>' +
                '<td class="table-sm am-vertical-align">'+ gameStatus +'</td>' +
                '<td class="table-md am-vertical-align"><span class="am-vertical-align-middle">'+ game.gameTypeId +'</span></td>' +
                '<td class="table-sm am-vertical-align">'+ platform +'</td>' +
                '<td class="table-md am-vertical-align"><span class="am-vertical-align-middle">'+ game.recommendType +'</span></td>' +
                '<td>' +
                '<div class="am-btn-group">' +
                '<button type="button" class="am-btn am-btn-primary" name="'+ game.name +'">' +
                '<span class="am-icon-pencil-square-o"></span> 编辑</button>' +
                '<button type="button" class="am-btn am-btn-danger am-hide-sm-only" name="'+ game.name +'">' +
                '<span class="am-icon-trash-o"></span> 删除</button>' +
                '</div>' +
                '</td>' +
                '</tr>'));
            }
            gameListPageInfo.totalPage = pageInfo.totalPage;
            gameListPageInfo.totalRow = pageInfo.totalRow;
          }
        }
      });
      return gameListPageInfo;
    }
    // 加载分页
    function loadPagination(totalPage, gamePagination, currentPage) {
      var template = Handlebars.compile('{{>pagination}}');
      var page = [];
      for (var i = 1; i <= totalPage; i++) {
        var className = "pagination-index";
        if (i === parseInt(currentPage)) {
          className += ' am-active';
        }
        page.push({
          "title": ""+ i +"",
          "link": "#",
          "className": className
        })
      }
      var data = {
        paginationData: {
          "content" : {
            "prevTitle": "上一页",
            "prevLink": "#",
            "nextTitle": "下一页",
            "nextLink": "#",
            "firstTitle": "首页",
            "firstLink": "#",
            "lastTitle": "末页",
            "lastLink": "#",
            "total": "3",
            "page": page
          }
        }
      };
      var html = template(data.paginationData);
      gamePagination.html(html);
      // 禁用相应的按钮
      if (1 === parseInt(currentPage)) {
        gamePagination.find('li.am-pagination-first').addClass('am-disabled');
        gamePagination.find('li.am-pagination-prev').addClass('am-disabled');
      } else {
        gamePagination.find('li.am-pagination-first').removeClass('am-disabled');
        gamePagination.find('li.am-pagination-prev').removeClass('am-disabled');
      }
      if (totalPage === parseInt(currentPage)) {
        gamePagination.find('li.am-pagination-last').addClass('am-disabled');
        gamePagination.find('li.am-pagination-next').addClass('am-disabled');
      } else {
        gamePagination.find('li.am-pagination-last').removeClass('am-disabled');
        gamePagination.find('li.am-pagination-next').removeClass('am-disabled');
      }
    }
    $(function () {
      var currentPage = 1;
      var pageNum = 1;
      var pageSize = 6;
      var tbody = $('#tbody');
      var gamePagination = $('#gamePagination');
      var pageInfo = loadGameList(pageNum, pageSize, tbody);
      var totalPage = pageInfo.totalPage;
      var totalRow = pageInfo.totalRow;
      loadPagination(totalPage, gamePagination, currentPage);

      // 编辑
      tbody.on('click', 'button.am-btn-primary', function () {
        var name = $(this).prop('name');
        AMUI.dialog.confirm({
          title: '编辑 ' + name,
          content: '<form class="am-form" data-am-validator>\n' +
            '          <fieldset>\n' +
            '            <div class="am-form-group">\n' +
            '              <label for="gameName">游戏名称：</label>\n' +
            '              <input type="text" id="gameName" name="gameName" minlength="1" placeholder="游戏名称" class="am-form-field" required/>\n' +
            '            <div class="am-form-group">\n' +
            '              <label for="gameTitle">游戏标题：</label>\n' +
            '              <input type="text" id="gameTitle" name="gameTitle" minlength="1" placeholder="游戏标题" class="am-form-field" required/>\n' +
            '            </div>\n' +
            '            <div class="am-form-group">\n' +
            '              <label for="gameSize">游戏大小(单位: Mb)：</label>\n' +
            '              <input type="text" id="gameSize" name="gameSize" minlength="1" placeholder="游戏大小(单位: Mb)" class="am-form-field" required/>\n' +
            '            </div>\n' +
            '            <div class="am-form-group">\n' +
            '              <label for="gameIcon">游戏图标</label>\n' +
            '              <input type="text" id="gameIcon" name="gameIcon" minlength="1" placeholder="游戏图标" class="am-form-field" required/>\n' +
            '            </div>\n' +
            '            <div class="am-form-group">\n' +
            '              <label for="gamePictures">游戏详情图片</label>\n' +
            '              <input type="text" id="gamePictures" name="gamePictures" minlength="1" placeholder="游戏详情图片" class="am-form-field" required/>\n' +
            '            </div>\n' +
            '            <div class="am-form-group">\n' +
            '              <label for="isoUrl">ios下载地址</label>\n' +
            '              <input type="text" id="isoUrl" name="iosUrl" minlength="1" placeholder="ios下载地址" class="am-form-field" required/>\n' +
            '            </div>\n' +
            '            <div class="am-form-group">\n' +
            '\n' +
            '            </div>\n' +
            '            <div class="am-form-group">\n' +
            '\n' +
            '            </div>\n' +
            '            <div class="am-form-group">\n' +
            '\n' +
            '            </div>\n' +
            '            <div class="am-form-group">\n' +
            '\n' +
            '            </div>\n' +
            '            <div class="am-form-group">\n' +
            '\n' +
            '            </div>\n' +
            '            <div class="am-form-group">\n' +
            '\n' +
            '            </div>\n' +
            '            </div>\n' +
            '          </fieldset>\n' +
            '        </form>',
          onConfirm: function () {

          },
          onCancel: function () {
            
          }
        });
      });
      // 删除
      tbody.on('click', 'button.am-btn-danger', function () {
        var name = $(this).prop('name');
        AMUI.dialog.confirm({
          title: '确认删除',
          content: name + "?",
          onConfirm: function () {
            $.ajax({
              url: '${pageContext.request.contextPath}/backend/game/delete',
              type: 'GET',
              data: { 'name' : name },
              dataType: 'json',
              success: function (serverResponse) {
                if (serverResponse.code === 200) {
                  totalRow--;
                }
                AMUI.dialog.alert({
                  content: serverResponse.msg
                });
                // 当前删除的是此页的最后一条记录
                if (totalRow === (totalPage - 1) * pageSize) {
                  currentPage--;
                  totalPage--;
                }
                pageInfo = loadGameList(currentPage, pageSize, tbody);
                loadPagination(totalPage, gamePagination, currentPage);
              }
            })
          },
          onCancel: function () {
            console.log(name);
          }
        });
      });
      // 首页
      gamePagination.on('click', 'li.am-pagination-first', function () {
        if (currentPage ===1) {
          return;
        }
        currentPage = 1;
        loadPagination(loadGameList(currentPage, pageSize, tbody).totalPage, gamePagination, currentPage);
      });
      // 末页
      gamePagination.on('click', 'li.am-pagination-last', function () {
        if (currentPage === totalPage) {
          return;
        }
        currentPage = pageInfo.totalPage;
        loadPagination(loadGameList(currentPage, pageSize, tbody).totalPage, gamePagination, currentPage);
      });
      // 上一页
      gamePagination.on('click', 'li.am-pagination-prev', function () {
        if (currentPage === 1) {
          return;
        }
        currentPage--;
        loadPagination(loadGameList(currentPage, pageSize, tbody).totalPage, gamePagination, currentPage)
      });
      // 下一页
      gamePagination.on('click', 'li.am-pagination-next', function () {
        if (currentPage === totalPage) {
          return;
        }
        currentPage++;
        loadPagination(loadGameList(currentPage, pageSize, tbody).totalPage, gamePagination, currentPage);
      });
      // 指定页码
      gamePagination.on('click', 'a.pagination-index', function () {
        if (parseInt($(this).html()) === currentPage) {
          return;
        }
        currentPage = parseInt($(this).html());
        loadPagination(loadGameList(currentPage, pageSize, tbody).totalPage, gamePagination, currentPage);
      })
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
    #gamePagination {
      float: right;
    }
    label {
      text-align: left;
    }
  </style>
</head>
<body>
  <%--表格--%>
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
  <%--分页--%>
  <div class="myPagination">
    <div id="gamePagination"></div>
  </div>
  <%--编辑框--%>
<%--  <div class="am-modal am-modal-prompt" tabindex="-1" id="modifyGame">--%>
<%--    <div class="am-modal-dialog">--%>
<%--      <div class="am-modal-hd"></div>--%>
<%--      <div class="am-modal-bd">--%>
<%--        --%>
<%--      </div>--%>
<%--      <div class="am-modal-footer">--%>
<%--        <span class="am-modal-btn" data-am-modal-cancel>取消</span>--%>
<%--        <span class="am-modal-btn" data-am-modal-confirm>提交</span>--%>
<%--      </div>--%>
<%--    </div>--%>
<%--  </div>--%>
</body>
</html>
