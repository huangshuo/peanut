<%--
  Created by IntelliJ IDEA.
  User: JAVASM
  Date: 2019/4/23
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>花生娱乐</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/amazeui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/amazeui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css" />

  <script>
  //主函数
  $(function() {
    //折叠菜单右侧小箭头图标样式改变
    iconStyle();
    //跳转页面
    link();
    //隐藏左侧菜单
    hiddenMenu();
    //面包屑导航
    breadCrumb();
    //返回主菜单
    returnHome();
    //生成左侧折叠菜单栏
    menuManage();
    //生成修改密码注销按钮
    logoutButton();
  });
  //折叠菜单右侧小箭头图标样式改变
  function iconStyle() {
    $('.am-panel ul').on('open.collapse.amui', function() {
      $(this).prev().children("i:first").next().removeClass();
      $(this).prev().children("i:first").next().addClass("am-icon-angle-down am-fr am-margin-right");
    }).on('close.collapse.amui', function() {
      $(this).prev().children("i:first").next().removeClass();
      $(this).prev().children("i:first").next().addClass("am-icon-angle-right am-fr am-margin-right");
    });
  }
  //返回主菜单（刷新页面）
  function returnHome() {
    $(".home").on("click",function () {
      window.location.reload();
    });
  }
  //隐藏左侧菜单具体动作
  function moveii(){
      if(clickNum % 2 !== 0){
        document.getElementById("bodyLeft").style.left="-14%";
        document.getElementById("change").style.left="-14%";
        document.getElementsByClassName("bodyRight")[0].style.width="93%";
            $("#change").html('<a class="am-icon-angle-double-right am-secondary am-fr  am-margin-bottom-xs" style="position: relative; top: 2px"></a>');
      }else{
        document.getElementsByClassName("bodyLeft")[0].style.left="0px";
        document.getElementById("change").style.left="0px";
        document.getElementsByClassName("bodyRight")[0].style.width="80%";
            $("#change").html('<a class="am-icon-angle-double-left am-secondary am-fr  am-margin-bottom-xs" style="position: relative; top: 2px"></a>');
        }
      clickNum++;
    }
  //隐藏左侧菜单
  var clickNum = 0;
  function hiddenMenu() {
    $("#change").on("click", moveii());
  }
  //面包屑导航
  function breadCrumb() {
    $(".bodyLeft>ul>li>ul>li>a").on("click",function () {
      $(".bodyRightTop ol").html("");
      $(".bodyRightTop ol").append('<li class="home"><a href="###" class="am-icon-home" >首页</a></li>'+
        '<li><a href="#">'+ this.innerText +'</a></li>');
      returnHome();
    });
  }
  //跳转页面
  function link() {
    $(".bodyRightContent").load("homeContent.jsp");
    $(".bodyLeft>ul>li>ul>li>a").on("click",function () {
      $(".bodyRightContent").load($(this).attr("id")+".jsp");
    });
  }
  //动态生成左侧菜单
  function menuManage() {
    $.ajax({
      url:"${pageContext.request.contextPath}/menu/manage",
      type:"get",
      data:{"page":1,"pageSize":50},
      dataType:"json",
      success:function (data) {
        for(var i in data.data.pageData){
          if(data.data.pageData[i].fid===0&data.data.pageData[i].isShow==1){
            $("#bodyLeft>ul").append('<li class="am-panel">' +
              '      <a data-am-collapse="{parent: \'#collapase-nav-1\', target: \'#target'+i+'\'}" style="color: white;">' +
              '        <i class="'+data.data.pageData[i].icon+' am-margin-left-sm"></i> '+data.data.pageData[i].mname+' <i class="am-icon-angle-right am-fr am-margin-right" id="arrow"></i>' +
              '      </a>' +
              '      <ul class="am-list am-collapse menu'+i+'" id="target'+i+'">' +
              '      </ul>' +
              '    </li>');
          }
          for(var j in data.data.pageData){
            if(data.data.pageData[j].fid===data.data.pageData[i].id&data.data.pageData[j].isShow==1){
              $(".menu"+i).append('<li>' +
                '          <a href="###" id="'+data.data.pageData[j].jspName+'"><span class="'+data.data.pageData[j].icon+' am-margin-left-lg"></span> '+data.data.pageData[j].mname+' </a>' +
                '        </li>')
            }
          }
        }
        link();
        breadCrumb();
        iconStyle();
      }
    })
  }
  // 注销按钮
  function logoutButton() {
    var $changePasswordModal = $('#changePasswordModal');
    var $operationMsgModal = $('#operationMsgModal');
    $('#userButton').html(${pageContext.session.getAttribute('session_user_key')}.username + '&nbsp;&nbsp;<span class="am-icon-caret-down"></span>');
    $('#changePassword').on('click', function () {
      $('#changePasswordForm')[0].reset();
      $changePasswordModal.modal();
    });
    // 确认
    $changePasswordModal.find('[data-am-modal-confirm]').off('click.confirm.modal.amui').on('click', function() {
      var id = ${pageContext.session.getAttribute('session_user_key')}.uid;
      $.ajax({
        url: '${pageContext.request.contextPath}/backend/password',
        type: 'POST',
        data: {
          "originPassword": $('#originPassword').val(),
          "newPassword": $('#newPassword').val(),
          "uid": id
        },
        dataType: 'json',
        success: function (serverResponse) {
          if (serverResponse.code === 200) {
            showOperationMsg(serverResponse.msg + ', 请重新登录');
            $operationMsgModal.on('closed.modal.amui', function () {
              window.location.href = '${pageContext.request.contextPath}/backend/logout';
            });
          } else {
            showOperationMsg(serverResponse.msg);
          }
        }
      });
    });
    // 取消
    $changePasswordModal.find('[data-am-modal-cancel]').off('click.cancel.modal.amui').on('click', function() {
      showOperationMsg('已取消');
    });
    // 操作信息提示
    function showOperationMsg(msg) {
      $operationMsgModal.find('.am-modal-bd').html(msg);
      $operationMsgModal.modal();
    }
  }

