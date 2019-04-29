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
    changeIcon();
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
          var isShow=d.isShow==1?'<i class="am-icon-check-square am-margin-left-sm" style="color: green;font-size: 20px"></i>'
            :'<i class="am-icon-remove am-margin-left-sm" style="color: red;font-size: 20px"></i>';
          $(".content").append('<tr class="am-animation-scale-up">' +
            '      <td>'+d.id+'</td>' +
            '      <td>'+d.mname+'</td>' +
            '      <td>'+d.fid+'</td>' +
            '      <td>'+isShow+'</td>' +
            '      <td><i class="'+d.icon+' am-margin-left-sm" style="font-size: 30px"></i></td>' +
            '      <td> <button type="button" ' +
            '                         class="am-btn am-btn-primary am-radius doc-prompt-toggle" ' +
            '                         id="menuId+'+i+'"'+
            '                         data-am-modal="{target: #dmy-prompt}">修改' +
            '           </button>' +
            '           <button type="button" class="am-btn am-btn-danger am-radius" id="delete+'+i+'">删除</button>' +
            '      </td>' +
            '    </tr>')
        });
        addMenu(page);
        modifyMenu(page);
        deleteMenu(page);
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
  function  modifyMenu(page){
    $("button[id*='menuId']").on('click', function() {
      $.each(iconArr,function (i,d) {
        $("#iconList").append('<li><a href="#"><i class="'+d+' am-margin-left-sm" style="font-size: 30px"></i></a></li>');
      });
      $("#menuName").val($(this).parent().parent().children().eq(1).html());
      $("#fid").val($(this).parent().parent().children().eq(2).html());
      $("#currentIcon").html("");
      $("#currentIcon").html($(this).parent().prev().html());
      $('#my-prompt').modal({
        relatedTarget: this,
        onConfirm: function(e) {
          var id = $(this.relatedTarget).parent().parent().children().eq(0).html();
          var mName = $("#menuName").val();
          var fid = $("#fid").val();
          var isShow = $("input[name='isShow']:checked").val();
          //确认：向数据库发送请求
          $.ajax({
            url:"${pageContext.request.contextPath}/menu/update",
            type:"get",
            data:{"id":id,"menuName":mName,"fid": fid,"isShow": isShow,"icon": $("#currentIcon").children("i:first").attr("class").split(" ")[0]},
            dataType:"text",
            success:function(data){
              pageData($("#currentPage").val());
            }
          });
        },
        onCancel: function() {
          $(".iconList").css("display","none");
        }
      });
    })
  }
  //删除菜单内容
  function deleteMenu(page) {
    $("button[id*='delete']").on("click",function () {
      $('#my-confirm-delete').modal({
        relatedTarget: this,
        onConfirm: function(options) {
          var id=$(this.relatedTarget).parent().parent().children("td:first").html();
          $.ajax({
            url:"${pageContext.request.contextPath}/menu/delete",
            type:"get",
            data:{"id":id},
            dataType:"text",
            success:function (data) {
              pageData($("#currentPage").val());
            }
          })
        },
        onCancel: function() {
        }
      });
    })
  }
  //添加新菜单
  function  addMenu(page){
    $('#addMenu').on('click', function() {
      $(".menuName").html("添加菜单");
      $.each(iconArr,function (i,d) {
        $("#iconList").append('<li><a href="#"><i class="'+d+' am-margin-left-sm" style="font-size: 30px"></i></a></li>');
      });
      var isShow=$("#line3 input[name='isShow']:checked").val();
      $("#currentIcon").html('<i class="am-icon-navicon am-margin-left-sm" style="font-size: 30px"></i>');
      $('#my-prompt').modal({
        relatedTarget: this,
        onConfirm: function(e) {
          // icon=icon==""?'':icon.split(" ")[0];

          //确认：向数据库发送请求
          $.ajax({
            url:"${pageContext.request.contextPath}/menu/insert",
            type:"get",
            data:{"menuName":$("#menuName").val(),"fid": $("#fid").val(),"isShow": isShow,"icon": $("#currentIcon").children("i:first").attr("class").split(" ")[0] },
            dataType:"text",
            success:function(data){
              pageData($("#totalPage").val());
            }
          });
        },
        onCancel: function() {
          $(".iconList").css("display","none");
        }
      });
    })
  }
  //更换图标
  function changeIcon() {
    $("#changeIcon").on("click",function(){
      $(".iconList").css("display","block");
      confirmIcon();
    })
  }
  function confirmIcon() {
    $("#iconList>li>a").on("click",function () {
      $("#currentIcon").html($(this).html());
      $(".iconList").css("display","none");
      console.log($("#currentIcon").children());
    })
  }
  var iconArr=["am-icon-american-sign-language-interpreting",
    "am-icon-asl-interpreting (alias)",
    "am-icon-assistive-listening-systems",
    "am-icon-audio-description",
    "am-icon-blind",
    "am-icon-braille",
    "am-icon-deaf",
    "am-icon-deafness (alias)",
    "am-icon-envira",
    "am-icon-fa (alias)",
    "am-icon-first-order",
    "am-icon-font-awesome",
    "am-icon-gitlab",
    "am-icon-glide",
    "am-icon-glide-g",
    "am-icon-google-plus-circle (alias)",
    "am-icon-google-plus-official",
    "am-icon-hard-of-hearing (alias)",
    "am-icon-instagram",
    "am-icon-low-vision",
    "am-icon-pied-piper",
    "am-icon-question-circle-o",
    "am-icon-sign-language",
    "am-icon-signing (alias)",
    "am-icon-snapchat",
    "am-icon-snapchat-ghost",
    "am-icon-snapchat-square",
    "am-icon-themeisle",
    "am-icon-universal-access",
    "am-icon-viadeo",
    "am-icon-viadeo-square",
    "am-icon-volume-control-phone",
    "am-icon-wheelchair-alt",
    "am-icon-wpbeginner",
    "am-icon-wpforms",
    "am-icon-yoast",
    "am-icon-bluetooth",
    "am-icon-bluetooth-b",
    "am-icon-codiepie",
    "am-icon-credit-card-alt",
    "am-icon-edge",
    "am-icon-fort-awesome",
    "am-icon-hashtag",
    "am-icon-mixcloud",
    "am-icon-modx",
    "am-icon-pause-circle",
    "am-icon-pause-circle-o",
    "am-icon-percent",
    "am-icon-product-hunt",
    "am-icon-reddit-alien",
    "am-icon-scribd",
    "am-icon-shopping-bag",
    "am-icon-shopping-basket",
    "am-icon-stop-circle",
    "am-icon-stop-circle-o",
    "am-icon-usb",
    "am-icon-",
    "am-icon-ntAwesome4.4新增字体（AmazeUI2.5中搭载）",
    "am-icon-",
    "am-icon-500px",
    "am-icon-amazon",
    "am-icon-balance-scale",
    "am-icon-battery-0 (alias)",
    "am-icon-battery-1 (alias)",
    "am-icon-battery-2 (alias)",
    "am-icon-battery-3 (alias)",
    "am-icon-battery-4 (alias)",
    "am-icon-battery-empty",
    "am-icon-battery-full",
    "am-icon-battery-half",
    "am-icon-battery-quarter",
    "am-icon-battery-three-quarters",
    "am-icon-black-tie",
    "am-icon-calendar-check-o",
    "am-icon-calendar-minus-o",
    "am-icon-calendar-plus-o",
    "am-icon-calendar-times-o",
    "am-icon-cc-diners-club",
    "am-icon-cc-jcb",
    "am-icon-chrome",
    "am-icon-clone",
    "am-icon-commenting",
    "am-icon-commenting-o",
    "am-icon-contao",
    "am-icon-creative-commons",
    "am-icon-expeditedssl",
    "am-icon-firefox",
    "am-icon-fonticons",
    "am-icon-genderless",
    "am-icon-get-pocket",
    "am-icon-gg",
    "am-icon-gg-circle",
    "am-icon-hand-grab-o (alias)",
    "am-icon-hand-lizard-o",
    "am-icon-hand-paper-o",
    "am-icon-hand-peace-o",
    "am-icon-hand-pointer-o",
    "am-icon-hand-rock-o",
    "am-icon-hand-scissors-o",
    "am-icon-hand-spock-o",
    "am-icon-hand-stop-o (alias)",
    "am-icon-hourglass",
    "am-icon-hourglass-1 (alias)",
    "am-icon-hourglass-2 (alias)",
    "am-icon-hourglass-3 (alias)",
    "am-icon-hourglass-end",
    "am-icon-hourglass-half",
    "am-icon-hourglass-o",
    "am-icon-hourglass-start",
    "am-icon-houzz",
    "am-icon-i-cursor",
    "am-icon-industry",
    "am-icon-internet-explorer",
    "am-icon-map",
    "am-icon-map-o",
    "am-icon-map-pin",
    "am-icon-map-signs",
    "am-icon-mouse-pointer",
    "am-icon-object-group",
    "am-icon-object-ungroup",
    "am-icon-odnoklassniki",
    "am-icon-odnoklassniki-square",
    "am-icon-opencart",
    "am-icon-opera",
    "am-icon-optin-monster",
    "am-icon-registered",
    "am-icon-safari",
    "am-icon-sticky-note",
    "am-icon-sticky-note-o",
    "am-icon-television",
    "am-icon-trademark",
    "am-icon-tripadvisor",
    "am-icon-tv (alias)",
    "am-icon-vimeo",
    "am-icon-wikipedia-w",
    "am-icon-y-combinator",
    "am-icon-yc (alias)",
    "am-icon-",
    "am-icon-",
    "am-icon-bed",
    "am-icon-buysellads",
    "am-icon-cart-arrow-down",
    "am-icon-cart-plus",
    "am-icon-connectdevelop",
    "am-icon-dashcube",
    "am-icon-diamond",
    "am-icon-facebook-official",
    "am-icon-forumbee",
    "am-icon-heartbeat",
    "am-icon-hotel (alias)",
    "am-icon-leanpub",
    "am-icon-mars",
    "am-icon-mars-double",
    "am-icon-mars-stroke",
    "am-icon-mars-stroke-h",
    "am-icon-mars-stroke-v",
    "am-icon-medium",
    "am-icon-mercury",
    "am-icon-motorcycle",
    "am-icon-neuter",
    "am-icon-pinterest-p",
    "am-icon-sellsy",
    "am-icon-server",
    "am-icon-ship",
    "am-icon-shirtsinbulk",
    "am-icon-simplybuilt",
    "am-icon-skyatlas",
    "am-icon-street-view",
    "am-icon-subway",
    "am-icon-train",
    "am-icon-transgender",
    "am-icon-transgender-alt",
    "am-icon-user-plus",
    "am-icon-user-secret",
    "am-icon-user-times",
    "am-icon-venus",
    "am-icon-venus-double",
    "am-icon-venus-mars",
    "am-icon-viacoin",
    "am-icon-whatsapp",
    "am-icon-",
    "am-icon-NewIconsin4.2",
    "am-icon-",
    "am-icon-angellist",
    "am-icon-area-chart",
    "am-icon-at",
    "am-icon-bell-slash",
    "am-icon-bell-slash-o",
    "am-icon-bicycle",
    "am-icon-binoculars",
    "am-icon-birthday-cake",
    "am-icon-bus",
    "am-icon-calculator",
    "am-icon-cc",
    "am-icon-cc-amex",
    "am-icon-cc-discover",
    "am-icon-cc-mastercard",
    "am-icon-cc-paypal",
    "am-icon-cc-stripe",
    "am-icon-cc-visa",
    "am-icon-copyright",
    "am-icon-eyedropper",
    "am-icon-futbol-o",
    "am-icon-google-wallet",
    "am-icon-ils",
    "am-icon-ioxhost",
    "am-icon-lastfm",
    "am-icon-lastfm-square",
    "am-icon-line-chart",
    "am-icon-meanpath",
    "am-icon-newspaper-o",
    "am-icon-paint-brush",
    "am-icon-paypal",
    "am-icon-pie-chart",
    "am-icon-plug",
    "am-icon-shekel (alias)",
    "am-icon-sheqel (alias)",
    "am-icon-slideshare",
    "am-icon-soccer-ball-o (alias)",
    "am-icon-toggle-off",
    "am-icon-toggle-on",
    "am-icon-trash",
    "am-icon-tty",
    "am-icon-twitch",
    "am-icon-wifi",
    "am-icon-yelp",
    "am-icon-adjust",
    "am-icon-anchor",
    "am-icon-archive",
    "am-icon-area-chart",
    "am-icon-arrows",
    "am-icon-arrows-h",
    "am-icon-arrows-v",
    "am-icon-asterisk",
    "am-icon-at",
    "am-icon-automobile (alias)",
    "am-icon-ban",
    "am-icon-bank (alias)",
    "am-icon-bar-chart",
    "am-icon-bar-chart-o (alias)",
    "am-icon-barcode",
    "am-icon-bars",
    "am-icon-beer",
    "am-icon-bell",
    "am-icon-bell-o",
    "am-icon-bell-slash",
    "am-icon-bell-slash-o",
    "am-icon-bicycle",
    "am-icon-binoculars",
    "am-icon-birthday-cake",
    "am-icon-bolt",
    "am-icon-bomb",
    "am-icon-book",
    "am-icon-bookmark",
    "am-icon-bookmark-o",
    "am-icon-briefcase",
    "am-icon-bug",
    "am-icon-building",
    "am-icon-building-o",
    "am-icon-bullhorn",
    "am-icon-bullseye",
    "am-icon-bus",
    "am-icon-cab (alias)",
    "am-icon-calculator",
    "am-icon-calendar",
    "am-icon-calendar-o",
    "am-icon-camera",
    "am-icon-camera-retro",
    "am-icon-car",
    "am-icon-caret-square-o-down",
    "am-icon-caret-square-o-left",
    "am-icon-caret-square-o-right",
    "am-icon-caret-square-o-up",
    "am-icon-cc",
    "am-icon-certificate",
    "am-icon-check",
    "am-icon-check-circle",
    "am-icon-check-circle-o",
    "am-icon-check-square",
    "am-icon-check-square-o",
    "am-icon-child",
    "am-icon-circle",
    "am-icon-circle-o",
    "am-icon-circle-o-notch",
    "am-icon-circle-thin",
    "am-icon-clock-o",
    "am-icon-close (alias)",
    "am-icon-cloud",
    "am-icon-cloud-download",
    "am-icon-cloud-upload",
    "am-icon-code",
    "am-icon-code-fork",
    "am-icon-coffee",
    "am-icon-cog",
    "am-icon-cogs",
    "am-icon-comment",
    "am-icon-comment-o",
    "am-icon-comments",
    "am-icon-comments-o",
    "am-icon-compass",
    "am-icon-copyright",
    "am-icon-credit-card",
    "am-icon-crop",
    "am-icon-crosshairs",
    "am-icon-cube",
    "am-icon-cubes",
    "am-icon-cutlery",
    "am-icon-dashboard (alias)",
    "am-icon-database",
    "am-icon-desktop",
    "am-icon-dot-circle-o",
    "am-icon-download",
    "am-icon-edit (alias)",
    "am-icon-ellipsis-h",
    "am-icon-ellipsis-v",
    "am-icon-envelope",
    "am-icon-envelope-o",
    "am-icon-envelope-square",
    "am-icon-eraser",
    "am-icon-exchange",
    "am-icon-exclamation",
    "am-icon-exclamation-circle",
    "am-icon-exclamation-triangle",
    "am-icon-external-link",
    "am-icon-external-link-square",
    "am-icon-eye",
    "am-icon-eye-slash",
    "am-icon-eyedropper",
    "am-icon-fax",
    "am-icon-female",
    "am-icon-fighter-jet",
    "am-icon-file-archive-o",
    "am-icon-file-audio-o",
    "am-icon-file-code-o",
    "am-icon-file-excel-o",
    "am-icon-file-image-o",
    "am-icon-file-movie-o (alias)",
    "am-icon-file-pdf-o",
    "am-icon-file-photo-o (alias)",
    "am-icon-file-picture-o (alias)",
    "am-icon-file-powerpoint-o",
    "am-icon-file-sound-o (alias)",
    "am-icon-file-video-o",
    "am-icon-file-word-o",
    "am-icon-file-zip-o (alias)",
    "am-icon-film",
    "am-icon-filter",
    "am-icon-fire",
    "am-icon-fire-extinguisher",
    "am-icon-flag",
    "am-icon-flag-checkered",
    "am-icon-flag-o",
    "am-icon-flash (alias)",
    "am-icon-flask",
    "am-icon-folder",
    "am-icon-folder-o",
    "am-icon-folder-open",
    "am-icon-folder-open-o",
    "am-icon-frown-o",
    "am-icon-futbol-o",
    "am-icon-gamepad",
    "am-icon-gavel",
    "am-icon-gear (alias)",
    "am-icon-gears (alias)",
    "am-icon-gift",
    "am-icon-glass",
    "am-icon-globe",
    "am-icon-graduation-cap",
    "am-icon-group (alias)",
    "am-icon-hdd-o",
    "am-icon-headphones",
    "am-icon-heart",
    "am-icon-heart-o",
    "am-icon-history",
    "am-icon-home",
    "am-icon-image (alias)",
    "am-icon-inbox",
    "am-icon-info",
    "am-icon-info-circle",
    "am-icon-institution (alias)",
    "am-icon-key",
    "am-icon-keyboard-o",
    "am-icon-language",
    "am-icon-laptop",
    "am-icon-leaf",
    "am-icon-legal (alias)",
    "am-icon-lemon-o",
    "am-icon-level-down",
    "am-icon-level-up",
    "am-icon-life-bouy (alias)",
    "am-icon-life-buoy (alias)",
    "am-icon-life-ring",
    "am-icon-life-saver (alias)",
    "am-icon-lightbulb-o",
    "am-icon-line-chart",
    "am-icon-location-arrow",
    "am-icon-lock",
    "am-icon-magic",
    "am-icon-magnet",
    "am-icon-mail-forward (alias)",
    "am-icon-mail-reply (alias)",
    "am-icon-mail-reply-all (alias)",
    "am-icon-male",
    "am-icon-map-marker",
    "am-icon-meh-o",
    "am-icon-microphone",
    "am-icon-microphone-slash",
    "am-icon-minus",
    "am-icon-minus-circle",
    "am-icon-minus-square",
    "am-icon-minus-square-o",
    "am-icon-mobile",
    "am-icon-mobile-phone (alias)",
    "am-icon-money",
    "am-icon-moon-o",
    "am-icon-mortar-board (alias)",
    "am-icon-music",
    "am-icon-navicon (alias)",
    "am-icon-newspaper-o",
    "am-icon-paint-brush",
    "am-icon-paper-plane",
    "am-icon-paper-plane-o",
    "am-icon-paw",
    "am-icon-pencil",
    "am-icon-pencil-square",
    "am-icon-pencil-square-o",
    "am-icon-phone",
    "am-icon-phone-square",
    "am-icon-photo (alias)",
    "am-icon-picture-o",
    "am-icon-pie-chart",
    "am-icon-plane",
    "am-icon-plug",
    "am-icon-plus",
    "am-icon-plus-circle",
    "am-icon-plus-square",
    "am-icon-plus-square-o",
    "am-icon-power-off",
    "am-icon-print",
    "am-icon-puzzle-piece",
    "am-icon-qrcode",
    "am-icon-question",
    "am-icon-question-circle",
    "am-icon-quote-left",
    "am-icon-quote-right",
    "am-icon-random",
    "am-icon-recycle",
    "am-icon-refresh",
    "am-icon-remove (alias)",
    "am-icon-reorder (alias)",
    "am-icon-reply",
    "am-icon-reply-all",
    "am-icon-retweet",
    "am-icon-road",
    "am-icon-rocket",
    "am-icon-rss",
    "am-icon-rss-square",
    "am-icon-search",
    "am-icon-search-minus",
    "am-icon-search-plus",
    "am-icon-send (alias)",
    "am-icon-send-o (alias)",
    "am-icon-share",
    "am-icon-share-alt",
    "am-icon-share-alt-square",
    "am-icon-share-square",
    "am-icon-share-square-o",
    "am-icon-shield",
    "am-icon-shopping-cart",
    "am-icon-sign-in",
    "am-icon-sign-out",
    "am-icon-signal",
    "am-icon-sitemap",
    "am-icon-sliders",
    "am-icon-smile-o",
    "am-icon-soccer-ball-o (alias)",
    "am-icon-sort",
    "am-icon-sort-alpha-asc",
    "am-icon-sort-alpha-desc",
    "am-icon-sort-amount-asc",
    "am-icon-sort-amount-desc",
    "am-icon-sort-asc",
    "am-icon-sort-desc",
    "am-icon-sort-down (alias)",
    "am-icon-sort-numeric-asc",
    "am-icon-sort-numeric-desc",
    "am-icon-sort-up (alias)",
    "am-icon-space-shuttle",
    "am-icon-spinner",
    "am-icon-spoon",
    "am-icon-square",
    "am-icon-square-o",
    "am-icon-star",
    "am-icon-star-half",
    "am-icon-star-half-empty (alias)",
    "am-icon-star-half-full (alias)",
    "am-icon-star-half-o",
    "am-icon-star-o",
    "am-icon-suitcase",
    "am-icon-sun-o",
    "am-icon-support (alias)",
    "am-icon-tablet",
    "am-icon-tachometer",
    "am-icon-tag",
    "am-icon-tags",
    "am-icon-tasks",
    "am-icon-taxi",
    "am-icon-terminal",
    "am-icon-thumb-tack",
    "am-icon-thumbs-down",
    "am-icon-thumbs-o-down",
    "am-icon-thumbs-o-up",
    "am-icon-thumbs-up",
    "am-icon-ticket",
    "am-icon-times",
    "am-icon-times-circle",
    "am-icon-times-circle-o",
    "am-icon-tint",
    "am-icon-toggle-down (alias)",
    "am-icon-toggle-left (alias)",
    "am-icon-toggle-off",
    "am-icon-toggle-on",
    "am-icon-toggle-right (alias)",
    "am-icon-toggle-up (alias)",
    "am-icon-trash",
    "am-icon-trash-o",
    "am-icon-tree",
    "am-icon-trophy",
    "am-icon-truck",
    "am-icon-tty",
    "am-icon-umbrella",
    "am-icon-university",
    "am-icon-unlock",
    "am-icon-unlock-alt",
    "am-icon-unsorted (alias)",
    "am-icon-upload",
    "am-icon-user",
    "am-icon-users",
    "am-icon-video-camera",
    "am-icon-volume-down",
    "am-icon-volume-off",
    "am-icon-volume-up",
    "am-icon-warning (alias)",
    "am-icon-wheelchair",
    "am-icon-wifi",
    "am-icon-wrench",
    "am-icon-FileTypeIcons",
    "am-icon-file",
    "am-icon-file-archive-o",
    "am-icon-file-audio-o",
    "am-icon-file-code-o",
    "am-icon-file-excel-o",
    "am-icon-file-image-o",
    "am-icon-file-movie-o (alias)",
    "am-icon-file-o",
    "am-icon-file-pdf-o",
    "am-icon-file-photo-o (alias)",
    "am-icon-file-picture-o (alias)",
    "am-icon-file-powerpoint-o",
    "am-icon-file-sound-o (alias)",
    "am-icon-file-text",
    "am-icon-file-text-o",
    "am-icon-file-video-o",
    "am-icon-file-word-o",
    "am-icon-file-zip-o (alias)",
    "am-icon-",
    "am-icon-SpinnerIcons",
    "am-icon-Theseiconsworkgreatwiththe am-icon-spin class.Checkoutthe spinningiconsexample.",
    "am-icon-",
    "am-icon-circle-o-notch",
    "am-icon-cog",
    "am-icon-gear (alias)",
    "am-icon-refresh",
    "am-icon-spinner",
    "am-icon-FormControlIcons",
    "am-icon-check-square",
    "am-icon-check-square-o",
    "am-icon-circle",
    "am-icon-circle-o",
    "am-icon-dot-circle-o",
    "am-icon-minus-square",
    "am-icon-minus-square-o",
    "am-icon-plus-square",
    "am-icon-plus-square-o",
    "am-icon-square",
    "am-icon-square-o",
    "am-icon-PaymentIcons",
    "am-icon-cc-amex",
    "am-icon-cc-discover",
    "am-icon-cc-mastercard",
    "am-icon-cc-paypal",
    "am-icon-cc-stripe",
    "am-icon-cc-visa",
    "am-icon-credit-card",
    "am-icon-google-wallet",
    "am-icon-paypal",
    "am-icon-ChartIcons",
    "am-icon-area-chart",
    "am-icon-bar-chart",
    "am-icon-bar-chart-o (alias)",
    "am-icon-line-chart",
    "am-icon-pie-chart",
    "am-icon-CurrencyIcons",
    "am-icon-btc",
    "am-icon-cny (alias)",
    "am-icon-dollar (alias)",
    "am-icon-eur",
    "am-icon-euro (alias)",
    "am-icon-gbp",
    "am-icon-ils",
    "am-icon-inr",
    "am-icon-jpy",
    "am-icon-krw",
    "am-icon-money",
    "am-icon-rmb (alias)",
    "am-icon-rouble (alias)",
    "am-icon-rub",
    "am-icon-ruble (alias)",
    "am-icon-rupee (alias)",
    "am-icon-shekel (alias)",
    "am-icon-sheqel (alias)",
    "am-icon-try",
    "am-icon-turkish-lira (alias)",
    "am-icon-usd",
    "am-icon-won (alias)",
    "am-icon-yen (alias)",
    "am-icon-TextEditorIcons",
    "am-icon-align-center",
    "am-icon-align-justify",
    "am-icon-align-left",
    "am-icon-align-right",
    "am-icon-bold",
    "am-icon-chain (alias)",
    "am-icon-chain-broken",
    "am-icon-clipboard",
    "am-icon-columns",
    "am-icon-copy (alias)",
    "am-icon-cut (alias)",
    "am-icon-dedent (alias)",
    "am-icon-eraser",
    "am-icon-file",
    "am-icon-file-o",
    "am-icon-file-text",
    "am-icon-file-text-o",
    "am-icon-files-o",
    "am-icon-floppy-o",
    "am-icon-font",
    "am-icon-header",
    "am-icon-indent",
    "am-icon-italic",
    "am-icon-link",
    "am-icon-list",
    "am-icon-list-alt",
    "am-icon-list-ol",
    "am-icon-list-ul",
    "am-icon-outdent",
    "am-icon-paperclip",
    "am-icon-paragraph",
    "am-icon-paste (alias)",
    "am-icon-repeat",
    "am-icon-rotate-left (alias)",
    "am-icon-rotate-right (alias)",
    "am-icon-save (alias)",
    "am-icon-scissors",
    "am-icon-strikethrough",
    "am-icon-subscript",
    "am-icon-superscript",
    "am-icon-table",
    "am-icon-text-height",
    "am-icon-text-width",
    "am-icon-th",
    "am-icon-th-large",
    "am-icon-th-list",
    "am-icon-underline",
    "am-icon-undo",
    "am-icon-unlink (alias)",
    "am-icon-DirectionalIcons",
    "am-icon-angle-double-down",
    "am-icon-angle-double-left",
    "am-icon-angle-double-right",
    "am-icon-angle-double-up",
    "am-icon-angle-down",
    "am-icon-angle-left",
    "am-icon-angle-right",
    "am-icon-angle-up",
    "am-icon-arrow-circle-down",
    "am-icon-arrow-circle-left",
    "am-icon-arrow-circle-o-down",
    "am-icon-arrow-circle-o-left",
    "am-icon-arrow-circle-o-right",
    "am-icon-arrow-circle-o-up",
    "am-icon-arrow-circle-right",
    "am-icon-arrow-circle-up",
    "am-icon-arrow-down",
    "am-icon-arrow-left",
    "am-icon-arrow-right",
    "am-icon-arrow-up",
    "am-icon-arrows",
    "am-icon-arrows-alt",
    "am-icon-arrows-h",
    "am-icon-arrows-v",
    "am-icon-caret-down",
    "am-icon-caret-left",
    "am-icon-caret-right",
    "am-icon-caret-square-o-down",
    "am-icon-caret-square-o-left",
    "am-icon-caret-square-o-right",
    "am-icon-caret-square-o-up",
    "am-icon-caret-up",
    "am-icon-chevron-circle-down",
    "am-icon-chevron-circle-left",
    "am-icon-chevron-circle-right",
    "am-icon-chevron-circle-up",
    "am-icon-chevron-down",
    "am-icon-chevron-left",
    "am-icon-chevron-right",
    "am-icon-chevron-up",
    "am-icon-hand-o-down",
    "am-icon-hand-o-left",
    "am-icon-hand-o-right",
    "am-icon-hand-o-up",
    "am-icon-long-arrow-down",
    "am-icon-long-arrow-left",
    "am-icon-long-arrow-right",
    "am-icon-long-arrow-up",
    "am-icon-toggle-down (alias)",
    "am-icon-toggle-left (alias)",
    "am-icon-toggle-right (alias)",
    "am-icon-toggle-up (alias)"
  ];
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
    height: 305px;
    width: 600px;
  }
  .line{
    height:60px;
    font-size: large;
  }
  .line>input,.line>button,.line>span,.line>label,.line>#currentIcon,.line>.iconList{
    float: left;
    margin-top: 15px;
  }
  .line input[type="radio"]{
    margin: 25px 30px 0 0;
  }
  #currentIcon i{
    float: right;
    margin-right:90px;
    margin-top: 0px;
  }
  .line button{
    height: 30px;
    line-height: 10px;
  }
  .iconList{
    display: none;
    width: 100px;
    height: 250px;
    position: absolute;
    right: 88px;
    top: 227px;
    border: 1px gray solid;
    background-color: white;
  }
  #iconList li{
    width: 80px;
    margin: 0;
    padding: 0;
  }
  #iconList i{
    position: absolute;
    right: 20px;
    top:8px;
  }
  #iconList a{
    height: 50px;
    width: 80px;
   }
  .addMenu{
  }
