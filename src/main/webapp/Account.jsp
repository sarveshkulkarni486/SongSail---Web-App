<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.example.music.Song" %>
<%@ page import="java.util.List" %>
<%@ page import="java.sql.*" %>
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
<meta charset="UTF-8">
<title>Insert title here</title>
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
<link rel="stylesheet" href="accounts.css"/>
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
                <li class="nav-link activites"><a href="SongSail.jsp"><i
                    class='bx bxs-dashboard'></i> <span class="mx-2">Home</span></a></li>
                <li class="nav-link activites"><a href="#"><i
                    class="fa-regular fa-paper-plane"></i> <span class="mx-2">Discover</span></a>
                </li>
                <li class="nav-link activites"><a href="Trending.jsp"><i
                    class="fa-solid fa-arrow-trend-up"></i> <span class="mx-2">Trending</span></a>
                </li>
            </ul>
            </li>

            <!-- sidenavbar second component -->
            <ul>
                Library
                <li href="playlist.jsp" class="nav-link activites"><i
                    class='bx bxs-playlist'></i> <span class="mx-2">Playlist</span></li>
                <li class="nav-link activites"><a href="favorites.jsp"><i
                    class="fa-regular fa-hearts"></i><span class="mx-2">Favourite</span>
                    </a>
                </li>
                <li class="nav-link activites"><a href="Account.jsp"><i
                    class="fa-regular fa-user"></i> <span class="mx-2">Account</span></a></li>
                <li href="settings.jsp" class="nav-link activites"><i
                    class='bx bx-cog'></i> <span class="mx-2">Settings</span></li>
            </ul>
    </div>
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-6">
                <div class="card card-horizontal">
                    <img src="#" alt="profile" class="img-fluid card-img-top">
                    <div class="card-body">
                        <h5 class="card-title">Card Title</h5>
                        <p class="card-text">Card description goes here.</p>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="form-container">
                    <form>
                        <div class="form-group">
                            
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    
</body>
</html>