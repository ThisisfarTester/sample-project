package com.business;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionDb;
@WebServlet("/deleteSrv")
public class DeleteRecordServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response){
		String id=request.getParameter("id");
		try {
			Connection con=ConnectionDb.getConn();
			String command="delete from registration_details where register_id=?";
		PreparedStatement pst=con.prepareStatement(command);
			pst.setString(1, id);
			int i=pst.executeUpdate();
				if(i>0){
					response.sendRedirect("view.jsp");
				}			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
	}
}
