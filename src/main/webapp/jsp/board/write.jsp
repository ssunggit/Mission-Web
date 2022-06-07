<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.ac.kopo.util.ConnectionFactory"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  /*
    	작업순서
    	1. 파라미터 추출(제목 , 작성자, 내용) 
    	-> HttpServletRequest request
    	2. t_board 테이블에 새로운 게시글 확인
    	3. 클라이언트에게 결과 전송
    */
    // post 방식 인코딩 필요
    request.setCharacterEncoding("utf-8");
    	
    String title = request.getParameter("title");
    String writer = request.getParameter("writer");
    String content = request.getParameter("content");
    
    //System.out.println("title"+title);
    //System.out.println("writer"+writer);
    //System.out.println("content"+content);
    
    Connection conn = new ConnectionFactory().getConnetion();
    
	StringBuilder sql = new StringBuilder();
	
	sql.append("insert into t_board(no, title, writer, content) ");
	sql.append(" values(seq_t_board_no.nextval, ?, ?, ?) ");
	
	
	PreparedStatement pstmt = conn.prepareStatement(sql.toString());
	
	pstmt.setString(1, title);
	pstmt.setString(2, writer);
	pstmt.setString(3, content);
	
	pstmt.executeUpdate();
		 
%>

<script>
	alert('새글등록을 완료하였습니다.')
	location.href = "list.jsp";
</script>
