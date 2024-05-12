<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.util.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.music.Song" %>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.*" %>
<%@ page import="java.util.Base64" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link
    href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
    rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
    crossorigin="anonymous">
<script
    src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
<!-- BOX ICONS CSS-->

<script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'
    rel='stylesheet'>
<script src="https://kit.fontawesome.com/2dd5f1c1c7.js"
    crossorigin="anonymous"></script>
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style>
    .searchResults {
        margin-left: 15rem;
    }
</style>

<!-- Manual css and js file -->
<link rel="stylesheet" href="style.css" />
<script src="script.js"></script>
<link rel="stylesheet" href="songsail.css" />

<title>Insert title here</title>
</head>
<body>
<%
    // Retrieve the search query sent from the AJAX request
    String query = request.getParameter("query");

    // Check if the search query is not empty
    if (query != null && !query.trim().isEmpty()) {
        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3309/music", "root", "Sarvesh@2001");

            // Prepare SQL statement to fetch search results
            String sql = "SELECT * FROM songs WHERE songname LIKE ? OR album LIKE ?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "%" + query + "%"); // Search for song name containing the query
            ps.setString(2, "%" + query + "%"); // Search for album containing the query

            // Execute the query
            ResultSet rs = ps.executeQuery();

            // Format the search results as HTML elements
            StringBuilder searchResults = new StringBuilder();
            while (rs.next()) {
                // Extract song details from the result set
                String songName = rs.getString("songname");
                String album = rs.getString("album");
                String singer = rs.getString("singer");
                String filePath = rs.getString("file_path");
            	String encodedAudio = null;
            	if(filePath!=null){
            		File file = new File(filePath);
            		FileInputStream fis = new FileInputStream(file);
            		byte[] audioBytes = new byte[(int) file.length()];
            		fis.read(audioBytes);
            		fis.close();
            		encodedAudio = Base64.getEncoder().encodeToString(audioBytes);
            	} else {
            		out.println("File not found");
            	}
            	%>
            	<br/>
            	<div class="music-card">
          <div class="play-icon">
             <audio preload="none" controls> 
                 <source src="data:audio/mpeg;base64, <%= encodedAudio %>" type="audio/mpeg">
             </audio>
          </div>
          <div class="music-details">
             <div class="song"><%= rs.getString("songname") %></div>
             <div class="artist"><%= rs.getString("singer") %></div>
             <div class="album"><%= rs.getString("album") %></div>
             <div class="song-time"></div>
          </div>
         </div>
         
         
         <% } 

                
                

            // Send the formatted search results back as a response
            out.println(searchResults.toString());

            // Close the database connections
            rs.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("Error fetching search results.");
        }
    }
%>
</body>
</html>