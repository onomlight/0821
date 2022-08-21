<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.text.*" %>   
 <%@page import="java.sql.*" %>
 <%@page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="check.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<h2>쇼핑몰회원수정</h2>
<table border="1" style="text-align: center;">
<form method="post" action="action.jsp">
<input type="hidden" name="mode" value="insert">

<%
request.setCharacterEncoding("UTF-8");
Connection conn=null;
Statement stmt = null;
String mod_custno=request.getParameter("mod_custno");
String custname = "";
String phone = "";
String address = "";
Date joindate;
String grade="";
String city="";
String joindateStr = "";

try{
	conn = Util.getConnection();
	stmt = conn.createStatement();
	String sql = "select * from member_tbl_02 where custno = " + mod_custno;
	ResultSet rs = stmt.executeQuery(sql);
	rs.next();
	mod_custno = rs.getString("custno");
	custname = rs.getString("custname");
	phone = rs.getString("phone");
	address = rs.getString("address");
	joindate = rs.getDate("joindate");
	grade = rs.getString("grade");
	city = rs.getString("city");
	
	SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
	joindateStr = transFormat.format(joindate);
}

catch(Exception e){
	e.printStackTrace();
}
%>
	<tr>
		<td>회원번호</td>
		<td><input type="text" name="custno" value="<%=mod_custno %>">
	<tr/>
	<tr>
		<td>회원성명</td>
		<td><input type="text" name="custname" value="<%=custname %>" >
	</tr>
	<tr>
		<td>전화번호</td>
		<td><input type="text" name="phone" value="<%=phone %>">
	</tr>
	<tr>
		<td>주소</td>
		<td><input type="text" name="address" value="<%=address %>">
	</tr>
	<tr>
		<td>가입일자</td>
		<td><input type="text" name="joindate" value="<%=joindateStr %>">
	</tr>
	<tr>
		<td>고객등급[A:VIP,B:일반,C:직원]</td>
		<td><input type="text" name="grade" value="<%=grade %>">
	</tr>
	<tr>
		<td>거주지역</td>
		<td><input type="text" name="city" value="<%=city %>">
	</tr>
	<tr>
		<td colspan="2">
			<input type="submit" value="수정" onclick="return modify()">
			<input type="button" value="조회" onclick="return search()">
		</td>
	</tr>
	</form>
</table>
<footer>
	<p>HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea</p>
</footer>
</body>
</html>