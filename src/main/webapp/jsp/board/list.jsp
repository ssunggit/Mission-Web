<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="kr.ac.kopo.util.JDBCClose"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
	<%--
		작업순서
		1. t_board 테이블에서 전체게시글 조회
		2. 조회된 게시물을 하나씩 웹브라우저 출력
	--%>
	
	<%--
		jsp 가 servlet으로 바뀔때 서비스 메소드 내 try-catch 문 안에 들어가 있기 때문에 예외처리를 해주지 않아도 오류나지 않는다
	--%>
<%
	BoardDAO dao = new BoardDAO();
	List<BoardVO> list = dao.selectAll();
				
	// 공유영역에 등록
	// page-context : list.jsp 안에서만 공유 자신의 페이지 내에서 등록된 객체
	// request : 한번 요청에 응답이 올때까지 연결되어 있는 jsp가 객체를 공유하기 위한 영역
	// session : 하나의 클라이언트가 여러번의 요청을 해도 객체를 공유하기 위함
	// application : 서버를 접속하는 모든 클라이언트가 값을 공유
	pageContext.setAttribute("list", list);
	

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록</title>
<script src="/Mission-Web/resource/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addBtn').click(function() {
			location.href= 'writeForm.jsp'
		})
	})	
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>전체게시글 조회</h2>
		<hr>
		<br>
		<table border="1" style="width:80%">
		<tr>
			<th width="7%">번호</th>
			<th>제목</th>
			<th width="16%">작성자</th>
			<th width="20%">등록일</th>
		</tr>	
		<%--  forEach문 동작원리
		<c:set var="board" value="${list[0]"}/> 
		<c:set var="board" value="${list[1]"}/> 
		<c:set var="board" value="${list[2]"}/> 
		--%>
		<c:forEach items="${ list }" var="board">
			<tr>
				<td>${ board.no }</td>
				<td>
					<!-- 
						겟방식으로 넘겨줌 
						? : 클라이언트가 자신의 정보를 서버에 담을 때 ? 뒤로 쓴다
					-->
					
					<!-- 보안을 위해 링크를 el로 적지 않는다  -->
					<a href="detail.jsp?no=${board.no}">
						<c:out value="${ board.title }"/> 
					</a>
				</td>
				<td>${ board.writer }</td>
				<td>${ board.regDate }</td>
			</tr>
		</c:forEach>
		</table>
		<br>
		<button id="addBtn">새글등록</button>
	</div>
</body>
</html>
