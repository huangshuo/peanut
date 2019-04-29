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
    var pageSize=$(".pageSizeNum").val();
    changePageBtn("init",page,pageSize);
    pageData("init",page,pageSize);
    addMenu(page,pageSize);
    select(page,pageSize);//生成一、二级下拉菜单数据
    search(page,pageSize);
    //???????????显示数据条数
    $(".pageSizeNum").on("change",function () {
      pageData("init",page,$(".pageSizeNum").val());
    })
  });
  //頁面固定換頁按鈕Ok
  function changePageBtn(action,page,pageSize) {
    $("#first").on("click",function () {
      var currentPage=1;
      $("#currentPage").val(1);
      pageData(action,currentPage,pageSize);
    });
    $("#last").on("click",function () {
      var totalPage= $("#totalPage").val();
      $("#currentPage").val(page);
      $("#currentPage").val(totalPage);
      pageData(action,totalPage,pageSize);
    });
    $("#next").on("click",function () {
      if($("#currentPage").val()!=$("#totalPage").val()){
        var currentPage=parseInt($("#currentPage").val()) +1;
        pageData(action,currentPage,pageSize);
      }
    });
    $("#prev").on("click",function () {
      if($("#currentPage").val()!=1){
        var currentPage=$("#currentPage").val()-1;
        pageData(action,currentPage,pageSize);
        $("#currentPage").val(currentPage);
      }
    });
  }
  //生成页面数据
  function pageData(action,page,pageSize,firstClass,secondClass,searchContent) {
    $.ajax({
      url:"${pageContext.request.contextPath}/channel/manage",
      type:"get",
      data:{"action":action,"page":page,"pageSize":pageSize,"firstClass":firstClass,"secondClass":secondClass,"searchContent":searchContent},
      dataType:"json",
      success:function (data) {
        $(".content").html("");
        $.each(data.data.pageData,function (i,d) {
          $(".content").append('<tr class="am-animation-scale-up">' +
            '      <td style="display: none">'+d.id+'</td>' +
            '      <td id="firstClass'+i+'">'+dataType(d.firstClass)+'</td>' +
            '      <td>'+dataType(d.secondClass)+'</td>' +
            '      <td>'+dataType(d.channelNum)+'</td>' +
            '      <td>'+dataType(d.channelDownloadLink)+'</td>' +
            '      <td>'+dataType(d.productName)+'</td>' +
            '      <td>'+dataType(d.showName)+'</td>' +
            '      <td>'+dateFormat(d.createDate)+'</td>' +
            '      <td> ' +
            '         <button type="button" class="am-btn am-btn-danger am-radius deleteBtn" name="'+d.id+'">删除</button>' +
            '      </td>' +
            '    </tr>');
        });

        $("li[id*='page']").remove();//每次 清空数字按钮

        for (var i = data.data.totalPage; i > 0; i--) {
          $("#prev").after('<li id="page' + i + '"><a href="###">' + i + '</a></li>');
        }
        //绑定事件
        $("li[id*='page']").on("click",function () {
          pageData(action,$(this).children().html(),pageSize,firstClass,secondClass,searchContent);
        });
        //在页面暂存totalPage、currentPage
        $("#totalPage").val(data.data.totalPage);
        $("#currentPage").val(data.data.pageNum);
        $("#currentPage-totalPage").html( data.data.pageNum+"/"+data.data.totalPage+"页");
        deleteChannel(page,pageSize);
      }
    });
  }
  //搜素功能
  function search(page,pageSize) {
    $("#search").on("click",function () {
      var action="search";
      pageData(action,1,pageSize,null,null,$("#searchContent").val());
    });
    $("#searchContent").on("keyup",function (event) {
      if(event.keyCode==13){
        var action="search";
        pageData(action,1,pageSize,null,null,$("#searchContent").val());
      }
    })
  }
  //一、二级下拉菜单功能
  function select(page,pageSize) {
    $.ajax({
      url:"${pageContext.request.contextPath}/channel/manage",
      type:"get",
      data:{"action":"selectOne","page":1,"pageSize":1000},
      dataType:"json",
      success:function (data) {
        $("#selectOne").append('<option>选择全部</option>');
        $.each(data.data.pageData,function (i,d) {
          $("#selectOne").append('<option>'+d.firstClass+'</option>')
        })
      }
    });
    $("#selectOne").on("change",function () {
      var firstClass=$(this).val()==="选择全部"?null:$(this).val();
      pageData("selectOne",page,pageSize,firstClass,null,null);
      $.ajax({
        url:"${pageContext.request.contextPath}/channel/manage",
        type:"get",
        data:{"action":"selectTwo","page":1,"pageSize":1000,"firstClass":$(this).val()},
        dataType:"json",
        success:function (data) {
          $("#selectTwo").html('<option>选择全部</option>');
          $.each(data.data.pageData,function (i,d) {
            $("#selectTwo").append('<option>'+d.secondClass+'</option>')
          })
        }
      })
    });
    $("#selectTwo").on("change",function () {
      var secondClass=$(this).val()==="选择全部"?null:$(this).val();
      pageData("selectTwo",page,pageSize,$("#selectOne").val(),secondClass,null);
    })
  }

  //添加新渠道
  function  addMenu(page,pageSize){
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
              pageData("init",page,pageSize,null,null,null);
            }
          });
        }
      });
    })
  }
  //删除渠道内容
  function deleteChannel(page,pageSize) {
    $(".deleteBtn").on("click",function () {
      $('#my-confirm').modal({
        relatedTarget: this,
        onConfirm: function(options) {
          var id = $(this.relatedTarget).attr("name");
          $.ajax({
            url:"${pageContext.request.contextPath}/channel/delete",
            type:"get",
            data:{"id":id},
            dataType:"text",
            success:function (data) {
              pageData("init",page,pageSize,null,null,null);
            }
         })
        }
      })
    })
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
   select{
    float: left;
    width: 180px;
    height: 30px;
    border-radius: 5px;
    margin-right: 20px;
  }
  .search{
    float: left;
    width: 300px;
    margin-left: 20px;
  }
  .pageSizeNum{
    float: right;
    height: 32px;
    width: 50px;
    margin:2px 0 0 20px ;
  }
</style>
<div class="border" style="height: 600px;">
  <%--下拉菜单1--%>
  <select data-am-selected="{searchBox: 1}" id="selectOne">

  </select>
    <%--下拉菜单2--%>
  <select data-am-selected="{searchBox: 1}" id="selectTwo">

  </select>
  <%--搜索框--%>
  <div class="am-input-group am-input-group-default search">
    <input type="text" class="am-form-field" placeholder="请输入渠道号" id="searchContent">
    <span class="am-input-group-btn">
        		<button class="am-btn am-btn-primary" type="button" id="search">
        			<span class="am-icon-search"></span>
        		</button>
      		</span>
  </div>
  <%--渠道添加添加功能--%>
  <button type="button" class="am-btn am-btn-primary  addChannel" id="addChannel" >添加渠道</button>
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
  <ul class="am-pagination am-pagination-right am-table-striped" id="page" style="float: right">
    <li id="first"><a href="###" >首页</a></li>
    <li id="prev"><a href="###">上一页</a></li>
    <li id="next"><a href="###" >下一页</a></li>
    <li id="last"><a href="###" >尾页</a></li>
    <li id="currentPage-totalPage"></li>
    <input type="hidden" value="" id="totalPage"/>
    <input type="hidden" value="" id="currentPage"/>
    <select class="pageSizeNum">
      <option>5</option>
      <option>10</option>
    </select>
  </ul>

</div>
<%--隐藏域、放总页数\当前页数--%>

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