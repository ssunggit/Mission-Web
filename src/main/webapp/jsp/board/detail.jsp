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
	sql.append("select no, title, writer, content ");
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
<% 
	while(rs.next()){
			int noPrint = rs.getInt("no");
			String title = rs.getString("title");
			String content = rs.getString("content");
			
	%>
		<%= noPrint %>
		<%= title %>
		<%= content %>
	<% 
	} 
	%> 
	
	 
	</div>
</body>
</html>