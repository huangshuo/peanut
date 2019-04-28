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
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/amazeui.min.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css"/>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/amazeui.chosen.css"/>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/echarts.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shine.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr-2.8.3.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/handlebars.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/amazeui.widgets.helper.min.js"></script>
  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/amazeui.chosen.min.js"></script>
  <script type="text/javascript">
    // 加载表格
    function loadGameList(pageNum, pageSize, $tbody) {
      $tbody.empty();
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
              var gameType;
              var recommendType;
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
              switch (parseInt(game.gameTypeId)) {
                case 1:
                  gameType = '休闲益智';
                  break;
                case 2:
                  gameType = '网络游戏';
                  break;
                case 3:
                  gameType = '动作冒险';
                  break;
                case 4:
                  gameType = '棋牌中心';
                  break;
                case 5:
                  gameType = '飞行设计';
                  break;
                case 6:
                  gameType = '经营策略';
                  break;
                case 7:
                  gameType = '角色扮演';
                  break;
                case 8:
                  gameType = '体育竞技';
                  break;
                default:
                  gameType = '未知类型';
                  break;
              }
              if (parseInt(game.recommendType) === 1) {
                recommendType = '普通';
              } else if (parseInt(game.recommendType) === 2) {
                recommendType = '最新';
              } else if (parseInt(game.recommendType) === 3) {
                recommendType = '推荐';
              } else {
                recommendType = '未知';
              }
              $tbody.append($('<tr>' +
                '<td class="table-lg am-vertical-align"><span class="am-vertical-align-middle">' + game.name + '</span></td>' +
                '<td class="table-lg am-vertical-align"><span class="am-vertical-align-middle">' + game.title + '</span></td>' +
                '<td class="table-md am-vertical-align"><span class="am-vertical-align-middle">' + game.downloadCount + '</span></td>' +
                '<td class="table-md am-vertical-align"><span class="am-vertical-align-middle">' + game.gameSize + '</span></td>' +
                '<td class="table-sm am-vertical-align">' + gameStatus + '</td>' +
                '<td class="table-md am-vertical-align"><span class="am-vertical-align-middle">' + gameType + '</span></td>' +
                '<td class="table-sm am-vertical-align">' + platform + '</td>' +
                '<td class="table-md am-vertical-align"><span class="am-vertical-align-middle">' + recommendType + '</span></td>' +
                '<td>' +
                '<div class="am-btn-group">' +
                '<button type="button" class="am-btn am-btn-primary" name="' + game.gameId + '">' +
                '<span class="am-icon-pencil-square-o"></span> 编辑</button>' +
                '<button type="button" class="am-btn am-btn-danger am-hide-sm-only" name="' + game.gameId + '">' +
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
    function loadPagination(totalPage, $gamePagination, currentPage, totalRow) {
      var template = Handlebars.compile('{{>pagination}}');
      var page = [];
      for (var i = 1; i <= totalPage; i++) {
        var className = "pagination-index";
        if (i === parseInt(currentPage)) {
          className += ' am-active';
        }
        page.push({
          "title": "" + i + "",
          "link": "#",
          "className": className
        })
      }
      var data = {
        paginationData: {
          "content": {
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
      $gamePagination.html(html);
      $('#totalRow').html(totalRow);
      $('#gamePaginationOption').show();
      // 禁用相应的按钮
      if (1 === parseInt(currentPage)) {
        $gamePagination.find('li.am-pagination-first').addClass('am-disabled');
        $gamePagination.find('li.am-pagination-prev').addClass('am-disabled');
      } else {
        $gamePagination.find('li.am-pagination-first').removeClass('am-disabled');
        $gamePagination.find('li.am-pagination-prev').removeClass('am-disabled');
      }
      if (totalPage === parseInt(currentPage)) {
        $gamePagination.find('li.am-pagination-last').addClass('am-disabled');
        $gamePagination.find('li.am-pagination-next').addClass('am-disabled');
      } else {
        $gamePagination.find('li.am-pagination-last').removeClass('am-disabled');
        $gamePagination.find('li.am-pagination-next').removeClass('am-disabled');
      }
    }
    // 获取游戏信息
    function getGameInfo(gameId) {
      var gameInfo = null;
      $.ajax({
        url: '${pageContext.request.contextPath}/backend/game/info',
        type: 'POST',
        data: {
          "gameId": gameId
        },
        dataType: 'json',
        async: false,
        success: function (serverResponse) {
          if (serverResponse.code === 200) {
            gameInfo = serverResponse.data;
          }
        }
      })
      return gameInfo;
    }
    // 操作信息提示
    function showOperationMsg(msg) {
      var operationMsgModal = $('#operationMsgModal');
      operationMsgModal.find('.am-modal-bd').html(msg);
      operationMsgModal.modal();
    }
    // 搜索按钮
    function searchGame(gameName, gameType, platform, recommendType) {

    }
    // main
    $(function () {
      var currentPage = 1;
      var pageNum = 1;
      var $tbody = $('#tbody');
      var $gamePagination = $('#gamePagination');
      var $modifyGameModal = $('#modifyGameModal');
      var $deleteGameModal = $('#deleteGameModal');
      var $pageSize = $('#pageSize');
      var pageSize = $pageSize.val();
      var pageInfo = loadGameList(pageNum, pageSize, $tbody);
      var totalPage = pageInfo.totalPage;
      var totalRow = pageInfo.totalRow;
      loadPagination(totalPage, $gamePagination, currentPage, totalRow);
      // 修改页面大小
      $pageSize.on('change', function () {
        pageSize = $(this).val();
        totalPage = loadGameList(currentPage, pageSize, $tbody).totalPage;
        currentPage = 1;
        loadPagination(totalPage, $gamePagination, currentPage, totalRow);
      });
      // 确认编辑
      $modifyGameModal.find('[data-am-modal-confirm]').off('click.confirm.modal.amui').on('click', function() {
        var modifyGameFormData = $('#modifyGameForm').serialize();
        $.ajax({
          url: '${pageContext.request.contextPath}/backend/game/modify',
          type: 'POST',
          data: modifyGameFormData,
          dataType: 'json',
          success: function (serverResponse) {
            showOperationMsg(serverResponse.msg);
            loadGameList(currentPage, pageSize, $tbody);
            loadPagination(totalPage, $gamePagination, currentPage, totalRow);
          }
        })
      });
      // 取消编辑
      $modifyGameModal.find('[data-am-modal-cancel]').off('click.cancel.modal.amui').on('click', function() {
        showOperationMsg('已取消');
      });
      // 确认删除
      $deleteGameModal.find('[data-am-modal-confirm]').off('click.confirm.modal.amui').on('click', function() {
        var deleteGameName = $deleteGameModal.find('.hiddenSpan').html();
        $.ajax({
          url: '${pageContext.request.contextPath}/backend/game/delete',
          type: 'GET',
          data: {
            "name": deleteGameName
          },
          dataType: 'json',
          success: function (serverResponse) {
            if (serverResponse.code === 200) {
              totalRow--;
            }
            showOperationMsg(serverResponse.msg);
            // 当前删除的是此页的最后一条记录
            if (totalRow === (totalPage - 1) * pageSize) {
              currentPage--;
              totalPage--;
            }
            pageInfo = loadGameList(currentPage, pageSize, $tbody);
            loadPagination(totalPage, $gamePagination, currentPage, totalRow);
          }
        })
      });
      // 取消删除
      $deleteGameModal.find('[data-am-modal-cancel]').off('click.cancel.modal.amui').on('click', function() {
        showOperationMsg('已取消');
      });

      // 编辑
      $tbody.on('click', 'button.am-btn-primary', function () {
        var gameId = $(this).prop('name');
        var game = getGameInfo(gameId);
        $('#modifyGameModalTitle').html('编辑 ' + game.name);
        $('#gameId').val(game.gameId);
        $('#gameName').val(game.name);
        $('#gameTitle').val(game.title);
        $('#gameSize').val(game.gameSize);
        $('#gameIcon').val(game.gameIcon);
        $('#gamePictures').val(game.gamePictures);
        $('#iosUrl').val(game.iosUrl);
        $('#androidUrl').val(game.androidUrl);
        $('#recommendType').val(game.recommendType);
        $('#platform').val(game.platform);
        $('#gameType').val(game.gameTypeId);
        $('#gameStatus').val(game.gameStatus);
        $modifyGameModal.modal();
      });
      // 删除
      $tbody.on('click', 'button.am-btn-danger', function () {
        var name = getGameInfo($(this).prop('name')).name;
        $deleteGameModal.find('.hiddenSpan').html(name);
        $deleteGameModal.find('.am-modal-bd').html(name);
        $deleteGameModal.modal();
      });
      // 首页
      $gamePagination.on('click', 'li.am-pagination-first', function () {
        if (currentPage === 1) {
          return;
        }
        currentPage = 1;
        loadPagination(loadGameList(currentPage, pageSize, $tbody).totalPage, $gamePagination, currentPage, totalRow);
      });
      // 末页
      $gamePagination.on('click', 'li.am-pagination-last', function () {
        if (currentPage === totalPage) {
          return;
        }
        currentPage = pageInfo.totalPage;
        loadPagination(loadGameList(currentPage, pageSize, $tbody).totalPage, $gamePagination, currentPage, totalRow);
      });
      // 上一页
      $gamePagination.on('click', 'li.am-pagination-prev', function () {
        if (currentPage === 1) {
          return;
        }
        currentPage--;
        loadPagination(loadGameList(currentPage, pageSize, $tbody).totalPage, $gamePagination, currentPage, totalRow)
      });
      // 下一页
      $gamePagination.on('click', 'li.am-pagination-next', function () {
        if (currentPage === totalPage) {
          return;
        }
        currentPage++;
        loadPagination(loadGameList(currentPage, pageSize, $tbody).totalPage, $gamePagination, currentPage, totalRow);
      });
      // 指定页码
      $gamePagination.on('click', 'a.pagination-index', function () {
        if (parseInt($(this).html()) === currentPage) {
          return;
        }
        currentPage = parseInt($(this).html());
        loadPagination(loadGameList(currentPage, pageSize, $tbody).totalPage, $gamePagination, currentPage, totalRow);
      })
    })
  </script>
  <style>
    body {
      overflow: auto;
    }
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
    .am-fr {
      height: 70px;
    }
    .gameHeader {
      height: 5%;
      margin-top: 1%;
    }
    .gameBody {
      margin-top: 1%;
      height: 93%;
    }
    .gameHeader .am-selected-btn {
      width: 60%;
    }
    .gameHeader .am-btn-block {
      width: 40%;
      float: right;
    }
  </style>
</head>
<body>
<%--搜索选项--%>
<div class="gameHeader">
  <div class="am-g">
    <div class="am-u-md-3">
      <div class="am-input-group am-input-group-primary">
        <span class="am-input-group-label">游戏名称</span>
        <input id="searchGameName" type="text" placeholder="游戏名称" class="am-form-field">
      </div>
    </div>
    <div class="am-u-md-2">
      <div class="am-input-group am-input-group-primary">
        <span class="am-input-group-label">分类</span>
        <select id="searchGameGameType" data-am-selected>
          <option value="1">休闲益智</option>
          <option value="2">网络游戏</option>
          <option value="3">动作冒险</option>
          <option value="4">棋牌中心</option>
          <option value="5">飞行射击</option>
          <option value="6">经营策略</option>
          <option value="7">角色扮演</option>
          <option value="8">体育竞技</option>
        </select>
      </div>
    </div>
    <div class="am-u-md-2">
      <div class="am-input-group am-input-group-primary">
        <span class="am-input-group-label">平台</span>
        <select id="searchGamePlatform" data-am-selected>
          <option value="1">iOS</option>
          <option value="2">Android</option>
          <option value="3">全部</option>
        </select>
      </div>
    </div>
    <div class="am-u-md-2">
      <div class="am-input-group am-input-group-primary">
        <span class="am-input-group-label">推荐类别</span>
        <select id="searchGameRecommendType" data-am-selected>
          <option value="1">普通</option>
          <option value="2">最新</option>
          <option value="3">推荐</option>
        </select>
      </div>
    </div>
    <div class="am-u-md-3">
      <button type="button" id="searchGameButton" class="am-btn am-btn-primary am-btn-block am-btn-xl">搜索</button>
    </div>
  </div>
</div>

<div class="gameBody">
  <%--表格--%>
  <table
      class="am-table am-table-bordered am-table-centered am-table-radius am-table-striped am-table-hover .am-text-nowrap">
    <tr class="am-primary">
      <th class="table-lg">名称</th>
      <th class="table-md">标题</th>
      <th class="table-md">下载量</th>
      <th class="table-sm">大小(M)</th>
      <th class="table-sm">状态</th>
      <th class="table-md">分类</th>
      <th class="table-sm">平台</th>
      <th class="table-sm">推荐类型</th>
      <th class="table-lg">操作</th>
    </tr>
    <tbody id="tbody">
    </tbody>
  </table>
  <%--分页--%>
  <div class="am-cf">
    <div class="am-fr">
      <div id="gamePagination"></div>
    </div>
    <div class="am-fr am-vertical-align">
      <div id="gamePaginationOption" hidden="hidden" class="am-vertical-align-middle">
        <label for="pageSize">&nbsp;每页&nbsp;</label>
        <select id="pageSize" data-am-selected="{btnWidth: '25%', btnStyle: 'secondary'}">
          <option value="5">5</option>
          <option value="10">10</option>
          <option value="15">15</option>
          <option value="20">20</option>
          <option value="40">40</option>
        </select>&nbsp;条
        &nbsp;共&nbsp;<span id="totalRow"></span>&nbsp;条
      </div>
    </div>
  </div>
</div>


<%--编辑框--%>
<div class="am-modal am-modal-confirm" tabindex="-1" id="modifyGameModal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd" id="modifyGameModalTitle"></div>
    <div class="am-modal-bd">
      <form class="am-form am-form-horizontal" id="modifyGameForm">
        <input type="hidden" name="gameId" id="gameId">
        <div class="am-form-group">
          <label for="gameName" class="am-u-md-3">游戏名称:</label>
          <div class="am-u-md-9">
            <input type="text" id="gameName" name="gameName" placeholder="游戏名称" class="am-form-field" required/>
          </div>
        </div>
        <div class="am-form-group">
          <label for="gameTitle" class="am-u-md-3">游戏标题:</label>
          <div class="am-u-md-9">
            <input type="text" id="gameTitle" name="gameTitle" placeholder="游戏标题" class="am-form-field" required/>
          </div>
        </div>
        <div class="am-form-group">
          <label for="gameSize" class="am-u-md-3">游戏大小:</label>
          <div class="am-u-md-9"><input type="text" id="gameSize" name="gameSize" placeholder="游戏大小(单位: Mb)"
                                        class="am-form-field" required/>
          </div>
        </div>
        <div class="am-form-group">
          <label for="gameIcon" class="am-u-md-3">游戏图标:</label>
          <div class="am-u-md-9">
            <input type="text" id="gameIcon" name="gameIcon" placeholder="游戏图标" class="am-form-field" required/>
          </div>
        </div>
        <div class="am-form-group">
          <label for="gamePictures" class="am-u-md-3">详情图片:</label>
          <div class="am-u-md-9">
            <input type="text" id="gamePictures" name="gamePictures" placeholder="游戏详情图片" class="am-form-field" required/>
          </div>
        </div>
        <div class="am-form-group">
          <label for="iosUrl" class="am-u-md-3">ios:</label>
          <div class="am-u-md-9">
            <input type="text" id="iosUrl" name="iosUrl" placeholder="ios下载地址" class="am-form-field" required/>
          </div>
        </div>
        <div class="am-form-group">
          <label for="androidUrl" class="am-u-md-3">android:</label>
          <div class="am-u-md-9">
            <input type="text" id="androidUrl" name="androidUrl" placeholder="android下载地址" class="am-form-field" required/>
          </div>
        </div>
        <div class="am-form-group">
          <label for="recommendType" class="am-u-md-3">推荐类型:</label>
          <div class="am-u-md-4">
            <select id="recommendType" name="recommendType" data-placeholder="推荐类型" class="chosen-select-width">
              <option value="1">普通</option>
              <option value="2">最新</option>
              <option value="3">推荐</option>
            </select>
          </div>
          <label for="gameStatus" class="am-u-md-2">状态:</label>
          <div class="am-u-md-3">
            <select id="gameStatus" name="gameStatus" data-placeholder="游戏状态" class="chosen-select-width">
              <option value="1">启用</option>
              <option value="2">下线</option>
            </select>
          </div>
        </div>
        <div class="am-form-group">
          <label for="gameType" class="am-u-md-3">游戏分类:</label>
          <div class="am-u-md-4">
            <select id="gameType" name="gameType" data-placeholder="游戏分类" class="chosen-select-width">
              <option value="1">休闲益智</option>
              <option value="2">网络游戏</option>
              <option value="3">动作冒险</option>
              <option value="4">棋牌中心</option>
              <option value="5">飞行射击</option>
              <option value="6">经营策略</option>
              <option value="7">角色扮演</option>
              <option value="8">体育竞技</option>
            </select>
          </div>
          <label for="platform" class="am-u-md-2">平台:</label>
          <div class="am-u-md-3">
            <select id="platform" name="platform" data-placeholder="游戏平台" class="chosen-select-width">
              <option value="1">iOS</option>
              <option value="2">Android</option>
              <option value="3">全部</option>
            </select>
          </div>
        </div>
      </form>
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>
<%--删除框--%>
<div class="am-modal am-modal-confirm" tabindex="-1" id="deleteGameModal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">确认删除</div>
    <span hidden="hidden" class="hiddenSpan"></span>
    <div class="am-modal-bd">
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>
<%--提示框--%>
<div class="am-modal am-modal-confirm" tabindex="-1" id="operationMsgModal">
  <div class="am-modal-dialog">
    <div class="am-modal-bd">
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn">确定</span>
    </div>
  </div>
</div>
</body>
</html>
