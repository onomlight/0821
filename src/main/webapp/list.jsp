<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
     <%@page import="java.sql.*" %>
 <%@page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member</title>
<style>
 header{
 background-color:blue;
 width: 100%;
 color: white;
  
 }
 nav ul
	{
		list-style:none;
		padding-left:0px;
		display:flex;
		justify-content: space-evenly;
	}
	nav li a{
		text-decoration:none;
		color : black;
	}
 footer{
 background-color:blue;
 text-align:center;
 height: 100px; 
 }
</style>
</head>
<body>
<header>쇼핑몰 회원관리</header>
<nav>
	<ul>
		<li><a href="/join.jsp">회원등록</a></li>
		<li><a href="/list.jsp">회원목록조회</a></li>
		<li><a href="/sale.jsp">회원매출조회</a></li>
		<li><a href="/index.jsp">홈으로</a></li>
			
	</ul>
</nav>
<h2>회원목록조회/수정</h2>

<table border="1" style="text-align: center;">
<tr>
	<td>회원번호</td>
	<td>회원성명</td>
	<td>전화번호</td>
	<td>주소</td>
	<td>가입일자</td>
	<td>고객등급</td>
	<td>거주지역</td>
</tr>
<%
	Connection conn=null;
	Statement stmt = null;
	String grade="";
	
	try{
		conn = Util.getConnection();
		stmt = conn.createStatement();
		String sql = "select * FROM member_tbl_02 ORDER BY custno";
		ResultSet rs = stmt.executeQuery(sql);
		while(rs.next()){
				grade = rs.getString("grade");
				switch(grade){
				case"A" :
					grade = "VIP";
					break;
				case"B" :
					grade = "일반";
					break;
				case"C" :
					grade = "직원";
					break;
				}
	
%>

<tr>
	<td><a href="modify.jsp?mod_custno=<%=rs.getString("custno") %>"><%=rs.getString("custno") %></a> </td>
	<td><%=rs.getString("custname") %> </td>
	<td><%=rs.getString("phone") %> </td>
	<td><%=rs.getString("address") %> </td>
	<td><%=rs.getDate("joindate") %> </td>
	<td><%=grade%> </td>
	<td><%=rs.getString("city") %> </td>
</tr>
<%
		}
	
	}
	catch(Exception e)
	{
		e.printStackTrace();
	}
%>
</table>

<footer>
	<p>HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea</p>
</footer>
</body>
</html>