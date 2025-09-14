<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="CSS/homeStyle.css">
<link type="text/css" rel="stylesheet" href="CSS/login-style.css">
<script>
function f1()
{
	var s='<%=(String)request.getAttribute("fail")%>';
	
	if(s=="fail")				
	{
		alert("로그인 실패. 아이디와 비밀번호를 확인해주세요.");
	}
	
}
</script>
<title>로그인 페이지</title>
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

        <div id="login">
        <div id="login-form">
        <div>
        
        <form method="POST" action="UserController">
        <table>
        <tr>
            <td><label>아이디</label></td>
            <td><input class="login2" type="text" name="id" placeholder="ID"></td>
            <td rowspan="2"><button id="login-btn" type="submit" tabindex="-1" >로그인</button></td>
        </tr>
        <tr>
            <td><label>비밀번호</label></td>
            <td><input class="login2"  id="password" name="password" type="password" placeholder="Password"></td>
        </tr>
     
        
        </table>
        <input type="hidden" name="action" value="check">
        </form>
        
        </div >
    
        
         <br>
         <div id="x2">
         <button type="button" onclick="location.href='sign-up.jsp'">회원가입</button> 
        </div>
        </div>
        </div>
</body>
</html>

