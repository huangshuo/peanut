<%--
  Created by IntelliJ IDEA.
  User: Doc10th
  Date: 2019/4/25
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<div id="hollyEntireFuckingPage">
<title>小说信息修改页面</title>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/amazeui.min.js"></script>--%>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/amazeui.min.css" />--%>
<%--<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" />--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/echarts.min.js" ></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shine.js" ></script>--%>
<%--<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr-2.8.3.js" ></script>--%>
<script>
    $(function () {
        var prepUpdateNovelId = "${param.novelId}";
        var prepUpdateNovelName = "${param.novelName}";
        var prepUpdateAuthorName = "${param.authorName}";
        var prepUpdateNovelTypeIdSecondary = "${param.novelTypeIdSecondary}";

        console.log(prepUpdateNovelTypeIdSecondary);
        // $("#novelId").prop("placeholder", prepUpdateNovelId);
        $("#novelName").prop("placeholder", prepUpdateNovelName);
        $("#authorName").prop("placeholder", prepUpdateAuthorName);
        $("#novelStatus>option[value=${param.novelStatus}]").attr("selected", true);
        console.log(JSON.parse(JSON.stringify(serializeObject($("form"))).replace("}", ", \"novelId\": \"" + prepUpdateNovelId + "\"}")));

        //表单序列化字符串转换为JSON(代码来源网络)
        function serializeObject(form)
        {
            var o = {};
            var a = form.serializeArray();
            $.each(a, function() {
                if (o[this.name] !== undefined) {
                    if (!o[this.name].push) {
                        o[this.name] = [o[this.name]];
                    }
                    o[this.name].push(this.value || '');
                } else {
                    o[this.name] = this.value || '';
                }
            });
            return o;
        }

        function checkEmpty(data){
            return $(data).val().length === 0;
        }

        function checkAllEmpty(){
            return $("#novelName").val().length * $("#authorName").val().length === 0;
        }

        var inputs = $("#novelName, #authorName");
        inputs.on("focus", function () {

            if(this.id.match("novel")) {
                $(this).prop("placeholder", prepUpdateNovelName);
            }else{
                $(this).prop("placeholder", prepUpdateAuthorName);
            }
        });

        inputs.on("blur", function () {
            var tempText = $(this).attr("placeholder");
            if(checkEmpty(this)){
                $(this).prop("placeholder", "Am I a joke to you?");
                $(this).css("backgroundColor", "pink");
            }else
            {
                $(this).css("backgroundColor", "white");
            }
        });

        $("#upDate").on("click", function () {
            var bottomButton = $("#upDate");
            console.log(JSON.parse(JSON.stringify(serializeObject($("form"))).replace("}", ", \"novelId\": \"" +
                prepUpdateNovelId + "\", \"novelTypeIdSecondary\": \"" + prepUpdateNovelTypeIdSecondary + "\"}")));

            inputs.blur();
            if(!checkAllEmpty()) {
                console.log(checkAllEmpty());
                $.ajax({
                    url: "${pageContext.request.contextPath}/backend/novel/update",
                    type: "GET",
                    data: JSON.parse(JSON.stringify(serializeObject($("form"))).replace("}", ", \"novelId\": \"" +
                        prepUpdateNovelId + "\", \"novelTypeIdSecondary\": \"" + prepUpdateNovelTypeIdSecondary + "\"}")),
                    dataType: "json",
                    success: function (data) {
                        if (data.code === 200) {
                            bottomButton.addClass("am-disabled");
                            bottomButton.html("更新成功");
                            bottomButton.css("color", "#71FF97");
                        } else {
                            bottomButton.html("更新失败");
                            bottomButton.css("color", "#8B436A");
                        }
                        window.setTimeout(function () {
                            $.ajax({
                                url: "/peanut/static/novel.jsp",
                                type: "GET",
                                dataType: "html",
                                success: function (data) {
                                    $("#hollyEntireFuckingPage").html(data);
                                }
                            });
                        }, 2000);

                    }
                })
            }

            // bottomButton.prop("data-am-popover", "{content: 'Am I a joke to you?', trigger: 'hover focus'}");
        })
    })
