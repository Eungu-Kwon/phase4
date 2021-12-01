<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "CirclePack.*, java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	DBHelper db = DBHelper.getInstance();
	int new_id = Integer.valueOf(request.getParameter("sid"));
	
	HttpSession tempSession = request.getSession();
	if(tempSession.getAttribute("id") == null){
		out.println("<script>alert('로그아웃되었습니다.');</script>");
		String s= "location.href='/phase4/mainpage/lib/mainpage.jsp';";
		out.println("<script>"+ s+"</script>");
	}
	else{
		String sql = "DELETE FROM SCHEDULES WHERE ID=" + new_id;
		System.out.println(sql);
		int i = db.updateSql(sql);
		String msg = "게시글이 삭제 되었습니다";
		if(i == -1) msg = "게시글 삭제에 실패했습니다 ";
		out.println("<script>alert('"+msg+"');</script>");
		String s= "location.href='schedule.jsp?cid=" + request.getParameter("cid") + "';";
		out.println("<script>"+ s+"</script>");
	}
	
%>