<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "CirclePack.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%

	
	String cid = request.getParameter("cid");
	String tid = request.getParameter("tid");
	String bid = request.getParameter("bid");
	String id = request.getParameter("id");
	CommentController cc = new CommentController();
	Comment comment = new Comment(request.getParameter("cid"),request.getParameter("tid"),request.getParameter("bid"),request.getParameter("id"));
	
	HttpSession tempSession = request.getSession();
	String userId = (String)tempSession.getAttribute("id");
	
	
	
	if (userId.equals(comment.getUserId())== false){
		String msg = "댓글 작성자만 삭제할 수 있습니다.";
		out.println("<script>alert('"+msg+"');</script>");
		String s= "location.href='board_page.jsp?cid="+request.getParameter("cid")+"&tid="+request.getParameter("tid")+"&id="+request.getParameter("bid")+"';";
		out.println("<script>"+ s+"</script>");
		if(1==1) return;
	}
	
	int i = cc.deleteProcess(cid, tid, bid, id);
	String msg = "댓글이 삭제 되었습니다.";
	if(i == -1) msg = "댓글 삭제를 실패했습니다.";
%>

<%
	out.println("<script>alert('"+msg+"');</script>");
	String s= "location.href='board_page.jsp?cid="+comment.getCid()+"&tid="+comment.getTid()+"&id="+comment.getBid()+"';";
	out.println("<script>"+ s+"</script>");	
		
%>