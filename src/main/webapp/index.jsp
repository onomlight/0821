<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<h2>쇼핑몰회원관리 프로그램</h2>

<footer>
	<p>HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea</p>
</footer>
</body>
</html>