</script>
<style>
  .bodyRightTop{
    font-size: 25px;
    height: 60px;
  }
   .header {
       z-index: 5;
    height: 50px;
    border-bottom: 1px lightgray solid;
       box-shadow: 0px 1px 4px 1px #919191;
    background-color: whitesmoke;
    line-height: 45px;
    padding-left: 10px;
  }
  .bodyLeftLable{
    -webkit-transition: left 0.75s;
    z-index : 2;
    float: left;
    position: relative;
    left: -1px;
    top: 40%;
    height: 60px;
    width: 25px;
    margin-top: 30px;
    background: rgba(41, 60, 85,1) ;
    border-radius: 0px 5px 5px 0px;
    font-size: 23px;
    text-align: center;
    font-weight: 700;
    border: 0;
    outline:none;
    box-shadow: 3px 3px 2px 0px darkgray;
  }
  .bodyLeft {
    -webkit-transition: left 0.75s;
    z-index : 1;
    position:relative;
    float: left;
    width: 14%;
    height: 100%;
    background-color: rgb(41, 60, 85);
    box-shadow: 2px 2px 2px 1px darkgray;
  }
  .bodyLeft li,.bodyLeft ul {
    background-color: rgb(41, 60, 85);
    border: 0px;
  }
  .admin-sidebar-list li a {
    color: white;
  }
  .bodyRight{
    -webkit-transition: width 0.75s;
    float: right;
    position: absolute;
    right: 50px;
    height: 937px;
    width: 80%;
    margin: 0px 1%;
  }
  .bodyRightContent{
    float: right;
    position: absolute;
    height: 850px;
    width: 100%;
  }
  .bodyRightTop{
    font-size: 25px;
    height: 60px;
  }
</style>
</head>
<body>
<%--顶部页面(标题)--%>
<div class="header">
    <h1 class="am-topbar-brand">
      <img src="${pageContext.request.contextPath}/resources/img/peanut.png" alt="花生娱乐&reg;" style="height: 25px;width: 25px">
      <a href="#">花生娱乐管理平台</a>
    </h1>
    <div class="am-topbar-right">
      <div class="am-dropdown" data-am-dropdown="{boundary: '.am-topbar'}">
        <button id="userButton" class="am-btn am-btn-secondary am-topbar-btn am-btn-sm am-dropdown-toggle" data-am-dropdown-toggle></button>
        <ul class="am-dropdown-content">
          <li id="changePassword">
            <a href="#">修改密码</a>
          </li>
          <li>
            <a href="${pageContext.request.contextPath}/backend/logout">注销</a>
          </li>
        </ul>
      </div>
    </div>
</div>
<%--页面左侧(折叠菜单)--%>
<div class="bodyLeft" id="bodyLeft">
  <ul class="am-list admin-sidebar-list" id="collapase-nav-1">
    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1'}" href="" class="home"><i class="am-icon-home am-margin-left-sm"></i> 首页</a>
    </li>

  </ul>
</div>

<%--显示隐藏标签--%>
<button class="bodyLeftLable" id="change" type="button" onclick="moveii()">
    <a class="am-icon-angle-double-right am-secondary am-fr am-margin-bottom-xs" style="position: relative; top: 2px"></a>
</button>
<%--页面主要内容--%>
<div class="bodyRight">
  <%--面包屑导航--%>
  <div class="bodyRightTop">
    <ol class="am-breadcrumb">
      <li class="home">
        <a href="###" class="am-icon-home home" >首页</a>
      </li>

    </ol>
  </div>
  <%--主页面内容--%>
  <div class="bodyRightContent">
  </div>
</div>
<div class="am-modal am-modal-confirm" tabindex="-1" id="changePasswordModal">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">修改密码</div>
    <div class="am-modal-bd">
      <form class="am-form am-form-horizontal" id="changePasswordForm">
        <div class="am-form-group">
          <label for="originPassword" class="am-u-md-3">原始密码:</label>
          <div class="am-u-md-9">
            <input type="password" id="originPassword" name="originPassword" placeholder="原始密码" class="am-form-field" required/>
          </div>
        </div>
        <div class="am-form-group">
          <label for="newPassword" class="am-u-md-3">新密码:</label>
          <div class="am-u-md-9">
            <input type="password" id="newPassword" name="newPassword" placeholder="新密码" class="am-form-field" required/>
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