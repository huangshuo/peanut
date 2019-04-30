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
    changePageBtn("select",page,pageSize);
    pageData("select",page,pageSize);
    addMenu(page,pageSize);
    $(".pageSizeNum").on("change",function () {
      pageData("select",page,$(".pageSizeNum").val());
    })
  });
  //頁面固定換頁按鈕
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
  function pageData(action,page,pageSize) {
    $.ajax({
      url:"${pageContext.request.contextPath}/backend/channel/class/manage",
      type:"get",
      data:{"action":action,"page":page,"pageSize":pageSize},
      dataType:"json",
      success:function (data) {
        $(".content").html("");
        $.each(data.data.pageData,function (i,d) {
          $(".content").append('<tr class="am-animation-scale-up">' +
            '      <td style="display: none">'+d.id+'</td>' +
            '      <td id="firstClass'+i+'">'+dataType(d.className)+'</td>' +
            '      <td>'+dataType(d.fname)+'</td>' +
            '      <td>'+dataType(d.labelOrder)+'</td>' +
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
          pageData(action,$(this).children().html(),pageSize);
        });
        //在页面暂存totalPage、currentPage
        $("#totalPage").val(data.data.totalPage);
        $("#currentPage").val(data.data.pageNum);
        $("#currentPage-totalPage").html( data.data.pageNum+"/"+data.data.totalPage+"页");
        deleteChannel("delete",page,pageSize);
      }
    });
  }
  //添加新渠道分类
  function  addMenu(page,pageSize){
    $('#addChannel').on('click', function() {
      $('#my-prompt').modal({
        relatedTarget: this,
        onConfirm: function(e) {
          //确认：向数据库发送请求
          $.ajax({
            url:"${pageContext.request.contextPath}/backend/channel/class/manage",
            type:"get",
            data:{"action":"insert",
              "className":e.data[1],
              "fname":e.data[2],
              "labelOrder":e.data[3]
            },
            dataType:"text",
            success:function(data){
              pageData("select",page,pageSize);
            }
          });
        }
      });
    })
  }
  //删除渠道分类
  function deleteChannel(action,page,pageSize) {
    $(".deleteBtn").on("click",function () {
      $('#my-confirm').modal({
        relatedTarget: this,
        onConfirm: function(options) {
          var id = $(this.relatedTarget).attr("name");
          $.ajax({
            url:"${pageContext.request.contextPath}/backend/channel/class/manage",
            type:"get",
            data:{"action":action,"id":id},
            dataType:"text",
            success:function (data) {
              console.log(123);
              pageData("select",page,pageSize);
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
    height: 350px;
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
    height: 38px;
    border-radius: 5px;
    margin-right: 20px;
  }
  .pageSizeNum{
    float: right;
    height: 32px;
    width: 50px;
    margin:2px 0 0 20px ;
  }
</style>
<div class="border" style="height: 600px;">
   <%--添加渠道分类功能--%>
  <button type="button" class="am-btn am-btn-primary  addChannel" id="addChannel" >添加渠道分类</button>
  <%--渠道分类 表单--%>
  <table class="am-table  am-table-centered am-table-hover am-table-striped">
    <thead>
    <tr class="am-primary">
      <th>分类名称</th>
      <th>父级</th>
      <th>标签排序</th>
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
    <div class="am-modal-hd menuName" >添加渠道分类</div>
    <div class="am-modal-bd">
      <input type="hidden" class="am-modal-prompt-input" id="id">
      <label class="label">分类名称</label><input type="text" class="am-modal-prompt-input" id="first_class">
      <label class="label">父级</label><input type="text" class="am-modal-prompt-input" id="second_class">
      <label class="label">标签排序</label><input type="text" class="am-modal-prompt-input" id="channel_num">
      <label class="label">备注</label><input type="text" class="am-modal-prompt-input" id="channel_download_link">
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm >提交</span>
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
