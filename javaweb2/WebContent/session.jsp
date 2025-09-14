<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>session</title>
</head>
<body>
<%

String name=(String)request.getAttribute("name");
String id=(String)request.getAttribute("id");


session.setAttribute("login","ok");
session.setAttribute("name",name);
session.setAttribute("id",id);

response.sendRedirect("home.jsp");

%>
</body>
</html>