<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "CirclePack.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	
	CommentController cc = new CommentController();
	Comment comment = new Comment(request.getParameter("cid"),request.getParameter("tid"),request.getParameter("id"));
	comment.setContent(request.getParameter("content"));
	HttpSession tempSession = request.getSession();
	comment.setUserId((String)tempSession.getAttribute("id"));
	System.out.println(comment.getCid());
	System.out.println(comment.getTid());
	System.out.println(comment.getBid());
	System.out.println(comment.getId());
	int i = cc.createProcess(comment);
	String msg = "댓글이 생성 되었습니다";
	if(i == -1) msg = "댓글 생성이 실패했습니다 ";
	out.println("<script>alert('"+msg+"');</script>");
	String s= "location.href='board_page.jsp?cid="+comment.getCid()+"&tid="+comment.getTid()+"&id="+comment.getBid()+"';";
	out.println("<script>"+ s+"</script>");

		
%>