<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "CirclePack.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%

	
	BoardController bc = new BoardController();
	int cid = Integer.parseInt(request.getParameter("cid"));
	int tid = Integer.parseInt(request.getParameter("tid"));
	int id = Integer.parseInt(request.getParameter("id"));
	
	Board board = new Board(request.getParameter("cid"), request.getParameter("tid"), request.getParameter("id"));
	HttpSession tempSession = request.getSession();
	String userId = (String)tempSession.getAttribute("id");
	if (userId.equals(board.getUserId())== false){
		String msg = "게시글 작성자만 삭제할 수 있습니다.";
		out.println("<script>alert('"+msg+"');</script>");
		String s= "location.href='circle_page.jsp?cid="+request.getParameter("cid")+"&tid="+request.getParameter("tid")+"';";
		out.println("<script>"+ s+"</script>");	
		if(1==1) return;
	}
	
	int i = bc.deleteProcess(cid, tid, id);
	String msg = "게시글이 삭제 되었습니다.";
	if(i == -1) msg = "게시글 삭제가 실패했습니다.";
%>

<%
	out.println("<script>alert('"+msg+"');</script>");
	String s= "location.href='circle_page.jsp?cid="+cid+"&tid="+tid+"';";
	out.println("<script>"+ s+"</script>");
		
%>