</script>
<style>
    div[class="am-container"]{
        border: lightgray solid 1px;
        box-shadow: 0px 0px 2px 2px whitesmoke;
    }
    #icon1{padding-left: 2%}
    #p1{
        width:100%;
        height:30px;
        background-color: #0E9EE2;}
    #novelStatus{
        font-size: 12pt;
        font-weight: lighter;
        padding-right: 80px;
        margin:5px 10px 5px 0px;
        height: 40px;
    }
    input{
        text-align: center;
        font-size: 15pt;
        font-weight: lighter;
        padding-right: 80px;
        margin:5px 10px 5px 0px;
        height: 40px;
    }
    #upDate{
        font-size: 15pt;
        color: whitesmoke;

    }
</style>
<div class="am-container">
    <div class="am-g">
        <p id="p1" >
            <i class="am-icon-pencil-square-o" id="icon1">信息修改</i>
        </p>
    </div>
    <form class="am-form" role="form">
<%--        <div class="am-g">--%>
<%--            <div class="am-u-md-3">&nbsp;</div>--%>
<%--            <div class="am-u-md-6">--%>
<%--                <div class="am-form-group">--%>
<%--                    <label for="novelId">小说ID</label>--%>
<%--                    <input type="text" id="novelId" name="novelId" class="am-form-group am-round">--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="am-u-md-3">&nbsp;</div>--%>
<%--        </div>--%>
        <div class="am-g">
            <div class="am-u-md-3">&nbsp;</div>
            <div class="am-u-md-6">
                <div class="am-form-group">
                    <label for="novelName">小说名称</label>
                    <input type="text" id="novelName" name="novelName" class="am-form-group am-round"
                           >
                </div>
            </div>
            <div class="am-u-md-3">&nbsp;</div>
        </div>
        <div class="am-g">
            <div class="am-u-md-3">&nbsp;</div>
            <div class="am-u-md-6">
                <div class="am-form-group">
                    <label for="authorName">小说作者</label>
                    <input type="text" id="authorName" name="authorName" class="am-form-group am-round">
                </div>
            </div>
            <div class="am-u-md-3">&nbsp;</div>
        </div>
<%--        <div class="am-g">--%>
<%--            <div class="am-u-md-3">&nbsp;</div>--%>
<%--            <div class="am-u-md-3">--%>
<%--                <div class="am-form-group">--%>
<%--                    <label for="primarySelect">一级分类</label><br/>--%>
<%--                    <select id="primarySelect" name="primaryClassification">--%>
<%--                        <option value="0">连载中</option>--%>
<%--                        <option value="1">完结</option>--%>
<%--                    </select>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--            <div class="am-u-md-3">--%>
<%--            <div class="am-form-group">--%>
<%--                <label for="secondarySelect">二级分类</label><br/>--%>
<%--                <select id="secondarySelect" name="secondaryClassification">--%>
<%--                    <option value="0">连载中</option>--%>
<%--                    <option value="1">完结</option>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--            <div class="am-u-md-3">&nbsp;</div>--%>
<%--        </div>--%>
        <div class="am-g">
            <div class="am-u-md-3">&nbsp;</div>
            <div class="am-u-md-6">
                <div class="am-form-group">
                    <label for="novelStatus">小说状态</label><br/>
                    <select id="novelStatus" name="novelStatus">
                        <option value="0">连载中</option>
                        <option value="1">完结</option>
                    </select>
                </div>
            </div>
            <div class="am-u-md-3">&nbsp;</div>
        </div>
        <div class="am-g">
            <div class="am-u-md-3">&nbsp;</div>
            <div class="am-u-md-6">
                <div class="am-form-group">
                    <button class="am-btn am-btn-block am-badge-secondary" type="button" id="upDate">提交</button>
                </div>
            </div>
            <div class="am-u-md-3">&nbsp;</div>
        </div>
    </form>
</div>
</div>