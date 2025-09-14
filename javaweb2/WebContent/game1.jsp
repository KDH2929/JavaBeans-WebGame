<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link type="text/css" rel="stylesheet" href="CSS/homeStyle.css">
        <link type="text/css" rel="stylesheet" href="CSS/admin.css">
        <title>공튀기기</title>
        <style>
            iframe
            {
                border:0px;
                margin-left:100px;
                margin-top:75px;
            }
        </style>
        
        
        <script>
        var state='<%=(String)session.getAttribute("login")%>';
        var name='<%=(String)session.getAttribute("name")%>';
        
        function f1()
        {
        	var nav2=document.getElementById("nav2-2");
        	if(state=="ok")
        	{
        		nav2.innerHTML="<div id='login_c'>로그인 되었습니다.<br>닉네임 : "+name+"<br><br><button onclick='location.href=\"logout.jsp\"'>로그아웃</button></div>";
        	}
        	
        	else
        	{
        		nav2.innerHTML="<button id='login-btn' type='button' onclick='location.href=\"loginPage.jsp\" '>로그인하기</button><br> <div id='x'><span>&nbsp</span><a href='sign-up.jsp'>회원가입</a></div>";
        	}
        	
        }
        </script>
<meta charset="UTF-8">
<title>공튀기기</title>
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
        </div>


        <div id="contents10">
            <iframe src="Bound.html" width="830" height="570"></iframe>
        </div>


</body>
</html>