<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
 <link type="text/css" rel="stylesheet" href="CSS/homeStyle.css">
 <link type="text/css" rel="stylesheet" href="CSS/admin.css">
 <script>
 
 
 </script>
<meta charset="UTF-8">
<title>회원 관리</title>
</head>
<body onload="f1()">
<div id="logo">
            게임모음집
        </div>

        <div id="nav1">
            <ul>
                <li><a href="home.jsp">홈</a></li>
                <li><a href="Game_introduce.html">게임 소개</a></li>
                <li><a href="notice.html">공지사항</a></li>
                <li><a href="board.html">게시판</a></li>

            </ul>
        </div>
      
        <div id="nav2-2">
         <button id="login-btn" type="button">관리자 페이지</button> 
         <br>

 
        <div id="menu">
            <button onclick="location.href='admin.jsp'">유저 관리</button>
        </div>

        </div>


        <div id="contents10">

        
            <div id="admin_main">
                <div id="option1">
                유저관리
                </div>
                <div id="div_table">
                <form method="get" action='UserController'>
             	ID : <%=request.getParameter("id")%> <br>
             	Password : <input type="text" name="password"><br>
             	name : <input type="text" name="name"><br>
             	email : <input type="text" name="email"><br>
             	date : <input type="text" name="date"><br>
             	score : <input type="text" name="score"><br>
             	    	<input type="hidden" name="action" value="modify"><br>
             	<input type="hidden" name="id" value='<%=request.getParameter("id")%>'><br>
             	<button type="submit">유저 정보 수정</button>
             	</form>
                </div>
            </div>
            </div>
</body>
</html>





