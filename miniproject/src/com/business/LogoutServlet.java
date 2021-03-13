package com.business;
import java.io.IOException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/logoutSrv")
public class LogoutServlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse res){
		HttpSession sess=req.getSession();
		if(sess!=null){
			sess.invalidate();
			try {
				res.sendRedirect("index.jsp");
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
