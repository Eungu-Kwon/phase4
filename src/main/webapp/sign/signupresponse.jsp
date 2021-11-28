<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*, Circle.DBHelper" %>
<!DOCTYPE html>
<%

request.setCharacterEncoding("utf-8");

String id = request.getParameter("reg-id");
String pwd = request.getParameter("reg-pass");
String name = request.getParameter("reg-name");
String email = request.getParameter("reg-email");
String date = request.getParameter("reg-date");
String department = request.getParameter("reg-department");


if(department == null){
	out.println("<script>alert('학과를 선택해주세요!'); document.cookie='sign=up;'; history.back();</script>");
}
else{
	DBHelper db = DBHelper.getInstance();

	String sql = "INSERT INTO USERS VALUES('" + id + "', '" + pwd + "', '" + name + "', '" + email + "', " + department + ", TO_DATE('" + date + "', 'yyyy-mm-dd'))";

	int result = db.updateSql(sql);

	if(result == -1){
		out.println("<script>alert('입력창을 다시 확인해주세요!'); document.cookie='sign=up;'; history.back();</script>");
	}
	else{
		HttpSession hs = request.getSession();
		hs.setAttribute("id", id);
		out.println("<script>document.cookie='sign=aa; max-age=0;';</script>");
		//response.sendRedirect("main.jsp");
	}
}
%>