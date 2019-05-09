<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head style="">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Amaze UI Admin table Examples</title>
    <meta name="description" content="广告结果">
    <meta name="keywords" content="table">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <link rel="icon" type="image/png" href="<c:url value="/assets/i/favicon2.png"/> ">
    <link rel="apple-touch-icon-precomposed" href="<c:url value="/assets/i/app-icon72x72@2x.png"/> ">
    <meta name="apple-mobile-web-app-title" content="Amaze UI"/>
    <link rel="stylesheet" href="<c:url value='/assets/css/amazeui.min.css'/>"/>
    <link rel="stylesheet" href="<c:url value='/assets/css/admin.css'/>">
</head>
<body>

<!-- content start -->
<div class="admin-content">
    <div class="admin-content-body">
        <div class="am-cf am-padding am-padding-bottom-0">
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">广告结果</strong>
            </div>
        </div>

        <hr>

        <div class="am-g">
            <%--<div class="am-u-sm-12 am-u-md-2">--%>
                <%--<div class="am-btn-toolbar">--%>
                    <%--<div class="am-btn-group am-btn-group-xs">--%>
                        <%--<button type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增--%>
                        <%--</button>--%>
                        <%--<button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存--%>
                        <%--</button>--%>
                        <%--<button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除--%>
                        <%--</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</div>--%>
            <div class="am-u-sm-12 am-u-md-2">
                <div class="am-form-group">
                    <select id="pageSize" data-am-selected="{btnWidth:'50%',btnSize:'sm',maxHeight:250}">
                        <option value="10"
                                <c:if test="${requestScope.pageModel.pageSize == 10}">selected</c:if> >每页 10 条
                        </option>
                        <option value="20"
                                <c:if test="${requestScope.pageModel.pageSize == 20}">selected</c:if> >每页 20 条
                        </option>
                        <option value="30"
                                <c:if test="${requestScope.pageModel.pageSize == 30}">selected</c:if> >每页 30 条
                        </option>
                        <option value="50"
                                <c:if test="${requestScope.pageModel.pageSize == 50}">selected</c:if> >每页 50 条
                        </option>
                    </select>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-2">
                <div class="am-form-group">
                    <select id="pageIndex" data-am-selected="{btnWidth:'40%',btnSize:'sm',maxHeight:250}">
                        <c:forEach var="i" begin="1" end="${requestScope.pageModel.totalSize}">
                            <option value="${i}"
                                    <c:if test="${requestScope.pageModel.pageIndex == i}">selected</c:if>  >
                                第 ${i} 页
                            </option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="am-u-sm-12 am-u-md-2 am-input-group am-datepicker-date"
                 data-am-datepicker="{format: 'yyyy-mm-dd'}">
                <p class="am-input-group-label">起始：</p>
                <input id="date_1" type="text" class="am-form-field" placeholder="日历组件"
                       value="<fmt:formatDate value="${requestScope.pageModel.date_1}" pattern="yyyy-MM-dd"/>" readonly>
                <span class="am-input-group-btn am-datepicker-add-on">
                  <button class="am-btn am-btn-default" type="button"><span class="am-icon-calendar"></span> </button>
                </span>
            </div>
            <div class="am-u-sm-12 am-u-md-2 am-input-group am-datepicker-date"
                 data-am-datepicker="{format: 'yyyy-mm-dd'}">
                <p class="am-input-group-label">截止：</p>
                <input id="date_2" type="text" class="am-form-field" placeholder="日历组件"
                       value="<fmt:formatDate value="${requestScope.pageModel.date_2}" pattern="yyyy-MM-dd"/>" readonly>
                <span class="am-input-group-btn am-datepicker-add-on">
                  <button class="am-btn am-btn-default" type="button"><span class="am-icon-calendar"></span> </button>
             </span>
            </div>

            <div class="am-u-sm-12 am-u-md-2">
                <div class="am-input-group am-input-group-sm">
                    <input id="advid" type="text" class="am-form-field" placeholder="广告ID"
                           value="${requestScope.todayResult.advid}"/>
                    <span class="am-input-group-btn">
                         <button id="btn_search" class="am-btn am-btn-default" type="button">搜索</button>
                    </span>
                </div>
            </div>
        </div>


        <div id="kh" class="am-g">
            <div class="am-u-sm-12">
                <form class="am-form">

                    <table class="am-table am-table-striped am-table-hover table-main">
                        <thead>
                        <tr>
                            <th class="table-check"><input type="checkbox"/></th>
                            <th class="table-id">ID</th>
                            <th class="table-id">类型</th>
                            <th class="table-type">新增成功</th>
                            <th class="table-author am-hide-sm-only">新增失败</th>
                            <th class="table-author am-hide-sm-only">留存成功</th>
                            <th class="table-author am-hide-sm-only">留存失败</th>
                            <th class="table-date am-hide-sm-only">日期</th>
                        </tr>
                        </thead>
                        <tbody id="content_table">
                        <c:forEach items="${todayResultList}" var="rs" varStatus="stat">
                            <tr>
                                <td><input type="checkbox"/></td>
                                <td>${rs.advid}</td>
                                <td>
                                    <c:if test="${rs.isremain == 0}">
                                        新增
                                    </c:if>
                                    <c:if test="${rs.isremain > 0}">
                                        留存
                                    </c:if>
                                </td>
                                <td class="am-hide-sm-only">${rs.newuser_success_count}</td>
                                <td class="am-hide-sm-only">${rs.newuser_err_count}</td>
                                <td class="am-hide-sm-only">${rs.remain_olduser_success_count}</td>
                                <td class="am-hide-sm-only">${rs.remain_err_opentcount}</td>
                                <td class="am-hide-sm-only"><fmt:formatDate value="${rs.result_time}"
                                                                            pattern="yyyy年MM月dd日 HH时mm分ss秒"/></td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div id="recordCount" class="am-cf">
                        共 ${pageModel.recordCount} 条记录
                    </div>

                    <hr/>
                    <p>注：多一些包容，少一些针对</p>
                </form>
            </div>

        </div>
    </div>

    <footer class="admin-content-footer">
        <hr>
        <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
    </footer>