</style>
<div class="border" style="height: 600px;">
  <%--渠道添加添加功能--%>
  <button type="button" class="am-btn am-btn-warning am-round addChannel" id="addMenu" >添加菜单</button>
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
<%--模态框，改变、添加内容--%>
<div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt" >
  <div class="am-modal-dialog changeMenu">
    <div class="am-modal-hd menuName" >修改菜单</div>
    <div class="am-modal-bd">
      <input type="hidden" class="am-modal-prompt-input" id="id">
      <div class="line">
        <label class="label">菜单名</label><input type="text" class="am-modal-prompt-input" id="menuName">
      </div>
      <div class="line">
        <label class="label">父菜单序号</label><input type="text" class="am-modal-prompt-input" id="fid">
      </div>
      <div class="line" id="line3">
        <label class="label">是否显示</label>
        <span>是</span><input type="radio" value="1" name="isShow" checked="checked"/>
        <span>否</span><input type="radio" value="0" name="isShow"/>
        <button type="button" class="am-btn am-btn-secondary" id="changeIcon" >更改图标</button>
        <label class="label" >当前图标&nbsp;&nbsp;</label>
        <div id="currentIcon"></div>
          <div class="am-scrollable-vertical iconList">
            <ul class="am-list am-list-static am-list-border" id="iconList"></ul>
          </div>
      </div>

    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>提交</span>
    </div>
  </div>
</div>
<%--模态框:删除菜单--%>
<div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm-delete">
  <div class="am-modal-dialog">
    <div class="am-modal-hd">Amaze UI</div>
    <div class="am-modal-bd">
      你，确定要删除这个菜单吗？
    </div>
    <div class="am-modal-footer">
      <span class="am-modal-btn" data-am-modal-cancel>取消</span>
      <span class="am-modal-btn" data-am-modal-confirm>确定</span>
    </div>
  </div>
</div>
