<%--
  Created by IntelliJ IDEA.
  User: Doc10th
  Date: 2019/4/25
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>小说信息修改页面</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/amazeui.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/amazeui.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin.css" />
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/echarts.min.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/shine.js" ></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr-2.8.3.js" ></script>
<script>
    $(function () {
        var prepUpdateNovelId = "${param.novelId}";
        var prepUpdateNovelName = "${param.novelName}";
        // var prepUpdateAuthorName = $
        $("#novelId").prop("placeholder", prepUpdateNovelId);
        $("#novelName").prop("placeholder", prepUpdateNovelName);
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
    #novelState{
        font-size: 12pt;
        font-weight: lighter;
        padding-right: 80px;
        margin:5px 10px 5px 0px;
        height: 40px;
    }
    input{
        font-size: 15pt;
        font-weight: lighter;
        padding-right: 80px;
        margin:5px 10px 5px 0px;
        height: 40px;
    }
    #unDate{
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
        <div class="am-g">
            <div class="am-u-md-3">&nbsp;</div>
            <div class="am-u-md-6">
                <div class="am-form-group">
                    <label for="novelId">小说ID</label>
                    <input type="text" id="novelId" name="novelId" class="am-form-group am-round">
                </div>
            </div>
            <div class="am-u-md-3">&nbsp;</div>
        </div>
        <div class="am-g">
            <div class="am-u-md-3">&nbsp;</div>
            <div class="am-u-md-6">
                <div class="am-form-group">
                    <label for="novelName">小说名称</label>
                    <input type="text" id="novelName" name="novelName" class="am-form-group am-round">
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
        <div class="am-g">
            <div class="am-u-md-3">&nbsp;</div>
            <div class="am-u-md-3">
                <div class="am-form-group">
                    <label for="primarySelect">一级分类</label><br/>
                    <select id="primarySelect" name="primaryClassification">
                        <option value="0">连载中</option>
                        <option value="1">完结</option>
                    </select>
                </div>
            </div>
            <div class="am-u-md-3">
            <div class="am-form-group">
                <label for="secondarySelect">二级分类</label><br/>
                <select id="secondarySelect" name="secondaryClassification">
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
                    <label for="novelState">小说状态</label><br/>
                    <select id="novelState" name="novelState">
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
                    <button class="am-btn am-btn-block am-badge-secondary" id="unDate">提交</button>
                </div>
            </div>
            <div class="am-u-md-3">&nbsp;</div>
        </div>
    </form>
</div>

