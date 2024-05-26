<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.naming.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.example.music.Song" %>
<%@ page import="java.io.*" %>
<%@ page import="java.nio.*" %>
<%@ page import="java.util.Base64" %>
<%
   String email = (String) session.getAttribute("email");
   String firstname = (String) session.getAttribute("firstname");
   if(email == null){
       response.sendRedirect("login.jsp");
       return;
   }
%>
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



<!-- Manual css and js file -->
<link rel="stylesheet" href="style.css" />
<script src="script.js"></script>
<link rel="stylesheet" href="songsail.css" />
<link rel="stylesheet" href="favorite.css"/>

</head>
<body>
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
                            <li><a class="dropdown-item" href="Accounts.jsp"><i
                                    class="fa-solid fa-gear" style="margin-right: 0.6rem;"></i>Settings</a></li>
                        </ul></li>
                </ul>
            </div>
        </div>
    </nav>


    <!-- side navbar -->
    <div class="p-1 my-container active-cont">
        <nav class="navbar top-navbar navbar-light bg-light px-5">
            <a class="btn border-0" id="menu-btn"><i class="bx bx-menu"></i></a>
        </nav>
    </div>

    <div
        class="side-navbar active-nav d-flex justify-content-between flex-wrap flex-column"
        id="sidebar">
        <ul class="nav flex-column text-white w-100">
            <a href="#" class="nav-link h3 text-white my-2">Music <br>
                Player
            </a>
            <!-- side navbar started -->
            <!-- sidenavbar first component -->
            <!-- i indicates box icons box-icons is library for icons -->
            <ul>
                Menu
                <li class="nav-link activites"><a href="SongSail.jsp"><i
                    class='bx bxs-dashboard'></i> <span class="mx-2">Home</span></a></li>
                <li class="nav-link activites"><a href="Discover.jsp"><i
                    class="fa-regular fa-paper-plane"></i> <span class="mx-2">Discover</a></span>
                </li>
                <li class="nav-link activites"><a href="Trending.jsp"><i
                    class="fa-solid fa-arrow-trend-up"></i> <span class="mx-2">Trending</span></a>
                </li>
            </ul>
            </li>

            <!-- sidenavbar second component -->
            <ul>
                Library
                <li class="nav-link activites"><a href="Trending.jsp"><i
                    class='bx bx-history'></i> <span class="mx-2">Recent</span></a></li>
                <li class="nav-link activites"><a href="favorites.jsp"><i
                    class="fa-regular fa-hearts"></i><span class="mx-2">Favorite</span>
                    </a>
                </li>
                <li class="nav-link activites"><a href="Accounts.jsp"><i
                    class="fa-regular fa-user"></i> <span class="mx-2">Account</span></a></li>
                <li class="nav-link activites"><a href="Accounts.jsp"><i
                    class='bx bx-cog'></i> <span class="mx-2">Settings</span></a></li>
            </ul>
    </div>
    <div class="container mt-4 card-container">
        <div class="card">
            <div class="card-body">
                <div class="card-content">
                    <img src="images/playlist.jpg" class="card-img" alt="Image">
                    <div class="text-content">
                        <h5 class="card-title">Playlist</h5>
                        <span class="card-text">34 songs</span> <span class="card-text">12
                            Artists</span>
                    </div>
                    <a class="btn btn-login submits">Listen</a>
                </div>
            </div>
        </div>
        <div class="card card1">
            <div class="card-body">
                <div class="card-content">
                    <div class="text-content">
                        <a href="addsongs.jsp" style="text-decoration: none;">
                        <i class="fa-solid fa-plus"></i>
                        <h5 class="card-title" style="margin-top: 1rem; text-align: center !important;">Add more
                            songs</h5>
                        </a>
                        <span class="card-text"></span>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container mt-4 card-container">
    <div class="search-card">
        <div class="card-body">
            <i class="fa fa-search"></i>
            <input type="text" id="searchInput" class="search-input" placeholder="Search" />
            <button onclick="search()" class="btn btn-primary">Search</button>
        </div>
    </div>
</div>

<div id="searchResults" class="results"></div>

<!-- Add any necessary JavaScript files or scripts here -->

<script>
    function search() {
        var query = document.getElementById('searchInput').value;
        if (query.trim() === '') {
            alert('Please enter a search query.');
            return;
        }

        // AJAX call to the JSP page
        var xhr = new XMLHttpRequest();
        xhr.open('POST', 'search.jsp');
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.onload = function () {
            if (xhr.status === 200) {
                document.getElementById('searchResults').innerHTML = xhr.responseText;
            } else {
                alert('Error fetching search results. Please try again.');
            }
        };
        xhr.send('query=' + encodeURIComponent(query));
    }
</script>
    
    
    <div class="container mt-4 song-container">
       <div class="">
           <h1 class="">Songs</h1>
       </div>
       <% 
                try {
                	String userEmail = (String) session.getAttribute("email");
                    // Database Connectivity
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3309/music", "root", "Sarvesh@2001");
                    String query = "SELECT songs.songname, songs.album, songs.singer, songs.lyrics, songs.file_path " +
                            "FROM songs " +
                            "INNER JOIN favorites f ON songs.song_id = f.song_id " +
                            "WHERE f.userEmail = '" + userEmail +"'";
                 // Retrieve Data
                    Statement stmt = conn.createStatement();
                    ResultSet rs = stmt.executeQuery(query);
                    int songCount = 0;
                    while(rs.next()){
                    	songCount++;
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
             <audio id="audio<%= songCount %>" preload="none" controls> 
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
                }
       catch (SQLIntegrityConstraintViolationException e) {
    	   e.printStackTrace();
       }
       catch(Exception e){
                	e.printStackTrace();
                }
       %>
       <script>
       const audioElements = document.querySelectorAll('audio');
          audioElements.forEach(audio => {
        	  audio.addEventListener('play', function(){
        		  audioElements.forEach(otherAudio => {
        			  if(otherAudio !== audio && !otherAudio.paused){
        				  otherAudio.pause();
        			  }
        		  });
        	  });
          });
       </script>
      </div>
</body>
</html>