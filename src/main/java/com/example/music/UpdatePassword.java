package com.example.music;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdatePassword
 */
@WebServlet("/UpdatePassword")
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		HttpSession session = request.getSession(false);
		if(session!=null) {
			String email = (String) session.getAttribute("email");
			if(email!=null) {
				String password = request.getParameter("password");
				String cnfpassword = request.getParameter("cnfpassword");
				
				if(password.equals(cnfpassword)) {
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3309/music", "root", "Sarvesh@2001");
						PreparedStatement ps = con.prepareStatement("UPDATE users SET password=? WHERE email=?");
						ps.setString(1, password);
						ps.setString(2, email);
						int result = ps.executeUpdate();
						if(result>0) {
							request.setAttribute("successmsg", "Password changed successfully try to login with new password");
							RequestDispatcher success =  request.getRequestDispatcher("/login.jsp?success=true");
							success.forward(request, response);
						}
						else {
							response.sendRedirect("forgot.jsp");
						}
					} catch(Exception e) {
						out.println("<h1>"+e+"</h1>");
					}
				} else {
					request.setAttribute("error", "Password does not change try again");
					RequestDispatcher dispatched = request.getRequestDispatcher("/forgot.jsp?error=true");
					dispatched.forward(request, response);
				
				}
			}
		}
	}

}
