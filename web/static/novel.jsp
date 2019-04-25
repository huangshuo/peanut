<%--
  Created by IntelliJ IDEA.
  User: Doc10th
  Date: 2019/4/25
  Time: 13:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<title>小说信息管理</title>
<script>
    $(function () {
        $("#primarySelect").on("change", function () {
            if($("#primarySelect>option[value='0']").prop("selected") === false){
                $("#primarySelect").css("color", "#3c3c3c");
            }else {
                $("#primarySelect").css("color", "#f5cecd");
            }
        });
        $("#secondarySelect").on("change", function () {
            if($("#secondarySelect>option[value='0']").prop("selected") === false){
                $("#secondarySelect").css("color", "#3c3c3c");
            }else {
                $("#secondarySelect").css("color", "#f5cecd");
            }
        });
    })
</script>
<style>
    .decorativeStrip{background-color: #0e90d2}
    #icon1{padding-left: 2%}
    #icon2{padding-left: 2%; position: relative; top: 5%}
    #p1{width:100%; height:30px;background-color: #0E9EE2;}
    #p2{width:100%; height:30px;background-color: lightskyblue;}

    /*#buttonContainer{padding-bottom: 10px}*/
    div[class="am-container"]{
        border: lightgray solid 1px;
        box-shadow: 0px 0px 2px 2px whitesmoke;
    }
    input{margin:5px 10px 5px 10px;  height: 40px;}
    input[name="pageIndex"]{max-width: 50px; text-align: center}
    #charm{max-width: 98%}
    select{
        font-size: 15pt;
        font-weight: lighter;
        padding-right: 80px;
        padding-left: 3px;
        margin:5px 10px 5px 10px;
        height: 40px;
        color: #f5cecd;
    }
    option{color: #3c3c3c;}
    option[value = "0"]{font-size: 10px; color:#f5cecd}
    #buttonContainer button{margin: 10px;}
    #totalPage{margin-left: 4%}
    label[for="rowNumberSelect"]{margin-left: 5%; font-weight: normal }
    #rowNumberSelect{
        height: 35px;
        padding-right: 10px;
        position: relative;
        top: -3px
    }
    #page{margin-left: 4%}
    .am-panel-group {
        margin-bottom: 0.5rem;
    }
    #tableContainer{padding-left: 0px; padding-right: 0px}
    #tableRow{margin-left: 0px; margin-right: 0px}
    #update{float: right}
</style>
<div class="am-container" id="charm">
    <div class="am-g am-g-collapse am-panel-group" id="accordion1" >
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
                    <form class="am-form-inline" role="form">
                        <div class="am-form-group">
                            <span class="decorativeStrip" style="font-size: 15pt; position: relative; top: 4px">&nbsp;</span>
                            <input type="text" class="am-form-field am-round" placeholder="书籍ID">
                        </div>

                        <div class="am-form-group">
                            <input type="text" class="am-form-field am-round" placeholder="名称">
                        </div>

                        <div class="am-form-group">
                            <select name="primaryClassification" id="primarySelect">
                                <option value="0" >一级分类</option>
                                <option value="1" >fadfasdf</option>
                                <option value="2" >fadfasdf</option>
                                <option value="3" >fadfasdf</option>
                            </select>
                        </div>

                        <div class="am-form-group">
                            <select name="secondaryClassification" id="secondarySelect">
                                <option value="0" >二级分类</option>
                                <option value="1" >fadfasdf</option>
                                <option value="2" >fadfasdf</option>
                                <option value="3" >fadfasdf</option>
                            </select>
                        </div>

                        <button type="submit" class="am-btn am-btn-primary"><i class="am-icon-search"></i>&nbsp;&nbsp;搜索</button>
                    </form>
                </div>
            </div>
            <div class="am-g">
                <div class="am-container" id="tableContainer">
                    <div class="am-g am-g-collapse am-panel-group" id="accordion2">
                        <div class="am-panel-hd">
                            <p id="p2" class="am-panel-title" data-am-collapse="{parent: '#accordion2', target: '#table'}">
                                <i class="am-icon-table" id="icon2">&nbsp;数据</i>
                            </p>
                        </div>
                    </div>
                    <div id="table" class="am-panel-collapse am-collapse am-in">
                        <div class="am-g am-g-collapse" id="tableRow">
                            <div class="am-panel-bd">
                                <div class="am-u-md-12">
                                    <table class="am-table am-table-striped am-table-hover am-table-centered am-table-bordered am-table-radius">
                                        <tr>
                                            <th>书籍ID</th>
                                            <th>书籍名称</th>
                                            <th>书籍作者</th>
                                            <th>一级分类ID</th>
                                            <th>一级分类名称</th>
                                            <th>二级分类ID</th>
                                            <th>二级分类名称</th>
                                            <th>更新状态</th>
                                        </tr>
                                        <tr>
                                            <td>书籍ID</td>
                                            <td>书籍名称</td>
                                            <td>书籍作者</td>
                                            <td>一级分类ID</td>
                                            <td>一级分类名称</td>
                                            <td>二级分类ID</td>
                                            <td>二级分类名称</td>
                                            <td>更新状态</td>
                                        </tr>
                                        <tr>
                                            <td>书籍ID</td>
                                            <td>书籍名称</td>
                                            <td>书籍作者</td>
                                            <td>一级分类ID</td>
                                            <td>一级分类名称</td>
                                            <td>二级分类ID</td>
                                            <td>二级分类名称</td>
                                            <td>更新状态</td>
                                        </tr>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="am-g am-g-collapse" id="buttonContainer">
                            <div class="am-panel-bd">
                            <div class="am-u-md-10">
                                <form class="am-form-inline" role="form">
                                    <button class="am-btn am-btn-primary">首页</button>
                                    <button class="am-btn am-btn-primary">上一页</button>
                                    <button class="am-btn am-btn-primary">下一页</button>
                                    <button class="am-btn am-btn-primary">尾页</button>
                                    <div class="am-form-group" id="page">
                                        第<input type="text" class="am-form-field am-round" name="pageIndex">页
                                    </div>
                                    <span id="totalPage">共1页</span>
                                    <label for="rowNumberSelect">行数</label>
                                    <select id="rowNumberSelect" name="rowNumberSelect" class="am-form-group">
                                        <option value="5">5</option>
                                        <option value="10">10</option>
                                        <option value="20">20</option>
                                    </select>
                                </form>
                            </div>
                            <div class="am-u-md-2">
                                <button class="am-btn am-btn-warning am-round" id="update">修改</button>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
