<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page import= "CirclePack.*" %>
    
    
<%
DBHelper dbhelper = DBHelper.getInstance();
String query = "";
ResultSet rs = null;
request.setCharacterEncoding("UTF-8");

HttpSession sess = request.getSession();
String userid = (String)sess.getAttribute("id"); 

String cid = request.getParameter("cid");
int csize=0;
int currentsize=0;


query = "select max_person, cur_person from circle where id="+cid + " FOR UPDATE";
rs = dbhelper.runSql(query);
if(rs.next()){
	csize=rs.getInt(1);
	currentsize=rs.getInt(2);
}

if (currentsize<=csize){
	String sql;
	
	sql = "insert into belongs_to values("+cid+",'"+userid+"')";

	int result = dbhelper.updateSqlWithoutCommit(sql);
	if(result == -1){
		out.println("<script>alert('가입 실패 ');window.location.href='/phase4/mainpage/lib/mainpage.jsp' </script>");
	}
	else{
		sql = "UPDATE CIRCLE SET Cur_person=" + (currentsize + 1) + " WHERE id="+cid;
		result = dbhelper.updateSqlWithoutCommit(sql);
		if(result == -1){
			out.println("<script>alert('가입 실패 ');window.location.href='/phase4/mainpage/lib/mainpage.jsp' </script>");
		}
		else
			out.println("<script>alert('club 가입 되었습니다! myClubs에서 더욱 자세히 확인 가능합니다.');  window.location.href='/phase4/mainpage/lib/mainpage.jsp';</script>");
		
	}
	
}
else{
	
	out.println("<script>alert('현재 회원 수보다 초과하여 club 가입을 하실 수 없습니다 ');  window.location.href='/phase4/mainpage/lib/mainpage.jsp'</script>");
	//response.sendRedirect("main.jsp");
}
dbhelper.doCommit();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>