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
    <meta name="description" content="设备状态">
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
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">设备状态</strong>
            </div>
        </div>

        <hr>

        <div class="am-g">
            <%--<div class="am-u-sm-12 am-u-md-2">--%>
            <%--<div class="am-btn-toolbar">--%>
            <%--<div class="am-btn-group am-btn-group-xs">--%>
            <%--<button id="add_advtaskInfo" type="button" class="am-btn am-btn-default"><span--%>
            <%--class="am-icon-plus"></span> 新增--%>
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

            <div class="am-u-sm-12 am-u-md-2">
                <div class="am-input-group am-input-group-sm">
                    <%--<input id="advid" type="text" class="am-form-field" placeholder="广告ID"--%>
                    <%--value="${requestScope.todayResult.advid}"/>--%>
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
                            <th class="table-author">设备标签</th>
                            <th class="table-author am-hide-sm-only">上次登录</th>
                            <th class="table-author am-hide-sm-only">上次取任务</th>
                            <th class="table-date am-hide-sm-only">online</th>
                            <th class="table-date am-hide-sm-only">状态</th>
                        </tr>
                        </thead>
                        <tbody id="content_table">
                        <c:forEach items="${DevactstatusList}" var="rs" varStatus="stat">
                            <tr>
                                <td><input type="checkbox"/></td>
                                <td>${rs.actsid}</td>
                                <td>${rs.dev_tag}</td>
                                <td class="am-hide-sm-only"><fmt:formatDate value="${rs.lastlogintime}"
                                                                            pattern="yyyy年MM月dd日 HH时mm分ss秒"/></td>
                                <td class="am-hide-sm-only"><fmt:formatDate value="${rs.lastfetchtasktime}"
                                                                            pattern="yyyy年MM月dd日 HH时mm分ss秒"/></td>
                                <td class="am-hide-sm-only">${rs.online}</td>
                                <td class="am-hide-sm-only">${rs.status}</td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                    <div class="am-cf">
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

    <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">修改广告信息</div>
            <div class="am-modal-bd">
                <form class="am-form am-form-horizontal">
                    <div class="am-form-group">
                        <label for="modal_adv_id" class="am-u-md-4 am-form-label">广告ID：</label>
                        <div class="am-u-md-8">
                            <input id="modal_adv_id" type="text" class="am-modal-prompt-input" readonly>
                            <small>说明：广告的唯一ID（无法修改）</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_name" class="am-u-md-4 am-form-label">广告名：</label>
                        <div class="am-u-md-8">
                            <input id="modal_name" type="text" class="am-modal-prompt-input">
                            <small>说明：广告中文名</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_adv_type" class="am-u-md-4 am-form-label">广告类型：</label>
                        <div class="am-u-md-8">
                            <%--<input id="modal_adv_type" type="text" class="am-modal-prompt-input">--%>
                            <select id="modal_adv_type" data-am-selected="{btnWidth:'50%',btnSize:'sm',maxHeight:250}">
                                <option value="1">普通cpa</option>
                                <option value="2">充值(2)</option>
                                <option value="3">充值(3)</option>
                                <option value="10">养粉|活跃</option>
                            </select>
                            <small>说明：广告的类型</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_apkid" class="am-u-md-4 am-form-label">APK包ID：</label>
                        <div class="am-u-md-8">
                            <input id="modal_apkid" type="text" class="am-modal-prompt-input">
                            <small>说明：广告使用的APK</small>
                        </div>
                    </div>
                    <div class="am-form-group am-input-group am-datepicker-date"
                         data-am-datepicker="{format: 'yyyy-mm-dd'}">
                        <p class="am-input-group-label">起始日期：</p>
                        <input id="modal_start_date" type="text" class="am-modal-prompt-input" placeholder="日历组件"
                               readonly>
                        <span class="am-input-group-btn am-datepicker-add-on">
                        <button class="am-btn am-btn-default" type="button"><span
                                class="am-icon-calendar"></span> </button>
                        </span>
                    </div>
                    <div class="am-form-group am-input-group am-datepicker-date"
                         data-am-datepicker="{format: 'yyyy-mm-dd'}">
                        <p class="am-input-group-label">结束日期：</p>
                        <input id="modal_end_date" type="text" class="am-modal-prompt-input" placeholder="日历组件"
                               readonly>
                        <span class="am-input-group-btn am-datepicker-add-on">
                        <button class="am-btn am-btn-default" type="button"><span
                                class="am-icon-calendar"></span> </button>
                        </span>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_requesttime" class="am-u-md-4 am-form-label">新增时间：</label>
                        <div class="am-u-md-8">
                            <input id="modal_requesttime" type="text" class="am-modal-prompt-input">
                            <small>说明：广告的新增时间</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_remaintime" class="am-u-md-4 am-form-label">留存时间：</label>
                        <div class="am-u-md-8">
                            <input id="modal_remaintime" type="text" class="am-modal-prompt-input">
                            <small>说明：广告的留存时间</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_timeline" class="am-u-md-5 am-form-label">（新增）时间线ID：</label>
                        <div class="am-u-md-7">
                            <input id="modal_timeline" type="text" class="am-modal-prompt-input">
                            <small>说明：广告在做新增时使用的时间线ID</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_rem_timeline" class="am-u-md-5 am-form-label">（留存）时间线ID：</label>
                        <div class="am-u-md-7">
                            <input id="modal_rem_timeline" type="text" class="am-modal-prompt-input">
                            <small>说明：广告在做留存时使用的时间线ID</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_remain_rule" class="am-u-md-4 am-form-label">留存规则：</label>
                        <div class="am-u-md-8">
                            <input id="modal_remain_rule" type="text" class="am-modal-prompt-input">
                            <small>说明：广告做留存的规则</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_allcount" class="am-u-md-4 am-form-label">总量：</label>
                        <div class="am-u-md-8">
                            <input id="modal_allcount" type="text" class="am-modal-prompt-input">
                            <small>说明：广告要做的总量</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_dayopencount" class="am-u-md-4 am-form-label">打开次数：</label>
                        <div class="am-u-md-8">
                            <input id="modal_dayopencount" type="text" class="am-modal-prompt-input">
                            <small>说明：广告的打开次数</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_dayusercount" class="am-u-md-4 am-form-label">每日新增量：</label>
                        <div class="am-u-md-8">
                            <input id="modal_dayusercount" type="text" class="am-modal-prompt-input">
                            <small>说明：广告每日的新增量</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_alldocount" class="am-u-md-4 am-form-label">（新增）已完成：</label>
                        <div class="am-u-md-8">
                            <input id="modal_alldocount" type="text" class="am-modal-prompt-input">
                            <small>说明：广告已经完成的新增的量</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_onlineflag" class="am-u-md-4 am-form-label">状态：</label>
                        <div class="am-u-md-8">
                            <select id="modal_onlineflag"
                                    data-am-selected="{btnWidth:'50%',btnSize:'sm',maxHeight:250}">
                                <option value="0">停新增</option>
                                <option value="1">运行</option>
                                <option value="2">停止</option>
                            </select>
                            <small>说明：广告的状态</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_alias" class="am-u-md-4 am-form-label">别名：</label>
                        <div class="am-u-md-8">
                            <input id="modal_alias" type="text" class="am-modal-prompt-input">
                            <small>说明：广告的别名，后台逻辑需要用它来创建类</small>
                        </div>
                    </div>
                </form>
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>保存</span>
            </div>
        </div>
    </div>

    <div class="am-modal am-modal-prompt" tabindex="-1" id="my-prompt-addAdvtaskInfo">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">添加广告信息</div>
            <div class="am-modal-bd">
                <form class="am-form am-form-horizontal">
                    <div class="am-form-group">
                        <label for="modal_add_adv_id" class="am-u-md-4 am-form-label">广告ID：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_adv_id" type="text" class="am-modal-prompt-input">
                            <small>说明：广告的唯一ID（无法修改）</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_name" class="am-u-md-4 am-form-label">广告名：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_name" type="text" class="am-modal-prompt-input">
                            <small>说明：广告中文名</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_adv_type" class="am-u-md-4 am-form-label">广告类型：</label>
                        <div class="am-u-md-8">
                            <%--<input id="modal_adv_type" type="text" class="am-modal-prompt-input">--%>
                            <select id="modal_add_adv_type"
                                    data-am-selected="{btnWidth:'50%',btnSize:'sm',maxHeight:250}">
                                <option value="1">普通cpa</option>
                                <option value="2">充值(2)</option>
                                <option value="3">充值(3)</option>
                                <option value="10">养粉|活跃</option>
                            </select>
                            <small>说明：广告的类型</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_apkid" class="am-u-md-4 am-form-label">APK包ID：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_apkid" type="text" class="am-modal-prompt-input">
                            <small>说明：广告使用的APK</small>
                        </div>
                    </div>
                    <div class="am-form-group am-input-group am-datepicker-date"
                         data-am-datepicker="{format: 'yyyy-mm-dd'}">
                        <p class="am-input-group-label">起始日期：</p>
                        <input id="modal_add_start_date" type="text" class="am-modal-prompt-input" placeholder="日历组件"
                               readonly>
                        <span class="am-input-group-btn am-datepicker-add-on">
                        <button class="am-btn am-btn-default" type="button"><span
                                class="am-icon-calendar"></span> </button>
                        </span>
                    </div>
                    <div class="am-form-group am-input-group am-datepicker-date"
                         data-am-datepicker="{format: 'yyyy-mm-dd'}">
                        <p class="am-input-group-label">结束日期：</p>
                        <input id="modal_add_end_date" type="text" class="am-modal-prompt-input" placeholder="日历组件"
                               readonly>
                        <span class="am-input-group-btn am-datepicker-add-on">
                        <button class="am-btn am-btn-default" type="button"><span
                                class="am-icon-calendar"></span> </button>
                        </span>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_requesttime" class="am-u-md-4 am-form-label">新增时间：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_requesttime" type="text" class="am-modal-prompt-input">
                            <small>说明：广告的新增时间</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_remaintime" class="am-u-md-4 am-form-label">留存时间：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_remaintime" type="text" class="am-modal-prompt-input">
                            <small>说明：广告的留存时间</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_timeline" class="am-u-md-5 am-form-label">（新增）时间线ID：</label>
                        <div class="am-u-md-7">
                            <input id="modal_add_timeline" type="text" class="am-modal-prompt-input">
                            <small>说明：广告在做新增时使用的时间线ID</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_rem_add_timeline" class="am-u-md-5 am-form-label">（留存）时间线ID：</label>
                        <div class="am-u-md-7">
                            <input id="modal_rem_add_timeline" type="text" class="am-modal-prompt-input">
                            <small>说明：广告在做留存时使用的时间线ID</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_remain_rule" class="am-u-md-4 am-form-label">留存规则：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_remain_rule" type="text" class="am-modal-prompt-input">
                            <small>说明：广告做留存的规则</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_allcount" class="am-u-md-4 am-form-label">总量：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_allcount" type="text" class="am-modal-prompt-input">
                            <small>说明：广告要做的总量</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_dayopencount" class="am-u-md-4 am-form-label">打开次数：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_dayopencount" type="text" class="am-modal-prompt-input">
                            <small>说明：广告的打开次数</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_dayusercount" class="am-u-md-4 am-form-label">每日新增量：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_dayusercount" type="text" class="am-modal-prompt-input">
                            <small>说明：广告每日的新增量</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_alldocount" class="am-u-md-4 am-form-label">（新增）已完成：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_alldocount" type="text" class="am-modal-prompt-input">
                            <small>说明：广告已经完成的新增的量</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_onlineflag" class="am-u-md-4 am-form-label">状态：</label>
                        <div class="am-u-md-8">
                            <select id="modal_add_onlineflag"
                                    data-am-selected="{btnWidth:'50%',btnSize:'sm',maxHeight:250}">
                                <option value="0">停新增</option>
                                <option value="1">运行</option>
                                <option value="2">停止</option>
                            </select>
                            <small>说明：广告的状态</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_alias" class="am-u-md-4 am-form-label">别名：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_alias" type="text" class="am-modal-prompt-input">
                            <small>说明：广告的别名，后台逻辑需要用它来创建类</small>
                        </div>
                    </div>
                </form>
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>保存</span>
            </div>
        </div>
    </div>

    <div class="am-modal am-modal-alert" tabindex="-1" id="my-alert">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">结果信息</div>
            <div class="am-modal-bd">
                APK_ID不存在,更新失败！
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn">确定</span>
            </div>
        </div>
    </div>

    <div class="am-modal am-modal-alert" tabindex="-1" id="my-alert-delete-advtaskinfo">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">结果信息</div>
            <div class="am-modal-bd">
                删除失败！
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn">确定</span>
            </div>
        </div>
    </div>

    <div class="am-modal am-modal-alert" tabindex="-1" id="my-alert-add-advtaskinfo">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">结果信息</div>
            <div class="am-modal-bd">
                新增失败！
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn">确定</span>
            </div>
        </div>
    </div>

    <div class="am-modal am-modal-confirm" tabindex="-1" id="my-confirm">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">确认信息</div>
            <div class="am-modal-bd">
                你，确定要删除这条记录吗？
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>确定</span>
            </div>
        </div>
    </div>
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
        $("#pageIndex").change(function () {
            var param = {};
            param['pageIndex'] = $(this).val();
            if (${requestScope.pageModel.pageSize != null}) {
                param['pageSize'] = ${requestScope.pageModel.pageSize};
            }
            $.post({
                url: '<c:url value="/Devactstatus/pageQuery"/>',
                data: param,
                contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                dataType: "json",
                success: function (data, textStatus, jqXHR) {
                    var list = data.DevactstatusList;
                    var pageModel = data.pageModel;
                    var devactstatus = data.Devactstatus;
                    var lastFetchTaskTime = data.LastFetchTaskTime;
                    var lastLoginTime = data.LastLoginTime;
                    var index = 0;
                    $("#content_table").empty();
                    $.each(list, function () {
                            var tr = $("<tr></tr>");
                            $("<td><input type='checkbox'/></td>").appendTo(tr);
                            $("<td></td>").html(this.actsid).appendTo(tr);
                            $("<td/>").html(this.dev_tag).appendTo(tr);
                            $("<td class='am-hide-sm-only'/>").html(lastLoginTime[index]).appendTo(tr);
                            $("<td class='am-hide-sm-only'/>").html(lastFetchTaskTime[index]).appendTo(tr);
                            index++;
                            $("<td class='am-hide-sm-only'/>").html(this.online).appendTo(tr);
                            $("<td class='am-hide-sm-only'/>").html(this.status).appendTo(tr);
                            $("#content_table").append(tr);
                        }
                    );
                    //给新增的操作按钮加上监听事件
                    OperationButtonListener();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("textStatus: " + textStatus + " -- errorThrown: " + errorThrown);
                }
            });
        });

        $("#btn_search").on("click", function () {
            var pageSize = $("#pageSize").val();
            var param = 'pageSize=' + pageSize + "&pageIndex=1";
            window.location.href = '<c:url value="/index/Devactstatus?"/>' + param;
        });

        $("#add_advtaskInfo").on("click", function () {
            $('#my-prompt-addAdvtaskInfo').modal({
                relatedTarget: this,
                onConfirm: function (e) {
                    var param = {};
                    param['adv_id'] = $("#modal_add_adv_id").val();
                    param['name'] = $("#modal_add_name").val();
                    param['adv_type'] = $("#modal_add_adv_type").val();
                    param['apkid'] = $("#modal_add_apkid").val();
                    param['start_date'] = $("#modal_add_start_date").val();
                    param['end_date'] = $("#modal_add_end_date").val();
                    param['requesttime'] = $("#modal_add_requesttime").val();
                    param['remaintime'] = $("#modal_add_remaintime").val();
                    param['timeline'] = $("#modal_add_timeline").val();
                    param['rem_timeline'] = $("#modal_add_rem_timeline").val();
                    param['remain_rule'] = $("#modal_add_remain_rule").val();
                    param['allcount'] = $("#modal_add_allcount").val();
                    param['dayopencount'] = $("#modal_add_dayopencount").val();
                    param['dayusercount'] = $("#modal_add_dayusercount").val();
                    param['alldocount'] = $("#modal_add_alldocount").val();
                    param['onlineflag'] = $("#modal_add_onlineflag").val();
                    param['alias'] = $("#modal_add_alias").val();
                    $.ajax("<c:url value="/AdvList/add"/>", {
                        type: "post",
                        data: JSON.stringify(param),
                        contentType: "application/json",
                        dataType: "json",
                        async: true,
                        success: function (data, textStatus, jqXHR) {
                            // alert(JSON.stringify(data));//{"result":" exist"}
                            var result = data.result;
                            if (result == 'success') {
                                //update成功，回显页面
                                var pageIndex = $("#pageIndex").val();
                                var pageSize = ${requestScope.pageModel.pageSize};
                                window.location.href = "<c:url value="/index/AdvList?"/>" + "pageSize=" + pageSize + "&pageIndex=" + pageIndex;
                            }
                            if (result == 'failure') {
                                $('#my-alert-add-advtaskinfo').modal();
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("jqXHR-" + jqXHR + "\ntextStatus-" + textStatus + "\nerrorThrown-" + errorThrown);
                        }
                    });

                },
                onCancel: function (e) {
                }
            });


        });

        OperationButtonListener();
    });

    //操作按钮添加事件监听
    function OperationButtonListener() {
        $('.btn_edit').on('click', function () {
            var tr = $(this).parents("tr");
            var adv_id = tr.children('td').eq(1).text();
            var name = tr.children('td').eq(2).text();
            var adv_type = tr.children('td').eq(3).text();
            var apkid = tr.children('td').eq(4).text();
            var start_date = tr.children('td').eq(5).text();
            var end_date = tr.children('td').eq(6).text();
            var requesttime = tr.children('td').eq(7).text();
            var remaintime = tr.children('td').eq(8).text();
            var timeline = tr.children('td').eq(9).text();
            var rem_timeline = tr.children('td').eq(10).text();
            var remain_rule = tr.children('td').eq(11).text();
            var allcount = tr.children('td').eq(12).text();
            var dayopencount = tr.children('td').eq(13).text();
            var dayusercount = tr.children('td').eq(14).text();
            var alldocount = tr.children('td').eq(15).text();
            var onlineflag = tr.children('td').eq(16).text();
            var alias = tr.children('td').eq(17).text();

            $("#modal_adv_id").val(adv_id);
            $("#modal_name").val(name);
            //设置广告类型  #modal_adv_type
            var $select_adv_type = $("#modal_adv_type");
            selectChecked($select_adv_type, adv_type);

            $("#modal_apkid").val(apkid);
            var yyyy_date1 = start_date.substr(0, 4);
            var mm_date1 = start_date.substr(5, 2);
            var dd_date1 = start_date.substr(8, 2);
            $("#modal_start_date").attr('value', yyyy_date1 + "-" + mm_date1 + "-" + dd_date1);

            var yyyy_date2 = end_date.substr(0, 4);
            var mm_date2 = end_date.substr(5, 2);
            var dd_date2 = end_date.substr(8, 2);
            $("#modal_end_date").attr('value', yyyy_date2 + "-" + mm_date2 + "-" + dd_date2);

            $("#modal_requesttime").val(requesttime);
            $("#modal_remaintime").val(remaintime);
            $("#modal_timeline").val(timeline);
            $("#modal_rem_timeline").val(rem_timeline);
            $("#modal_remain_rule").val(remain_rule);
            $("#modal_allcount").val(allcount);
            $("#modal_dayopencount").val(dayopencount);
            $("#modal_dayusercount").val(dayusercount);
            $("#modal_alldocount").val(alldocount);
            var $select_onlineflag = $("#modal_onlineflag");
            selectChecked($select_onlineflag, onlineflag);

            $("#modal_alias").val(alias);
            $('#my-prompt').modal({
                relatedTarget: this,
                onConfirm: function (e) {
                    var param = {};
                    param['adv_id'] = $("#modal_adv_id").val();
                    param['name'] = $("#modal_name").val();
                    param['adv_type'] = $("#modal_adv_type").val();
                    param['apkid'] = $("#modal_apkid").val();
                    param['start_date'] = $("#modal_start_date").val();
                    param['end_date'] = $("#modal_end_date").val();
                    param['requesttime'] = $("#modal_requesttime").val();
                    param['remaintime'] = $("#modal_remaintime").val();
                    param['timeline'] = $("#modal_timeline").val();
                    param['rem_timeline'] = $("#modal_rem_timeline").val();
                    param['remain_rule'] = $("#modal_remain_rule").val();
                    param['allcount'] = $("#modal_allcount").val();
                    param['dayopencount'] = $("#modal_dayopencount").val();
                    param['dayusercount'] = $("#modal_dayusercount").val();
                    param['alldocount'] = $("#modal_alldocount").val();
                    param['onlineflag'] = $("#modal_onlineflag").val();
                    param['alias'] = $("#modal_alias").val();
                    $.ajax("<c:url value="/AdvList/Edit"/>", {
                        type: "post",
                        data: JSON.stringify(param),
                        contentType: "application/json",
                        dataType: "json",
                        async: true,
                        success: function (data, textStatus, jqXHR) {
                            // alert(JSON.stringify(data));//{"result":"id exist"}
                            var result = data.result;
                            if (result == 'id exist') {
                                //update成功，回显页面
                                var pageIndex = $("#pageIndex").val();
                                var pageSize = ${requestScope.pageModel.pageSize};
                                window.location.href = "<c:url value="/index/AdvList?"/>" + "pageSize=" + pageSize + "&pageIndex=" + pageIndex;
                            }
                            if (result == 'id not exist') {
                                $('#my-alert').modal();
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("jqXHR-" + jqXHR + "\ntextStatus-" + textStatus + "\nerrorThrown-" + errorThrown);
                        }
                    });

                },
                onCancel: function (e) {
                }
            });
        });

        $('.btn_delete').on('click', function () {
            var tr = $(this).parents("tr");
            var adv_id = tr.children('td').eq(1).text();
            $("#adv_id_hidden").val(adv_id);
            $('#my-confirm').modal({
                relatedTarget: this,
                onConfirm: function (options) {
                    $("#adv_id_hidden").val();
                    var param = {};
                    param['adv_id'] = $("#adv_id_hidden").val();
                    $.ajax("<c:url value="/AdvList/Delete"/>", {
                        type: "post",
                        data: JSON.stringify(param),
                        contentType: "application/json",
                        dataType: "json",
                        async: true,
                        success: function (data, textStatus, jqXHR) {
                            // alert(JSON.stringify(data));//{"result":"id exist"}
                            var result = data.result;
                            if (result == 'success') {
                                //update成功，回显页面
                                var pageIndex = $("#pageIndex").val();
                                var pageSize = ${requestScope.pageModel.pageSize};
                                window.location.href = "<c:url value="/index/AdvList?"/>" + "pageSize=" + pageSize + "&pageIndex=" + pageIndex;
                            }
                            if (result == 'failure') {
                                $('#my-alert-delete-advtaskinfo').modal();
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("jqXHR-" + jqXHR + "\ntextStatus-" + textStatus + "\nerrorThrown-" + errorThrown);
                        }
                    });
                },
                // closeOnConfirm: false,
                onCancel: function () {
                    // alert('算求，不弄了');
                }
            });
        });

    };

    //重新渲染<select>
    function selectChecked(select, checkValue) {
        select.find("option").each(function () {
            if (this.text == checkValue) {
                this.selected = true;
                select.trigger('changed.selected.amui');
            }
        });
    };

</script>

</body>
</html>