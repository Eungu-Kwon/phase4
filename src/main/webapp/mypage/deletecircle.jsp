<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*, Circle.DBHelper" %>
<!DOCTYPE html>
<%

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
int cid = Integer.parseInt(request.getParameter("cid"));

DBHelper db = DBHelper.getInstance();

String sql = "DELETE FROM BELONGS_TO WHERE User_id='" + id + "' AND Cid=" + cid;

int result = db.updateSql(sql);

if(result == -1){
	out.println("<script>alert('입력창을 다시 확인해주세요!" + id + "'); history.back();</script>");
}
else {
	out.println("<script>alert('탈퇴하였습니다!'); window.location.href='mypage.jsp'</script>");
}
%>