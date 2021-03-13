package com.business;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.text.SimpleDateFormat;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionDb;
import com.util.FieldValidator;

@WebServlet("/registerAction")
public class RegisterNewUser extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response,String date,String month, String year) throws IOException{
		String id=request.getParameter("id");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String password=request.getParameter("pwd");
		String gender=request.getParameter("gender");
		String country=request.getParameter("country");
		String interest[]=request.getParameterValues("interest");
		String dob=date+"/"+month+"/"+year;
		//validate field
		String errResponse=new FieldValidator().validateField(fname, lname, password, gender, interest);
		if("empty record".equals(errResponse))
			response.sendRedirect("register.jsp?errMessage=emptyR");
		else if("empty fname".equals(errResponse))
			response.sendRedirect("register.jsp?errMessage=emptyFn");
		else if("empty lname".equals(errResponse))
			response.sendRedirect("register.jsp?errMessage=emptyLn");
		else if("empty pwd".equals(errResponse))
			response.sendRedirect("register.jsp?errMessage=emptyP");
		else if("empty gendar".equals(errResponse))
			response.sendRedirect("register.jsp?errMessage=emptyG");
		else if("empty hoby".equals(errResponse))
			response.sendRedirect("register.jsp?errMessage=emptyH");
		else{
			StringBuffer intrest=new StringBuffer();
			for(String hby:interest)
				intrest.append(hby+" ");
		try {
			SimpleDateFormat sdf= new SimpleDateFormat("dd/MM/yy");
			java.util.Date d1 =sdf.parse(dob);
			long ms=d1.getTime();
			System.out.println(">>>>>> : "+ms);
			java.sql.Date d2=new java.sql.Date(ms);
			Connection con=ConnectionDb.getConn();
			String command="insert into registration_details values(?,?,?,?,?,?,?,?)";
			PreparedStatement pst=con.prepareStatement(command);
			pst.setString(1, id);
			pst.setString(2, fname);
			pst.setString(3, lname);
			pst.setString(4, gender);
			pst.setString(5, country);
			pst.setString(6, intrest.toString());
			pst.setString(7, password);
			pst.setDate(8, d2);
			
			int i=pst.executeUpdate();
				if(i>0){
					response.sendRedirect("register.jsp?msg=insert");
				}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		}
		
	}
}
