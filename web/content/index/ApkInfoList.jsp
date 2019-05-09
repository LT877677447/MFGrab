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
            <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">广告的APK</strong>
            </div>
        </div>

        <hr>

        <div class="am-g">
            <div class="am-u-sm-12 am-u-md-2">
                <div class="am-btn-toolbar">
                    <div class="am-btn-group am-btn-group-xs">
                        <button id="add_apkInfo" type="button" class="am-btn am-btn-default"><span class="am-icon-plus"></span> 新增
                        </button>
                        <%--<button type="button" class="am-btn am-btn-default"><span class="am-icon-save"></span> 保存--%>
                        <%--</button>--%>
                        <%--<button type="button" class="am-btn am-btn-default"><span class="am-icon-trash-o"></span> 删除--%>
                        <%--</button>--%>
                    </div>
                </div>
            </div>
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
                            <th class="table-author">包名</th>
                            <th class="table-author">别名</th>
                            <th class="table-author am-hide-sm-only">APK文件</th>
                            <th class="table-author am-hide-sm-only">脚本文件</th>
                            <th class="table-author am-hide-sm-only">新增参数</th>
                            <th class="table-date am-hide-sm-only">留存参数</th>
                            <th class="table-date am-hide-sm-only">脚本版本</th>
                            <th class="table-date am-hide-sm-only">操作</th>
                        </tr>
                        </thead>
                        <tbody id="content_table">
                        <c:forEach items="${ApkInfoList}" var="rs" varStatus="stat">
                            <tr>
                                <td><input type="checkbox"/></td>
                                <td>${rs.apkid}</td>
                                <td>${rs.packagename}</td>
                                <td class="am-hide-sm-only">${rs.apkname}</td>
                                <td class="am-hide-sm-only">${rs.apkfile}</td>
                                <td class="am-hide-sm-only">${rs.reg_scriptfiles}</td>
                                <td class="am-hide-sm-only">${rs.regscriptparams}</td>
                                <td class="am-hide-sm-only">${rs.remscriptparams}</td>
                                <td class="am-hide-sm-only">${rs.scriptfile_version}</td>
                                <td class="operation">
                                    <div class="am-btn-toolbar">
                                        <div class="am-btn-group am-btn-group-xs">
                                            <button type="button"
                                                    class="am-btn am-btn-default am-btn-xs am-text-secondary btn_edit"><span
                                                    class="am-icon-pencil-square-o"></span> 编辑
                                            </button>
                                            <%--<button class="am-btn am-btn-default am-btn-xs am-hide-sm-only"><span--%>
                                                    <%--class="am-icon-copy"></span> 复制--%>
                                            <%--</button>--%>
                                            <button type="button"
                                                    class="am-btn am-btn-default am-btn-xs am-text-danger btn_delete">
                                                <span class="am-icon-trash-o"></span> 删除
                                            </button>
                                        </div>
                                    </div>
                                </td>
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

    <div class="am-modal am-modal-prompt" tabindex="-1" id="modal_edit">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">修改APK包信息</div>
            <div class="am-modal-bd">
                <form class="am-form am-form-horizontal">
                    <div class="am-form-group">
                        <label for="modal_apkid" class="am-u-md-4 am-form-label">APK包ID：</label>
                        <div class="am-u-md-8">
                            <input id="modal_apkid" type="text" class="am-modal-prompt-input" readonly>
                            <small>说明：广告APK包的唯一ID（无法修改）</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_packagename" class="am-u-md-4 am-form-label">APK包名：</label>
                        <div class="am-u-md-8">
                            <input id="modal_packagename" type="text" class="am-modal-prompt-input">
                            <small>说明：APK包的包名</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_apkname" class="am-u-md-4 am-form-label">APK包别名：</label>
                        <div class="am-u-md-8">
                            <input id="modal_apkname" type="text" class="am-modal-prompt-input">
                            <small>说明：APK包的中文别名</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_MultipartFile_apkfile" class="am-u-md-4 am-form-label">APK文件：</label>
                        <div class="am-u-md-8">
                            <input id="modal_MultipartFile_apkfile" type="file" class="am-modal-prompt-input">
                            <p id="modal_MultipartFile_apkfile_help" class="am-form-help"></p>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_MultipartFile_scriptfile" class="am-u-md-4 am-form-label">脚本文件：</label>
                        <div class="am-u-md-8">
                            <input id="modal_MultipartFile_scriptfile" type="file" class="am-modal-prompt-input">
                            <p id="modal_MultipartFile_scriptfile_help" class="am-form-help"></p>
                            <small>说明：新增脚本和留存脚本是同一个</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_regscriptparams" class="am-u-md-4 am-form-label">新增参数：</label>
                        <div class="am-u-md-8">
                            <input id="modal_regscriptparams" type="text" class="am-modal-prompt-input">
                        </div>
                        <small>说明：做新增要用的参数</small>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_remscriptparams" class="am-u-md-4 am-form-label">留存参数：</label>
                        <div class="am-u-md-8">
                            <input id="modal_remscriptparams" type="text" class="am-modal-prompt-input">
                            <small>说明：做留存的参数</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_scriptfile_version" class="am-u-md-4 am-form-label">脚本版本：</label>
                        <div class="am-u-md-8">
                            <input id="modal_scriptfile_version" type="text" class="am-modal-prompt-input">
                        </div>
                        <small>说明：脚本文件的版本号</small>
                    </div>
                </form>
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>保存</span>
            </div>
        </div>
    </div>

    <div class="am-modal am-modal-alert" tabindex="-1" id="edit_failure">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">结果信息</div>
            <div class="am-modal-bd">
                更新失败！
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn">确定</span>
            </div>
        </div>
    </div>

    <div class="am-modal am-modal-alert" tabindex="-1" id="add_failure">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">结果信息</div>
            <div class="am-modal-bd">
                添加失败！
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

    <div class="am-modal am-modal-alert" tabindex="-1" id="delete-failure">
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

    <div class="am-modal am-modal-prompt" tabindex="-1" id="modal_add">
        <div class="am-modal-dialog">
            <div class="am-modal-hd">新增APK包</div>
            <div class="am-modal-bd">
                <form class="am-form am-form-horizontal">
                    <div class="am-form-group">
                        <label for="modal_add_apkid" class="am-u-md-4 am-form-label">APK包ID：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_apkid" type="text" class="am-modal-prompt-input">
                            <small>说明：广告APK包的唯一ID</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_packagename" class="am-u-md-4 am-form-label">APK包名：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_packagename" type="text" class="am-modal-prompt-input">
                            <small>说明：APK包的包名</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_apkname" class="am-u-md-4 am-form-label">APK包别名：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_apkname" type="text" class="am-modal-prompt-input">
                            <small>说明：APK包的中文别名</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_MultipartFile_apkfile" class="am-u-md-4 am-form-label">APK文件：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_MultipartFile_apkfile" type="file" class="am-modal-prompt-input">
                            <p id="modal_add_MultipartFile_apkfile_help" class="am-form-help"></p>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_MultipartFile_scriptfile" class="am-u-md-4 am-form-label">脚本文件：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_MultipartFile_scriptfile" type="file" class="am-modal-prompt-input">
                            <p id="modal_add_MultipartFile_scriptfile_help" class="am-form-help"></p>
                            <small>说明：新增脚本和留存脚本是同一个</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_regscriptparams" class="am-u-md-4 am-form-label">新增参数：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_regscriptparams" type="text" class="am-modal-prompt-input">
                        </div>
                        <small>说明：做新增要用的参数</small>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_remscriptparams" class="am-u-md-4 am-form-label">留存参数：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_remscriptparams" type="text" class="am-modal-prompt-input">
                            <small>说明：做留存的参数</small>
                        </div>
                    </div>
                    <div class="am-form-group">
                        <label for="modal_add_scriptfile_version" class="am-u-md-4 am-form-label">脚本版本：</label>
                        <div class="am-u-md-8">
                            <input id="modal_add_scriptfile_version" type="text" class="am-modal-prompt-input">
                        </div>
                        <small>说明：脚本文件的版本号</small>
                    </div>
                </form>
            </div>
            <div class="am-modal-footer">
                <span class="am-modal-btn" data-am-modal-cancel>取消</span>
                <span class="am-modal-btn" data-am-modal-confirm>保存</span>
            </div>
        </div>
    </div>
