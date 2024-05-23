<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.music.Song" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.*" %>
<%@ page import="java.util.Base64" %>
<%
   String email = (String) session.getAttribute("email");
   String firstname = (String) session.getAttribute("firstname");
   String lastname = (String) session.getAttribute("lastname");
   if(email == null){
       response.sendRedirect("login.jsp");
       return;
   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Song Sail</title>
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



<!-- Manual css and js file -->
<script src="script.js"></script>
<link rel="stylesheet" href="accountstyle.css" />
<link rel="stylesheet" href="style.css" />
<script src="script.js"></script>
<link rel="stylesheet" href="songsail.css" />
<link rel="stylesheet" href="favorite.css" />
</head>
<body>  
<%
String emailid = (String) session.getAttribute("email");
Connection conn = null;
List<Song> songs = new ArrayList<>();
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/music", "root", "Sarvesh@2001");
    PreparedStatement ps = conn.prepareStatement("SELECT * FROM USERS WHERE email=?");
    ps.setString(1, emailid);
    ResultSet rs = ps.executeQuery();
    if(rs.next()){
    	firstname = rs.getString("firstname");
        lastname = rs.getString("lastname");
        session.setAttribute("firstname", firstname);
        session.setAttribute("lastname", lastname);
    }
    
   
} catch(Exception e) {
    e.printStackTrace();
} finally {
    if (conn != null) {
        try {
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}


%>
    <!-- top navbar -->
    <nav class=" topnavbar navbar navbar-expand-lg navbar-light bg-light">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">MP3Player</a>
            <button class="navbar-toggler" type="button"
                data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false"
                aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                    <li class="nav-item dropdown"><a
                        class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
                        role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="fa-regular fa-user"></i> Account
                    </a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="logout.jsp"><i
                                    class="fa-solid fa-right-to-bracket"
                                    style="margin-right: 0.6rem;"></i><%= firstname %></a></li>
                            <li>
                                <hr class="dropdown-divider">
                            </li>
                            <li><a class="dropdown-item" href="settings.jsp"><i
                                    class="fa-solid fa-gear" style="margin-right: 0.6rem;"></i>Settings</a></li>
                        </ul></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-auto">
                <div class="card" id="card1" style="width: 24rem;">
                    <div class="card-body">
                    <div class="card-title-wrapper" style="margin-left: 5rem; margin-top: 1rem;">
                    <i class="fa-regular fa-user"></i>
                    <h5 class="card-title">Account</h5>
                    </div>
                    <br />
                    <div class="card-title-wrapper" style="margin-top: 1rem;">
                    <i class="fa-solid fa-person"></i><p class="card-title">Name: </p>
                    <span><%=firstname %></span> <span><%=lastname %></span>
                    </div>
                    <div class="card-title-wrapper" style="margin-top: 1rem;">
                    <i class="fa-regular fa-envelope"></i><p class="card-title">Email: </p>
                    <span><%=email %></span>
                    </div>
                    </div>
                </div>
            </div>
            <div class="col-md-auto">
                <div class="card" id="card2">
                    <div class="card-body">
                       <div class="card-title-wrapper">
                            <i class="fa-solid fa-user"></i>
                            <h4 class="card-title"><%=firstname %></h4><h4 class="card-title"><%=lastname %></h4>
                       </div>
                    </div>
                    <div class="card-body">
                    
                       <div class="card-title-wrapper">
                            <i class="fa-solid fa-envelope"></i>
                            <h5 class="card-title"><%=email %></h5>
                       </div>
                       <a href="forgot.jsp"><p class="card-text">Change Password</p></a>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col">
           <%
           Connection con = null;
           try {
               con = DriverManager.getConnection("jdbc:mysql://localhost:3309/music", "root", "Sarvesh@2001");
               PreparedStatement ps1 = con.prepareStatement("SELECT songname, singer, album, lyrics, file_path FROM songs WHERE email=?");
               ps1.setString(1, email);
               ResultSet resultset = ps1.executeQuery();
               int songCount = 0;
               // Display Data
               while (resultset.next()) {
                   String lyrics = resultset.getString("lyrics");
                   songCount++;
                   String filePath = resultset.getString("file_path");
                   String encodedAudio = null;
                   if (filePath != null) {
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
               <div class="music-card">
                   <div class="play-icon">
                       <audio id="audio<%= songCount %>" preload="none" controls> 
                           <source src="data:audio/mpeg;base64, <%= encodedAudio %>" type="audio/mpeg">
                       </audio>
                   </div>
                   <div class="music-details">
                       <div class="song"><%= resultset.getString("songname") %></div>
                       <div class="artist"><%= resultset.getString("singer") %></div>
                       <div class="album"><%= resultset.getString("album") %></div>
                       <div class="song-time"></div>
                   </div>
               </div>
       <%
               }
           } catch(Exception e){
               e.printStackTrace();
           } finally {
               if (con != null) {
                   try {
                       con.close();
                   } catch (SQLException e) {
                       e.printStackTrace();
                   }
               }
           }
       %>
       </div>
        </div>
    </div>
</body>