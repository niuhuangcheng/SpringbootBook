<%@ page language="java" pageEncoding="UTF-8" %>
<HTML>
<HEAD>
    <meta http-equiv="Content-Language" content="zh-cn">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <LINK href="${pageContext.request.contextPath}/css/style.css"
          type="text/css" rel="stylesheet">
    <!-- 1    jQuery的js包 -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
    <!-- 2    css资源 -->
    <link href="<%=request.getContextPath()%>/css/easyui/themes/default/easyui.css"
          rel="stylesheet" type="text/css">
    <!-- 3    图标资源 -->
    <link href="<%=request.getContextPath()%>/css/easyui/themes/icon.css"
          rel="stylesheet" type="text/css">
    <!-- 4    EasyUI的js包 -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.easyui.min.js"></script>
    <!-- 5    本地语言 -->
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui-lang-zh_CN.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.form.js"></script>

    <script type="text/javascript" src="<%=request.getContextPath()%>/js/easyform/easyform.css"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/easyform/easyform.js"></script>
    <script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/common.js"></script>
    <script>
        function submitForm() {
            $('#userAction_save_do').form('submit', {
                onSubmit: function () {
                    var b = $(this).form('enableValidation').form('validate');
                    if (b) {
                        if (! $.isEmptyObject($("input[type='file']").val())) {
                            var param = $("#userAction_save_do").formSerialize();
                            $(this).ajaxSubmit({
                                "url": "saveBook",
                                "type": "post",
                                "data": param,
                                "dataType": "json",
                                "success": function (data) {
                                    changeToBookListTab("商品查看","book/list",1)
                                },
                                "error": function (data) {
                                    alert("服务器繁忙，请稍后再试");
                                }
                            })
                        }else{
                            alert("请添加上传文件")
                        }
                    }
                }
            });
        }

        function clearForm() {
            $('#userAction_save_do').form('clear');
        }
    </script>
</HEAD>

<body>
<form id="userAction_save_do" name="Form1" action="" class="easyui-form" data-options="novalidate:true"
      enctype="multipart/form-data" method="post">
    &nbsp;
    <font color="red">${add_error_msg}</font>
    <table cellSpacing="1" cellPadding="5" width="100%" align="center"
           bgColor="#eeeeee" style="border: 1px solid #8ba7e3" border="0">
        <tr>
            <td class="ta_01" align="center" bgColor="#afd1f3" colSpan="4"
                height="26"><strong><STRONG>添加商品</STRONG> </strong>
            </td>
        </tr>


        <tr>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品名称：</td>
            <td class="ta_01" bgColor="#ffffff"><input type="text"
                                                       name="name" class="easyui-textbox"
                                                       data-options="required:true,missingMessage:'商品名称不能为空，请输入'"/>
            </td>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品价格：</td>
            <td class="ta_01" bgColor="#ffffff"><input type="text"
                                                       name="price" class="easyui-textbox"
                                                       data-options="required:true,missingMessage:'请输入商品价格'"/>
            </td>
        </tr>
        <tr>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品数量：</td>
            <td class="ta_01" bgColor="#ffffff"><input type="text"
                                                       name="pnum" class="easyui-textbox" data-options="required:true"/>
            </td>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品类别：</td>
            <td class="ta_01" bgColor="#ffffff"><select name="category"
                                                        id="category" class="easyui-combobox" style="width:200px;"
                                                        required="true">
                <option value="" selected="selected">请选择商品类别</option>
                <option value="文学">文学</option>
                <option value="生活">生活</option>
                <option value="计算机">计算机</option>
                <option value="外语">外语</option>
                <option value="经营">经营</option>
                <option value="励志">励志</option>
                <option value="社科">社科</option>
                <option value="学术">学术</option>
                <option value="少儿">少儿</option>
                <option value="艺术">艺术</option>
                <option value="原版">原版</option>
                <option value="科技">科技</option>
                <option value="考试">考试</option>
                <option value="生活百科">生活百科</option>
            </select>
            </td>
        </tr>


        <tr>
            <td align="center" bgColor="#f5fafe" class="ta_01">商品图片：</td>
            <td class="ta_01" bgColor="#ffffff" colSpan="3">
                <input class="easyui-filebox" name="imgPath" data-options="prompt:'Choose a file...'"
                       style="width:260px" data-options="required:true,validType:'checkFile'">
            </td>
        </tr>
        <TR>
            <TD class="ta_01" align="center" bgColor="#f5fafe">商品描述：</TD>
            <TD class="ta_01" bgColor="#ffffff" colSpan="3">

                <input name="description" class="easyui-textbox"
                       data-options="required:true"
                       style="width: 96%;height: 60px;">
            </TD>
        </TR>
        <TR>
            <td align="center" colSpan="4" class="sep1"><img
                    src="${pageContext.request.contextPath}/images/shim.gif">
            </td>
        </TR>


        <tr>
            <td class="ta_01" style="WIDTH: 100%" align="center"
                bgColor="#f5fafe" colSpan="4">


                <input type="button" onclick="submitForm()"
                       class="easyui-linkbutton" style="width: 70px;height: 30px;" value="确定">

                <FONT face="宋体">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</FONT>


                <input type="button" onclick="clearForm()" value="重置" class="easyui-linkbutton"
                       style="width: 70px;height: 30px;">
            </td>
        </tr>
    </table>
</form>
</body>
</HTML>