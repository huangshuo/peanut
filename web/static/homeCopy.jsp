<%--
  Created by IntelliJ IDEA.
  User: JAVASM
  Date: 2019/4/23
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/amazeui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/amazeui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/app.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/echarts.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shine.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr-2.8.3.js" ></script>

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
    //折线图（流量）
    flow();
    //饼图
    userPart();
    //柱状图
    histogram();

    /*折叠菜单信息*/
    //通过json动态生成菜单栏
    // var foldMenu = {
    //   "manageCenter":{
    //     "firstListName":"管理中心",
    //     "secondListName":{
    //       //key存贮jsp文件名
    //       "authorityManage":"权限管理",
    //       "menuManage":"菜单管理"
    //     },
    //     //一二级菜单关联
    //     "target":"manage",
    //     //菜单图标样式
    //     "icon":"am-icon-qq"
    //   },
    //   "templateManage":{
    //     "firstListName":"模板管理",
    //     "secondListName":{
    //       //key存贮jsp文件名
    //       "":"模板配置"
    //     },
    //     "target":"template",
    //     "icon":"am-icon-th-large"
    //   },
    //   "advertisementManage":{
    //     "firstListName":"广告管理",
    //     "secondListName":{
    //       //key存贮jsp文件名
    //       "":"首页顶置广告",
    //       "":"首页分类广告"
    //     },
    //     "target":"advertisement",
    //     "icon":"am-icon-rss-square"
    //   },
    //   "gameManage":{
    //     "firstListName":"游戏管理",
    //     "secondListName":{
    //       //key存贮jsp文件名
    //       "":"游戏配置"
    //     },
    //     "target":"game",
    //     "icon":"am-icon-gamepad"
    //   },
    //   "companyManage":{
    //     "firstListName":"合作公司管理",
    //     "secondListName":{
    //       //key存贮jsp文件名
    //       "":"合作公司管理",
    //       "":"合作公司订单管理"
    //     },
    //     "target":"company",
    //     "icon":"am-icon-building"
    //   },
    //   "channelManage":{
    //     "firstListName":"渠道版本",
    //     "secondListName":{
    //       //key存贮jsp文件名
    //       "":"渠道管理",
    //       "":"渠道分类管理"
    //     },
    //     "target":"channel",
    //     "icon":"am-icon-exchange"
    //   },
    //   "CP":{
    //     "firstListName":"CP",
    //     "secondListName":{
    //       //key存贮jsp文件名
    //       "":"CP查询"
    //     },
    //     "target":"CP",
    //     "icon":"am-icon-money"
    //   },
    //   "bookManage":{
    //     "firstListName":"图书管理",
    //     "secondListName":{
    //       //key存贮jsp文件名
    //       "":"图书列表",
    //       "":"菜单管理"
    //     },
    //     "target":"book",
    //     "icon":"am-icon-book"
    //   },
    //   "labelManage":{
    //     "firstListName":"标签管理",
    //     "secondListName":{
    //       //key存贮jsp文件名
    //       "":"标签列表"
    //     },
    //     "target":"label",
    //     "icon":"am-icon-tags"
    //   },
    //   "classificationManage":{
    //     "firstListName":"分类管理",
    //     "secondListName":{
    //       //key存贮jsp文件名
    //       "":"分类列表"
    //     },
    //     "target":"classification",
    //     "icon":"am-icon-share-alt-square"
    //   },
    //   "recommendManage":{
    //     "firstListName":"推荐管理",
    //     "secondListName":{
    //       //key存贮jsp文件名
    //       "":"首页内容推荐"
    //     },
    //     "target":"recommend",
    //     "icon":"am-icon-registered"
    //   },
    //   "CertificationManage":{
    //     "firstListName":"认证管理",
    //     "secondListName":{
    //       //key存贮jsp文件名
    //     },
    //     "target":"Certification",
    //     "icon":"am-icon-connectdevelop"
    //   }
    // };
    var menuJson={
      "code": 200,
      "msg": "操作成功",
      "data": {
        "pageNum": 1,
        "pageSize": 30,
        "totalPage": 1,
        "totalRow": 28,
        "firstPage": true,
        "lastPage": true,
        "pageData": [
          {
            "fid": 0,
            "icon": "am-icon-qq",
            "id": 1,
            "isShow": 1,
            "mname": "管理中心"
          },
          {
            "fid": 0,
            "icon": "am-icon-th-large",
            "id": 2,
            "isShow": 1,
            "mname": "模板管理"
          },
          {
            "fid": 0,
            "icon": "am-icon-rss-square",
            "id": 3,
            "isShow": 1,
            "mname": "广告管理"
          },
          {
            "fid": 0,
            "icon": "am-icon-gamepad",
            "id": 4,
            "isShow": 1,
            "mname": "游戏管理"
          },
          {
            "fid": 0,
            "icon": "am-icon-building",
            "id": 5,
            "isShow": 1,
            "mname": "合作公司管理"
          },
          {
            "fid": 0,
            "icon": "am-icon-exchange",
            "id": 6,
            "isShow": 1,
            "mname": "渠道版本"
          },
          {
            "fid": 0,
            "icon": "am-icon-money",
            "id": 7,
            "isShow": 1,
            "mname": "CP"
          },
          {
            "fid": 0,
            "icon": "am-icon-book",
            "id": 8,
            "isShow": 1,
            "mname": "图书管理"
          },
          {
            "fid": 0,
            "icon": "am-icon-tags",
            "id": 9,
            "isShow": 1,
            "mname": "标签管理"
          },
          {
            "fid": 0,
            "icon": "am-icon-share-alt-square",
            "id": 10,
            "isShow": 1,
            "mname": "分类管理"
          },
          {
            "fid": 0,
            "icon": "am-icon-registered",
            "id": 11,
            "isShow": 1,
            "mname": "推荐管理"
          },
          {
            "fid": 0,
            "icon": "connectdevelop",
            "id": 12,
            "isShow": 1,
            "mname": "认证管理"
          },
          {
            "fid": 1,
            "id": 13,
            "isShow": 1,
            "mname": "权限管理"
          },
          {
            "fid": 1,
            "id": 14,
            "isShow": 1,
            "jspName": "menuManage",
            "mname": "菜单管理"
          },
          {
            "fid": 2,
            "id": 15,
            "isShow": 1,
            "mname": "模板配置 "
          },
          {
            "fid": 2,
            "id": 16,
            "isShow": 1,
            "mname": "模板列表"
          },
          {
            "fid": 3,
            "id": 17,
            "isShow": 1,
            "mname": "首页顶置广告"
          },
          {
            "fid": 3,
            "id": 18,
            "isShow": 1,
            "mname": "首页分类广告"
          },
          {
            "fid": 4,
            "id": 19,
            "isShow": 1,
            "mname": "游戏配置"
          },
          {
            "fid": 5,
            "id": 20,
            "isShow": 1,
            "mname": "合作公司管理"
          },
          {
            "fid": 5,
            "id": 21,
            "isShow": 1,
            "mname": "合作订单管理"
          },
          {
            "fid": 6,
            "id": 22,
            "isShow": 1,
            "mname": "渠道管理"
          },
          {
            "fid": 6,
            "id": 23,
            "isShow": 1,
            "mname": "渠道分类管理"
          },
          {
            "fid": 7,
            "id": 24,
            "isShow": 1,
            "mname": "CP查询"
          },
          {
            "fid": 8,
            "id": 25,
            "isShow": 1,
            "mname": "图书列表"
          },
          {
            "fid": 9,
            "id": 26,
            "isShow": 1,
            "mname": "标签列表"
          },
          {
            "fid": 10,
            "id": 27,
            "isShow": 1,
            "mname": "分类列表"
          },
          {
            "fid": 11,
            "id": 28,
            "isShow": 1,
            "mname": "首页内容推荐"
          }
        ]
      }
    }
    for(var i in menuJson.data.pageData){
      console.log(menuJson.data.pageData[i].isShow==1);
      if(menuJson.data.pageData[i].fid===0&menuJson.data.pageData[i].isShow==1){
        $("#bodyLeft>ul").append('<li class="am-panel">' +
          '      <a data-am-collapse="{parent: \'#collapase-nav-1\', target: \'#target'+i+'\'}" style="color: white;">' +
          '        <i class="'+menuJson.data.pageData[i].icon+' am-margin-left-sm"></i> '+menuJson.data.pageData[i].mname+' <i class="am-icon-angle-right am-fr am-margin-right" id="arrow"></i>' +
          '      </a>' +
          '      <ul class="am-list am-collapse menu'+i+'" id="target'+i+'">' +
          '      </ul>' +
          '    </li>');
      }
      for(var j in menuJson.data.pageData){
        if(menuJson.data.pageData[j].fid===menuJson.data.pageData[i].id&menuJson.data.pageData[j].isShow==1){
          $(".menu"+i).append('<li>' +
                '          <a href="###" id="'+menuJson.data.pageData[j].jspName+'"><span class="'+menuJson.data.pageData[i].icon+' am-margin-left-lg"></span> '+menuJson.data.pageData[j].mname+' </a>' +
                '        </li>')
            }
        }
      }

    // for(var i in foldMenu){
    //   $("#bodyLeft>ul").append('<li class="am-panel">' +
    //     '      <a data-am-collapse="{parent: \'#collapase-nav-1\', target: \'#'+foldMenu[i].target+'\'}" style="color: white;">' +
    //     '        <i class="'+foldMenu[i].icon+' am-margin-left-sm"></i> '+foldMenu[i].firstListName+' <i class="am-icon-angle-right am-fr am-margin-right" id="arrow"></i>' +
    //     '      </a>' +
    //     '      <ul class="am-list am-collapse menu'+i+'" id="'+foldMenu[i].target+'">' +
    //     '      </ul>' +
    //     '    </li>');
    //
    //   for(var j in foldMenu[i].secondListName){
    //     console.log(j);
    //     $(".menu"+i).append('<li>' +
    //       '          <a href="###" id="'+j+'"><span class="'+foldMenu[i].icon+' am-margin-left-lg"></span> '+foldMenu[i].secondListName[j]+' </a>' +
    //       '        </li>')
    //   }
    // }
    link();

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
        $("#change").html('<a class="am-icon-angle-double-left am-secondary am-fr  am-margin-bottom-xs" style="position: relative; top: 2px" onclick="moveii()"></a>');
      }else{
        document.getElementsByClassName("bodyLeft")[0].style.left="0px";
        document.getElementById("change").style.left="0px";
        document.getElementsByClassName("bodyRight")[0].style.width="80%";
        $("#change").html('<a class="am-icon-angle-double-right am-secondary am-fr  am-margin-bottom-xs" style="position: relative; top: 2px" onclick="moveii()"></a>');
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
        '<li><a href="#">'+$(this).text()+'</a></li>');
      returnHome();
    });
  }
  //跳转页面
  function link() {
    $(".bodyLeft>ul>li>ul>li>a").on("click",function () {
      $(".bodyRightContent").load($(this).attr("id")+".jsp");
    });
  }
  //饼图
  function userPart(){
    var myChart = echarts.init(document.getElementById('container1'), 'shine');
    var app = {};
    option = null;
    var data = genData(5);

    option = {
      title : {
        text: '用户组成',
        subtext: '',
        x:'center'
      },
      tooltip : {
        trigger: 'item',
        formatter: "{a} <br/>{b} : {c} ({d}%)"
      },
      legend: {
        type: 'scroll',
        orient: 'vertical',
        right: 10,
        top: 20,
        bottom: 20,
        data: data.legendData,

        selected: data.selected
      },
      series : [
        {
          name: '姓名',
          type: 'pie',
          radius : '55%',
          center: ['40%', '50%'],
          data: data.seriesData,
          itemStyle: {
            emphasis: {
              shadowBlur: 10,
              shadowOffsetX: 0,
              shadowColor: 'rgba(0, 0, 0, 0.5)'
            }
          }
        }
      ]
    };

    function genData(count) {
      var nameList = [
        '赵', '钱', '孙', '李', '周', '吴', '郑', '王', '冯', '陈', '褚', '卫', '蒋', '沈', '韩', '杨', '朱', '秦', '尤', '许', '何', '吕', '施', '张', '孔', '曹', '严', '华', '金', '魏', '陶', '姜', '戚', '谢', '邹', '喻', '柏', '水', '窦', '章', '云', '苏', '潘', '葛', '奚', '范', '彭', '郎', '鲁', '韦', '昌', '马', '苗', '凤', '花', '方', '俞', '任', '袁', '柳', '酆', '鲍', '史', '唐', '费', '廉', '岑', '薛', '雷', '贺', '倪', '汤', '滕', '殷', '罗', '毕', '郝', '邬', '安', '常', '乐', '于', '时', '傅', '皮', '卞', '齐', '康', '伍', '余', '元', '卜', '顾', '孟', '平', '黄', '和', '穆', '萧', '尹', '姚', '邵', '湛', '汪', '祁', '毛', '禹', '狄', '米', '贝', '明', '臧', '计', '伏', '成', '戴', '谈', '宋', '茅', '庞', '熊', '纪', '舒', '屈', '项', '祝', '董', '梁', '杜', '阮', '蓝', '闵', '席', '季', '麻', '强', '贾', '路', '娄', '危'
      ];
      var legendData = [];
      var seriesData = [];
      var selected = {};
      for (var i = 0; i < 5; i++) {
        var name = Math.random() > 0.65
          ? makeWord(4, 1) + '·' + makeWord(3, 0)
          : makeWord(2, 1);
        legendData.push(name);
        seriesData.push({
          name: name,
          value: Math.round(Math.random() * 100000)
        });
        selected[name] = i < 6;
      }

      return {
        legendData: legendData,
        seriesData: seriesData,
        selected: selected
      };

      function makeWord(max, min) {
        var nameLen = Math.ceil(Math.random() * max + min);
        var name = [];
        for (var i = 0; i < nameLen; i++) {
          name.push(nameList[Math.round(Math.random() * nameList.length - 1)]);
        }
        return name.join('');
      }
    }
    ;
    if (option && typeof option === "object") {
      myChart.setOption(option, true);
    }
  }
  //柱状图
  function histogram(){
    var myChart = echarts.init(document.getElementById('container2'), 'shine');
    var app = {};
    option = null;
    option = {
      title : {
        text: '某地区蒸发量和降水量',
        subtext: '纯属虚构'
      },
      tooltip : {
        trigger: 'axis'
      },
      legend: {
        data:['蒸发量','降水量']
      },
      toolbox: {
        show : true,
        feature : {
          dataView : {show: true, readOnly: false},
          magicType : {show: true, type: ['line', 'bar']},
          restore : {show: true},
          saveAsImage : {show: true}
        }
      },
      calculable : true,
      xAxis : [
        {
          type : 'category',
          data : ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
        }
      ],
      yAxis : [
        {
          type : 'value'
        }
      ],
      series : [
        {
          name:'蒸发量',
          type:'bar',
          data:[2.0, 4.9, 7.0, 23.2, 25.6, 76.7, 135.6, 162.2, 32.6, 20.0, 6.4, 3.3],
          markPoint : {
            data : [
              {type : 'max', name: '最大值'},
              {type : 'min', name: '最小值'}
            ]
          },
          markLine : {
            data : [
              {type : 'average', name: '平均值'}
            ]
          }
        },
        {
          name:'降水量',
          type:'bar',
          data:[2.6, 5.9, 9.0, 26.4, 28.7, 70.7, 175.6, 182.2, 48.7, 18.8, 6.0, 2.3],
          markPoint : {
            data : [
              {name : '年最高', value : 182.2, xAxis: 7, yAxis: 183},
              {name : '年最低', value : 2.3, xAxis: 11, yAxis: 3}
            ]
          },
          markLine : {
            data : [
              {type : 'average', name : '平均值'}
            ]
          }
        }
      ]
    };
    ;
    if (option && typeof option === "object") {
      myChart.setOption(option, true);
    }
  }
  //折线图（流量）
  function flow(){
    var myChart = echarts.init(document.getElementById('container3'), 'shine');
    var app = {};
    option = null;
    option = {
      title: {
        text: '堆叠区域图'
      },
      tooltip : {
        trigger: 'axis',
        axisPointer: {
          type: 'cross',
          label: {
            backgroundColor: '#6a7985'
          }
        }
      },
      legend: {
        data:['邮件营销','联盟广告','视频广告','直接访问','搜索引擎']
      },
      toolbox: {
        feature: {
          saveAsImage: {}
        }
      },
      grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
      },
      xAxis : [
        {
          type : 'category',
          boundaryGap : false,
          data : ['周一','周二','周三','周四','周五','周六','周日']
        }
      ],
      yAxis : [
        {
          type : 'value'
        }
      ],
      series : [
        {
          name:'邮件营销',
          type:'line',
          stack: '总量',
          areaStyle: {},
          data:[120, 132, 101, 134, 90, 230, 210]
        },
        {
          name:'联盟广告',
          type:'line',
          stack: '总量',
          areaStyle: {},
          data:[220, 182, 191, 234, 290, 330, 310]
        },
        {
          name:'视频广告',
          type:'line',
          stack: '总量',
          areaStyle: {},
          data:[150, 232, 201, 154, 190, 330, 410]
        },
        {
          name:'直接访问',
          type:'line',
          stack: '总量',
          areaStyle: {normal: {}},
          data:[320, 332, 301, 334, 390, 330, 320]
        },
        {
          name:'搜索引擎',
          type:'line',
          stack: '总量',
          label: {
            normal: {
              show: true,
              position: 'top'
            }
          },
          areaStyle: {normal: {}},
          data:[820, 932, 901, 934, 1290, 1330, 1320]
        }
      ]
    };
    ;
    if (option && typeof option === "object") {
      myChart.setOption(option, true);
    }
  }
