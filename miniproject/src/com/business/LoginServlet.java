package com.business;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.util.ConnectionDb;
import com.util.FieldValidator;
@WebServlet("/loginAction")
public class LoginServlet extends HttpServlet {
	private Connection con;
	private PreparedStatement ps;
	private RequestDispatcher rd;
	private HttpSession session;
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws IOException, ServletException{
		String uname=req.getParameter("uname");
		String pwd=req.getParameter("pwd");
		String type=req.getParameter("role");
		//validate user
		String response=new FieldValidator().validateUser(uname, pwd, type);
		if("empty record".equals(response))
			res.sendRedirect("index.jsp?errMessage=emptyR");
		else if("empty user".equals(response))
			res.sendRedirect("index.jsp?errMessage=emptyU");
		else if("empty pwd".equals(response))
			res.sendRedirect("index.jsp?errMessage=emptyP");
		else if("empty role".equals(response))
			res.sendRedirect("index.jsp?errMessage=emptyT");
		else{
			try {
				processLogin(req, res, type,uname,pwd);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		System.out.println(type);
	}
	private void processLogin(HttpServletRequest req, HttpServletResponse res, String role,String uname, String pwd) throws SQLException, IOException, ServletException{
	
		con=ConnectionDb.getConn();
		if("admin".equals(role)){
			ps=con.prepareStatement("select count(*) from login where loginid=? and loginpwd=?");
			role="Admin";
		}
		if("user".equals(role)){
			ps=con.prepareStatement("select count(*) from REGISTRATION_DETAILS where register_id=? and password=?");
			role="user";
		}
		//Business logic process to login
		ps.setString(1,uname);
		ps.setString(2, pwd);
		ResultSet rs=ps.executeQuery();
		if(rs.next()){
			int i=rs.getInt(1);
				if(i==1){
					if(role.equals("Admin")){
						//errMessage="successA";
						session=req.getSession();
						session.setAttribute("name", uname);
						rd=req.getRequestDispatcher("adminAction.jsp");
						rd.forward(req, res);
					}
					else{
						session=req.getSession();
						session.setAttribute("name", uname);
						rd=req.getRequestDispatcher("userAction.jsp");
						rd.forward(req, res);
					}
				}else{
					if(role.equals("Admin"))
						res.sendRedirect("index.jsp?errMessage=adminError");
					if(role.equals("user"))
						res.sendRedirect("index.jsp?errMessage=userError");
				}
		}
		ps.close();
		con.close();
	}
}
