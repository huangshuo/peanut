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
        // $(".bodyRight").css("width","80%");
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
    font-size: x-large;
    font-weight: 500;
    color: rgb(41, 60, 85);
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
    /*color: rgba(237,63,20,1);*/
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
  花生娱乐管理平台
</div>
<%--页面左侧(折叠菜单)--%>
<div class="bodyLeft" id="bodyLeft">
  <ul class="am-list admin-sidebar-list" id="collapase-nav-1">

    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1'}" href="" class="home"><i class="am-icon-home am-margin-left-sm"></i> 首页</a>
    </li>

    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1', target: '#manage'}" style="color: white;">
        <i class="am-icon-qq am-margin-left-sm"></i> 管理中心 <i class="am-icon-angle-right am-fr am-margin-right" id="arrow"></i>
      </a>
      <ul class="am-list am-collapse" id="manage">
        <li>
          <a href="###" id="authorityManagement"><i class="am-icon-qq am-margin-left-lg" ></i> 权限管理 </a>
        </li>
        <li>
          <a href="###" id="menuManage"><i class="am-icon-qq  am-margin-left-lg"></i> 菜单管理 </a>
        </li>
      </ul>
    </li>

    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1', target: '#template'}" style="color: white;">
        <i class="am-icon-th-large   am-margin-left-sm"></i> 模板管理 <i class="am-icon-angle-right am-fr am-margin-right"></i>
      </a>
      <ul class="am-list am-collapse " id="template">
        <li>
          <a href="###" id="templetConfig"><i class="am-icon-th-large  am-margin-left-lg" ></i> 模板配置 </a>
        </li>
        <li>
          <a href="###" id="templetList"><i class="am-icon-th-large  am-margin-left-lg" ></i> 模板列表 </a>
        </li>
      </ul>
    </li>

    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1', target: '#advertisement'}">
        <i class="am-icon-rss-square am-margin-left-sm"></i> 广告管理 <i class="am-icon-angle-right am-fr am-margin-right"></i>
      </a>
      <ul class="am-list am-collapse " id="advertisement">
        <li>
          <a href="###"><span class="am-icon-rss-square am-margin-left-lg"></span> 首页顶置广告 </a>
        </li>
        <li>
          <a href="###"><span class="am-icon-rss-square am-margin-left-lg"></span> 首页分类广告 </a>
        </li>
      </ul>
    </li>

    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1', target: '#game'}">
        <i class="am-icon-gamepad am-margin-left-sm"></i> 游戏管理 <i class="am-icon-angle-right am-fr am-margin-right"></i>
      </a>
      <ul class="am-list am-collapse " id="game">
        <li>
          <a href="###"><span class="am-icon-gamepad am-margin-left-lg"></span> 游戏配置 </a>
        </li>
      </ul>
    </li>

    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1', target: '#company'}">
        <i class="am-icon-building am-margin-left-sm"></i> 合作公司管理 <i class="am-icon-angle-right am-fr am-margin-right"></i>
      </a>
      <ul class="am-list am-collapse " id="company">
        <li>
          <a href="###"><span class="am-icon-building am-margin-left-lg"></span> 合作公司管理 </a>
        </li>
        <li>
          <a href="###"><span class="am-icon-building am-margin-left-lg"></span> 合作公司订单管理 </a>
        </li>
      </ul>
    </li>

    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1', target: '#channel'}">
        <i class="am-icon-exchange am-margin-left-sm"></i> 渠道版本 <i class="am-icon-angle-right am-fr am-margin-right"></i>
      </a>
      <ul class="am-list am-collapse " id="channel">
        <li>
          <a href="###"><span class="am-icon-exchange am-margin-left-lg"></span> 渠道管理 </a>
        </li>
        <li>
          <a href="###"><span class="am-icon-exchange am-margin-left-lg"></span> 渠道分类管理 </a>
        </li>
      </ul>
    </li>

    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1', target: '#CP'}">
        <i class="am-icon-money am-margin-left-sm"></i> CP <i class="am-icon-angle-right am-fr am-margin-right"></i>
      </a>
      <ul class="am-list am-collapse " id="CP">
        <li>
          <a href="###"><span class="am-icon-money am-margin-left-lg"></span> CP查询 </a>
        </li>
      </ul>
    </li>

    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1', target: '#books'}">
        <i class="am-icon-book am-margin-left-sm"></i> 图书管理<i class="am-icon-angle-right am-fr am-margin-right"></i>
      </a>
      <ul class="am-list am-collapse " id="books">
        <li>
          <a href="###" id="novel"><span class="am-icon-book am-margin-left-lg" ></span> 图书列表 </a>
        </li>
      </ul>
    </li>

    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1', target: '#label'}">
        <i class="am-icon-tags am-margin-left-sm"></i> 标签管理 <i class="am-icon-angle-right am-fr am-margin-right"></i>
      </a>
      <ul class="am-list am-collapse " id="label">
        <li>
          <a href="###"><span class="am-icon-tags  am-margin-left-lg"></span> 标签列表 </a>
        </li>
      </ul>
    </li>

    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1', target: '#classification'}">
        <i class="am-icon-share-alt-square am-margin-left-sm"></i> 分类管理 <i class="am-icon-angle-right am-fr am-margin-right"></i>
      </a>
      <ul class="am-list am-collapse " id="classification">
        <li>
          <a href="###"><span class="am-icon-share-alt-square am-margin-left-lg"></span> 分类列表 </a>
        </li>
      </ul>
    </li>

    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1', target: '#recommendation'}">
        <i class="am-icon-registered am-margin-left-sm"></i> 推荐管理 <i class="am-icon-angle-right am-fr am-margin-right"></i>
      </a>
      <ul class="am-list am-collapse " id="recommendation">
        <li>
          <a href="###"><span class="am-icon-registered am-margin-left-lg"></span> 首页内容推荐 </a>
        </li>
      </ul>
    </li>

    <li class="am-panel">
      <a data-am-collapse="{parent: '#collapase-nav-1', target: '#Certification'}">
        <i class="am-icon-connectdevelop am-margin-left-sm"></i> 认证管理 <i class="am-icon-angle-right am-fr am-margin-right"></i>
      </a>
      <ul class="am-list am-collapse " id="Certification">
        <li>
          <a href="###"><span class="am-icon-connectdevelop am-margin-left-lg"></span> </a>
        </li>
      </ul>
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
