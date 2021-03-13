<%--
	file name : adminAction.jsp
	@description : this jsp page is to show success page of admin.
--%>
<html>
	<head>
		<title>Management Application</title>
	</head>
	<body>
		<div align='center'>
			<table border="1" style="width:800">
			<tr>
				<td><div align='right'>
						<font color='blue'>
							<b>
								<%="Welcome, "+(String)session.getAttribute("name")%>
							</b>
						</font><br>
						<a href='logoutSrv'><font size='2pxl'>logout</font></a>
					</div>
					<div align="center">
						<font size='2pxl'>
							<br>
								<a href="register.jsp">Register new user</a>
								<br>
								<a href="view.jsp">view all users</a>
								<br>
								<a href="update_ref.jsp">update user</a>
						</font>
					</div>
				</td>
					
			</tr>
		</table>
		</div>
		
	</body>
</html>