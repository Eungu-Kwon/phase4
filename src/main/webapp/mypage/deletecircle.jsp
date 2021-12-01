<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page import= "CirclePack.*" %>
<!DOCTYPE html>
<%

request.setCharacterEncoding("utf-8");

String id = request.getParameter("id");
int cid = Integer.parseInt(request.getParameter("cid"));

DBHelper db = DBHelper.getInstance();
String query = "select cur_person from circle where id=" + cid + " FOR UPDATE";
String sql = "DELETE FROM BELONGS_TO WHERE User_id='" + id + "' AND Cid=" + cid;
ResultSet rs = db.runSql(query);
rs.next();
int person_count = rs.getInt(1);
int result = db.updateSqlWithoutCommit(sql);

if(result == -1){
	out.println("<script>alert('에러가 발생하였습니다!" + id + "'); history.back();</script>");
}
else {
	query = "UPDATE CIRCLE SET Cur_person=" + (person_count - 1) + " WHERE id="+cid;
	db.updateSqlWithoutCommit(query);
	out.println("<script>alert('탈퇴하였습니다!'); window.location.href='mypage.jsp'</script>");
}
db.doCommit();
%>