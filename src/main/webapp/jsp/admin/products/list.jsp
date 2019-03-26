<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<HTML>
<HEAD>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="${pageContext.request.contextPath}/css/style.css"
	rel="stylesheet" type="text/css" />
<script language="javascript"
	src="${pageContext.request.contextPath}/js/admin/public.js"></script>
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
	<script type="text/javascript"  src="<%=request.getContextPath()%>/js/admin/list.js"></script>
	<script type="text/javascript"  src="<%=request.getContextPath()%>/js/admin/common.js"></script>
	<script type="text/javascript">
	function addProduct() {
        changeToBookListTab("商品添加","book/add",2)
	}
	function deleteMany(){
        var rows = $("#requestGrid").datagrid("getSelections")
        if (rows.length > 0){
            var ids = [];
            for(var i=0; i<rows.length; i++){
                ids.push(rows[i].id);
            }
             ids.join(',')
            $(location).attr("href","${pageContext.request.contextPath}/book/batchDelete?ids="+ids);
        }else{
            alert("请选择后再点击删除哦！")
        }
    }
    $(function(){
        $("#Form1").submit(function(e){
            e.preventDefault();
            var temp={
                "id":$("#id").val(),
                "category":$("#category").val(),
                "name":$("#name").val(),
                "maxprice":$("#maxprice").val(),
				"minprice":$("#minprice").val()
			};
            $("#requestGrid").datagrid('load',temp);

		})
	})
</script>
</HEAD>
<body>
	<br>
	<form id="Form1" name="Form1"
		action="${pageContext.request.contextPath}/book/searchBooks"
		method="post">
		<table cellSpacing="1" cellPadding="0" width="100%" align="center"
			bgColor="#f5fafe" border="0">
			<TBODY>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3" ><strong>查
							询 条 件</strong>
					</td>
				</tr>
				<tr>
					<td>
						<table cellpadding="0" cellspacing="0" border="0" width="100%" style="border-collapse:separate; border-spacing:0px 5px;">
							<tr style="height: 30px">
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									商品编号</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="id" size="15" value="" id="id" class="easyui-textbox" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									类别：</td>
								<td class="ta_01" bgColor="#ffffff"><select name="category"
									id="category" class="easyui-combobox" style="width:200px;">
										<option value="" selected="selected">--选择商品类加--</option>
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
								</select></td>
							</tr>

							<tr style="margin-top: 10px;">
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									商品名称：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="name" size="15" value="" id="name" class="easyui-textbox" />
								</td>
								<td height="22" align="center" bgColor="#f5fafe" class="ta_01">
									价格区间(元)：</td>
								<td class="ta_01" bgColor="#ffffff"><input type="text"
									name="minprice" size="10" value="" class="easyui-textbox" id="minprice"/>- <input type="text"
									name="maxprice" size="10" value="" class="easyui-textbox" id="maxprice"/></td>
							</tr>

							<tr style="height: 30px">
								<td width="100" height="22" align="center" bgColor="#f5fafe"
									class="ta_01"></td>
								<td class="ta_01" bgColor="#ffffff"><font face="宋体"
									color="red"> &nbsp;</font>
								</td>
								<td align="right" bgColor="#ffffff" class="ta_01"><br>
									<br></td>
								<td align="right" bgColor="#ffffff" class="ta_01">
									<button type="submit" id="search" name="search"
										value="查询" class="easyui-linkbutton" data-options="iconCls:'icon-search'" style="width: 70px;height: 30px;">
										查询</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input
									type="reset" name="reset" value="重置"
									class="easyui-linkbutton" style="width: 70px;height: 30px;" />
								</td>
							</tr>
						</table>
					</td>

				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#afd1f3"><strong>商品列表</strong>
					</TD>
				</tr>
				<tr>
					<td class="ta_01" align="right">
					    <font color="red">${delete_many_error_msg}</font>
					    <font color="red">${deleteResult}</font>
						<button type="button" id="delete" name="delete" value="批量删除"
								class="easyui-linkbutton" data-options="iconCls:'icon-remove'"  style="width:10%" onclick="deleteMany()" >批量删除
						</button>
						<button type="button" id="add" name="add" value="添加"
								class="easyui-linkbutton" data-options="iconCls:'icon-add'" style="width:5%" onclick="addProduct()">添加
						</button>
					</td>
				</tr>
				<tr>
					<td class="ta_01" align="center" bgColor="#f5fafe">

						<table id="requestGrid"></table>
					</td>
				</tr>
			</TBODY>
		</table>
	</form>
</body>
</HTML>

