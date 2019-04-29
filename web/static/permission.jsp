<%--
  Created by IntelliJ IDEA.
  User: huangs
  Date: 2019/4/28
  Time: 20:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>权限管理</title>
<%--  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>--%>
<%--  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/amazeui.min.js"></script>--%>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/amazeui.min.css"/>--%>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css"/>--%>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css"/>--%>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/amazeui.chosen.css"/>--%>
<%--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/zTreeStyle.css"/>--%>
<%--  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/echarts.min.js"></script>--%>
<%--  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shine.js"></script>--%>
<%--  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr-2.8.3.js"></script>--%>
<%--  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/handlebars.min.js"></script>--%>
<%--  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/amazeui.widgets.helper.min.js"></script>--%>
<%--  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/amazeui.chosen.min.js"></script>--%>
<%--  <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.ztree.all.min.js"></script>--%>
  <script>
    // 加载表格
    function loadUserList(pageInfo, $tbody, $userPagination) {
      $tbody.empty();
      var pageData = pageInfo.pageData;
      var pageNum = pageInfo.pageNum;
      var totalPage = pageInfo.totalPage;
      var totalRow = pageInfo.totalRow;
      var isFirstPage = pageInfo.firstPage;
      var isLastPage = pageInfo.lastPage;
      // 填充表格
      for (var index in pageData) {
        var user = pageData[index];
        var number = parseInt(index) + 1;
        var role;
        var status;
        if (user.role === 1) {
          role = '普通用户';
        } else if (user.role === 2) {
          role = '合作用户';
        } else if (user.role === 3) {
          role = '管理员';
        } else {
          role = '未知';
        }
        if (user.status === 1) {
          status = '<span class="am-badge am-badge-success am-radius am-vertical-align-middle">可用</span>'
        } else {
          status = '<span class="am-badge am-badge-danger am-radius am-vertical-align-middle">失效</span>'
        }
        $tbody.append($('<tr>' +
          '<td class="table-sm am-vertical-align"><span class="am-vertical-align-middle">' + number + '</span></td>' +
          '<td class="table-lg am-vertical-align"><span class="am-vertical-align-middle">' + user.username + '</span></td>' +
          '<td class="table-md am-vertical-align"><span class="am-vertical-align-middle">' + role + '</span></td>' +
          '<td class="table-lg am-vertical-align"><span class="am-vertical-align-middle">' + user.createTime + '</span></td>' +
          '<td class="table-lg am-vertical-align"><span class="am-vertical-align-middle">' + user.lastLoginTime + '</span></td>' +
          '<td class="table-sm am-vertical-align">' + status + '</td>' +
          '<td class="table-lg">' +
          '<div class="am-btn-group">' +
          '<button type="button" class="am-btn am-btn-primary" name="' + user.uid + '">' +
          '<span class="am-icon-pencil-square-o"></span> 编辑</button>' +
          '<button type="button" class="am-btn am-btn-danger am-hide-sm-only deleteUser" name="' + user.uid + '">' +
          '<span class="am-icon-trash-o"></span> 删除</button>' +
          '</div>' +
          '</td>' +
          '</tr>'));
        $tbody.on('click', '.deleteUser', function () {
          var name = getUserInfo($(this).prop('name')).username;
          $('#deleteUserModal').find('.hiddenSpan').html(name);
          $('#deleteUserModal').find('.am-modal-bd').html(name);
          $('#deleteUserModal').modal();
        });
      }
      // 显示分页信息
      var template = Handlebars.compile('{{>pagination}}');
      var page = [];
      for (var i = 1; i <= totalPage; i++) {
        var className = "pagination-index";
        if (i === parseInt(pageNum)) {
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
            "page": page
          }
        }
      };
      var html = template(data.paginationData);
      $userPagination.html(html);
      $('#totalRow').html(totalRow);
      $('#userPaginationOption').show();
      // 禁用相应的按钮
      if (isFirstPage) {
        $userPagination.find('li.am-pagination-first').addClass('am-disabled');
        $userPagination.find('li.am-pagination-prev').addClass('am-disabled');
      } else {
        $userPagination.find('li.am-pagination-first').removeClass('am-disabled');
        $userPagination.find('li.am-pagination-prev').removeClass('am-disabled');
      }
      if (isLastPage) {
        $userPagination.find('li.am-pagination-last').addClass('am-disabled');
        $userPagination.find('li.am-pagination-next').addClass('am-disabled');
      } else {
        $userPagination.find('li.am-pagination-last').removeClass('am-disabled');
        $userPagination.find('li.am-pagination-next').removeClass('am-disabled');
      }
      // 恢复按钮加载状态
      $('#searchUserButton').button('reset');
    }
    // 获取用户分页列表
    function pageQueryUser(pageNum, pageSize) {
      var username = $('#searchUserUsername').val().trim();
      var status = $('#searchUserStatus').val();
      var role = $('#searchUserRole').val();
      var pageInfo = null;
      $.ajax({
        url: '${pageContext.request.contextPath}/backend/user/list',
        type: 'GET',
        data: {
          "pageNum": pageNum,
          "pageSize": pageSize,
          "username": username,
          "status": status,
          "role": role
        },
        dataType: 'json',
        async: false,
        success: function (serverResponse) {
          if (serverResponse.code === 200) {
            pageInfo = serverResponse.data;
          }
        }
      });
      return pageInfo;
    }
    // 根据用户id获取用户信息
    function getUserInfo(uid) {
      var userInfo = null;
      $.ajax({
        url: '${pageContext.request.contextPath}/backend/user/info',
        type: 'POST',
        data: {
          "uid": uid
        },
        dataType: 'json',
        async: false,
        success: function (serverResponse) {
          if (serverResponse.code === 200) {
            userInfo = serverResponse.data;
          }
        }
      });
      return userInfo;
    }
    // 根据菜单id获取菜单信息
    function getMenuInfo(id) {
      var menuInfo = null;
      $.ajax({
        url: '${pageContext.request.contextPath}/backend/user/permission',
        type: 'POST',
        data: {
          "id": id
        },
        dataType: 'json',
        async: false,
        success: function (serverResponse) {
          if (serverResponse.code === 200) {
            menuInfo = serverResponse.data;
          }
        }
      });
      return menuInfo;
    }
    // 获取所有菜单信息
    function getMenuList() {
      var menuList = null;
      $.ajax({
        url: '${pageContext.request.contextPath}/backend/user/menu/list',
        type: 'GET',
        async: false,
        success: function (serverResponse) {
          if (serverResponse.code === 200) {
            menuList = serverResponse.data;
          }
        }
      });
      return menuList;
    }
    // 加载权限树状菜单
    function loadPermissionTree() {
      var setting = {
        check: {
          enable: true,
          chkboxType:  {'Y': 'ps', 'N' : 'ps'}
        },
        data: {
          simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "pId",
            rootPid: 0
          }
        }
      };
      var permissionNodes = [];
      var menus = getMenuList();
      for (var i in menus) {
        var menuInfo = menus[i];
        var permission = {
          id: menuInfo.id,
          pId: menuInfo.fid,
          name: menuInfo.mname,
          open: true,
          checked: false
        };
        permissionNodes.push(permission);
      }
      $.fn.zTree.init($('#permission'), setting, permissionNodes);
    }
    // 操作信息提示
    function showOperationMsg(msg) {
      var operationMsgModal = $('#operationMsgModal');
      operationMsgModal.find('.am-modal-bd').html(msg);
      operationMsgModal.modal();
    }
    // main
    $(function () {

      var $tbody = $('#tbody');
      var $userPagination = $('#userPagination');
      var $modifyUserModal = $('#modifyUserModal');
      var $deleteUserModal = $('#deleteUserModal');
      var $searchUserButton = $('#searchUserButton');
      var $addUserButton = $('#addUserButton');
      var $pageSize = $('#pageSize');
      var $modifyUserForm = $('#modifyUserForm');
      var checkedPermission = "";
      var pageNum = 1;
      var pageSize = $pageSize.val();
      var pageInfo = pageQueryUser(pageNum, pageSize);
      loadUserList(pageInfo, $tbody, $userPagination);
      loadPermissionTree(checkedPermission);
      var permissionTree = $.fn.zTree.getZTreeObj("permission");
      // 删除
      $tbody.on('click', '.deleteUser', function () {
        alert("13213");
        // var name = getUserInfo($(this).prop('name')).username;
        // $deleteUserModal.find('.hiddenSpan').html(name);
        // $deleteUserModal.find('.am-modal-bd').html(name);
        // $deleteUserModal.modal();
      });
      // 修改页面大小
      $pageSize.on('change', function () {
        pageNum = 1;
        pageSize = $(this).val();
        pageInfo = pageQueryUser(pageNum, pageSize);
        loadUserList(pageInfo, $tbody, $userPagination);
      });
      // 用户名
      $('#searchUserUsername').on('change', function () {
        $searchUserButton.button('loading');
        var pageInfo = pageQueryUser(pageNum, pageSize);
        loadUserList(pageInfo, $tbody, $userPagination);
      });
      // 用户状态
      $('#searchUserStatus').on('change', function () {
        $searchUserButton.button('loading');
        var pageInfo = pageQueryUser(pageNum, pageSize);
        loadUserList(pageInfo, $tbody, $userPagination);
      });
      // 用户角色
      $('#searchUserRole').on('change', function () {
        $searchUserButton.button('loading');
        var pageInfo = pageQueryUser(pageNum, pageSize);
        loadUserList(pageInfo, $tbody, $userPagination);
      });
      // 搜索按钮
      $searchUserButton.on('click', function () {
        // 显示为加载状态
        $searchUserButton.button('loading');
        var pageInfo = pageQueryUser(pageNum, pageSize);
        loadUserList(pageInfo, $tbody, $userPagination);
      });
      // 添加按钮
      $addUserButton.on('click', function () {
        $('#modifyUserModalTitle').html('添加');
        $modifyUserForm[0].reset();
        permissionTree.checkAllNodes(false);
        $modifyUserModal.modal();
      });
      // 确认编辑/添加
      $modifyUserModal.find('[data-am-modal-confirm]').off('click.confirm.modal.amui').on('click', function () {
        var modifyUserFormData = $modifyUserForm.serialize();
        // 获取已勾选的节点
        var permissions = permissionTree.getCheckedNodes(true);
        var permissionStr = "";
        for (var index in permissions) {
          permissionStr += permissions[index].id + ',';
        }
        // 去掉最后一个,
        permissionStr = permissionStr.substring(0, permissionStr.length - 1);
        modifyUserFormData += '&permission=' + permissionStr;
        if ($('#modifyUserModalTitle').html() === '添加') {
          $.ajax({
            url: '${pageContext.request.contextPath}/backend/user/add',
            type: 'POST',
            data: modifyUserFormData,
            dataType: 'json',
            success: function (serverResponse) {
              showOperationMsg(serverResponse.msg);
              pageInfo = pageQueryUser(pageNum, pageSize);
              loadUserList(pageInfo, $tbody, $userPagination);
            }
          });
        } else {
          $.ajax({
            url: '${pageContext.request.contextPath}/backend/user/modify',
            type: 'POST',
            data: modifyUserFormData,
            dataType: 'json',
            success: function (serverResponse) {
              showOperationMsg(serverResponse.msg);
              pageInfo = pageQueryUser(pageNum, pageSize);
              loadUserList(pageInfo, $tbody, $userPagination);
            }
          });
        }
      });
      // 取消编辑/添加
      $modifyUserModal.find('[data-am-modal-cancel]').off('click.cancel.modal.amui').on('click', function () {
        showOperationMsg('已取消');
      });
      // 确认删除
      $deleteUserModal.find('[data-am-modal-confirm]').off('click.confirm.modal.amui').on('click', function () {
        var deleteUsername = $deleteUserModal.find('.hiddenSpan').html();
        $.ajax({
          url: '${pageContext.request.contextPath}/backend/user/delete',
          type: 'GET',
          data: {
            "username": deleteUsername
          },
          dataType: 'json',
          success: function (serverResponse) {
            showOperationMsg(serverResponse.msg);
            if (serverResponse.code === 200) {
              // 当前删除的是此页的最后一条记录
              if (pageInfo.totalRow === (pageInfo.totalPage - 1) * pageSize) {
                pageNum--;
              }
              pageInfo = pageQueryUser(pageNum, pageSize, $tbody);
              loadUserList(pageInfo, $tbody, $userPagination);
            }
          }
        })
      });
      // 取消删除
      $deleteUserModal.find('[data-am-modal-cancel]').off('click.cancel.modal.amui').on('click', function () {
        showOperationMsg('已取消');
      });
      // 编辑
      //todo
      $tbody.on('click', 'button.am-btn-primary', function () {
        var uid = $(this).prop('name');
        var user = getUserInfo(uid);
        $('#modifyUserModalTitle').html('编辑 ' + user.username);
        $('#uid').val(user.uid);
        $('#username').val(user.username);
        $('#status').val(user.status);
        $('#role').val(user.role);
        $modifyUserModal.modal();
      });

      // 首页
      $userPagination.on('click', 'li.am-pagination-first', function () {
        if (pageNum === 1) {
          return;
        }
        pageNum = 1;
        pageInfo = pageQueryUser(pageNum, pageSize);
        loadUserList(pageInfo, $tbody, $userPagination);
      });
      // 末页
      $userPagination.on('click', 'li.am-pagination-last', function () {
        if (pageNum === pageInfo.totalPage) {
          return;
        }
        pageNum = pageInfo.totalPage;
        pageInfo = pageQueryUser(pageNum, pageSize);
        loadUserList(pageInfo, $tbody, $userPagination);
      });
      // 上一页
      $userPagination.on('click', 'li.am-pagination-prev', function () {
        if (pageNum === 1) {
          return;
        }
        pageNum--;
        pageInfo = pageQueryUser(pageNum, pageSize);
        loadUserList(pageInfo, $tbody, $userPagination);
      });
      // 下一页
      $userPagination.on('click', 'li.am-pagination-next', function () {
        if (pageNum === pageInfo.totalPage) {
          return;
        }
        pageNum++;
        pageInfo = pageQueryUser(pageNum, pageSize);
        loadUserList(pageInfo, $tbody, $userPagination);
      });
      // 指定页码
      $userPagination.on('click', 'a.pagination-index', function () {
        if (parseInt($(this).html()) === pageNum) {
          return;
        }
        pageNum = $(this).html();
        pageInfo = pageQueryUser(pageNum, pageSize);
        loadUserList(pageInfo, $tbody, $userPagination);
      })
    })
  </script>
  <style>
    /*body {*/
    /*  overflow: auto;*/
    /*}*/
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
    /*.am-fr {*/
    /*  height: 70px;
    }*/
    .userHeader {
      height: 5%;
      margin-top: 1%;
    }
    .userBody {
      margin-top: 1%;
      height: 91%;
    }
    .userHeader .am-selected-btn {
      width: 60%;
    }
    .userHeader .am-btn-block {
      float: right;
    }
  </style>