</div>
<!-- content end -->

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu"
   data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<input id="apkid_hidden" type="hidden">

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
    $(function () {
        $("#pageIndex").change(function () {
            var operation_html = $(".operation").eq(0).html();
            var param = {};
            param['pageIndex'] = $(this).val();
            if (${requestScope.pageModel.pageSize != null}) {
                param['pageSize'] = ${requestScope.pageModel.pageSize};
            }
            // alert(JSON.stringify(param));
            $.post({
                url: '<c:url value="/ApkInfo/PageQuery"/>',
                data: JSON.stringify(param),
                // contentType: "application/x-www-form-urlencoded;charset=UTF-8",
                contentType: "application/json",
                dataType: "json",
                success: function (data, textStatus, jqXHR) {
                    var ApkInfoList = data.ApkInfoList;
                    var pageModel = data.pageModel;
                    var apkinfo = data.ApkInfo;

                    $("#content_table").empty();
                    $.each(ApkInfoList, function () {
                        var tr = $("<tr ></tr>");
                        $("<td><input type='checkbox'/></td>").appendTo(tr);
                        $("<td></td>").html(this.apkid).appendTo(tr);
                        $("<td/>").html(this.packagename).appendTo(tr);
                        $("<td class='am-hide-sm-only'/>").html(this.apkname).appendTo(tr);
                        $("<td class='am-hide-sm-only'/>").html(this.apkfile).appendTo(tr);
                        $("<td class='am-hide-sm-only'/>").html(this.reg_scriptfiles).appendTo(tr);
                        $("<td class='am-hide-sm-only'/>").html(this.regscriptparams).appendTo(tr);
                        $("<td class='am-hide-sm-only'/>").html(this.remscriptparams).appendTo(tr);
                        $("<td class='am-hide-sm-only'/>").html(this.scriptfile_version).appendTo(tr);
                        // var td = $("<td id='operation' class='am-hide-sm-only'/>");
                        var td = $("<td class='operation'/>");
                        $(operation_html).appendTo(td);
                        td.appendTo(tr);
                        $("#content_table").append(tr);
                    });
                    OperationButtonListener();
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    alert("textStatus: " + textStatus + " -- errorThrown: " + errorThrown);
                }
            });
        });

        $("#btn_search").on("click", function () {
            var pageSize = $("#pageSize").val();
            var param = 'pageSize='+pageSize+"&pageIndex=1";
            window.location.href = '<c:url value="/index/APKList?"/>'+param;
        });

        $("#add_apkInfo").on("click",function () {
            $('#modal_add').modal({
                relatedTarget: this,
                onConfirm: function (e) {
                    var param = new FormData();
                    param.append("apkid",$("#modal_add_apkid").val());
                    param.append("packagename",$("#modal_add_packagename").val());
                    param.append("apkname",$("#modal_add_apkname").val());
                    if($("#modal_add_MultipartFile_apkfile").val() != ''){
                        param.append("MultipartFile_apkfile",$("#modal_add_MultipartFile_apkfile")[0].files[0]);
                    }
                    if($("#modal_add_MultipartFile_scriptfile").val() != ''){
                        param.append("MultipartFile_scriptfile",$("#modal_add_MultipartFile_scriptfile")[0].files[0]);
                    }
                    param.append("regscriptparams",$("#modal_add_regscriptparams").val());
                    param.append("remscriptparams",$("#modal_add_remscriptparams").val());
                    param.append("scriptfile_version",$("#modal_add_scriptfile_version").val());
                    $.ajax("<c:url value="/ApkInfo/Add"/>", {
                        type: "post",
                        data: param,
                        dataType: "json",
                        processData:false,
                        contentType:false,
                        async: true,
                        success: function (data, textStatus, jqXHR) {
                            var result = data.result;
                            if(result == 'success'){
                                var pageIndex = $("#pageIndex").val();
                                var pageSize = ${requestScope.pageModel.pageSize};
                                window.location.href = "<c:url value="/index/APKList?"/>" + "pageSize=" + pageSize + "&pageIndex=" + pageIndex;
                            }
                            if(result == 'failure'){
                                $('#add_failure').modal();
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
            var apkid = tr.children('td').eq(1).text();
            var packagename = tr.children('td').eq(2).text();
            var apkname = tr.children('td').eq(3).text();
            var apkfile = tr.children('td').eq(4).text();
            var reg_scriptfiles = tr.children('td').eq(5).text();
            var regscriptparams = tr.children('td').eq(6).text();
            var remscriptparams = tr.children('td').eq(7).text();
            var scriptfile_version = tr.children('td').eq(8).text();
            $("#modal_apkid").val(apkid);
            $("#modal_packagename").val(packagename);
            $("#modal_apkname").val(apkname);
            //每次打开modal时，清空modal缓存的上次选择的文件
            $("#modal_MultipartFile_apkfile").val('');
            $("#modal_MultipartFile_scriptfile").val('');
            $("#modal_MultipartFile_apkfile_help").text(apkfile);
            $("#modal_MultipartFile_scriptfile_help").text(reg_scriptfiles);

            $("#modal_regscriptparams").val(regscriptparams);
            $("#modal_remscriptparams").val(remscriptparams);
            $("#modal_scriptfile_version").val(scriptfile_version);
            $('#modal_edit').modal({
                relatedTarget: this,
                onConfirm: function (e) {
                    var param = new FormData();
                    param.append("apkid",$("#modal_apkid").val());
                    param.append("packagename",$("#modal_packagename").val());
                    param.append("apkname",$("#modal_apkname").val());
                    if($("#modal_MultipartFile_apkfile").val() != ''){
                        param.append("MultipartFile_apkfile",$("#modal_MultipartFile_apkfile")[0].files[0]);
                    }
                    if($("#modal_MultipartFile_scriptfile").val() != ''){
                        param.append("MultipartFile_scriptfile",$("#modal_MultipartFile_scriptfile")[0].files[0]);
                    }
                    param.append("regscriptparams",$("#modal_regscriptparams").val());
                    param.append("remscriptparams",$("#modal_remscriptparams").val());
                    param.append("scriptfile_version",$("#modal_scriptfile_version").val());
                    $.ajax("<c:url value="/ApkInfo/Edit"/>", {
                        type: "post",
                        data: param,
                        dataType: "json",
                        processData:false,
                        contentType:false,
                        async: true,
                        success: function (data, textStatus, jqXHR) {
                            var result = data.result;
                            if(result == 'success'){
                                var pageIndex = $("#pageIndex").val();
                                var pageSize = ${requestScope.pageModel.pageSize};
                                window.location.href = "<c:url value="/index/APKList?"/>" + "pageSize=" + pageSize + "&pageIndex=" + pageIndex;
                            }
                            if(result == 'failure'){
                                $('#edit_failure').modal();
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
            var apkid = tr.children('td').eq(1).text();
            $("#apkid_hidden").val(apkid);
            // $("#adv_id_hidden").val(adv_id);
            $('#my-confirm').modal({
                relatedTarget: this,
                onConfirm: function(options) {
                    var param = {};
                    param['apkid'] = $("#apkid_hidden").val();
                    $.ajax("<c:url value="/ApkInfo/Delete"/>", {
                        type: "post",
                        data: JSON.stringify(param),
                        contentType: "application/json",
                        dataType: "json",
                        async: true,
                        success: function (data, textStatus, jqXHR) {
                            // alert(JSON.stringify(data));//{"result":"id exist"}
                            var result = data.result;
                            if(result == 'success'){
                                //update成功，回显页面
                                var pageIndex = $("#pageIndex").val();
                                var pageSize = ${requestScope.pageModel.pageSize};
                                window.location.href = "<c:url value="/index/APKList?"/>" + "pageSize=" + pageSize + "&pageIndex=" + pageIndex;
                            }
                            if(result == 'failure'){
                                $('#delete-failure').modal();
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("jqXHR-" + jqXHR + "\ntextStatus-" + textStatus + "\nerrorThrown-" + errorThrown);
                        }
                    });
                },
                // closeOnConfirm: false,
                onCancel: function() {
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