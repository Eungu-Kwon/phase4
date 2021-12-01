<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page import= "CirclePack.*" %>
<!DOCTYPE html>
<%

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
String pwd = request.getParameter("pass");
String name = request.getParameter("name");
String email = request.getParameter("email");
String date = request.getParameter("date");
String department = request.getParameter("department");


DBHelper db = DBHelper.getInstance();

String sql;
if (!pwd.equals(""))
	sql = "UPDATE USERS SET Pwd='" + pwd + "', Email='" + email + "', Birth_date=TO_DATE('" + date + "', 'yyyy-mm-dd'), Did=" + department + " WHERE Id='" + id + "'";
else 
	sql = "UPDATE USERS SET Email='" + email + "', Birth_date=TO_DATE('" + date + "', 'yyyy-mm-dd'), Did=" + department + " WHERE Id='" + id + "'";

int result = db.updateSql(sql);
if(result == -1){
	out.println("<script>alert('입력창을 다시 확인해주세요!'); history.back();</script>");
}
else {
	out.println("<script>alert('회원정보가 업데이트 되었습니다!');</script>");
	String s= "location.href='/phase4/mainpage/lib/mainpage.jsp';";
	out.println("<script>"+ s+"</script>");
}
%>