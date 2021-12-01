<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "CirclePack.*, java.sql.*" %>

<% request.setCharacterEncoding("utf-8"); %>

<%
	String sql = "SELECT MAX(id) FROM SCHEDULES";
	DBHelper db = DBHelper.getInstance();
	
	ResultSet rs = db.runSql(sql);
	rs.next();
	int new_id = rs.getInt(1) + 1;
	
	
	
	HttpSession tempSession = request.getSession();
	if(tempSession.getAttribute("id") == null){
		out.println("<script>alert('로그아웃되었습니다.');</script>");
		String s= "location.href='/phase4/mainpage/lib/mainpage.jsp';";
		out.println("<script>"+ s+"</script>");
		if(1==1) return;
	}
	else{
		sql = "INSERT INTO SCHEDULES VALUES(" + new_id + ", '" + tempSession.getAttribute("id") + "', " + request.getParameter("cid") + ", '"
				+ request.getParameter("sel_color") + "', '" + request.getParameter("content") + "', TO_DATE('"
				+ request.getParameter("start_date") + "', 'yyyy-mm-dd'), TO_DATE('" + request.getParameter("end_date") + "', 'yyyy-mm-dd'), '"
				+ request.getParameter("title") + "')";
		int i = db.updateSql(sql);
		String msg = "게시글이 생성 되었습니다";
		if(i == -1) msg = "게시글 생성이 실패했습니다 ";
		out.println("<script>alert('"+msg+"');</script>");
		String s= "location.href='schedule.jsp?cid=" + request.getParameter("cid") + "';";
		out.println("<script>"+ s+"</script>");
	}
	
%>