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
  //頁面固定換頁按鈕
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
            '      <td>'+dataType(d.firstClass)+'</td>' +
            '      <td>'+dataType(d.secondClass)+'</td>' +
            '      <td>'+dataType(d.channelNum)+'</td>' +
            '      <td>'+dataType(d.channelDownloadLink)+'</td>' +
            '      <td>'+dataType(d.productName)+'</td>' +
            '      <td>'+dataType(d.showName)+'</td>' +
            '      <td>'+dateFormat(d.createDate)+'</td>' +
            '      <td> ' +
            '         <button type="button" class="am-btn am-btn-danger am-radius deleteBtn">删除</button>' +
            '      </td>' +
            '    </tr>')
        });
        modifyMenu(page,pageSize);
        deleteChannel(page,pageSize);
      }
    });
  }
  //日期转换函数
  function dateFormat(strLongTime) {
    if(typeof(strLongTime) == "undefined"){
      return "";
    }else{
      var oDate=new Date(strLongTime);
      var year=oDate.getFullYear();
      var month=oDate.getMonth()+1;
      var date=oDate.getDate();
      var hours=oDate.getHours();
      var minutes=oDate.getMinutes();
      var seconds=oDate.getSeconds();
      return year+"年"+
        addZero(month)+"月"+
        addZero(date)+"日 "+
        addZero(hours)+"h"+
        addZero(minutes)+"m"+
        addZero(seconds)+"s";
    }
  }
  //日期补零
  function addZero(data) {
    if(data<10){
      data="0"+data;
    }
    return data;
  }
  //判断数据类型是否为空、为undefined
  function dataType(data) {
    if (typeof(data) == "undefined") {
      data="";
    }
    return data;
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
          pageData($(this).children().html(),pageSize);
          $("#currentPage").val($(this).children().html());
        });
      }
    })
  }
  //添加新渠道
  function  modifyMenu(page,pageSize){
    $('#addChannel').on('click', function() {
      $('#my-prompt').modal({
        relatedTarget: this,
        onConfirm: function(e) {
          var channelData=[
            $("#first_class").val(),
            $("#second_class").val(),
            $("#channel_num").val(),
            $("#channel_download_link").val(),
            $("#product_name").val(),
            $("#show_name").val()
          ];
          console.log(channelData);
          //确认：向数据库发送请求
          $.ajax({
            url:"${pageContext.request.contextPath}/channel/insert",
            type:"get",
            data:{
              "first_class":channelData[0],
              "second_class":channelData[1],
              "channel_num": channelData[2],
              "channel_download_link": channelData[3],
              "product_name": channelData[4],
              "show_name":channelData[5]
            },
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
  function deleteChannel(page,pageSize) {
    $(".deleteBtn").on("click",function () {
      var first_class=$(this).parent().parent().children("td:first").html();
      console.log(first_class);
      $('#my-confirm').modal({
        relatedTarget: this,
        onConfirm: function(options) {
          $.ajax({
            url:"${pageContext.request.contextPath}/channel/delete",
            type:"get",
            data:{"first_class":first_class},
            dataType:"text",
            success:function (data) {
              console.log(data);
              pageData(page,pageSize);
            }
         })
        }
      })
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
    height: 460px;
    width: 700px;
  }
  .changeMenu input{
    margin: 20px 0;
  }
  .addChannel{
    display: block;
    float: right;
    margin: 0 100px 15px 0;
  }
</style>
<div class="border" style="height: 600px;">
  <%--渠道添加添加功能--%>
  <button type="button" class="am-btn am-btn-warning am-round addChannel" id="addChannel" >添加渠道</button>
  <%--渠道管理 表单--%>
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
<%--添加渠道 模态框--%>
<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt" >
  <div class="am-modal-dialog changeMenu">
    <div class="am-modal-hd menuName" >添加菜单</div>
    <div class="am-modal-bd">
      <input type="hidden" class="am-modal-prompt-input" id="id">

      <label class="label">一级目录</label><input type="text" class="am-modal-prompt-input" id="first_class">
      <label class="label">二级目录</label><input type="text" class="am-modal-prompt-input" id="second_class">
      <label class="label">渠道号</label><input type="text" class="am-modal-prompt-input" id="channel_num">
      <label class="label">渠道下载地址</label><input type="text" class="am-modal-prompt-input" id="channel_download_link">
      <label class="label">产品名称</label><input type="text" class="am-modal-prompt-input" id="product_name">
      <label class="label">显示名称</label><input type="text" class="am-modal-prompt-input" id="show_name">

    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
    </div>
  </div>
</div>
<%--删除渠道 模态框--%>
<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">花生娱乐</div>
    <div class="am-modal-bd">
      你，确定要删除这个渠道吗？
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>