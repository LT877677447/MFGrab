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
            <div class="am-u-sm-12 am-u-md-4">
                <div class="am-form-group">
                    请选择月份：
                    <select id="MonthToShow" data-am-selected="{btnWidth:'50%',btnSize:'sm',maxHeight:250}">
                        <option value="1"<c:if test="${requestScope.pageModel.month == 1}">selected</c:if> >1月份</option>
                        <option value="2"<c:if test="${requestScope.pageModel.month == 2}">selected</c:if> >2月份</option>
                        <option value="3"<c:if test="${requestScope.pageModel.month == 3}">selected</c:if> >3月份</option>
                        <option value="4"<c:if test="${requestScope.pageModel.month == 4}">selected</c:if> >4月份</option>
                        <option value="5"<c:if test="${requestScope.pageModel.month == 5}">selected</c:if> >5月份</option>
                        <option value="6"<c:if test="${requestScope.pageModel.month == 6}">selected</c:if> >6月份</option>
                        <option value="7"<c:if test="${requestScope.pageModel.month == 7}">selected</c:if> >7月份</option>
                        <option value="8"<c:if test="${requestScope.pageModel.month == 8}">selected</c:if> >8月份</option>
                        <option value="9"<c:if test="${requestScope.pageModel.month == 9}">selected</c:if> >9月份</option>
                        <option value="10"<c:if test="${requestScope.pageModel.month == 10}">selected</c:if> >10月份</option>
                        <option value="11"<c:if test="${requestScope.pageModel.month == 11}">selected</c:if> >11月份</option>
                        <option value="12"<c:if test="${requestScope.pageModel.month == 12}">selected</c:if> >12月份</option>
                    </select>
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
                            <th class="table-date am-hide-sm-only">月活</th>
                            <th class="table-date am-hide-sm-only">月份</th>
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
                                    <td>${rs.numberOfMonthLive}</td>
                                    <td>${requestScope.map.Month}月份</td>
                                </tr>
                            </c:forEach>
                            <tr class="am-active"><td>共计</td><td>/</td><td>${requestScope.map.total}</td><td>${requestScope.map.Month}月份</td></tr>

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
        $("#MonthToShow").change(function () {
            queryWithChannelAndDate()
        });

        $("#btn_search").on('click',function () {
            queryWithChannelAndDate();
        });

        function queryWithChannelAndDate() {
            var month = $("#MonthToShow").val();
            window.location.href = "<c:url value="/Month2Live/List?"/>"+"month="+month;
        }

    });
</script>

</body>
</html>