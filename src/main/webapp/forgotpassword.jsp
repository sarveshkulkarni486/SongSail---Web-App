<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<!-- manual css -->
<link rel="stylesheet" href="login.css" />
</head>
<body>
    <div class="container mt-4 container-custom">
        <div class="card">
            <div class="card-body">
                <div class="row">
                    <div class="col-md-6">
                        <h5>Forgotten Your Password?</h5>
                        <p>Don't worry enter your new password below to change</p>
                        <form action="UpdatePassword" method="post" style="margin-top: 3rem;">
                            <div class="card form-card">
                                <div class="card-body">
                                    <div class="form-group">
                                        <label for="password">New Password: </label>
                                        <input type="password" class="form-control" name="password" placeholder="*********" />
                                    </div>
                                    <br />
                                    <div class="form-group">
                                        <span style="font-size: 12px; text-decoration: none;">Enter same password which you filled in new password field</span>
                                        <label for="cnfpassword">Confirm Password: </label>
                                        <input type="password" class="form-control" name="cnfpassword" placeholder="*********" />
                                    </div>
                                    <br />
                                    <button type="submit" class="btn btn-primary">Change</button>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-6">
                        <img src="images/forgot.jpg" class="img-fluid" alt="login-image"/>
                    </div>
                </div>
            </div>
        </div>

    </div>

</body>
</html>