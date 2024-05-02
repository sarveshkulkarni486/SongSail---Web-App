<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
  session = request.getSession(false);
  if(session!=null){
	  session.invalidate();
  }
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // Prevent caching
  response.setHeader("Pragma", "no-cache"); // Prevent caching

  // Redirect to login page
  response.sendRedirect("index.jsp");
%>

</body>
</html>