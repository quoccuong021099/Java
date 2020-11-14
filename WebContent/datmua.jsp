<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
<%
	String ms=request.getParameter("ms");
	String ts=request.getParameter("ts");
	String tg=request.getParameter("tg");
	String giatam=request.getParameter("gia");
	String ml=request.getParameter("ml");
	String a=request.getParameter("anh");
	if(ms!= null){
		giohangbo gh;
		//neu mua hang dau tien
		if(session.getAttribute("gh")==null){
			gh=new giohangbo(); //tạo giỏ hàng
			session.setAttribute("gh", gh); //khoi tao session
		}
		gh=(giohangbo)session.getAttribute("gh");//b1: lay session gan ra bien
		gh.Them(ms, ts,tg, Long.parseLong(giatam), 1, ml, a); //b2: thay doi bien
		session.setAttribute("gh", gh); //b3: luu bien vao session
		response.sendRedirect("htgio.jsp");//chay ra trang htgio
	}
%>
</body>
</html>