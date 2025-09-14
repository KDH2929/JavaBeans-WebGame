<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.Map.Entry" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.Collections" %>
<%@ page import="java.util.Comparator" %>
<%@ page import="java.util.LinkedList" %>
<%@ page import="java.util.Queue" %>

<!DOCTYPE html>
<html>
<head>
<script>

var state='<%=(String)session.getAttribute("login")%>';
var name='<%=(String)session.getAttribute("name")%>';

<%
String first_name="";
int first_score=0;


String second_name="";
int second_score=0;


String third_name="";
int third_score=0;


String fourth_name="";
int fourth_score=0;


String fifth_name="";
int fifth_score=0;
%>

function f1()
{
	var nav2=document.getElementById("nav2");
	if(state=="ok")
	{
		nav2.innerHTML="<div id='login_c'>로그인 되었습니다.<br>닉네임 : "+name+"<br><br><button onclick='location.href=\"logout.jsp\"'>로그아웃</button></div>";
	}
	
	else
	{
		nav2.innerHTML="<button id='login-btn' type='button' onclick='location.href=\"loginPage.jsp\" '>로그인하기</button><br> <div id='x'><span>&nbsp</span><a href='sign-up.jsp'>회원가입</a></div>";
	}
	
	<%		// 점수 갱신을 위한 곳
	Class.forName("com.mysql.jdbc.Driver");

    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/user_data", "root", "1423");
    Statement stmt = conn.createStatement();
    
    String sqlStr="select*from users";
    ResultSet rset = stmt.executeQuery(sqlStr);
    Map<String, Integer> Map1 = new HashMap<String, Integer>();
    while(rset.next())
    {
    	String name=rset.getString("name");
    	int score=rset.getInt("score");
    	
    	Map1.put(name,score);
    }
    rset.close(); stmt.close(); conn.close(); 
    List<Entry<String, Integer>> list_entries = new ArrayList<Entry<String, Integer>>(Map1.entrySet());
    Collections.sort(list_entries, new Comparator<Entry<String, Integer>>() {
		// compare로 값을 비교
		public int compare(Entry<String, Integer> obj1, Entry<String, Integer> obj2)
		{
			// 내림 차순으로 정렬
			return obj2.getValue().compareTo(obj1.getValue());
		}
		
	});
    
    Queue<Integer> stack = new LinkedList<>();
    Queue<String> stack2 = new LinkedList<>();
    for(Entry<String, Integer> entry : list_entries) {
		stack2.add(entry.getKey());
		stack.add(entry.getValue());
	}
    
    if(!stack2.isEmpty())
    {
    	first_name=stack2.poll();
    	first_score=stack.poll();
    }

    if(!stack2.isEmpty())
    {
    second_name=stack2.poll();
    second_score=stack.poll();
    }
    
    
    if(!stack2.isEmpty())
    {
    third_name=stack2.poll();
    third_score=stack.poll();
    }
    
    if(!stack2.isEmpty())
    {
    fourth_name=stack2.poll();
    fourth_score=stack.poll();
    }
    
    if(!stack2.isEmpty())
    {
    fifth_name=stack2.poll();
    fifth_score=stack.poll();
    }
    
    %>
    
	
    var first_name="<%=first_name%>";
    var first_score="<%=first_score%>";
    var second_name="<%=second_name%>";
    var second_score="<%=second_score%>";
    var third_name="<%=third_name%>";
    var third_score="<%=third_score%>";
    var fourth_name="<%=fourth_name%>";
    var fourth_score="<%=fourth_score%>";
    var fifth_name="<%=fifth_name%>";
    var fifth_score="<%=fifth_score%>";
    

    document.getElementById("nick1").innerHTML=first_name;
    document.getElementById("score1").innerHTML=first_score;
    
    document.getElementById("nick2").innerHTML=second_name;
    document.getElementById("score2").innerHTML=second_score;
    
    document.getElementById("nick3").innerHTML=third_name;
    document.getElementById("score3").innerHTML=third_score;
    
    document.getElementById("nick4").innerHTML=fourth_name;
    document.getElementById("score4").innerHTML=fourth_score;
    
    document.getElementById("nick5").innerHTML=fifth_name;
    document.getElementById("score5").innerHTML=fifth_score;
        
	
}
</script>

<meta charset="UTF-8">
<link type="text/css" rel="stylesheet" href="CSS/homeStyle.css">

<title>홈</title>

<style>

#rank_list table,tr,td
{
	margin:0px;
	border:1px solid;
	border-collapse: collapse;
	font-size:15px;
}

.cont2
{	
	margin-left:40px;
}

#rank_list tr,td
{
	padding:7px;
}
</style>
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
      
        <div id="nav2">
          
	         
        </div>
     


        <div id="contents">
            <div id="contents1">
            <table>
                <caption>게임 목록</caption>
                 <tr><td><img src="JPG/bound.JPG" onclick="location.href='game1.jsp' "></td><td><img onclick="location.href='game2.jsp'" src="JPG/shooting.jpg"></td><td><img src="JPG/tempJPG.jpg"></td></tr>
                <tr><td>공튀기기</td><td>탄막 슈팅게임</td><td>미구현</td></tr>
            </table>
            <table>
                <tr><td><img src="JPG/tempJPG.jpg"></td><td><img src="JPG/tempJPG.jpg"></td><td><img src="JPG/tempJPG.jpg"></td></tr>
                <tr><td>미구현</td><td>미구현</td><td>미구현</td></tr>
            </table>
            </div>


        <div id="contents2">
        <div class="cont2" id="ranking">
        <div id="game_list2">
        <table>
        <tr>
        <td><button>탄막슈팅게임</button></td>
        </tr>
        </table>
        </div>
        <div id="rank_list">
        <table>
        <tr><td>순위</td><td>닉네임</td><td>점수</td></tr>
        <tr><td>1위</td><td id="nick1"></td><td id="score1"></td></tr>
        <tr><td>2위</td><td id="nick2"></td><td id="score2"></td></tr>
        <tr><td>3위</td><td id="nick3"></td><td id="score3"></td></tr>
        <tr><td>4위</td><td id="nick4"></td><td id="score4"></td></tr>
        <tr><td>5위</td><td id="nick5"></td><td id="score5"></td></tr>
        </table>
        </div>
        </div>
         
        </div>


        </div>

</body>
</html>
