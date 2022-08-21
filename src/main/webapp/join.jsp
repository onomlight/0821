<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.sql.*" %>
 <%@page import="DBPKG.Util" %>
   <%
   request.setCharacterEncoding("UTF-8");
   		Connection conn = null;
   		Statement stmt = null;
   		String custno="";
   		
   		try{
   			conn = Util.getConnection(); // DB연결
   			stmt = conn.createStatement(); // SQL실행을 위한 변수생성
   			String sql ="SELECT MAX(custno)+1 custno FROM member_tbl_02";
   			ResultSet rs = stmt.executeQuery(sql); // stmt 통해 sql 실행 후 결과 
   			rs.next(); // 1개 출력 
   			custno = rs.getString("custno");
   		}
   		catch(Exception e){
   			e.printStackTrace();
   		}
   %> 
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="check.js"></script>
<meta charset="UTF-8">
<title>JOIN</title>
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
<h2>회원 등록</h2>


<form action="action.jsp" method="post" name ="frm" action="join.jsp" method="post" >
	<input type="hidden" name="mode" value="insert">
		<table border="1">
				<tr>
					<td>회원번호(자동발생)</td>
					<td><input type="text" name="custno" value="<%=custno %>" ></td>
				</tr>
				<tr>
					<td>회원성명</td>
					<td><input type="text" name="custname"></td>
				</tr>
				<tr>
					<td>회원전화</td>
					<td><input type="text" name="phone"></td>
				</tr>
				<tr>
					<td>회원주소</td>
					<td><input type="text" name="address"></td>
				</tr>
				<tr>
					<td>가입일자</td>
					<td><input type="text" name="joindate"></td>
				</tr>
				<tr>
					<td>고객등급[A:VIP,B:일반,C:직원]</td>
					<td><input type="text" name="grade"></td>
				</tr>
				<tr>
					<td>도시코드</td>
					<td><input type="text" name="city"></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="등록" onclick="return joinCheck()">
					 <input	type="button" value="조회" onclick="return search()"></td>
				</tr>
			</table>

</form>
<footer>
	<p>HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea</p>
</footer>
</body>
</html>