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
<title>Trang Chủ | Sách</title>
<linkhref="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,900;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">

<link rel="stylesheet"  href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>

<body>


<div class="container">


 <div class="menu">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="nav-right">
				<a class="navbar-brand" href="TrangchuController"><i class="fa fa-atlas"></i> Nhà Sách Lạc Việt</a>
			</div>
			<div class="nav-left">
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fas fa-history"></i> Lịch sử mua hàng</a></li>
						<li class="nav-item"><a class="nav-link" href="DangnhapController"><i
								class="fas fa-shopping-cart"></i> Giỏ hàng</a></li>
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fas fa-sign-in-alt"></i> 
				<button type="button" class="btn-dk" data-toggle="modal" data-target="#myModal">Đăng ký</button></a></li>
						<li class="nav-item"><a class="nav-link" href="DangnhapController"><i
								class="fas fa-sign-in-alt"></i> Đăng
								nhập</a></li>
								
								
					</ul>
				</div>
			</div>
			
			
		</nav>
	</div>

      <!-- Loai sach -->
<div class="row">
<%
	loaibo lbo=new loaibo();
	ArrayList<loaibean> ds2=lbo.getloai();
	int a=ds2.size();	
%>
<div class="col-3">
 <nav class="navbar navbar-light bg-light">
            <form class="form-inline m-auto" action="TrangchuController" method="post">
              <input
                class="form-control mr-sm-2"
                type="search"
                placeholder="Search..."
                name="txttk"
                style="width: 1zzz0px;"
              />
              <button
                class="btn btn-outline-success my-2 my-sm-0"
                type="submit"
              >
                Search
              </button>
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

    <!-- Content -->

    <div class="col-9">
      <%
	
		ArrayList<loaibean> dsloai = (ArrayList<loaibean>)request.getAttribute("dsloai");
		ArrayList<sachbean> ds= (ArrayList<sachbean>)request.getAttribute("dssach");
		int n=ds.size();
	%>     
    <div class=container-card>
	<% for(int i=0;i<n;i++){ %>
	<div class="card" >
	<% sachbean ss=ds.get(i); %>
		<img  class="card-img-top" alt="" src="<%=ss.getAnh() %>">
		<div class="card-body">
		 <h6 class="card-title"><%=ss.getTensach() %></h6>
		 <p class="card-text"><%=ss.getTacgia() %></p>
		  <p class="card-text">Giá: <%=ss.getGia() %> VND</p>
		<a href="DangnhapController"> <img alt="" src="asset/img/buynow.jpg"> </a> 
		</div>
	</div>
<%} %>
    </div>
    </div>
</div> 
</div>


</body>
</html>
<!-- 
<div class="container">
  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">Đăng ký</button>
  Modal
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      Modal content
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title-1">Đăng ký</h4>
        </div>
        <div class="modal-body">
          <form method="post" action="TrangchuController">
          <label>Họ và tên</label>
          	<input type="text" name="txtTen" class="form-control">
          	<br>
            <label>Tuổi</label>
          	<input type="number" name="txtTuoi" class="form-control" min="1" value="1">
          	<br>
          	<label>Số điện thoại</label>
          	<input type="number" name="txtTuoi" class="form-control" min="1" >
          	<br>
          	<label>Email</label>
          	<input type="Email" name="tkkt" class="form-control">
          	<br>
          <label>Tên đăng nhập</label>
          	<input type="text" name="tkkt" class="form-control">
          	<br>
            <label> Mật khẩu</label>
          	<input type="password" name="mk" class="form-control">
          	<br>
          	<input type="submit" name="dangky" class="btn btn-outline-success" value="Đăng ký">
          </form>
        </div>
       
      </div>
      
    </div>
  </div>
  
</div> -->

<!-- <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
      Modal content
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title-1">Đăng ký</h4>
        </div>
        <div class="modal-body">
          <form method="post" action="TrangchuController">
          <label>Họ và tên</label>
          	<input type="text" name="txtTen" class="form-control">
          	<br>
            <label>Tuổi</label>
          	<input type="number" name="txtTuoi" class="form-control" min="1" value="1">
          	<br>
          	<label>Số điện thoại</label>
          	<input type="number" name="txtTuoi" class="form-control" min="1" >
          	<br>
          	<label>Email</label>
          	<input type="Email" name="tkkt" class="form-control">
          	<br>
          <label>Tên đăng nhập</label>
          	<input type="text" name="tkkt" class="form-control">
          	<br>
            <label> Mật khẩu</label>
          	<input type="password" name="mk" class="form-control">
          	<br>
          	<input type="submit" name="dangky" class="btn btn-outline-success" value="Đăng ký">
          </form>
        </div>
       
      </div>
      
    </div>
  </div> -->