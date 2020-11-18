<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<linkhref="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,900;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="asset/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="asset/plugins/font-awesome/css/all.min.css">
<link rel="stylesheet" href="asset/css/index.css">
<link rel="stylesheet" href="asset/css/style.css">
</head>
<style>
 body{
 
 background-color: #071019;
 color: #fff;
 }
 .container{
 	margin: 200px auto;
 }
</style>
<body>
	<div class="container">
	 <img src="asset/img/canhbao.png" style="float: left">
	 <br><br><br><br>
	 <h1 >
	<%
		out.print("Sai tên đăng nhập hoặc mật khẩu!");
	%>
	</h1>
	<br>
	<a href="TrangchuController"><button class="btn btn-primary">Đăng nhập lại</button></a>
	</div>
</body>
</html>