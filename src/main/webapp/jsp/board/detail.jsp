<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// http://localhost:9999/Mission-Web/jsp/board/detail.jsp?no=21
	
	/*
		작업순서
		1. no 파라미터를 추출 - java
		2. 추출된 no에 해당 게시물을 조회(t_board) - java
		3. 조회된 게시물을 화면 출력 - html
	*/
	
	int no = Integer.parseInt(request.getParameter("no"));
	BoardDAO dao = new BoardDAO();
	BoardVO board = dao.selectByNo(no);
	
	// 화면에 출력시키기 위해 공유영역에 저장
	pageContext.setAttribute("board", board);
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
		<tr>
			<th width="25%">번호</th>
				<!--    .은 getter 메소드 -->
			<td>${ board.no }</td>
		</tr>
		<tr>
			<th width="25%">제목</th>
			<td>${ board.title }</td>
		</tr>
		<tr>
			<th width="25%">작성자</th>
			<td>${ board.writer }</td>
		</tr>
		<tr>
			<th width="25%">내용</th>
			<td>${ board.content }</td>
		</tr>
		<tr>
			<th width="25%">조회수</th>
			<td>${ board.viewCnt }</td>
		</tr>
		<tr>
			<th width="25%">등록일</th>
			<td>${ board.regDate }</td>
		</tr>
	</table> 
	</div>
</body>
</html>