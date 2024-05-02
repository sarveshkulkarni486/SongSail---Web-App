package com.example.music;

import java.io.*;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class Forgot
 */
@WebServlet("/Forgot")
public class Forgot extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String email = request.getParameter("email");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3309/music", "root", "Sarvesh@2001");
			PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=?");
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				HttpSession session = request.getSession();
				session.setAttribute("email", email);
				response.sendRedirect("forgotpassword.jsp");
			}
			else {
				request.setAttribute("errormsg", "Email does not exists");
				RequestDispatcher dispatch = request.getRequestDispatcher("/forgot.jsp?error=true");
				dispatch.forward(request, response);
			}
		} catch(Exception e) {
			out.println("<h1>" + e + "</h1>");
		}
	}

}
