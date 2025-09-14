<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>log_out</title>
</head>
<body>
<%
session.removeAttribute("login");
session.removeAttribute("name");

response.sendRedirect("home.jsp");
%>
</body>
</html>