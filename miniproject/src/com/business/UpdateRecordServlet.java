package com.business;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionDb;
import com.util.FieldValidator;
@WebServlet("/updateSrv")
public class UpdateRecordServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
		String id=request.getParameter("id");
		String fname=request.getParameter("fname");
		String lname=request.getParameter("lname");
		String password=request.getParameter("pwd");
		String nar/nari=request.getParameter("gender");
		String country=request.getParameter("country");
		String interest[]=request.getParameterValues("interest");
		//validate field
		/*String errResponse=new FieldValidator().validateField(fname, lname, password, gendar, interest);
		System.out.println(">>>> errorResponse : "+errResponse);
		if("empty record".equals(errResponse))
			response.sendRedirect("update_red.jsp?errMessage=emptyR");
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
		else{*/
			StringBuffer intrest=new StringBuffer();
			for(String hby:interest)
				intrest.append(hby+" ");
		try {
			Connection con=ConnectionDb.getConn();
			String command="update registration_details set fname=?,lname=?,gender=?,country=?,interest=?,password=? where register_id=?";
			PreparedStatement pst=con.prepareStatement(command);
			pst.setString(1, fname);
			pst.setString(2, lname);
			pst.setString(3, gender);
			pst.setString(4, country);
			pst.setString(5, intrest.toString());
			pst.setString(6, password);
			pst.setString(7, id);
			int i=pst.executeUpdate();
				if(i>0){
					response.sendRedirect("update_ref.jsp?resp=updated&action=search&ids="+id);
				}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//}
	}
}