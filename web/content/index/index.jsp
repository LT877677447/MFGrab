<%--suppress XmlPathReference --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html class="fixed-layout">
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>查询页面</title>
  <meta name="description" content="这是一个 index 页面">
  <meta name="keywords" content="index">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="renderer" content="webkit">
  <meta http-equiv="Cache-Control" content="no-siteapp" />
  <link rel="icon" type="image/png" href="<c:url value="/assets/i/favicon2.png"/> ">
  <link rel="apple-touch-icon-precomposed" href="<c:url value="/assets/i/app-icon72x72@2x.png"/> ">
  <meta name="apple-mobile-web-app-title" content="Amaze UI" />
  <link rel="stylesheet" href="<c:url value='/assets/css/amazeui.min.css'/>"/>
  <link rel="stylesheet" href="<c:url value='/assets/css/admin.css'/>">
</head>
<body>
<!--[if lte IE 9]>
<p class="browsehappy">你正在使用<strong>过时</strong>的浏览器，Amaze UI 暂不支持。 请 <a href="http://browsehappy.com/" target="_blank">升级浏览器</a>
  以获得更好的体验！</p>
<![endif]-->

<header class="am-topbar am-topbar-inverse admin-header">
  <div class="am-topbar-brand">
    <strong>查询结果页面</strong> <%--<small>查询页面</small>--%>
  </div>

  <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

  <div class="am-collapse am-topbar-collapse" id="topbar-collapse">
    <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">
      <li class="am-hide-sm-only"><a href="javascript:;" id="admin-fullscreen"><span class="am-icon-arrows-alt"></span> <span class="admin-fullText">开启全屏</span></a></li>
    </ul>
  </div>
</header>

<div class="am-cf admin-main">
  <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
    <div class="am-offcanvas-bar admin-offcanvas-bar">
      <ul class="am-list admin-sidebar-list">
        <li><a href="<c:url value="/Summary/List?channel=464"/>" target="mainContent2"><span class="am-icon-home"></span> 详细记录</a></li>
        <li><a href="<c:url value="/statistical/List?"/>" target="mainContent2"><span class="am-icon-bookmark"></span> 概要统计</a></li>
        <li><a href="<c:url value="/Month2Live/List?"/>" target="mainContent2"><span class="am-icon-adn"></span> 月活统计</a></li>
      </ul>
    </div>
  </div>

  <iframe name="mainContent2" src="<c:url value="/Summary/List?channel=464"/>" width="85%" height="100%">

  </iframe>
</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>

<!--[if lt IE 9]>
<script src="http://libs.baidu.com/jquery/1.11.1/jquery.min.js"></script>
<script src="http://cdn.staticfile.org/modernizr/2.8.3/modernizr.js"></script>
<script src="<c:url value='/assets/js/amazeui.ie8polyfill.min.js'/> "></script>
<![endif]-->

<!--[if (gte IE 9)|!(IE)]><!-->
<script src="<c:url value="/js/jquery-2.2.2.js"/> "></script>
<!--<![endif]-->
<script src="<c:url value="/assets/js/amazeui.min.js"/> "></script>
<script src="<c:url value="/assets/js/app.js"/> "></script>
<script>
  // $('#am-icon-envelope-o').on(click)




</script>



</body>
</html>
