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
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/resources/css/table.css">
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addBtn').click(function() {
			location.href = 'writeForm.jsp'
		})
	})

	function checkLogin(boardNo) {
		/* el과 jstl중에서는 jstl(백단코드)의 해석이 먼저된다  */
		/* js에서 c:set태그를 실행하려는것은 안된다 */
		<c:choose>
			<c:when test="${ empty userVO }">	
				if(confirm('로그인 후 사용가능합니다\n로그인 페이지로 이동할까요?')){
					location.href = '/Mission-Web/jsp/login/login.jsp'
				}
			</c:when>	
			
			<c:otherwise>
				location.href = 'detail.jsp?no=' + boardNo
			</c:otherwise>
		</c:choose>
	}
</script>
<script>
</script>
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	
	<section>
		<div align="center">
		<hr>
		<h2>전체게시글 조회</h2>
		<hr>
		<br>
		<table border="1" style="width:100%">
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
		<c:forEach items="${ list }" var="board" varStatus="loop">
			<tr <c:if test="${ loop.count mod 2 eq 0 }">class="even"</c:if>>
				<td>
					<c:out value="${ board.no }"/> 
				</td>
				<td>
					<!-- 
						겟방식으로 넘겨줌 
						? : 클라이언트가 자신의 정보를 서버에 담을 때 ? 뒤로 쓴다
					-->
					
					<!-- 보안을 위해 링크를 el로 적지 않는다  -->
					<!--  화면 출력을 위해 el 이 아닌 out 태그로 적어야한다 -->
					<%-- 
					<a href="updateViewCnt.jsp?no=${board.no}">
						<c:out value="${ board.title }"/> 
					</a>
					 --%>
					 
					 <!-- href javascript를 실행하겠다  -->
					 <a href="javascript:checkLogin(${ board.no })">
						<c:out value="${ board.title }"/> 
					</a>
				</td>
				<td>
					<c:out value="${ board.writer }"/> 
				</td>
				<td>${ board.regDate }</td>
			</tr>
		</c:forEach>
		</table>
		<br>
		<c:if test="${ not empty userVO }">
			<button id="addBtn">새글등록</button>
		</c:if>
	</div>
	</section>
	
	<footer>
	<!-- xml include forward 에서의 루트는 context-path 뒤 : http://localhost:9999/Mission-Web/ 뒤 -->
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>