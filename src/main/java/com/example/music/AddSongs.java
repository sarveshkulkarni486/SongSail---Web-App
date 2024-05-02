package com.example.music;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;
@WebServlet("/AddSongs")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,  // 2 MB
	    maxFileSize = 1024 * 1024 * 10,       // 10 MB
	    maxRequestSize = 1024 * 1024 * 50     // 50 MB
	)
public class AddSongs extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		response.setContentType("text/html");
		long maxsize = 25*1024*1024;
		HttpSession session = request.getSession(false);
		if(session!=null) {
			String email = (String) session.getAttribute("email");
			String firstname = (String) session.getAttribute("firstname");
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3309/music", "root", "Sarvesh@2001");
				String songname = request.getParameter("songname");
				String album = request.getParameter("album");
				String singer = request.getParameter("singer");
				String lyrics = request.getParameter("lyrics");
				Part song = request.getPart("song");
				if(song != null && song.getSize()>maxsize) {
					response.sendRedirect("error.jsp?error=File size exceeds 25MB");
					return;
				}
				String contentType = song.getContentType();
				if(!contentType.equals("audio/mpeg")) {
					response.sendRedirect("error.jsp?error=Inavlid file type. Only mp3 allowed");
					return;
				}
				String sql = "INSERT INTO songs (songname, album, singer, lyrics, song) VALUES(?, ?, ?, ?, ?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, songname);
				ps.setString(2, album);
				ps.setString(3, singer);
				ps.setString(4, lyrics);
				
				//Extracting MP3 File data
				InputStream inputStream = null;
				inputStream = song.getInputStream();
				ps.setBlob(5, inputStream);
				//executing update query 
				int rowsInserted = ps.executeUpdate();
				if(rowsInserted>0) {
					out.println("<h1>Data Inserted");
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}

}
