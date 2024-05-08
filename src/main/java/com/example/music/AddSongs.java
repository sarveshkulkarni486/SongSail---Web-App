package com.example.music;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
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
			String uploadDirectory = "D://SumogoInfotech//SongSail//Songs";
			File uploadDir = new File(uploadDirectory);
			if(!uploadDir.exists()) {
				uploadDir.mkdirs();
			}
			try {
				Part filePart = request.getPart("song");
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

				String fileName = extractFileName(filePart);
				InputStream inputstream = filePart.getInputStream();
				Files.copy(inputstream, new File(uploadDirectory + File.separator + fileName).toPath(), StandardCopyOption.REPLACE_EXISTING);

				String sql = "INSERT INTO songs (songname, album, singer, lyrics, file_path) VALUES(?, ?, ?, ?, ?)";
				PreparedStatement ps = con.prepareStatement(sql);
				ps.setString(1, songname);
				ps.setString(2, album);
				ps.setString(3, singer);
				ps.setString(4, lyrics);
				ps.setString(5, uploadDirectory +"//"+ fileName);
				
				int rowsInserted = ps.executeUpdate(); 
				
				if(rowsInserted>0) {
					out.println("<h1>Data Inserted");
				}
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}
	private String extractFileName(Part part) {
		String contentDisp = part.getHeader("content-disposition");
		String[] items = contentDisp.split(";");
		for(String s :items) {
			if(s.trim().startsWith("filename")) {
				return s.substring(s.indexOf("=")+2, s.length()-1);
			}
		}
		return "";
	}

}