</div>
<!-- content end -->

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<footer>
    <hr>
    <p class="am-padding-left">© 2014 AllMobilize, Inc. Licensed under MIT license.</p>
</footer>


<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<c:url value="/js/jquery-2.2.2.js"/> "></script>
<!--<![endif]-->
<script src="<c:url value="/assets/js/amazeui.min.js"/> "></script>
<script src="<c:url value="/assets/js/app.js"/> "></script>
<script>

    $("#pageIndex").change(function () {
        var param = {};
        param['pageIndex'] = $(this).val();
        if (${requestScope.pageModel.pageSize != null}) {
            param['pageSize'] = ${requestScope.pageModel.pageSize};
        }
        if (${requestScope.pageModel.date_1 != null}) {
            param['date_1'] = '${requestScope.pageModel.date_1}';
            param['date_1'] = '<fmt:formatDate value="${requestScope.pageModel.date_1}" pattern="yyyy-MM-dd"/>';
        }
        if (${requestScope.pageModel.date_2 != null}) {
            param['date_2'] = '<fmt:formatDate value="${requestScope.pageModel.date_2}" pattern="yyyy-MM-dd"/>';
        }
        if (${requestScope.todayResult.advid != null}) {
            param['advid'] = '${requestScope.todayResult.advid}';
        }
        $.post({
            url: '<c:url value="/todayResult/PageQuery"/>',
            data: param,
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            dataType: "json",
            success: function (data, textStatus, jqXHR) {
                var todayResults = data.TodayResults;
                var time = data.ResultTime;
                var size = 0;

                $("#content_table").empty();
                $.each(todayResults, function () {
                    var tr = $("<tr ></tr>");
                    $("<td><input type='checkbox'/></td>").appendTo(tr);
                    $("<td></td>").html(this.advid).appendTo(tr);
                    if (this.isremain == 0) {
                        $("<td/>").html("新增").appendTo(tr);
                    }
                    if (this.isremain == 1) {
                        $("<td/>").html("留存").appendTo(tr);
                    }
                    $("<td class='am-hide-sm-only'/>").html(this.newuser_success_count).appendTo(tr);
                    $("<td class='am-hide-sm-only'/>").html(this.newuser_err_count).appendTo(tr);
                    $("<td class='am-hide-sm-only'/>").html(this.remain_olduser_success_count).appendTo(tr);
                    $("<td class='am-hide-sm-only'/>").html(this.remain_err_opentcount).appendTo(tr);
                    $("<td class='am-hide-sm-only'/>").html(time[size++]).appendTo(tr);
                    $("#content_table").append(tr);
                });
            },
            error: function (jqXHR, textStatus, errorThrown) {
                alert("textStatus: " + textStatus + " -- errorThrown: " + errorThrown);
            }
        });
    });

    $("#btn_search").on("click", function () {
        //get方法请求  返回页面
        var pageSize = $("#pageSize").val();
        var date_1 = $("#date_1").val();
        var date_2 = $("#date_2").val();
        var advid = $("#advid").val();
        var param = 'pageIndex=1&pageSize='+pageSize+'&date_1='+date_1+'&date_2='+date_2+'&advid='+advid;
        window.location.href = '<c:url value="/index/todayResult?"/>'+param;

    });


</script>

</body>
</html>