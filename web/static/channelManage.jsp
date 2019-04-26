<%--
  Created by IntelliJ IDEA.
  User: JAVASM
  Date: 2019/4/26
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script>
  $(function () {
    var page=1;
    var pageSize=10;
    changePageBtn(page,pageSize);
    pageData(page,pageSize);
    pageBtnLoad(page,pageSize);
  });
  //点击换页按钮切换页面
  function changePageBtn(page,pageSize) {
    $("#first").on("click",function () {
      page=1;
      pageData(page,pageSize);
    });
    $("#last").on("click",function () {
      page= $("#totalPage").val();
      $("#currentPage").val(page);
      pageData(page,pageSize);
    });
    $("#next").on("click",function () {
      if($("#currentPage").val()!=$("#totalPage").val()){
        page=parseInt($("#currentPage").val()) +1;
        $("#currentPage").val(page);
        pageData(page,pageSize);
      }
    });
    $("#prev").on("click",function () {
      if($("#currentPage").val()!=1){
        page=$("#currentPage").val()-1;
        $("#currentPage").val(page);
        pageData(page,pageSize);
      }
    });
  }
  //生成页面数据
  function pageData(page,pageSize) {
    $.ajax({
      url:"${pageContext.request.contextPath}/channel/manage",
      type:"get",
      data:{"page":page,"pageSize":pageSize},
      dataType:"json",
      success:function (data) {
        $(".content").html("");
        $.each(data.data.pageData,function (i,d) {
          $(".content").append('<tr class="am-animation-scale-up">' +
            '      <td>'+d.firstClass+'</td>' +
            '      <td>'+d.secondClass+'</td>' +
            '      <td>'+d.channelNum+'</td>' +
            '      <td>'+d.channelDownloadLink+'</td>' +
            '      <td>'+d.productName+'</td>' +
            '      <td>'+d.showName+'</td>' +
            '      <td>'+d.createDate+'</td>' +
            '      <td> <button type="button" ' +
            '                         class="am-btn am-btn-primary am-radius doc-prompt-toggle" ' +
            '                         id="" ' +
            '                         data-am-modal="{target: #dmy-prompt}">修改' +
            '           </button>' +
            '           <button type="button" class="am-btn am-btn-danger am-radius">删除</button>' +
            '      </td>' +
            '    </tr>')
        });
        modifyMenu(page,pageSize);
      }
    });
  }
  //页面加载根据总页码数 生成页码按钮
  function pageBtnLoad(page,pageSize) {
    $.ajax({
      url:"${pageContext.request.contextPath}/channel/manage",
      type:"get",
      data:{"page":page,"pageSize":pageSize},
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
  //更新菜单内容 待完成
  function  modifyMenu(page,pageSize){

    $('.doc-prompt-toggle').on('click', function() {
      $("#first_class").val($(this).parent().prev().prev().prev().prev().prev().html());
      $("#second_class").val($(this).parent().prev().prev().prev().prev().html());
      $("#channel_num").val($(this).parent().prev().prev().prev().html());
      $("#channel_download_link").val($(this).parent().prev().prev().html());
      $("#product_name").val($(this).parent().prev().html());
      $("#show_name").val($(this).parent().prev().html());
      $("#create_date").val($(this).parent().prev().html());
      $('#my-prompt').modal({
        relatedTarget: this,
        onConfirm: function(e) {
          //确认：向数据库发送请求
          $.ajax({
            url:"${pageContext.request.contextPath}/channel/update",
            type:"get",
            data:{"id":$("#id").val(),"menuName":$("#menuName").val(),"fid": $("#fid").val(),"isShow": $("#isShow").val(),"icon": $("#icon").val()},
            dataType:"text",
            success:function(data){
              pageData(page,pageSize);
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
    width: 110px;
    text-align: right;
    margin-right: 10px;
  }
  .menuName{
    font-size: 25px;
  }
  .changeMenu{
    height: 510px;
    width: 700px;
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
      <th>一级目录</th>
      <th>二级目录</th>
      <th>渠道号</th>
      <th>渠道下载地址</th>
      <th>产品名称</th>
      <th>显示名称</th>
      <th>创建时间</th>
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


      <label class="label">一级目录</label><input type="text" class="am-modal-prompt-input" id="first_class">
      <label class="label">二级目录</label><input type="text" class="am-modal-prompt-input" id="second_class">
      <label class="label">渠道号</label><input type="text" class="am-modal-prompt-input" id="channel_num">
      <label class="label">渠道下载地址</label><input type="text" class="am-modal-prompt-input" id="channel_download_link">
      <label class="label">产品名称</label><input type="text" class="am-modal-prompt-input" id="product_name">
      <label class="label">显示名称</label><input type="text" class="am-modal-prompt-input" id="show_name">
      <label class="label">创建时间</label><input type="text" class="am-modal-prompt-input" id="create_date">
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
    </div>
  </div>
</div>
