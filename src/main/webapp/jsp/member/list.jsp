<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@page import="java.util.List"%>
<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%
	MemberDAO dao = new MemberDAO();
	List<MemberVO> list = dao.selectAll(); 
	
	pageContext.setAttribute("list", list);
%> 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member List</title>
<script src="/Mission-Web/resource/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#addMemberBtn').click(function() {
			location.href= 'addMember.jsp'
		})
	})	
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>회원 리스트</h2>
		<hr>
		<br>
		<table border="1" style="width:80%">
			<tr>
				<th>ID</th>
				<th>이름</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>주소</th>
				<th>가입날짜</th>
			</tr>	
		<c:forEach items="${ list }" var="list">
			<tr>
				<td><c:out value="${ list.id }"/></td>
				<td><c:out value="${ list.name }"/></td>
				<td>
					<c:out value="${ list.emailId }@${ list.emailDomain }"/>
				</td>
				<td>
					<c:out value="${ list.tel1 }-${ list.tel2 }-${ list.tel3 }"/>
				</td>					
				<td>
					<c:out value="${ list.basicAddr } ${ list.detailAddr }"/>
				</td>				
				<td><c:out value="${ list.regDate }"></c:out></td>			
			</tr>	
		</c:forEach>	
		</table>
		<br>
		<button id="addMemberBtn">새로운 회원 등록</button>
	</div>
</body>
</html>