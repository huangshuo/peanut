<%--
  Created by IntelliJ IDEA.
  User: JAVASM
  Date: 2019/4/29
  Time: 21:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/echarts.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shine.js"></script>
<script>
  $(function() {
    userPart();
    histogram();
    flow();
  });
  //饼图
  function userPart(){
    var myChart = echarts.init(document.getElementById('container1'), 'shine');
    var app = {};
    option = null;
    var data = genData(5);

    option = {
      title : {
        text: '用户按地区分布',
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
      for (var i = 0; i < 9; i++) {
        var name = ["江苏","浙江","广东","山东","四川","河南","上海","北京","其他"][i];
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
        text: '用户充值率',
        subtext: ''
      },
      tooltip : {
        trigger: 'axis'
      },
      legend: {
        data:['总用户','有充值记录用户']
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
          name:'总用户',
          type:'bar',
          data:[10000*2, 10000*3, 10000*4.5, 10000*5.2, 10000*6, 10000*9, 10000*20, 10000*25, 10000*33, 10000*39, 10000*45, 10000*50],
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
          name:'有充值记录用户',
          type:'bar',
          data:[10000*2*0.1, 10000*3*0.11, 10000*4.5*0.125, 10000*5.2*0.08, 10000*6*0.16, 10000*9*0.22, 10000*20*0.26, 10000*25*0.13, 10000*33*0.22, 10000*39*0.13, 10000*45*0.121, 10000*50*0.125],
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
        text: '渠道下载量'
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
        data:['应用市场推广','手机厂商预装','社交平台推广','内容推广','其他']
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
          name:'应用市场推广',
          type:'line',
          stack: '总量',
          areaStyle: {},
          data:[820*10, 932*10, 901*10, 934*10, 1290*10, 1330*10, 1320*10]
        },
        {
          name:'手机厂商预装',
          type:'line',
          stack: '总量',
          areaStyle: {},
          data:[220*10, 182*10, 191*10, 234*10, 290*10, 330*10, 310*10]
        },
        {
          name:'社交平台推广',
          type:'line',
          stack: '总量',
          areaStyle: {},
          data:[150*10, 232*10, 201*10, 154*10, 190*10, 330*10, 410*10]
        },
        {
          name:'内容推广',
          type:'line',
          stack: '总量',
          areaStyle: {normal: {}},
          data:[320*10, 332*10, 301*10, 334*10, 390*10, 330*10, 320*10]
        },
        {
          name:'其他渠道',
          type:'line',
          stack: '总量',
          label: {
            normal: {
              show: true,
              position: 'top'
            }
          },
          areaStyle: {normal: {}},
          data:[120*10, 132*10, 101*10, 134*10, 90*10, 230*10, 210*10]
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

</style>
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