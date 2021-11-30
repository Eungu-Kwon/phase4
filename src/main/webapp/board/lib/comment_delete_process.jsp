<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "CirclePack.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	CommentController cc = new CommentController();
	int cid = Integer.parseInt(request.getParameter("cid"));
	int tid = Integer.parseInt(request.getParameter("tid"));
	int bid = Integer.parseInt(request.getParameter("bid"));
	int id = Integer.parseInt(request.getParameter("id"));
	int i = cc.deleteProcess(cid, tid, bid,id);
	String msg = "댓글이 삭제되었습니다.";
	if(i == -1) msg = "댓글 삭제를 실패했습니다.";
	out.println("<script>alert('"+msg+"');</script>");
	String s= "location.href='board_page.jsp?cid="+cid+"&tid="+tid+"&id="+bid+"';";
	out.println("<script>"+ s+"</script>");
		
%>