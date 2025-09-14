<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
 <link type="text/css" rel="stylesheet" href="CSS/homeStyle.css">
 <link type="text/css" rel="stylesheet" href="CSS/admin.css">
 <script>
 <% String s=(String)request.getAttribute("text"); %>
 
 function f1()
 {
	 <%		// 데이터 갱신을 위한 곳	
		Class.forName("com.mysql.jdbc.Driver");

	    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_data", "root", "1423");
	    Statement stmt = conn.createStatement();
	    ResultSet rset;
	    String sqlStr="select*from users";
	    
	    if(s!=null)
	    {
	    	sqlStr=sqlStr+" where name='"+s+"'";
	    }
	    
	    rset = stmt.executeQuery(sqlStr);
      %>
 }
 
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
                <table id="table3">
                    <thead>
                        <tr><th>아이디</th><th>비밀번호</th><th>이름</th><th>이메일</th><th>가입일</th><th>점수</th><th>수정</th><th>삭제</th></tr>
                    </thead>
                    <tbody>
                    <%
                    while (rset.next()) {
                    	
                        %>
                  		<tr>
                  		<td><%=rset.getString("id")%></td>
                  		<td><%=rset.getString("password")%></td>
                  		<td><%=rset.getString("name")%></td>
                  		<td><%=rset.getString("email")%></td>
                  		<td><%=rset.getString("date")%></td>
                  		<td><%=rset.getInt("score")%></td>
                  		<td><a href="modify.jsp?action=modify&id=<%=rset.getString("id")%>">Modify</a></td>
                  		<td><a href="UserController?action=delete&id=<%=rset.getString("id")%>">Delete</a></td>
                  		<%}  %>
                    </tbody>
    
                </table>
                </div>
                
                <form  method="get" action='UserController'>
                <div id="find2">
                <select id="find_nick">
                    <option>닉네임</option>
                </select>
    
 
                <input type="text" name="text">
                <button type="submit">검색</button>
                <input type="hidden" name="action" value="find">
                </div>
                </form>
            </div>
            </div>
            
</body>
</html>





