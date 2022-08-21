<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>.
 <%@page import="java.sql.*" %>
 <%@page import="DBPKG.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sale</title>
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
<h2>매출조회</h2>
<table border="1">
	<tr>
		<td>회원번호</td>
		<td>회원성명</td>
		<td>고객등급</td>
		<td>매출</td>
	</tr>
	
	   <%
   		Connection conn = null;
   		Statement stmt = null;
   		String grade="";
   		
   		try{
   			conn = Util.getConnection(); 
   			stmt = conn.createStatement(); 
   			String sql ="select me.custno, me.custname, me.grade , sum(mo.price) price from member_tbl_02 me , money_tbl_02 mo  				    where me.custno = mo.custno   				    GROUP BY me.custno ,  me.custname , me.grade   				    order by sum(mo.price) desc";
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
   	<td><%=rs.getString("custno") %></td>
   	<td><%=rs.getString("custname") %></td>
   	<td><%=grade %></td>
   	<td><%=rs.getString("price") %></td>
   </tr>
   <%
   			}
   			
   	
   		}
   		catch(Exception e){
   			e.printStackTrace();
   		}
   %>
</table>

<footer>
	<p>HRDKOREA Copyright&copy;2016 All rights reserved. Human Resources Development Service of Korea</p>
</footer>
</body>
</html>