<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page language="java" import="java.text.*, java.sql.*, Circle.DBHelper" %>
<!DOCTYPE html>
<%

HttpSession sess = request.getSession();
sess.invalidate();
response.sendRedirect("/phase4/mainpage/lib/mainpage.jsp");

%>