</script>
<style>
  /*div{*/
  /*  border: 1px solid red;*/
  /*}*/
   .header {
    height: 50px;
    border-bottom: 1px lightgray solid;
    background-color: whitesmoke;
    line-height: 45px;
    padding-left: 50px;
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
    box-shadow: 2px 2px 2px 0px darkgray;
  }
  .bodyLeft {
    -webkit-transition: left 0.75s;
    z-index : 1;
    position:relative;
    float: left;
    width: 14%;
    height: 937px;
    background-color: rgb(41, 60, 85);
    box-shadow: 2px 2px 2px 2px darkgray;
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
  .contentLine1 {
    height: 12%;
    margin-bottom: 30px;
    margin-left: 8%;
  }
  .contentLine1>div {
    margin-right: 5%;
  }
  .contentLine2{
    height: 40%;
  }
  .contentLine2>div{
    height: 100%;
    float: left;
  }
  .userPart1{
    width: 40%;
    margin-right: 8%;
  }
  .userPart2{
    width: 50%;
  }
  .contentLine3{
    height: 40%;
    width: 90%;
    margin-left: 4%;
  }
  .show{
    float: left;
    width: 200px;
    height: 100px;
    border: 1px solid lightgray;
    border-radius: 5px;
    box-shadow:lightgray 1px 1px 1px 1px;
  }
  .showLeft{
    float: left;
    height: 100%;
    width: 40%;
    border-radius: 5px 0px 0px 5px;
    background-color:rgb(45,140,240) ;
    color: white;
    text-align: center;
    padding-top: 30px;
  }
  .showRight{
    float: left;
    height: 100%;
    width: 60%;
    background-color: ghostwhite;
    background: lightblue;
    text-align: center;
    font-family:"microsoft yahei" ;
    color: rgb(77,86,106);
  }
  .number{
    line-height: 65px;
    font-size: 2.5em;
    font-weight: 500;
  }
  .numberTitle{
    font-size: small;
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
      <a href="#">花生娱乐管理平台</a>
    </h1>
    <div class="am-topbar-right">
      <div class="am-dropdown" data-am-dropdown="{boundary: '.am-topbar'}">
        <button class="am-btn am-btn-secondary am-topbar-btn am-btn-sm am-dropdown-toggle" data-am-dropdown-toggle>账户<span class="am-icon-caret-down"></span></button>
        <ul class="am-dropdown-content">
          <li>
            <a href="#">修改密码</a>
          </li>
          <li>
            <a href="#">注销</a>
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
<button class="bodyLeftLable" id="change" type="button">
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

    <div class="contentLine1">
      <div class="show">
        <div class="showLeft">
          <i class="am-icon-user-plus am-margin-bottom-lg am-icon-lg"></i>
        </div>
        <div class="showRight">
          <div class="number">803</div>
          <div class="numberTitle">新增用户</div>
        </div>
      </div>

      <div class="show">
        <div class="showLeft " style="background-color: rgb(25,190,107);">
          <i class="am-icon-hand-o-up am-margin-bottom-lg am-icon-lg"></i>
        </div>
        <div class="showRight">
          <div class="number" style="font-size: 1.6em;">253001</div>
          <div class="numberTitle">累计点击</div>
        </div>
      </div>

      <div class="show">
        <div class="showLeft " style="background-color: rgb(255,153,0);">
          <i class="am-icon-plus-square-o am-margin-bottom-lg am-icon-lg"></i>
        </div>
        <div class="showRight">
          <div class="number">666</div>
          <div class="numberTitle">新增互动</div>
        </div>
      </div>

      <div class="show">
        <div class="showLeft " style="background-color: rgb(237,63,20);">
          <i class="am-icon-share am-margin-bottom-lg am-icon-lg"></i>
        </div>
        <div class="showRight">
          <div class="number">120</div>
          <div class="numberTitle">分享统计</div>
        </div>
      </div>

      <div class="show">
        <div class="showLeft " style="background-color: rgb(154,102,228);">
          <i class="am-icon-file am-margin-bottom-lg am-icon-lg"></i>
        </div>
        <div class="showRight">
          <div class="number">12</div>
          <div class="numberTitle">新增页面</div>
        </div>
      </div>

    </div>

    <div class="contentLine2">

      <div class="userPart1">
        <div id="container1" style="height: 100%"></div>
      </div>

      <div class="userPart2">
        <div id="container2" style="height: 100%"></div>
      </div>
    </div>

    <div class="contentLine3">
      <div id="container3" style="height: 100%" ></div>
    </div>

  </div>
</div>
</body>
</html>