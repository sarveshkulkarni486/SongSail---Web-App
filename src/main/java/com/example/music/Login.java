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
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		try {
			String firstname = "";
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3309/music", "root", "Sarvesh@2001");
			PreparedStatement ps = con.prepareStatement("SELECT * FROM users WHERE email=? AND password=?");
			ps.setString(1, email);
			ps.setString(2, password);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				firstname = rs.getString("firstname");
				HttpSession session = request.getSession(true);
				session.setAttribute("email", email);
				session.setAttribute("firstname", firstname);
				response.sendRedirect(request.getContextPath()+ "/SongSail.jsp");
				
			}
			else {
				request.setAttribute("errorMessage", "Invalid email or password");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp?error=true");
				dispatcher.forward(request, response);
			}
			
		} catch(Exception e) {
			out.println("<h1>"+ e + " </h1>");
		}
	}

}
