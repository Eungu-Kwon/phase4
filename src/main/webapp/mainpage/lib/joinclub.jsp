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


query = "select max_person from circle where id="+cid ;
rs = dbhelper.runSql(query);
while(rs.next())
	csize=rs.getInt(1);


query="select count(*) from belongs_to b ,circle c where b.cid=c.id and c.id="+cid;
rs = dbhelper.runSql(query);
while(rs.next())
	currentsize=rs.getInt(1);


if (currentsize<=csize){
	
	String sql = "insert into belongs_to values("+cid+",'"+userid+"')";

	int result = dbhelper.updateSql(sql);
	if(result == -1){
		out.println("<script>alert('가입 실패 ');window.location.href='/phase4/mainpage/lib/mainpage.jsp' </script>");
	}
	else{
		
		out.println("<script>alert('club 가입 되었습니다! myClubs에서 더욱 자세히 확인 가능합니다.');  window.location.href='/phase4/mainpage/lib/mainpage.jsp';</script>");
		//response.sendRedirect("main.jsp");
	}
	
}
else{
	
	out.println("<script>alert('현재 회원 수보다 초과하여 club 가입을 하실 수 없습니다 ');  window.location.href='/phase4/mainpage/lib/mainpage.jsp'</script>");
	//response.sendRedirect("main.jsp");
}
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