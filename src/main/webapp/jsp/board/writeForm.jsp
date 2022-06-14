<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새글등록폼</title>
<script src="/Mission-Web/resources/js/jquery-3.6.0.min.js"></script>
<script>
	$(document).ready(function() {
		$('#ListBtn').click(function() {
			location.href= 'list.jsp'
		})
	})
	
	function checkForm() {
	
		let f = document.writeForm
		
		if(f.title.value == '') {
			alert('제목을 입력하세요')
			f.title.focus()
			return false	
		}
		
		if(f.writer.value == '') {
			alert('작성자를 입력하세요')
			f.writer.focus()
			return false
		}
		
		if(f.content.value == '') {
			alert('내용을 입력하세요')
			f.content.focus()
			return false
		}
		return true
	}
</script>
</head>
<body>
	<div align="center">
		<hr>
		<h2>새글 등록폼</h2>
		<hr>
		<br>
		<!-- onsubmit : action이 가르키는 url로 이동하게 할지 말지를 결정하는 속성 -->
		<!-- return false 이면 액션이 가르키는 url로 이동하지 않는다. -->
		<!-- form 태그의 name 속성으로 form 태그 안 태그들을 제어할 수 있다. -->
		<form action="write.jsp" method="post" name="writeForm" onsubmit="return checkForm()">
			<table border="1" style="width:80%">
				<tr>
					<th width="25%">제목</th>
																	<!-- 속성과 값이 같을 경우에는 속성명만 기재할 수 있다 -->
					<td><input type="text" name="title" size="80"></td>
				</tr>
				<tr>
					<th width="25%">작성자</th>
					<td><input type="text" name="writer"></td>
				</tr>
				<tr>
					<th width="25%">내용</th>
					<td>
						<textarea rows="5" cols="80" name="content"></textarea>
					</td>
				</tr>
			</table>
			<br>
			<input type="submit" value="새글등록">&nbsp;&nbsp;
			<button type="button" id="ListBtn">목록</button>
		</form>
	</div>
</body>
</html>