<%--suppress XmlPathReference --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>查看入口</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="format-detection" content="telephone=no">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-cache"/>
    <link rel="alternate icon" type="image/png" href="<c:url value="/assets/i/favicon2.png"/> ">
    <link rel="stylesheet" href="<c:url value="/assets/css/amazeui.min.css"/>"/>
    <style>
        .header {
            text-align: center;
        }

        .header h1 {
            font-size: 200%;
            color: #333;
            margin-top: 30px;
        }

        .header p {
            font-size: 14px;
        }
    </style>
</head>
<body>
<div class="header">
    <div class="am-g">
        <h1>登录入口</h1>
        <%--<p>Integrated Development Environment<br/>代码编辑，代码生成，界面设计，调试，编译</p>--%>
    </div>
    <hr/>
</div>
<div class="am-g">
    <div class="am-u-lg-6 am-u-md-8 am-u-sm-centered">
        <br>
        <form method="post" class="am-form">
            <label for="name">用户名:</label>
            <input type="text" id="name" value="">
            <p id="comment_name" style="color: #009cda"></p>

            <label for="password">密码:</label>
            <input type="password" id="password" value="">
            <p id="comment_pass" style="color: #009cda"></p>

            <div class="am-cf">
                <input id="login" type="button" value="登 录" class="am-btn am-btn-primary am-btn-sm am-fl">
                <input id="forgetPass" type="button" value="忘记密码 ^_^? "
                       class="am-btn am-btn-default am-btn-sm am-fr">
            </div>
        </form>

        <hr>
        <p>© 2019 AllMobilize, Inc. Licensed under MIT license.</p>
    </div>
</div>


<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="<c:url value='/assets/js/amazeui.ie8polyfill.min.js'/> "></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<c:url value="/js/jquery-2.2.2.js"/> "></script>
<!--<![endif]-->
<script src="<c:url value="/assets/js/amazeui.min.js"/> "></script>
<script>
    (function ($) {
        var url = getRootPath();
        //初始自带的，以后可能删除
        $(function () {
            var $fullText = $('.admin-fullText');
            $('#admin-fullscreen').on('click', function () {
                $.AMUI.fullscreen.toggle();
            });

            $(document).on($.AMUI.fullscreen.raw.fullscreenchange, function () {
                $fullText.text($.AMUI.fullscreen.isFullscreen ? '退出全屏' : '开启全屏');
            });
        });

        //按钮 登录
        $("#login").on('click', function () {
            var name = $("#name").val();
            name = name.replace(/(^\s*)|(\s*$)/g, '');//去除空格;
            if (name.length == 0) {
                $("#comment_name").text("用户名不能为空");
                return;
            } else {
                $("#comment_name").text("");
            }
            var password = $("#password").val();
            if (password.length == 0) {
                $("#comment_pass").text("密码不能为空");
                return;
            } else {
                $("#comment_pass").text("");
            }
            var data = {
                name: name,
                password: password
            };
            $.ajax(url + "/index/login", {
                type: "post",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "json",
                async:true,
                success: function (data) {
                    var res = data.res;
                    if (res.toString() === "exist") {
                        window.location.href = "<c:url value="/index/index"/>";
                    }
                    if (res.toString() === "not exist") {
                        $("#comment_pass").text("账号不存在");
                    }
                },
                error: function (jqXHR) {
                    alert("Sending reqeust failed");
                }
            });
        });


        $('#testbtn').on('click',function () {
            $.post(getRootPath()+"/index/todayResult");
        })


        //按钮 忘记密码
        $('#forgetPass').on('click', function () {
            alert("功能开发中，敬请期待！");
        });

        function getRootPath() {
            var pathName = window.location.pathname.substring(1);
            var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
            return window.location.protocol + '//' + window.location.host + '/' + webName;
        }

    })(jQuery);
</script>

</body>
</html>
