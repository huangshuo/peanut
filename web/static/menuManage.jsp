<%--
  Created by IntelliJ IDEA.
  User: JAVASM
  Date: 2019/4/24
  Time: 21:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
  $(function () {
    var page=1;
    changePageBtn(page);
    pageData(page);
    pageBtnLoad(page);
  });
  //点击换页按钮切换页面
  function changePageBtn(page) {
    $("#first").on("click",function () {
      page=1;
      pageData(page);
    });
    $("#last").on("click",function () {
      page= $("#totalPage").val();
      $("#currentPage").val(page);
      pageData(page);
    });
    $("#next").on("click",function () {
      if($("#currentPage").val()!=$("#totalPage").val()){
        page=parseInt($("#currentPage").val()) +1;
        $("#currentPage").val(page);
        pageData(page);
      }
    });
    $("#prev").on("click",function () {
      if($("#currentPage").val()!=1){
        page=$("#currentPage").val()-1;
        $("#currentPage").val(page);
        pageData(page);
      }
    });
  }
  //生成页面数据
  function pageData(page) {
    $.ajax({
      url:"${pageContext.request.contextPath}/menu/manage",
      type:"get",
      data:{"page":page,"pageSize":10},
      dataType:"json",
      success:function (data) {
        $(".content").html("");
        $.each(data.data.pageData,function (i,d) {
          $(".content").append('<tr class="am-animation-scale-up">' +
            '      <td>'+d.id+'</td>' +
            '      <td>'+d.mname+'</td>' +
            '      <td>'+d.fid+'</td>' +
            '      <td>'+d.isShow+'</td>' +
            '      <td>'+d.icon+'</td>' +
            '      <td> <button type="button" ' +
            '                         class="am-btn am-btn-primary am-radius doc-prompt-toggle" ' +
            '                         id="" ' +
            '                         data-am-modal="{target: #dmy-prompt}">修改' +
            '           </button>' +
            '           <button type="button" class="am-btn am-btn-danger am-radius">删除</button>' +
            '      </td>' +
            '    </tr>')
        });
        modifyMenu();
      }
    });
  }
  //页面加载、根据总页码数 生成页码按钮
  function pageBtnLoad(page) {
    $.ajax({
      url:"${pageContext.request.contextPath}/menu/manage",
      type:"get",
      data:{"page":page,"pageSize":10},
      dataType:"json",
      success:function (data) {
        $("#totalPage").val(data.data.totalPage);
        for (var i = data.data.totalPage; i > 0; i--) {
          $("#prev").after('<li id="page' + i + '"><a href="###">' + i + '</a></li>');
        }
        $("li[id*='page']").on("click",function () {
          pageData($(this).children().html());
          $("#currentPage").val($(this).children().html());
        });
      }
    })
  }
  //更新菜单内容
  function  modifyMenu(){

    $('.doc-prompt-toggle').on('click', function() {
      $("#id").val($(this).parent().prev().prev().prev().prev().prev().html());
      $("#menuName").val($(this).parent().prev().prev().prev().prev().html());
      $("#fid").val($(this).parent().prev().prev().prev().html());
      $("#isShow").val($(this).parent().prev().prev().html());
      $("#icon").val($(this).parent().prev().html());

      $('#my-prompt').modal({
        relatedTarget: this,
        onConfirm: function(e) {
          //确认：向数据库发送请求
          $.ajax({
            url:"${pageContext.request.contextPath}/menu/update",
            type:"get",
            data:{"id":$("#id").val(),"menuName":$("#menuName").val(),"fid": $("#fid").val(),"isShow": $("#isShow").val(),"icon": $("#icon").val()},
            dataType:"text",
            success:function(data){
              pageData(1);
            }
          });

        }
      });
    })
  }
  //删除菜单内容
  function deleteMenu() {

  }

</script>
<style>
  .border{
    margin: 20px;
  }
  .border ul{
    background-color: white;
  }
  label{
    float: left;
    width: 90px;
    text-align: right;
    margin-right: 10px;
  }
  .menuName{
    font-size: 25px;
  }
  .changeMenu{
    height: 350px;
    width: 600px;
  }
  .changeMenu input{
    margin: 20px 0;
  }
</style>
<div class="border" style="height: 600px;">
  <%--菜单管理表单--%>
  <table class="am-table  am-table-centered am-table-hover am-table-striped">
    <thead>
    <tr class="am-primary">
      <th>序号</th>
      <th>菜单名</th>
      <th>父id</th>
      <th>是否显示</th>
      <th>图标</th>
      <th>操作</th>
    </tr>
    </thead>
    <tbody class="content">
    </tbody>
  </table>
  <%--分页--%>
  <ul class="am-pagination am-pagination-right am-table-striped" id="page">
    <li id="first"><a href="###" >首页</a></li>
    <li id="prev"><a href="###">上一页</a></li>
    <li id="next"><a href="###" >下一页</a></li>
    <li id="last"><a href="###" >尾页</a></li>
  </ul>
</div>

<%--隐藏域、放总页数\当前页数--%>
<input type="hidden" value="" id="totalPage">
<input type="hidden" value="1" id="currentPage">
<%--模态框，改变内容--%>
<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt" >
  <div class="am-modal-dialog changeMenu">
    <div class="am-modal-hd menuName" >修改菜单</div>
    <div class="am-modal-bd">
      <input type="hidden" class="am-modal-prompt-input" id="id">
      <label class="label">菜单名</label><input type="text" class="am-modal-prompt-input" id="menuName">
      <label class="label">父id</label><input type="text" class="am-modal-prompt-input" id="fid">
      <label class="label">是否显示</label><input type="text" class="am-modal-prompt-input" id="isShow">
      <label class="label">图标</label><input type="text" class="am-modal-prompt-input" id="icon">
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
    </div>
  </div>
</div>