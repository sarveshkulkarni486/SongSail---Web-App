package com.example.music;

import java.io.*;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		Connection connection=null;
		PreparedStatement ps=null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3309/music", "root", "Sarvesh@2001");
			if(firstname.isEmpty() || lastname.isEmpty() && email.isEmpty() && password.isEmpty()) {
				out.println("<html><body>");
				out.println("<h1>Fill required field");
				out.println("</body></html>");
				
			}
			else {
				ps = connection.prepareStatement("SELECT * FROM users WHERE email=?");
				ps.setString(1, email);
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					out.println("<html><body>");
					out.println("<h1>Email already exists</h1>");
					out.println("<p>Try to register with new email id:</p>");
					out.println("</body></html>");
				}
				else {
					PreparedStatement ps1 = connection.prepareStatement("INSERT INTO users(firstname, lastname, email, password) VALUES(?,?,?,?)");
					ps1.setString(1, firstname);
					ps1.setString(2, lastname);
					ps1.setString(3, email);
					ps1.setString(4, password);
					int res = ps1.executeUpdate();
					if(res>=0) {
						out.println("<h1>User Registered Succesfully");
						response.sendRedirect("login.jsp");
					}
					else {
						out.println("Something went wrong");
					}
				}
			}
				
		}
		catch(Exception e) {
			out.println("<h1>" + e + "</h1>");
		}
	}

}
