<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=21
%>

<%
	int no = Integer.parseInt(request.getParameter("no"));
	
	Connection conn = new ConnectionFactory().getConnetion();
	StringBuilder sql = new StringBuilder();
	sql.append("select * ");
	sql.append(" from t_board ");
	sql.append(" where no =" + no);
		
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());

	ResultSet rs = pstmt.executeQuery();
	
	System.out.println();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세</title>
<script src="/Mission-Web/resource/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#Btn').click(function() {
			location.href= 'list.jsp'
		})
	})	
</script>
</head>
<body>
	<div align="center">
	<hr>
	<h2>게시판 상세</h2>
	<hr>	
	<table border="1" style="width:80%">
<% 
	while(rs.next()){
			int noPrint = rs.getInt("no");
			String title = rs.getString("title");
			String writer = rs.getString("writer");
			String content = rs.getString("content");
			int view_cnt = rs.getInt("view_cnt");
			String reg_date = rs.getString("reg_date");
			
	%>
	<tr>
		<td>번호</td>
		<td><%= noPrint %></td>
	</tr>
	<tr>
		<td>날짜</td>
		<td><%= reg_date %></td>
	</tr>
	<tr>
		<td>글쓴이</td>
		<td><%= writer %></td>
	</tr>
	<tr>
		<td>제목</td>
		<td><%= title %></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><%= content %></td>
	</tr>
	<tr>
		<td>조회수</td>
		<td><%= view_cnt %></td>
	</tr>
	
	<% 
	} 
	%> 
	
	</table> 
	</div>
</body>
</html>