<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "CirclePack.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	BoardController bc = new BoardController();
	Board board = new Board(request.getParameter("cid"), request.getParameter("tid"));
	board.setTitle(request.getParameter("title"));
	board.setContent(request.getParameter("content"));
	HttpSession tempSession = request.getSession();
	board.setUserId("fviocs501");
	//board.setUserId((String)tempSession.getAttribute("id"));
	
	int i = bc.createProcess(board);
	String msg = "데이터 추가 성공 !";
	if(i == -1) msg = "[에러] 데이터 삭제 ";
%>

<script>
	alert('<%=msg%>');
	location.href='circle_page.jsp?cid=<%=request.getParameter("cid")%>&tid=<%=request.getParameter("tid") %>';
	
</script>