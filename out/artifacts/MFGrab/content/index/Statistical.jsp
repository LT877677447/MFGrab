<%--suppress ALL --%>
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
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">提示：最新统计到昨日数据</strong>
            </div>
        </div>

        <hr>

        <div class="am-g">

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

            <div class="am-u-sm-12 am-u-md-8">
                <div class="am-input-group am-input-group-sm">
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
                            <th class="table-date">渠道编号</th>
                            <th class="table-date">渠道名</th>
                            <th class="table-date am-hide-sm-only">活跃</th>
                            <th class="table-date am-hide-sm-only">新增</th>
                            <th class="table-date am-hide-sm-only">留存</th>
                            <th class="table-date am-hide-sm-only">日期</th>
                        </tr>
                        </thead>
                        <tbody id="content_table">
                            <c:forEach items="${StatisticalList}" var="rs" varStatus="stat">
                                <tr>
                                    <td>${rs.sup_objectNo}</td>
                                    <td>
                                        <c:if test="${rs.sup_objectNo == 464}">yiyuan</c:if>
                                        <c:if test="${rs.sup_objectNo == 625}">oppo</c:if>
                                        <c:if test="${rs.sup_objectNo == 626}">vivo</c:if>
                                        <c:if test="${rs.sup_objectNo == 627}">huawei</c:if>
                                        <c:if test="${rs.sup_objectNo == 628}">xiaomi</c:if>
                                        <c:if test="${rs.sup_objectNo == 629}">qq</c:if>
                                    </td>
                                    <td>${rs.twologincount}</td>
                                    <td>${rs.newcount}</td>
                                    <td>${rs.dayreten}</td>
                                    <td>${requestScope.map.date_range}</td>
                                </tr>
                            </c:forEach>
                            <tr class="am-active"><td>共计</td><td>/</td><td>${requestScope.map.sumTwoLoginCount}</td><td>${requestScope.map.sumNewCount}</td><td>${requestScope.map.sumDayReten}</td><td>${requestScope.map.date_range}</td></tr>

                        </tbody>
                    </table>

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

<input id="adv_id_hidden" type="hidden">

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="assets/js/amazeui.ie8polyfill.min.js"></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<c:url value="/js/jquery-2.2.2.js"/> "></script>
<!--<![endif]-->
<script src="<c:url value="/assets/js/amazeui.js"/> "></script>
<script src="<c:url value="/assets/js/app.js"/> "></script>
<script>
    //页面加载完执行 write here
    $(function () {
        $("#selectedChannel").change(function () {
            queryWithChannelAndDate()
        });

        $("#btn_search").on('click',function () {
            queryWithChannelAndDate();
        });

        function queryWithChannelAndDate() {
            var date_1 = $("#date_1").val();
            var date_2 = $("#date_2").val();
            window.location.href = "<c:url value="/statistical/List?"/>"+"date_1="+date_1+"&date_2="+date_2;
        }

    });
</script>

</body>
</html>