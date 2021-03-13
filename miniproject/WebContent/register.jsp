<%@page import="com.util.ConnectionDb, java.sql.*" %>
<html>
	<head>
		<title>Management Application</title>
	</head>
	<body>
		<%--reading max id from table to display --%>
		<%!String id; %>
		<%
			Connection con=ConnectionDb.getConn();
			Statement stmt=con.createStatement();
			ResultSet rs=stmt.executeQuery("select max(register_id) from registration_details");
			if(rs.next()){
					id=rs.getString(1);
					if(id!=null){
					/*extracting number data from id, if id is 'R102' then extract 102 and convert
						them in int and increment by 1
					*/
				    int no=Integer.parseInt(id.substring(1,4))+1;
					char ch=id.charAt(0);
					id=ch+String.valueOf(no);
				}else{
					id="R101";
				}
			}
		%>
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
					<%--form to register user --%>
					<div align="center">
						<h4><font color='red' size='4pxl'><b><i>Registration Form</i></b></font></h4>
							<hr/>
						<div align='left'>
							<a href='adminAction.jsp'>
								<font size='2pxl'>home</font>
							</a>
						</div>
						 <%
						 	String str=request.getParameter("msg");
						 	if(str!=null){
						 %>
						 <font color='green' size='1pxl'>
						 	<%="User created successfully" %>
						 <%} %>
						 </font>
						<form action="registerAction" method="post">
							<table>
								<tr>
									<td>Enter ID</td>
									<td><input readonly type="text" name="id" value='<%=id%>'></td>
								</tr>
								<tr>
									<td>Enter First Name</td>
									<td><input type="text" name="fname"></td>
								</tr>
								<tr>
									<td>Enter Last Name</td>
									<td><input type="text" name="lname"></td>
								</tr>
								<tr>
									<td>Enter password</td>
									<td><input type="password" name="pwd"></td>
      </tr>
								
								<tr>
								<td>			Select DOB :</td>
			<td>	<select name="dd">
					<option value='-1'>--date--</option>
					<% 
						for(int i=1;i<=31;i++){
					%>
						<option value='<%=i%>'><%=i%></option>
					<% }
					%>
				</select>&nbsp;
				<!-- select to provide month -->
				<select name="month">
					<option value='-1'>--month--</option>
					<% 
						for(int i=1;i<=12;i++){
					%>
						<option value='<%=i%>'><%=i%></option>
					<% }
					%>
				</select>&nbsp;
			<!-- select to provide year -->
				<select name="year">
					<option value='-1'>--year--</option>
					<% 
						int year=1989;
					
						for(int i=0;i<=10;i++){
								year=year+1;
					%>
						<option value='<%=year%>'><%=year%></option>
					<% }
					%>
								</select></td></tr>
								<tr>
							
									<td>Select Gender</td>
									<td><input type="radio" name="gender" value="Male">Male
										&nbsp;
										<input type="radio" name="gender" value="Female">Female
									</td>
								</tr>
								<tr>
									<td>Select country</td>
									<td><select name="country">
											<option value="India">India</option>
											<option value="USA">USA</option>
											<option value="UK">UK</option>
											<option value="UAE">UAE</option>
										</select>
									</td>
								</tr>
								<tr>
									<td>Show your interest :</td>
									<td>
										<input type="checkbox" value="Cricket" name="interest">Cricket&nbsp;
										<input type="checkbox" value="Movie" name="interest">Movie&nbsp;
										<input type="checkbox" value="Chess" name="interest">Chess&nbsp;
										<input type="checkbox" value="Travel" name="interest">Traveling
									</td>
								</tr>
							</table>&nbsp;&nbsp;&nbsp;&nbsp;
							<input type="submit" value="Commit"/>
						</form>
					</div>
					<%--code to display error message --%>
					<div align="center">
						<font color='red' size='1pxl'>
							<%
								String msg=request.getParameter("errMessage");
								if(msg!=null){
									//Field Validation
									if(msg.equals("emptyR"))
										out.println("All field are required to be filded before submition.!");
									if(msg.equals("emptyFn"))
										out.println("please provide first name");
									if(msg.equals("emptyLn"))
										out.println("please provide last name");
									if(msg.equals("emptyP"))
										out.println("please provide password");
									if(msg.equals("emptyG"))
										out.println("please select gendar");
									if(msg.equals("emptyH"))
										out.println("please select one of your hobby.!");
								}
							%>
						</font>
					</div>
				</td>	
			  </tr>
			</table>
		</div>
	</body>
</html>