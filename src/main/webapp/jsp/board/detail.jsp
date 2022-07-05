<%@page import="kr.ac.kopo.board.vo.BoardFileVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	// 1. 게시물 조회
		BoardVO board =  dao.selectByNo(no);
		
	// 2. 첨부파일 조회
	List<BoardFileVO> fileList = dao.selectFileByNo(no);
	
	// 화면에 출력시키기 위해 공유영역에 저장
	// 3. 공유영역에 등록
	pageContext.setAttribute("board", board);
	pageContext.setAttribute("fileList", fileList);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="/Mission-Web/assets/img/favicon.png" rel="icon">
  <link href="/Mission-Web/assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Amatic+SC:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Inter:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="/Mission-Web/assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="/Mission-Web/assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="/Mission-Web/assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="/Mission-Web/assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="/Mission-Web/assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="/Mission-Web/assets/css/main.css" rel="stylesheet">
<meta charset="UTF-8">
<title>게시판 상세</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/resources/css/table.css">
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	if(${userVO} == ''){
		location.href = '/Mission-Web/jsp/login/login.jsp'
	}

	function doAction(type) {
		switch(type) {
		case 'U' : 
			location.href = "update.jsp?no=${param.no}"
			break;
		case 'D' : 
			if(confirm('삭제하시겠습니까?')){
				location.href = "delete.jsp?no=${param.no}"
			}
			break;
		case 'L' :
			location.href = "list.jsp"
			break;
		}
	}
</script>
</head>
<body>
<header id="header" class="header fixed-top d-flex align-items-center">
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	<section>
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
			<td><c:out value="${ board.title }"/> </td>
		</tr>
		<tr>
			<th width="25%">작성자</th>
			<td>${ board.writer }</td>
		</tr>
		<tr>
			<th width="25%">내용</th>
			<td><c:out value="${ board.content }"/> </td>
		</tr>
		<tr>
			<th width="25%">조회수</th>
			<td>${ board.viewCnt }</td>
		</tr>
		<tr>
			<th width="25%">등록일</th>
			<td>${ board.regDate }</td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<!-- 파일이 서버에 있다  -->
			<td>
				<c:forEach items="${ fileList }" var="fileVO">
					<a href="/Mission-Web/upload/${ fileVO.fileSaveName }">
						${ fileVO.fileOriName }
					</a> 
					(${ fileVO.fileSize }bytes)
					<br>
				</c:forEach>
			</td>
		</tr>
	</table>
	<br>
	<button onclick="doAction('U')">수  정</button>&nbsp;&nbsp;
	<button onclick="doAction('D')">삭  제</button>&nbsp;&nbsp;
	<button onclick="doAction('L')">목  록</button>&nbsp;&nbsp;
	</div>
	</section>
	<footer id="footer" class="footer">
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>