<%--搜索--%>
<div class="userHeader">
  <div class="am-g">
    <div class="am-u-md-4">
      <div class="am-input-group am-input-group-primary">
        <span class="am-input-group-label">用户名</span>
        <input id="searchUserUsername" type="text" class="am-form-field">
      </div>
    </div>
    <div class="am-u-md-2">
      <div class="am-input-group am-input-group-primary">
        <span class="am-input-group-label">角色</span>
        <select id="searchUserRole" data-am-selected>
          <option value="0" selected>全部</option>
          <option value="1">普通用户</option>
          <option value="2">合作公司</option>
          <option value="3">管理员</option>
        </select>
      </div>
    </div>
    <div class="am-u-md-2">
      <div class="am-input-group am-input-group-primary">
        <span class="am-input-group-label">状态</span>
        <select id="searchUserStatus" data-am-selected>
          <option value="0" selected>全部</option>
          <option value="1">可用</option>
          <option value="2">无效</option>
        </select>
      </div>
    </div>
    <div class="am-u-md-1 am-u-md-offset-2">
      <button type="button" id="searchUserButton"
              class="am-btn am-btn-primary am-btn-block am-btn-lg btn-loading-example"
              data-am-loading="{spinner: 'circle-o-notch', loadingText: '加载中...'}">搜索
      </button>
    </div>
    <div class="am-u-md-1">
      <button type="button" id="addUserButton" class="am-btn am-btn-success am-btn-block am-btn-lg">添加</button>
    </div>
  </div>
