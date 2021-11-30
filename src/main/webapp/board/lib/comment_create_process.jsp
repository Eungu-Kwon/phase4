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
	String msg = "게시글이 생성 되었습니다";
	if(i == -1) msg = "게시글 생성이 실패했습니다 ";
%>

<script>
	alert('<%=msg%>');
</script>
<%
	String cid = request.getParameter("cid");
	String tid = request.getParameter("tid");
	String id = request.getParameter("id");
	if(i != -1){
		String s = "board_page.jsp?cid="+cid+"&tid="+tid+"&id="+id;
		response.sendRedirect(s);
	}
	else{
		String s = "circle_page.jsp?cid="+cid+"&tid="+tid;
		response.sendRedirect(s);
	}
		
%>