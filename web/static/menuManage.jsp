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
    pageChange(page);
    changePage(page);
    pageLoad(page);
  });

  function changePage(page) {
    $("#first").on("click",function () {
      page=1;
      pageChange(page);
    });
    $("#last").on("click",function () {
      page= $("#totalPage").val();
      $("#currentPage").val(page);
      pageChange(page);
    });
    $("#next").on("click",function () {
      if($("#currentPage").val()!=$("#totalPage").val()){
        page=parseInt($("#currentPage").val()) +1;
        $("#currentPage").val(page);
        pageChange(page);
      }
    });
    $("#prev").on("click",function () {
      if($("#currentPage").val()!=1){
        page=$("#currentPage").val()-1;
        $("#currentPage").val(page);
        pageChange(page);
      }
    });
  }

  function pageChange(page) {
    $.ajax({
      url:"${pageContext.request.contextPath}/menu/manage",
      type:"get",
      data:{"page":page},
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
            '      <td> <button type="button" class="am-btn am-btn-primary am-radius">修改</button>' +
            '           <button type="button" class="am-btn am-btn-danger am-radius">删除</button>' +
            '      </td>' +
            '    </tr>')
        });
      }
    });
  }

  function pageLoad(page) {
    $.ajax({
      url:"${pageContext.request.contextPath}/menu/manage",
      type:"get",
      data:{"page":page},
      dataType:"json",
      success:function (data) {
        $("#totalPage").val(data.data.totalPage);
        for (var i = data.data.totalPage; i > 0; i--) {
          $("#prev").after('<li id="page' + i + '"><a href="###">' + i + '</a></li>');
        }
        $("li[id*='page']").on("click",function () {
          pageChange($(this).children().html());
          $("#currentPage").val($(this).children().html());
        });
      }
    })
  }
</script>
<style>
  .border{
    margin: 20px;
  }
  .border ul{
    background-color: white;
  }
</style>
<div class="border" style="height: 600px;">
  <%--菜单管理表单--%>
  <table class="am-table  am-table-centered am-table-hover">
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