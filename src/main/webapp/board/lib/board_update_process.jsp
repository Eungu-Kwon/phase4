<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "CirclePack.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	BoardController bc = new BoardController();
	Board board = new Board(request.getParameter("cid"), request.getParameter("tid"), request.getParameter("id"));
	board.setTitle(request.getParameter("title"));
	board.setContent(request.getParameter("content"));
	HttpSession tempSession = request.getSession();
	//board.setUserId((String)tempSession.getAttribute("id"));
	
	int i = bc.updateProcess(board);
	String msg = "게시글이 수정되었습니다";
	if(i == -1) msg = "게시글 수정이 실패했습니다 ";
%>

<%
	out.println("<script>alert('"+msg+"');</script>");
	if(i != -1){
		//String s = "board_page.jsp?cid="+board.getCid()+"&tid="+board.getTid()+"&id="+board.getId();
		String s= "location.href='board_page.jsp?cid="+board.getCid()+"&tid="+board.getTid()+"&id="+board.getId()+"';";
		out.println("<script>"+ s+"</script>");
	
	}
	else{
		String s= "location.href='circle_page.jsp?cid="+board.getCid()+"&tid="+board.getTid()+"';";
		out.println("<script>"+ s+"</script>");
	}
%>