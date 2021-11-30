<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import= "CirclePack.*" %>
<%@ page import="java.sql.*"%>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String tname = request.getParameter("tname");
	String cid = request.getParameter("cid");
	
	int id = 0;
	ResultSet rs = null;
	DBHelper db = DBHelper.getInstance();
	try {
		String sql = "select max(id) from tab_menu where cid = "+cid;
		rs = db.runSql(sql);
		rs.next();
		id = rs.getInt(1)+1;
		rs.close();
	} catch (SQLException e) {
		System.out.println(e);
	}
	
	
	String sql="INSERT INTO TAB_MENU VALUES("+id+","+cid+",'"+tname+"')";
	System.out.println(sql);

	int i = db.updateSql(sql);
	String msg = "탭 메뉴가 생성 되었습니다";
	if(i == -1) msg = "탭 메뉴 생성이 실패했습니다 ";
	out.println("<script>alert('"+msg+"');</script>");
	String s= "location.href='circle_page.jsp?cid="+cid+"';";
	out.println("<script>"+ s+"</script>");
%>