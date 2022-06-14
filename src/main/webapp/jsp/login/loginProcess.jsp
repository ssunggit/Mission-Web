<%@page import="kr.ac.kopo.member.dao.MemberDAO"%>
<%@page import="kr.ac.kopo.member.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	
	MemberVO memberVO = new MemberVO();
	memberVO.setId(id);
	memberVO.setPassword(password);
	
	MemberDAO dao = new MemberDAO();
	MemberVO userVO = dao.login(memberVO);
	
	String msg = "";
	String url = "";
	
	if(userVO == null){
		// 로그인 실패
		msg="아이디 또는 패스워드를 잘못입력했습니다";
		url="login.jsp";
	} else {
		// 로그인 성공
		switch(userVO.getType()){
		case "S" :
			msg = "관리자님 환영합니다.";
			break;
		case "U" :
			msg = userVO.getId() + "님 환영합니다.";
			break;
		}
		url="/Mission-Web";		
		
		// 세션 등록
		session.setAttribute("userVO", userVO);
	}
	
	pageContext.setAttribute("msg", msg);
	pageContext.setAttribute("url", url);
%>    
<script>
/* 먼저 el 부터 해석 되기 때문에 작은따옴표로 감싸야한다 */
	alert('${ msg }');
	location.href = '${ url }';
</script>
