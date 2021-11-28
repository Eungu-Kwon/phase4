<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*, Circle.DBHelper" %>
<!DOCTYPE html>
<%

request.setCharacterEncoding("utf-8");
HttpSession sess = request.getSession();
String id = request.getParameter("id");

DBHelper db = DBHelper.getInstance();

String sql = "DELETE FROM BELONGS_TO WHERE User_id='" + id + "'";
db.updateSql(sql);
sql = "DELETE USERS WHERE Id='" + id + "'";

int result = db.updateSql(sql);

if(result == -1){
	out.println("<script>alert('Error!'); history.back();</script>");
}
else {
	//TODO: go to main
	sess.invalidate();
	out.println("<script>alert('회원 정보가 삭제되었습니다.'); window.location.href='/phase4/sign/login.jsp';</script>");
}
%>