</div>

<div class="userBody">
  <%--表格--%>
  <table
      class="am-table am-table-bordered am-table-centered am-table-radius am-table-striped am-table-hover .am-text-nowrap">
    <tr class="am-primary">
      <th class="table-sm">序号</th>
      <th class="table-lg">用户名</th>
      <th class="table-md">角色</th>
      <th class="table-lg">创建时间</th>
      <th class="table-lg">最后登录时间</th>
      <th class="table-sm">状态</th>
      <th class="table-lg">操作</th>
    </tr>
    <tbody id="tbody">
    </tbody>
  </table>
  <%--分页--%>
  <div class="am-cf">
    <div class="am-fr">
      <div id="userPagination"></div>
    </div>
    <div class="am-fr am-vertical-align">
      <div id="userPaginationOption" hidden="hidden" class="am-vertical-align-middle">
        <label for="pageSize">&nbsp;每页&nbsp;</label>
        <select id="pageSize" data-am-selected="{btnWidth: '25%'}">
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

<%--todo--%>
<%--编辑框--%>
<div class="am-modal am-modal-confirm" tabindex="-1" id="modifyUserModal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd" id="modifyUserModalTitle"></div>
    <div class="am-modal-bd">
      <form class="am-form am-form-horizontal" id="modifyUserForm">
        <input type="hidden" name="uid" id="uid">
        <div class="am-form-group">
          <label for="username" class="am-u-md-3">用户名:</label>
          <div class="am-u-md-9">
            <input type="text" id="username" name="username" placeholder="用户名" class="am-form-field" required/>
          </div>
        </div>
        <div class="am-form-group">
          <label for="role" class="am-u-md-3">角色:</label>
          <div class="am-u-md-9">
            <select id="role" name="role" data-placeholder="角色" class="chosen-select-width">
              <option value="1">普通用户</option>
              <option value="2">合作公司</option>
              <option value="3">管理员</option>
            </select>
          </div>
        </div>
        <div class="am-form-group">
          <label for="status" class="am-u-md-3">状态:</label>
          <div class="am-u-md-9">
            <select id="status" name="status" data-placeholder="状态" class="chosen-select-width">
              <option value="1">可用</option>
              <option value="2">无效</option>
            </select>
          </div>
        </div>
        <div class="am-form-group">
          <label for="role" class="am-u-md-3">权限:</label>
          <div class="am-u-md-9">
            <ul id="permission" class="ztree"></ul>
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
<div class="am-modal am-modal-confirm" tabindex="-1" id="deleteUserModal">
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