package com.example.music;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.example.music.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SongSail
 */
@WebServlet("/SongSail")
@MultipartConfig
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
		List<Song> songs = new ArrayList<>();

		try {
			Connection con = DriverManager.getConnection(url, dbuser, password);
			PreparedStatement ps = con.prepareStatement("SELECT * FROM songs");
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				String songname = rs.getString("songname");
				String album = rs.getString("album");
				String singer = rs.getString("singer");
				String lyrics = rs.getString("lyrics");
				String filePath = rs.getString("file_path");
				
				Song song = new Song(songname, singer, album, lyrics, filePath);
				songs.add(song);
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		request.setAttribute("songs", songs);
		RequestDispatcher dispatcher = request.getRequestDispatcher("SongSail.jsp");
		dispatcher.forward(request, response);
	}

}
