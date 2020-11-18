<%@page import="bo.giohangbo"%>
<%@page import="bean.sachbean"%>
<%@page import="bo.sachbo"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="dao.loaidao"%>
<%@page import="dao.sachdao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home|Sách</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="asset/plugins/font-awesome/css/all.min.css">
  <link rel="stylesheet" href="asset/css/index.css">
  <style>
  body{
  background-color: #F2F2F2;}
  .over{
  white-space: nowrap; 
  overflow: hidden;
  text-overflow: ellipsis;}
  </style>
</head>
<body>
<div class="container">
	<div class="menu">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	  		<div class="container">
			<a class="navbar-brand" href="TrangchuController"><i class="fa fa-atlas"></i> Nhà Sách Lạc Việt</a>
			<ul class="navbar-nav navbar-right" >
				<li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#myModal1"><i
								class="fa fa-history"></i> Lịch sử mua hàng</a></li>
				<li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#myModal1"><i
								class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
				<li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#myModal"><i
								class="fa fa-sign-in-alt"></i>Đăng ký</a></li>
								<!-- The Modal -->
					<div class="modal" id="myModal">
					    <div class="modal-dialog">
					      <div class="modal-content">
					      
					        <!-- Modal Header -->
					        <div class="modal-header">
					          <h4 class="modal-title">Đăng ký</h4>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        
					        <!-- Modal body -->
					        <div class="modal-body" style="width=1500px;">
					          <form method="post" action="SachController">
						          <div class="form-group">
									  <label for="usr">Họ và tên</label>
									  <input type="text" class="form-control" id="usr" required>
								  </div>
								  <div class="form-group">
									  <label for="usr">Giới tính</label>
									  <select class="form-control" id="sel1" >
									    <option>Nam</option>
									    <option>Nữ</option>
									  </select>
								  </div>
								  <div class="form-group">
									  <label for="usr">Ngày sinh</label>
									  <input type="date" id="start" name="trip-start" class="form-control"
										     value="2020/11/09"
										     min="1900-01-01" max="2020-12-31" required>
								  </div>
								  <div class="form-group">
									  <label for="usr">Tên đăng nhập</label>
									  <input type="text" class="form-control" id="usr" required>
								  </div>
								  <div class="form-group">
									  <label for="usr">Mật khẩu</label>
									  <input type="password" class="form-control" id="usr" required>
								  </div>
								  <div class="form-group">
									  <label for="usr">Nhập lại mật khẩu</label>
									  <input type="password" class="form-control" id="usr" required>
								  </div>
								  <div class="form-group">
									  <label for="usr">Email</label>
									  <input type="email" class="form-control" id="usr" required>
								  </div>
								  <div class="form-group">
									  <input type="submit" class="form-control btn btn-success" id="usr" value="Đăng ký">
								  </div>
					          </form>
					        </div>
					      </div>
					    </div>
					  
					</div>
				<li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#myModal1"><i
								class="fa fa-sign-in-alt"></i> Đăng nhập</a></li>
								<!-- The Modal -->
					<div class="modal" id="myModal1">
					    <div class="modal-dialog">
					      <div class="modal-content">
					      
					        <!-- Modal Header -->
					        <div class="modal-header">
					          <h4 class="modal-title">Đăng Nhập</h4>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        
					        <!-- Modal body -->
					        <div class="modal-body" style="width=1500px;">
					          <form method="post" action="LoginController">
								  <div class="form-group">
									  <label for="usr">Tên đăng nhập</label>
									  <input type="text" name="txtusername" class="form-control" id="usr" required>
								  </div>
								  <div class="form-group">
									  <label for="usr">Mật khẩu</label>
									  <input type="password" name="txtpassword" class="form-control" id="usr" required>
								  </div>
								  
								  <div class="form-group">
									  <input type="submit" class="form-control btn btn-success" id="usr" value="Đăng nhập">
								  </div>
					          </form>
					        </div>
					      </div>
					    </div>
					  
					</div>
					
			</ul>
			</div>
		</nav>
	</div>
	
<!-- ========================================================================================== -->	
	
	      <!-- Loai sach -->
<div class="row">
	
	<div class="col-3">
		<%
			loaibo lbo=new loaibo();
			ArrayList<loaibean> ds2=lbo.getloai();
			int a=ds2.size();	
		%>
		<nav class="navbar navbar-light bg-light">
			<form class="form-inline m-auto" action="TrangchuController" method="post">
			  <div class="form-group">
				<input class="form-control mr-sm-2" style="width:50%;" type="search" placeholder="Search..." name="txttk" />
				<button class="btn btn-outline-success " type="submit" > Search</button>
			  </div>
			</form>
	    </nav>
	    <% for(int i=0;i<a;i++){ %>
			<div class="list-group">
			     <a href="TrangchuController?maloai=<%=ds2.get(i).getMaloai()%>" class="list-group-item list-group-item-action list-group-item-light">
			     <%=ds2.get(i).getTenloai() %>
			     </a>
			</div>
		<%}%>
					
	</div>
	<!-- ========================================================================================== -->
 	<%
		ArrayList<loaibean> dsloai = (ArrayList<loaibean>)request.getAttribute("dsloai");
		ArrayList<sachbean> ds= (ArrayList<sachbean>)request.getAttribute("dssach");
		int n=ds.size();
	  %>
 <div class="col-9">
 	<div class="container-card">
 	<% for(int i=0;i<n;i++){ 
		
	%>
		<div class="card" style="width: 250px; margin-top: 20px;">
		<% sachbean ss=ds.get(i); %>
		 <img  class="card-img-top" style="height: 250px;" alt="" src="<%=ss.getAnh() %>">
		  <div class="card-body">
		    <h5 class="card-title over"><%=ss.getTensach() %></h5>
		    <p class="card-text over"><%=ss.getTacgia() %></p>
		    <p class="card-text">Giá: <%=ss.getGia() %> VND</p>
		    <a href="#" data-toggle="modal" data-target="#myModal1"> 
		    <img alt="" src="asset/img/buynow.jpg"> </a> 
		  </div>
		</div> 
	<%} %>
	</div>	
 </div>
		
</div> 
</div>
</body>
</html>
