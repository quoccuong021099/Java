<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%-- <%
	giohangbo gh=(giohangbo)session.getAttribute("gh");
	String sltam=request.getParameter("txtsl");
	/* gh.Them(ms, "", 0, Long.parseLong(sltam), ""); */
	session.setAttribute("gh", gh);
	response.sendRedirect("htgio.jsp");
%> --%>
<%-- <%
	String ms=request.getParameter("ms");
	String ts=request.getParameter("ts");
	String tg=request.getParameter("tg");
	String giatam=request.getParameter("gia");
	String ml=request.getParameter("ml");
	String a=request.getParameter("anh");
	String sltam=request.getParameter("txtsl");
	giohangbo gh=(giohangbo)session.getAttribute("gh");//b1: lay session gan ra bien
		gh.Them(ms, ts,tg, Long.parseLong(giatam), Long.parseLong(sltam), ml, a); //b2: thay doi bien
		session.setAttribute("gh", gh); //b3: luu bien vao session
		response.sendRedirect("htgio.jsp");//chay ra trang htgio
	
%> --%>
<%
	giohangbo gh= (giohangbo)session.getAttribute("gh");
	String ms=request.getParameter("ms");
	String ts=request.getParameter("ts");
	String tg=request.getParameter("tg");
	String giatam=request.getParameter("gia");
	String ml=request.getParameter("ml");
	String a=request.getParameter("anh");
	String sltam=request.getParameter("txtsl");
	gh.Them(ms, ts, tg, (long)0, Long.parseLong(sltam), ml, a);
	/* gh.Them(ms, "", (long)0, Long.parseLong(sltam), "", ml, a); */
	session.setAttribute("gh", gh);
	response.sendRedirect("htgio.jsp");
%>
</body>
</html>