<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.example.music.Song" %>
<%@ page import="java.util.List" %>
<%
   String email = (String) session.getAttribute("email");
   String firstname = (String) session.getAttribute("firstname");
   if(email == null){
	   response.sendRedirect("login.jsp");
	   return;
   }
   else {
	
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


<!-- Manual css and js file -->
<link rel="stylesheet" href="style.css" />
<script src="script.js"></script>
<link rel="stylesheet" href="songsail.css" />

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
							<li><a class="dropdown-item" href="settings.jsp"><i
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
				<li href="#" class="nav-link activites"><i
					class='bx bxs-dashboard'></i> <span class="mx-2">Home</span></li>
				<li href="discover.jsp" class="nav-link activites"><i
					class="fa-regular fa-paper-plane"></i> <span class="mx-2">Discover</span>
				</li>
				<li href="trending.jsp" class="nav-link activites"><i
					class="fa-solid fa-arrow-trend-up"></i> <span class="mx-2">Trending</span>
				</li>
			</ul>
			</li>

			<!-- sidenavbar second component -->
			<ul>
				Library
				<li href="recent.jsp" class="nav-link activites"><i
					class='bx bx-history'></i> <span class="mx-2">Recent</span></li>
				<li href="playlist.jsp" class="nav-link activites"><i
					class='bx bxs-playlist'></i> <span class="mx-2">Playlist</span></li>
				<li href="favourite.jsp" class="nav-link activites openModal"><i
					class="fa-regular fa-heart"></i> <span class="mx-2">Favourite</span>
				</li>
				<li href="account.jsp" class="nav-link activites"><i
					class="fa-regular fa-user"></i> <span class="mx-2">Account</span></li>
				<li href="settings.jsp" class="nav-link activites"><i
					class='bx bx-cog'></i> <span class="mx-2">Settings</span></li>
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
					<a href="playlist.jsp" class="btn btn-login submits">Listen</a>
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
				<input type="text" class="search-input" placeholder="Search" />
			</div>
		</div>
	</div>
	<div class="container mt-4 song-container">
	   <div class="">
	       <h1 class="">Songs</h1>
	   </div>
	   <% List<Song> songs = (List<Song>) request.getAttribute("songs"); %>
	   <% if(songs!=null){ %>
	      <%for(Song music : songs){ %>
	   <div class="music-card">
	      <div class="play-icon">
	         <audio controls> 
	             <source src="data:audio/mpeg;base64, <%= music.getSongInputStream() %>" type="audio/mpeg">
	         </audio>
	         <i class="fas fa-play"></i>
	      </div>
	      <div class="music-details">
	         <div class="title"><%= music.getSongName() %></div>
	         <div class="artist"><%= music.getArtist() %></div>
	         <div class="album"><%= music.getAlbum() %></div>
	         <div class="song-time"></div>
	      </div>
	   </div>
	   <% } %>
	</div>
	<% } else { %>
	  <p>No songs found</p>
	<% } %>
</body>
</html>
<%
}
%>