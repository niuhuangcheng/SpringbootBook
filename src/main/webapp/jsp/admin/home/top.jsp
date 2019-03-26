<%@ page language="java" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<style type="text/css">
BODY {
	MARGIN: 0px;
	BACKGROUND-COLOR: #ffffff
}

BODY {
	FONT-SIZE: 14px;
	COLOR: #000000
}

TD {
	FONT-SIZE: 14px;
	COLOR: #000000
}

TH {
	FONT-SIZE: 14px;
	COLOR: #000000
}
</style>
<link href="<%=request.getContextPath()%>/css/top.css"
	rel="stylesheet" type="text/css">

<script type="text/javascript">
	function exitSys() {
		var flag = window.confirm("确认退出系统吗?");
		if (flag) {
			window.top.open('', '_parent', '');
			window.top.close();
		}
		//如果你使用的是firefox浏览器必须要做以下设置 
		//1、在地址栏输入about:config然后回车，警告确认 
		//2、在过滤器中输入”dom.allow_scripts_to_close_windows“，双击即可将此值设为true 即可完成了 

	}
</script>
</HEAD>
<body background="${pageContext.request.contextPath}/images/top_11.png" style="background-repeat: no-repeat;">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" >
		<tr>
			<td height="30"   style="position:absolute;bottom:0;width: 100%;">
				<table width="100%" border="0" cellspacing="0" cellpadding="0"
					>
					<tr>
						<td width="85%" align="left" style="padding-bottom: 10px;font-size: 16px;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <font color="#000000">
								<script language="JavaScript">
									tmpDate = new Date();
									date = tmpDate.getDate();
									month = tmpDate.getMonth() + 1;
									year = tmpDate.getFullYear();
									document.write(year);
									document.write("年");
									document.write(month);
									document.write("月");
									document.write(date);
									document.write("日 ");

									myArray = new Array(6);
									myArray[0] = "星期日"
									myArray[1] = "星期一"
									myArray[2] = "星期二"
									myArray[3] = "星期三"
									myArray[4] = "星期四"
									myArray[5] = "星期五"
									myArray[6] = "星期六"
									weekday = tmpDate.getDay();
									if (weekday == 0 | weekday == 6) {
										document.write(myArray[weekday])
									} else {
										document.write(myArray[weekday])
									};
								</script> </font>
						</td>
						<td width="15%" style="padding-bottom: 10px;font-size: 16px;">
							<table width="100%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="16"
										background="${pageContext.request.contextPath}/images/mis_05b.jpg">

									</td>
									<td width="155" valign="bottom">
										<font color="blue"><a href="javascript:void(0)" style="font-size: 16px;"
											onclick="exitSys()">退出系统</a> </font></td>
									<td width="10" align="right">
									</td>
								</tr>
							</table>
						</td>
						<td align="right" width="5%"></td>
					</tr>
				</table>
			</td>
		</tr>
	</table>
</body>
</HTML>
