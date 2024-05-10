package com.example.music;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddToFavoriteServlet")
public class AddToFavoriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setHeader("Access-Control-Allow-Origin", "*");
	    response.setHeader("Access-Control-Allow-Methods", "POST");
	    response.setHeader("Access-Control-Allow-Headers", "Content-Type");
		String song_id = request.getParameter("songId");
		String userEmail = request.getParameter("userEmail");
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3309/music", "root", "Sarvesh@2001");
			String query = "INSERT INTO favorites (song_id, userEmail) VALUES(?, ?)";
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, song_id);
			ps.setString(2, userEmail);
			int rowsInserted = ps.executeUpdate();
			if(rowsInserted > 0) {
				response.getWriter().write("song added to favorites!");
			} else {
				response.getWriter().write("Failed to add song to favorites!");
			}
			ps.close();
			con.close();
		} catch(Exception e) {
			e.printStackTrace();
			response.getWriter().write("Error, " + e.getMessage());
		}
	}

}
