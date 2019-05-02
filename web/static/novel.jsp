<%--
  Created by IntelliJ IDEA.
  User: Doc10th
  Date: 2019/4/25
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="holePage">
    <title>小说信息管理</title>
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/modernizr-2.8.3.js"></script>
    <script>
        $(function () {

            var novelId;
            var novelName;
            var authorName;
            var novelStatus;
            var novelTypeIdSecondary;

            var allType;

            $.ajax({

                url: "${pageContext.request.contextPath}/backend/novel/select/type/all",
                dataType: "json",
                success: function (result) {
                    allType = result;
                    $.each(result, function (key) {
                        $("#novelTypeIdPrimary").append($("<option value=" + key.split("ID:")[1] + " >" + key.split("ID:")[0] + "</option>"));
                    })
                }
            });
            $("#novelTypeIdPrimary").on("change", function () {
                var secondaryType = $("#novelTypeIdSecondary");
                if ($("#novelTypeIdPrimary>option[value='0']").prop("selected") === false) {
                    $("#novelTypeIdPrimary").css("color", "#3c3c3c");
                } else {
                    secondaryType.css("color", "#f5cecd");
                    $("#novelTypeIdPrimary").css("color", "#f5cecd");
                }
                secondaryType.children().each(function (index) {
                    if (index > 0) {
                        $(this).remove();
                    }
                });
                var tempSecondary = {};
                $.each(allType, function (key, value) {
                    if (key.split("ID:")[1].match($("#novelTypeIdPrimary").val())) {
                        tempSecondary = value;
                    }
                });

                $.each(tempSecondary, function () {

                    secondaryType.append($("<option value=" + this.typeId + ">" + this.typeName + "</option>"));
                });
            });

            $("table").on("click", "tr", function () {
                $("table tr").attr("class", null);
                if (this.id !== "tableHead") {
                    $(this).attr("class", "am-primary");
                    novelId = $(this).children()[0].innerText;
                    novelName = $(this).children()[1].innerText;
                    authorName = $(this).children()[2].innerText;
                    novelTypeIdSecondary = $(this).children()[5].innerText;
                    novelStatus = $(this).children()[7].innerText;
                }
            });

            $("#novelTypeIdSecondary").on("change", function () {
                if ($("#novelTypeIdSecondary>option[value='0']").prop("selected") === false) {
                    $("#novelTypeIdSecondary").css("color", "#3c3c3c");
                } else {
                    $("#novelTypeIdSecondary").css("color", "#f5cecd");
                }
            });

            //表单序列化字符串转换为JSON(代码来源网络)
            function serializeObject(form) {
                var o = {};
                var a = form.serializeArray();
                $.each(a, function () {
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

            // 合并两个JSON 对象
            $.mergeJsonObject = function (jsonObject1, jsonObject2) {
                var resultJsonObject = {};
                for (var i in jsonObject1) {
                    resultJsonObject[i] = jsonObject1[i];
                }
                for (var i in jsonObject2) {
                    resultJsonObject[i] = jsonObject2[i];
                }
                return resultJsonObject;
            };
            $("#update").on("click", function () {
                if (novelId !== null) {
                    $.ajax({
                        url: "/peanut/static/novelUpdate.jsp",
                        type: "GET",
                        data: {
                            "novelId": novelId,
                            "novelName": novelName,
                            "authorName": authorName,
                            "novelStatus": (novelStatus.match("连载") ? "0" : "1"),
                            "novelTypeIdSecondary": novelTypeIdSecondary
                        },
                        dataType: "html",
                        success: function (data) {
                            $("#holePage").html(data);
                        }
                    })
                }
            });

            var totalPage;

            function flushTable() {
                var novelTypeIdPrimary;
                var novelTypeNamePrimary;
                var novelTypeNameSecondary;

                $.ajax({
                    url: "${pageContext.request.contextPath}/backend/novel/select",
                    type: "GET",
                    data: $.mergeJsonObject(serializeObject($("#form1")), serializeObject($("#form2"))),
                    dataType: "json",
                    success: function (result) {
                        if (result.code === 200) {
                            totalPage = result.data.totalPage;
                            $("#totalPage").text("共" + totalPage + "页");
                            var rowIndex1 = 0;
                            var rowIndex2 = 0;
                            $("table tr:gt(0)").remove();
                            $.each(result.data.pageData, function () {
                                rowIndex1++;
                                var novelTypeIdSecondary = this.secondaryTypeId;
                                $.ajax({
                                    url: "${pageContext.request.contextPath}/backend/novel/select/type",
                                    type: "GET",
                                    data: {"novelTypeIdSecondary": novelTypeIdSecondary},
                                    dataType: "json",
                                    success: function (result) {
                                        rowIndex2++;

                                        $("#typeIdPrimary" + rowIndex2).text(result.novelTypeIdPrimary);
                                        $("#typeNamePrimary" + rowIndex2).text(result.novelTypeNamePrimary);
                                        $("#typeNameSecondary" + rowIndex2).text(result.novelTypeNameSecondary);
                                    }
                                });
                                $("table").append($("<tr>" +
                                    "<td>" + this.novelId + "</td>" +
                                    "<td>" + this.novelName + "</td>" +
                                    "<td>" + this.authorName + "</td>" +
                                    "<td id='typeIdPrimary" + rowIndex1 + "'></td>" +
                                    "<td id='typeNamePrimary" + rowIndex1 + "'></td>" +
                                    "<td>" + novelTypeIdSecondary + "</td>" +
                                    "<td id='typeNameSecondary" + rowIndex1 + "'></td>" +
                                    "<td>" + this.novelStatus + "</td>"
                                    + "</td></tr>"));
                            })
                        } else {
                            $("#totalPage").text("共0页");
                            $("table tr:gt(0)").remove();
                        }
                        buttonConfig();
                    }

                });
            }

            var pageIndex = $("#pageIndex");
            pageIndex.val(1);
            $("#pageIndex, #novelId, #novelName").on("keyup", function (fn) {
                if (fn.keyCode === 13) {
                    buttonConfig();
                    flushTable();
                }
            });

            function buttonConfig() {
                $("#previousPage").removeClass("am-disabled");
                $("#nextPage").removeClass("am-disabled");
                if (totalPage !== 0) {
                    if (parseInt(pageIndex.val()) <= 1) {
                        pageIndex.val("1");
                        $("#previousPage").addClass("am-disabled");
                    }
                    if (parseInt(pageIndex.val()) >= totalPage) {
                        pageIndex.val("" + totalPage);
                        $("#nextPage").addClass("am-disabled");
                    }
                } else {
                    $("#previousPage").addClass("am-disabled");
                    $("#nextPage").addClass("am-disabled");
                }
            }

            flushTable();
            $("#search").on("click", function () {
                pageIndex.val("1");
                flushTable();
            });
            $("#nextPage").on("click", function () {
                pageIndex.val("" + (parseInt(pageIndex.val()) + 1));
                flushTable();
            });
            $("#previousPage").on("click", function () {
                pageIndex.val("" + (parseInt(pageIndex.val()) - 1));
                flushTable();
            });
            $("#firstPage").on("click", function () {
                pageIndex.val("1");
                flushTable();
            });
            $("#lastPage").on("click", function () {
                pageIndex.val(totalPage);
                flushTable();
            });
            buttonConfig();
        });

    </script>
    <style>
        .decorativeStrip {
            background-color: #0e90d2
        }

        #icon1 {
            padding-left: 2%
        }

        #icon2 {
            padding-left: 2%;
            position: relative;
            top: 5%
        }

        #p1 {
            width: 100%;
            height: 30px;
            background-color: #0E9EE2;
        }

        #p2 {
            width: 100%;
            height: 30px;
            background-color: lightskyblue;
        }

        /*#buttonContainer{padding-bottom: 10px}*/
        div[class="am-container"] {
            border: lightgray solid 1px;
            box-shadow: 0px 0px 2px 2px whitesmoke;
        }

        input {
            margin: 5px 10px 5px 10px;
            height: 40px;
        }

        input[name="pageIndex"] {
            max-width: 50px;
            text-align: center
        }

        #charm {
            max-width: 98%
        }

        select {
            font-size: 15pt;
            font-weight: lighter;
            padding-right: 80px;
            padding-left: 3px;
            margin: 5px 10px 5px 10px;
            height: 40px;
            color: #f5cecd;
        }

        option {
            color: #3c3c3c;
        }

        option[value = "0"] {
            font-size: 10px;
            color: #f5cecd
        }

        #buttonContainer button {
            margin: 10px;
        }

        #totalPage {
            margin-left: 4%
        }

        label[for="rowNumberSelect"] {
            margin-left: 5%;
            font-weight: normal
        }

        #rowNumberSelect {
            height: 35px;
            padding-right: 10px;
            position: relative;
            top: -3px
        }

        #page {
            margin-left: 4%
        }

        .am-panel-group {
            margin-bottom: 0.5rem;
        }

        #tableContainer {
            padding-left: 0px;
            padding-right: 0px
        }

        #tableRow {
            margin-left: 0px;
            margin-right: 0px
        }

        #update {
            float: right
        }
    </style>

    <div class="am-container" id="charm">
        <div class="am-g am-g-collapse am-panel-group" id="accordion1">
            <div class="am-panel-hd">
                <p id="p1" class="am-panel-title" data-am-collapse="{parent: '#accordion1', target: '#body'}">
                    <i class="am-icon-book" id="icon1">图书管理</i>
                </p>
            </div>
        </div>
        <div id="body" class="am-panel-collapse am-collapse am-in">
            <div class="am-panel-bd">
                <div class="am-g">
                    <div class="am-u-md-10">
                        <form id="form1" class="am-form-inline" role="form">
                            <div class="am-form-group">
                                <span class="decorativeStrip" style="font-size: 15pt; position: relative; top: 4px">&nbsp;</span>
                                <input id="novelId" name="novelId" type="text" class="am-form-field am-round"
                                       placeholder="书籍ID">
                            </div>

                            <div class="am-form-group">
                                <input id="novelName" name="novelName" type="text" class="am-form-field am-round"
                                       placeholder="名称">
                            </div>

                            <div class="am-form-group">
                                <select id="novelTypeIdPrimary" name="novelTypeIdPrimary" data-am-selected>
                                    <option value="0">一级分类</option>
                                </select>
                            </div>

                            <div class="am-form-group">
                                <select id="novelTypeIdSecondary" name="novelTypeIdSecondary" data-am-selected>
                                    <option value="0">二级分类</option>
                                </select>
                            </div>

                            <button type="button" id="search" class="am-btn am-btn-primary"><i
                                class="am-icon-search"></i>&nbsp;&nbsp;搜索
                            </button>
                        </form>
                    </div>
                </div>
                <div class="am-g">
                    <div class="am-container" id="tableContainer" style="max-width: 1200px">
                        <div class="am-g am-g-collapse am-panel-group" id="accordion2">
                            <div class="am-panel-hd">
                                <p id="p2" class="am-panel-title"
                                   data-am-collapse="{parent: '#accordion2', target: '#table'}">
                                    <i class="am-icon-table" id="icon2">&nbsp;数据</i>
                                </p>
                            </div>
                        </div>
                        <div id="table" class="am-panel-collapse am-collapse am-in">
                            <div class="am-g am-g-collapse" id="tableRow">
                                <div class="am-panel-bd">
                                    <div class="am-u-md-12">
                                        <table
                                            class="am-table am-table-striped am-table-hover am-table-centered am-table-bordered am-table-radius">
                                            <tr id="tableHead">
                                                <th>小说ID</th>
                                                <th>小说名称</th>
                                                <th>小说作者</th>
                                                <th>一级分类ID</th>
                                                <th>一级分类名称</th>
                                                <th>二级分类ID</th>
                                                <th>二级分类名称</th>
                                                <th>更新状态</th>
                                            </tr>
                                            <tr>
                                                <td>1</td>
                                                <td>咩霸之死</td>
                                                <td>俺</td>
                                                <td>1</td>
                                                <td>沙雕选摘</td>
                                                <td>1</td>
                                                <td>二级分类名称</td>
                                                <td>完结</td>
                                            </tr>
                                            <tr>
                                                <td>2</td>
                                                <td>冷枭的专属宝贝</td>
                                                <td>夜未晚</td>
                                                <td>2</td>
                                                <td>都市言情</td>
                                                <td>2</td>
                                                <td>总裁豪门</td>
                                                <td>完结</td>
                                            </tr>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="am-g am-g-collapse" id="buttonContainer">
                                <div class="am-panel-bd">
                                    <form id="form2" class="am-form-inline" role="form">
                                        <div class="am-u-md-5" style="padding-right: 30px">
                                            <button class="am-btn am-btn-primary" id="firstPage" type="button">首页
                                            </button>
                                            <button class="am-btn am-btn-primary" id="previousPage" type="button">上一页
                                            </button>
                                            <button class="am-btn am-btn-primary" id="nextPage" type="button">下一页
                                            </button>
                                            <button class="am-btn am-btn-primary" id="lastPage" type="button">尾页
                                            </button>

                                        </div>
                                        <div class="am-u-md-5">

                                            <span id="totalPage">共1页</span>
                                            <div class="am-form-group" id="page">
                                                第<input id="pageIndex" type="text" class="am-form-field am-round"
                                                        name="pageIndex">页
                                            </div>
                                            <%-- 当表单当中存在多个输入框时，只有最后一个有回车提交，利用这一点来禁用这之前的回车提交--%>
                                            <input style="display:none;">
                                            <label for="rowNumberSelect">行数</label>
                                            <select id="rowNumberSelect" name="pageSize" class="am-form-group"
                                                    data-am-selected>
                                                <option value="5">5</option>
                                                <option value="10">10</option>
                                                <option value="20">20</option>
                                            </select>
                                        </div>
                                        <div class="am-u-md-2">
                                            <button class="am-btn am-btn-warning am-round" type="button" id="update">
                                                修改
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>