<%@page import="java.sql.*" %>
<%@page import="com.util.ConnectionDb"%>
<a href="adminAction.jsp">click for home</a>
<%
  Connection con=ConnectionDb.getConn();
  String command="select register_id from registration_details order by register_id";
  PreparedStatement stmt=con.prepareStatement(command);
  ResultSet rs=stmt.executeQuery();
%>
<html>
	<body>
		<div align='right'>
		<font color='blue'>
			<b>
			<%="Welcome, "+(String)session.getAttribute("name")%>
			</b>
			<br>
		</font>
		<a href='logoutSrv'><font size='2pxl'>logout</font></a>
	</div>
		<form action="#">
			Select Id for update :<select name="ids">
				<option value="-1">Select Id</option>	
					<%
						while(rs.next()){
					%>	
									<option value="<%=rs.getString(1)%>"><%=rs.getString(1) %></option>
					<%
						}
					%>
				</select>&nbsp;
				<input type="submit" value="search" name="action">
		</form>
		<br>
		<%
			String msg=request.getParameter("msg");
				if(msg!=null){
					out.println("Please select Id");
				}
		%>
		<%
			String act=request.getParameter("action");
			
			String ids=request.getParameter("ids");
			if("-1".equalsIgnoreCase(ids)){
				response.sendRedirect("update_ref.jsp?msg=failed");
			}else{
			if("search".equalsIgnoreCase(act)){	
			if(ids!=null){
					String cmnd="select * from registration_details where register_id=?";
					PreparedStatement st=con.prepareStatement(cmnd);
							st.setString(1, ids);
					ResultSet rss=st.executeQuery();
					rss.next();
					if(rss!=null){
						
		%>
			<div align="center">
				<form action="#">
					<input type="text" name="id" readonly value="<%=rss.getString(1) %>"><br>
					<input type="text" name="fname" value="<%=rss.getString(2) %>" readonly="readonly"><br>
					<input type="text" name="lname" value="<%=rss.getString(3)%>" readonly="readonly"><br>
						<%
							if(rss.getString(4).equalsIgnoreCase("Male")){
						%>
							<input type="radio" name="gender" value="Male" checked="checked" disabled="disabled">Male&nbsp;
						<%}else{
						%><input type="radio" name="gender" value="Male" disabled="disabled">Male&nbsp;
						<%}if(rss.getString(4).equalsIgnoreCase("Female")){
						%>
							<input type="radio" name="gender" value="Female" checked="checked" disabled="disabled">Female&nbsp;
						<%}else{ %>
							<input type="radio" name="gender" value="Female" disabled="disabled">Female&nbsp;
						<%		}							
						%>
							<br>
						<select name="country" disabled="disabled">
								<%if(rss.getString(5).equalsIgnoreCase("India")) {%>
										<option value="<%=rss.getString(5)%>" selected="selected"><%=rss.getString(5) %></option>
								<%}else{%>
										<option value="India">India</option>
								<%}if(rss.getString(5).equalsIgnoreCase("USA")){%>
									<option value="<%=rss.getString(5)%>" selected="selected"><%=rss.getString(5) %></option>
								<%}else{%><option value="USA">USA</option>
								<%}if(rss.getString(5).equalsIgnoreCase("UK")){ %>
									<option value="<%=rss.getString(5)%>" selected="selected"><%=rss.getString(5) %></option>
								<%}else{%>
									<option value="UK">UK</option>
								<%}if(rss.getString(5).equalsIgnoreCase("UAE")){ %>
								<option value="<%=rss.getString(4)%>" selected="selected"><%=rss.getString(5) %></option>
							<%}else{%>
								<option value="UAE">UAE</option>
							<%}%>
						</select><br>
						<%--Checkbox business --%>
							<%
								String data=rss.getString(6);
							%>
							<%if(data.contains("Cricket")){%>
								<input type="checkbox" name="interest" value="Cricket" checked="checked" disabled="disabled"><%="Cricket"%>
							<%}else{%>
								<input type="checkbox" name="interest" value="Cricket" disabled="disabled"><%="Cricket"%>
							<%} %>
							<%if(data.contains("Movie")){%>
								<input type="checkbox" name="interest" value="Movie" checked="checked" disabled="disabled"><%="Movie"%>
							<%}else{%>
								<input type="checkbox" name="interest" value="Movie" disabled="disabled"><%="Movie"%>
							<%} %>
							<%if(data.contains("Travel")){%>
								<input type="checkbox" name="interest" value="Travel" checked="checked" disabled="disabled"><%="Travel"%>
							<%}else{%>
								<input type="checkbox" name="interest" value="Travel" disabled="disabled"><%="Travel"%>
							<%} %>
							<%if(data.contains("Chess")){%>
								<input type="checkbox" name="interest" value="Chess" checked="checked" disabled="disabled"><%="Chess"%>
							<%}else{%>
								<input type="checkbox" name="interest" value="Chess" disabled="disabled"><%="Chess"%>
							<%}%>
							<% //}//close of while
							%>
							<br>
						<%--end business for check box --%>
							<input type="submit" value="edit" name="action">
							<br>
							
						<%
							String res=request.getParameter("resp");
								if(res!=null){
						%>
								<font color='green' size='1pxl'>
									Record updated..!
								</font>
					<%			}	
						}//close of action check if for search
					}//close of rss check if
			} //close of id check if
			}//close #line 31 else
			%>
				</form>
				</div>
			<%--FOR UPDATE FORM TO BE ACTIONED --%>	
			
			<%if("edit".equalsIgnoreCase(act)){	
				String idd=request.getParameter("id");
				
				if(idd!=null){
					String cmnd="select * from registration_details where register_id=?";
					PreparedStatement st=con.prepareStatement(cmnd);
							st.setString(1, idd);
					ResultSet rss=st.executeQuery();
					rss.next();
					if(rss!=null){					
		%>
			<div align="center">
				<form action="updateSrv" method="post">
					<input type="text" name="id" readonly value="<%=rss.getString(1) %>"><br>
					<input type="text" name="fname" value="<%=rss.getString(2) %>"><br>
					<input type="text" name="lname" value="<%=rss.getString(3)%>"><br>
					<input type="hidden" name="pwd"	value="<%=rss.getString(7) %>"><br>
					    <%
							if(rss.getString(4).equalsIgnoreCase("Male")){
						%>
							<input type="radio" name="gender" value="Male" checked="checked">Male&nbsp;
						<%}else{
						%><input type="radio" name="gender" value="Male">Male&nbsp;
						<%}if(rss.getString(4).equalsIgnoreCase("Female")){
						%>
							<input type="radio" name="gender" value="Female" checked="checked">Female&nbsp;
						<%}else{ %>
							<input type="radio" name="gender" value="Female">Female&nbsp;
						<%		}							
						%>
							<br>
						<select name="country">
								<%if(rss.getString(5).equalsIgnoreCase("India")) {%>
										<option value="<%=rss.getString(5)%>" selected="selected"><%=rss.getString(5) %></option>
								<%}else{%>
										<option value="India">India</option>
								<%}if(rss.getString(5).equalsIgnoreCase("USA")){%>
									<option value="<%=rss.getString(5)%>" selected="selected"><%=rss.getString(5) %></option>
								<%}else{%><option value="USA">USA</option>
								<%}if(rss.getString(5).equalsIgnoreCase("UK")){ %>
									<option value="<%=rss.getString(5)%>" selected="selected"><%=rss.getString(5) %></option>
								<%}else{%>
									<option value="UK">UK</option>
								<%}if(rss.getString(5).equalsIgnoreCase("UAE")){ %>
								<option value="<%=rss.getString(4)%>" selected="selected"><%=rss.getString(5) %></option>
							<%}else{%>
								<option value="UAE">UAE</option>
							<%}%>
						</select><br>
						<%--Checkbox business --%>
							<%
								String data=rss.getString(6);
							%>
							<%if(data.contains("Cricket")){%>
								<input type="checkbox" name="interest" value="Cricket" checked="checked"><%="Cricket"%>
							<%}else{%>
								<input type="checkbox" name="interest" value="Cricket"><%="Cricket"%>
							<%} %>
							<%if(data.contains("Movie")){%>
								<input type="checkbox" name="interest" value="Movie" checked="checked"><%="Movie"%>
							<%}else{%>
								<input type="checkbox" name="interest" value="Movie"><%="Movie"%>
							<%} %>
							<%if(data.contains("Travel")){%>
								<input type="checkbox" name="interest" value="Travel" checked="checked"><%="Travel"%>
							<%}else{%>
								<input type="checkbox" name="interest" value="Travel"><%="Travel"%>
							<%} %>
							<%if(data.contains("Chess")){%>
								<input type="checkbox" name="interest" value="Chess" checked="checked"><%="Chess"%>
							<%}else{%>
								<input type="checkbox" name="interest" value="Chess"><%="Chess"%>
							<%}%>
							<% //}//close of while
							%><br>
						<input type="submit" value="update" name="action">
						<%
							}//close of action check if for search
					}//close of rss check if
			} //close of id check if				
			%>
				</form>
				</div>
		 
			<%-- --%>
	</body>
</html>
