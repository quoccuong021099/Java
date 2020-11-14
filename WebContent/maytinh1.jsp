<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> hello <%=session.getAttribute("cuong") %></h1>
	<form method="post" action="TestController">
		a= <input type="number" name="txta" placeholder="Nhap a"
		value= "<%=request.getAttribute("a")%>" >
		<br>
		b= <input type="number" name="txtb" placeholder="Nhap b"
		value= "<%=request.getAttribute("b")%>">
		<br>
		kq= <input type="number" name="txtkq" 
		value= "<%=request.getAttribute("kq")%>">
		<br>
		<input type="submit" name="btncong" value="+">
		<input type="submit" name="btntru" value="-">
		<input type="submit" name="btnnhan" value="*">
		<input type="submit" name="btnchia" value="/">
		
	</form>

	
</body>
</html>