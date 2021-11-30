<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*"%>
<%@ page import= "CirclePack.*" %> 

    
<%
request.setCharacterEncoding("utf-8");
DBHelper db = DBHelper.getInstance();
/* HttpSession sess = request.getSession();
String userid = (String)sess.getAttribute("id"); 
 */
 int cid = 0;
ResultSet rs = null;

	try {
		String sql = "select max(id) from circle";
		rs = db.runSql(sql);
		rs.next();
		cid = rs.getInt(1);
		rs.close();
	} catch (SQLException e) {
		System.out.println(e);
	}
int current_cid=cid + 1;


String cname = request.getParameter("cname");
String description = request.getParameter("descr");
String master= request.getParameter("id");
String phonenum = request.getParameter("phonenum");
String thumb = request.getParameter("thumb");
String size = request.getParameter("size");
String isClub= request.getParameter("isClub");
String isMini = request.getParameter("isMini");
String choose_cate = request.getParameter("choose_cate");
String start_date = request.getParameter("start-date");
String end_date = request.getParameter("end-date");

if (isClub.equals("true")){
	isClub="Y";
	
}
else{
	isClub="N";
}




String sql = "insert into circle values("+String.valueOf(current_cid)+",'"+cname+"','"+master+"','"+phonenum+"','"+description+"',"+size+",'"+isClub+"',"+choose_cate+","+"TO_DATE( '"+start_date+"' , 'yyyy-mm-dd')"+","+"TO_DATE( '"+end_date+"' , 'yyyy-mm-dd'),'"+thumb+"')"; 
System.out.println(sql);
int result = db.updateSql(sql);

if(result == -1){
	out.println("<script>alert('입력창을 다시 확인해주세요!');  history.back();</script>");
}
else{
	System.out.println("엥");
	
	out.println("<script>alert('동아리 가입 되었습니다! My Club\'s에서 확인해보세요!');  </script>");
	response.sendRedirect("./mainpage.jsp");
	//response.sendRedirect("main.jsp");
}

	//response.sendRedirect("main.jsp");

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