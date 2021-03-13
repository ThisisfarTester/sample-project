<%--	file name : index.jsp
		used for providing login option to user as well as
		an administrator.!
 --%>
<html>
	<head>
		<title>Management Application</title>
	</head>
	<body bgcolor='cyan'>
		<div align="center">
			<font color='green' size='3pxl'>Login with the system</font><br>
			<hr><br>
			<form action="loginAction" method="post">
				<table>
					<tr>
						<td>Enter User name sumit :</td>
						<td><input type="text" name='uname'></td>
					</tr>
					<tr>
						<td>Enter Password :</td>
						<td><input type="password" name='pwd'></td>
					</tr>
					<tr>
						<td>Select role :</td>
						<td><select name='role'>
							<option value='-1'>-select role-</option>
							<option value='admin'>Admin</option>
							<option value='user'>User</option>
							</select>
						</td>
					</tr>
					<tr>
						<td></td>
						<td><input type="submit" value="login"></td>
					</tr>
				</table>
			</form>
		</div>
		<%--code to display error message --%>
		<div align="center">
			<font color='red' size='1pxl'>
			<%
				String msg=request.getParameter("errMessage");
				if(msg!=null){
					//login credentials validation
					if(msg.equals("adminError"))
						out.println("Invalid Admin login credentials.!");
					if(msg.equals("userError"))
						out.println("Seems Your are new here,<br> please contact admin for login credentials.!");
					//input validation
					if(msg.equals("emptyR"))
						out.println("please provide details to proceed login..!");
					if(msg.equals("emptyU"))
						out.println("please provide user name");
					if(msg.equals("emptyP"))
						out.println("please provide password");
					if(msg.equals("emptyT"))
						out.println("please select authentication role.!");
				}
			%>
			</font>
		</div>
	</body>
</html>
