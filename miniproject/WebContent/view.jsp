<%@page import="java.sql.*" %>
<%@page import="com.util.ConnectionDb" %>
<a href="adminAction.jsp">click for home</a>
<%
  Connection con=ConnectionDb.getConn();
  String command="select * from registration_details";
  PreparedStatement stmt=con.prepareStatement(command);
  ResultSet rs=stmt.executeQuery();
 %>
 	<div align='right'>
 		<font color='blue'>
			<b>
			<%="Welcome, "+(String)session.getAttribute("name")%>
			</b>
		</font><br>
		<a href='logoutSrv'><font size='2pxl'>logout</font></a>
	</div>
 	<div align='center'><table style="background-color:cyan">
 		<tr><th bgcolor='megenta'>First Name </th><th bgcolor='megenta'>Last Name</th><th bgcolor='megenta'>Gender</th><th bgcolor='megenta'>Country</th><th bgcolor='megenta'>Interest</th><th bgcolor='megenta'>Delete</th></tr>
 <%
  while(rs.next()){
	out.println("<tr bgcolor='fff##'>");
	out.println("<td>"+rs.getString(2)+"</td>"+"<td>"+rs.getString(3)+"</td>"+"<td>"+rs.getString(4)+"</td>"+"<td>"+rs.getString(5)+"</td>"+"<td>"+rs.getString(6)+"</td>");
	out.println("<td><a href='deleteSrv?id="+rs.getString(1)+"'>delete"+"</a></td>");
	out.println("</tr>");
  }
%>
</table></div>