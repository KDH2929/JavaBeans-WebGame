<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

   <link type="text/css" rel="stylesheet" href="CSS/homeStyle.css">
        <link type="text/css" rel="stylesheet" href="CSS/sign-up-style.css">
		<meta charset="UTF-8">
		<title>회원가입</title>
		
		<script>
		 
	
		function f1()
		{
			var s='<%=(String)request.getAttribute("fail")%>';
			
			if(s=="fail")				
			{
				alert("비밀번호가 동일하지 않습니다.");
			}
			
		}
		</script>
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

        <form id="sign-up" method="POST" action='UserController' name="frmAddUser">
            <div id="a1">회원가입</div>
            <table>
                <tr><td>아이디</td><td><input type="text" name="id"></td></tr>
                <tr><td>비밀번호</td><td><input type="password" name="password"></td></tr>
                <tr><td>비밀번호확인</td><td><input type="password" name="password_check"></td></tr>
                <tr><td>닉네임</td><td><input type="text" name="name"></td></tr>
                <tr><td>이메일</td><td><input type="email" name="email"></td></tr>
            </table>
            <button type="submit" id="b1">가입하기</button>
            <input type="hidden" name="action" value="sign_up">
        </form>

</html>