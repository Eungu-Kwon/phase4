<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*, java.util.Date"%>
<%@ page import= "CirclePack.*" %> 

    
<%
request.setCharacterEncoding("utf-8");
DBHelper db = DBHelper.getInstance();
/* HttpSession sess = request.getSession();
String userid = (String)sess.getAttribute("id"); 
 */

ResultSet rs = null;


int cid = 0;
Circle circle = new Circle(request.getParameter("cid"));

String description = request.getParameter("description");
String master= request.getParameter("manager");
String phonenum = request.getParameter("phonenum");
String thumb = request.getParameter("thumb");
String size = request.getParameter("size");
String choose_cate = request.getParameter("choose_cate");
String start_date = request.getParameter("start-date");
String end_date = request.getParameter("end-date");

circle.setDescription(description);
circle.setManager(master);
circle.setPhoneNum(phonenum);
circle.setThumbnail(thumb);
circle.setMax_person(Integer.parseInt(size));

//java.util.Date util_StartDate = transformat.parse( req.getParameter("startDate") );
//java.sql.Date sql_StartDate = new java.sql.Date( util_StartDate.getTime() );

SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
java.util.Date util_StartDate = transFormat.parse(start_date);
java.util.Date util_EndDate = transFormat.parse(end_date);
java.sql.Date sdate = new java.sql.Date( util_StartDate.getTime() );
java.sql.Date edate = new java.sql.Date( util_EndDate.getTime() );

circle.setStartDate(sdate);
circle.setEndDate(edate);


int i = circle.updateCircle();
String msg = "동아리가 수정되었습니다";
if(i == -1) msg = "게시글 수정이 실패했습니다 ";

out.println("<script>alert('"+msg+"');</script>");
String s= "location.href='circle_page.jsp?cid="+circle.getId()+"';";
out.println("<script>"+ s+"</script>");
%>