<%@page import="kr.ac.kopo.board.vo.BoardVO"%>
<%@page import="kr.ac.kopo.board.dao.BoardDAO"%>
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
    BoardVO board = new BoardVO();
    board.setTitle(title);
    board.setWriter(writer);
    board.setContent(content);  
    
    BoardDAO dao = new BoardDAO();
    // vo를 파라미터로 넘긴다
    dao.insertBoard(board);
		 
%>

<script>
	alert('새글등록을 완료하였습니다.')
	location.href = "list.jsp";
</script>
