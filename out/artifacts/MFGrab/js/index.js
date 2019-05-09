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

    //我的事件
    $(function () {
        'use strict';
        //按钮 登录
        $('input[name="login"]').on('click', function () {
            var name = $("#name").val();
            name = name.replace(/(^\s*)|(\s*$)/g, '');//去除空格;
            if(name.length == 0){
                $("#comment_name").text("用户名不能为空");
                return;
            }else{
                $("#comment_name").text("");
            }
            var password = $("#password").val();
            password = password.replace(/(^\s*)|(\s*$)/g, '');//去除空格;
            if(password.length == 0){
                $("#comment_pass").text("密码不能为空");
                return;
            }else{
                $("#comment_pass").text("");
            }
            var data = {
              "name":name ,
               "password":password
            };
            $.ajax(url + "/index/login", {
                type: "post",
                data: JSON.stringify(data),
                contentType: "application/json",
                dataType: "json",
                success: function (data) {
                    var res = data.res;
                    if(res.toString() == "exist")  {
                        
                    }
                    if(res.toString() == "not exist"){
                        $("#comment_pass").text("账号不存在");
                    }
                },
                error: function (jqXHR) {
                    alert("Sending reqeust failed");
                }
            });
        });

        //按钮 忘记密码
        $('input[name="forgetPass"]').on('click', function () {
            alert("功能开发中，敬请期待！");
        });
    });

    function getRootPath() {
        var pathName = window.location.pathname.substring(1);
        var webName = pathName == '' ? '' : pathName.substring(0, pathName.indexOf('/'));
        return window.location.protocol + '//' + window.location.host + '/' + webName;
    }

})(jQuery);
