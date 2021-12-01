<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*, java.util.ArrayList"%>
<%@ page import= "CirclePack.*" %>
<!DOCTYPE html>
<%

request.setCharacterEncoding("utf-8");
HttpSession sess = request.getSession();
String id = request.getParameter("id");
int result = 0;
DBHelper db = DBHelper.getInstance();
ArrayList<Integer> cid_list = new ArrayList<>();
String query = "SELECT * FROM BELONGS_TO WHERE User_id='" + id + "'";

ResultSet rs = db.runSql(query);
while(rs.next()){
	cid_list.add(rs.getInt(1));
}
for(int i = 0; i < cid_list.size(); i++){
	int cid = cid_list.get(i);
	String sql = "select cur_person from circle where id=" + cid + " FOR UPDATE";
	ResultSet circleSet = db.runSql(sql);
	circleSet.next();
	int cur_person = circleSet.getInt(1);
	sql = "DELETE FROM BELONGS_TO WHERE User_id='" + id + "' AND Cid=" + cid;
	db.updateSqlWithoutCommit(sql);
	sql = "UPDATE CIRCLE SET Cur_person=" + (cur_person - 1) + " WHERE id="+cid;
	db.updateSqlWithoutCommit(sql);
	sql = "DELETE USERS WHERE Id='" + id + "'";
	db.doCommit();
}


//int result = db.updateSql(sql);

if(result == -1){
	out.println("<script>alert('Error!'); history.back();</script>");
}
else {
	sess.invalidate();
	out.println("<script>alert('회원 정보가 삭제되었습니다.'); window.location.href='/phase4/mainpage/lib/mainpage.jsp';</script>");
}
%>