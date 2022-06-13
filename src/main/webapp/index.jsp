<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
<link rel="stylesheet" href="/Mission-Web/resources/css/layout.css">
<link rel="stylesheet" href="/Mission-Web/resources/css/table.css">
</head>
<body>
	<header>
		<jsp:include page="/jsp/include/topMenu.jsp" />
	</header>
	
	<section>
		section
	</section>
	
	<footer>
	<!-- xml include forward 에서의 루트는 context-path 뒤 : http://localhost:9999/Mission-Web/ 뒤 -->
		<%@ include file="/jsp/include/footer.jsp" %>
	</footer>
</body>
</html>