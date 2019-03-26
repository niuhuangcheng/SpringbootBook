<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <style>
        body {
            overflow:hidden
        }
    </style>
    <!-- 1    jQuery的js包 -->
    <script type="text/javascript"  src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <!-- 2    css资源 -->
    <link href="<%=request.getContextPath()%>/css/easyui/themes/default/easyui.css"
          rel="stylesheet" type="text/css">
    <!-- 3    图标资源 -->
    <link href="<%=request.getContextPath()%>/css/easyui/themes/icon.css"
          rel="stylesheet" type="text/css">
    <!-- 4    EasyUI的js包 -->
    <script type="text/javascript"  src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>
    <!-- 5    本地语言 -->
    <script type="text/javascript"  src="<%=request.getContextPath()%>/js/easyui-lang-zh_CN.js"></script>
    <script src="<%=request.getContextPath()%>/js/admin/home/main.js"></script>
</head>


<body class="easyui-layout">
<!--  页面上方区域     -->
<div region="north" style="height:76px;font-size: 26px;text-align: center;background-color: #D1EEEE">
    <iframe src="top" frameborder="0" scrolling="no" style="width: 100%;height: 100%;"></iframe>
</div>

<!--  页面左边区域    -->
<div region="west" style="width:180px" title="菜单功能列表">
    <!-- 树形结构的功能列表 -->
    <ul id="tree"></ul>
</div>

<!--  页面中间内容（主面板）区域     -->
<div region="center">
    <div class="easyui-tabs" fit="true" border="false" id="tabs">
        <div title="首页">欢迎来到后台管理系统</div>
    </div>
</div>
<!--  页面左边区域    -->
<div region="south" style="width:180px;height:80px;"  >
    <iframe src="bottom" frameborder="0" scrolling="no" style="width: 100%;"></iframe>
</div>
</body>
</html>
</html>
