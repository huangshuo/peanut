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
    var prepUpdateNovelId = ${param.novelId};
    var prepUpdateNovelName = ${param.novelName};
    $("#novelId").prop("placeholder", prepUpdateNovelId);
    $("#novelName").prop("placeholder", prepUpdateNovelName);
    })
</script>
<div class="am-container">
    <div class="am-g">
        <form class="am-form-inline" role="form">
            <div class="am-u-md-3">
            </div>
            <div class="am-u-md-3">
                <label for="novelId">小说ID</label>
                    <input type="text" id="novelId" name="novelId" class="am-form-group">
            </div>
            <div class="am-u-md-3">
                <label for="novelName">小说名称</label>
                <input type="text" id="novelName" name="novelName" class="am-form-group">
            </div>
            <div class="am-u-md-3">
            </div>

        </form>
    </div>
</div>

