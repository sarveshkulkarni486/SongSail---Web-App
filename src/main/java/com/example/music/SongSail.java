package com.example.music;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SongSail
 */
@WebServlet("/SongSail")
public class SongSail extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	final String url = "jdbc:mysql://localhost:3309/music";
	final String dbuser = "root";
	final String password = "Sarvesh@2001";
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		try (Connection con = DriverManager.getConnection(url, dbuser, password)){
			String sql = "SELECT songname, album, singer, lyrics, song FROM songs";
			try(PreparedStatement stmt = con.prepareStatement(sql)){
				try(ResultSet rs = stmt.executeQuery()){
					if(rs.next()) {
						String songName = rs.getString("songname");
						String album = rs.getString("album");
						String singer = rs.getString("singer");
						String lyrics = rs.getString("lyrics");
						
						request.setAttribute("songname", songName);
						request.setAttribute("album", album);
						request.setAttribute("artist", singer);
						request.setAttribute("lyrics", lyrics);
						
						RequestDispatcher dispatcher = request.getRequestDispatcher("/SongSail.jsp");
						dispatcher.forward(request, response);
					} else {
						response.setStatus(HttpServletResponse.SC_NOT_FOUND);
						response.getWriter().println("MP3 file not found");
					}
				}
			}
		} catch (SQLException e) {
			response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			response.getWriter().println("Internal server error");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
