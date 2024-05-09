<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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


<!-- Manual css and js file -->
<link rel="stylesheet" href="addsongs.css"/>
</head>
<body>
    <div class="container">
          <div class="card">
             <div class="card-body">
               <div class="row">
					<div class="col-md-6">
						<img src="images/music.gif" class="img-fluid" alt="login-image" />
					</div>
					<div class="col-md-6">
						<main style="margin-top: 5.4rem;">
							<h1>Start your journey in the world of tattoo</h1>
							<form action="AddSongs" method="post" enctype="multipart/form-data">
								<input type="text" id="songname" name="songname" placeholder="Song name">
								<input type="text" id="album" name="album" placeholder="Album name"> 
								<input type="text" id="singer" name="singer" placeholder="Singer name">
								<textarea id="lyrics" name="lyrics" placeholder="Lyrics" maxlength="5000"></textarea>
								<br/>
								<input type="file" id="music" name="song" placeholder="upload music">
								<br/>
								<button type="submit">SIGN IN</button>
							</form>
						</main>
					</div>
				</div>
          </div>
          
       </div>
    </div>
 	
</body>
</html>
<% 
   }
%>