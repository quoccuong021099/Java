<%@page import="bean.sachbean"%>
<%@page import="bean.loaibean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bo.loaibo"%>
<%@page import="bo.giohangbo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Book Store</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
<link rel="stylesheet" href="asset/plugins/font-awesome/css/all.min.css">
<link rel="stylesheet" href="asset/css/index.css">
<style>

.over{
  white-space: nowrap; 
  overflow: hidden;
  text-overflow: ellipsis;}
.bg-success{
background-color: #E0E6F8!important;
}	
  
 .timkiem{
 	position: relative;
 }
 .tk{
  position: absolute;
  background-color: #343a40;
  padding: 10px;
  display: none;
  box-sizing: border-box;
 }
 .timkiem:hover .tk{
 	 display: block;
  top: 100%;
  left: 0px;
  z-index: 2; 	
 }
 
 
</style>
</head>
<body>

<%String un = (String)session.getAttribute("tendangnhap");%>
<%	loaibo lbo=new loaibo();
	ArrayList<loaibean> ds2=lbo.getloai();
	int a=ds2.size();	
%>
<div class="navbar navbar-expand-lg  navbar-dark bg-dark static-top  ">
  <div class="container">
    <a class="navbar-brand" href="SachController"><i class="fa fa-atlas"></i> Nhà Sách Lạc Việt</a>
    <button class="navbar-toggler cde" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarResponsive">
      <ul class="navbar-nav ml-auto">
      	<%if(un== null){%>
      	<li class="nav-item active timkiem">
          <a class="nav-link " href="#" data-toggle="modal" data-target="#myModal2"><i class="fas fa-search-plus"></i> Tìm kiếm</a>
        <form class="form-inline  my-2 my-lg-0 tk" action="SachController" method="post">
	         	<input class="form-control"   type="search" placeholder="Search" aria-label="Search" name="txttk">
	        	<button class="btn btn-outline-success my-2 my-sm-0 "  type="submit">Search</button>
	    </form>
        </li>
        
        <li class="nav-item ">
          <a class="nav-link" href="#"><i class="fa fa-shopping-cart"></i> Giỏ hàng</a>
        </li>
        <li class="nav-item ">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal"><i class="fa fa-sign-in-alt"> </i> Đăng ký</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#myModal1"><i class="fa fa-sign-in-alt"></i> Đăng nhập</a>
        </li>
        

        <%}%>
        <%if(un!=null){%>
			<li class="nav-item active"><a class="nav-link" href="#" >
	  							<%out.print("Xin Chào, "+ un);%></a></li>
	  		<li class="nav-item  timkiem">
	         	<a class="nav-link " href="#" data-toggle="modal" data-target="#myModal2"><i class="fas fa-search-plus"></i> Tìm kiếm</a>
		        <form class="form-inline  my-2 my-lg-0 tk" action="SachController" method="post">
			         	<input class="form-control"   type="search" placeholder="Search" aria-label="Search" name="txttk">
			        	<button class="btn btn-outline-success my-2 my-sm-0 "  type="submit">Search</button>
			    </form>
	        </li>
	  		<li class="nav-item"><a class="nav-link" href="LSMH.jsp" ><i
					class="fa fa-history"></i> Lịch sử mua hàng</a></li>
			<li class="nav-item"><a class="nav-link" href="giohangController" ><i
			class="fa fa-shopping-cart"></i> Giỏ hàng
			<% giohangbo gh1=(giohangbo)session.getAttribute("gh");%>
	          	<% if (gh1==null){ %>
	         		 	<h6 style=" display:inline-block; color:#fff; ">(0)</h6>
	          	<%} %>
	          	<%if(gh1!=null){ %>
	          			<h6 style=" display:inline-block; color:#fff; "> (<%=gh1.ds.size() %>) </h6>
	        <%} %></a></li>
			<li class="nav-item"><a class="nav-link" href="LogoutController" ><i
					class="fa fa-sign-in-alt"></i>Đăng xuất</a></li>
		<%}%>
      </ul>
    </div>
  </div>
</div>

<div class="navbar navbar-expand-lg  navbar-dark bg-success">
	<div class="container">
		<div class="row">
			<% for(int i=0;i<a;i++){ %>
			<a class="btn col-lg-3 col-md-4  col-6" href="SachController?maloai=<%=ds2.get(i).getMaloai()%>" ><%=ds2.get(i).getTenloai() %></a>
			<%}%>
		</div>	
	</div>
</div>
<% ArrayList<loaibean> dsloai = (ArrayList<loaibean>)request.getAttribute("dsloai");
	ArrayList<sachbean> ds= (ArrayList<sachbean>)request.getAttribute("dssach");
	int n=ds.size();%>
<div class="container">
<div class="row">
<% for(int i=0;i<n;i++){ sachbean ss=ds.get(i); %>
  <div class="col-lg-3 col-md-4 col-sm-6 col-12">
  <div class="card m-2" style="width:250px">
    <img class="card-img-top" src="<%=ss.getAnh() %>" alt="Card image" style="width:100%;height:250px;">
    <div class="card-body">
      <h4 class="card-title over"><%=ss.getTensach() %></h4>
      <p class="card-text over"><%=ss.getTacgia() %></p>
      <p class="card-text">Giá: <%=ss.getGia()%> VND</p>
      <%if(un== null){%>
			<a 
				href="#" data-toggle="modal" data-target="#myModal1">
				<img alt="" src="asset/img/buynow.jpg">
			</a> <%} %>
		    <%if(un!= null){%>
		    <a 
				href="DatmuaController?ms=<%=ss.getMasach()%>&ts=<%=ss.getTensach()%>&tg=<%=ss.getTacgia()%>&gia=<%=ss.getGia()%>&ml=<%=ss.getMaloai()%>&anh=<%=ss.getAnh()%>">
				<img alt="" src="asset/img/buynow.jpg">
			</a>
		<%} %>
    </div>
  </div>
  </div>
<%} %>
</div>

</div>
<!-- Modal -->
<!-- The Modal đăng ký -->
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
		  <form method="post" action="DangkyController">
			<div class="form-group">
				 <label for="usr">Họ và tên</label>
				 <input type="text" class="form-control" name="txtname"  required>
			</div>
			<div class="form-group">
				 <label for="usr">Địa chỉ</label>
				 <input type="text" class="form-control" name="txtdiachi"  required>
			</div>
			<div class="form-group">
				 <label for="usr">Điện thoại</label>
				 <input type="text" class="form-control" name="sodt"  required>
			</div>
			<div class="form-group">
				 <label for="usr">Ngày sinh</label>
				 <input type="date" id="start"  class="form-control"
				     value="2020/11/09"
				     min="1900-01-01" max="2020-12-31" required>
			</div>
			<div class="form-group">
				 <label for="usr">Email</label>
				 <input type="email" class="form-control"  name="txtemail" required>
			</div>
			<div class="form-group">
				 <label for="usr">Tên đăng nhập</label>
				 <input type="text" class="form-control" " name="txtun" required>
			</div>
			<div class="form-group">
				 <label for="usr">Mật khẩu</label>
				 <input type="password" class="form-control" name="txtpass"  required>
			</div>
			<div class="form-group">
				 <input type="submit" class="form-control btn btn-success"  value="Đăng ký">
			</div>
		  </form>
		</div>
	  </div>
    </div>
</div>
			<!-- The Modal đăng nhập -->
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
				  <input type="text" name="txtun" class="form-control" id="usr" required>
			  </div>
			  <div class="form-group">
				  <label for="usr">Mật khẩu</label>
				  <input type="password" name="txtpass" class="form-control" id="usr" required>
			  </div>
			  
			  <div class="form-group">
				  <input type="submit" class="form-control btn btn-success" id="usr" value="Đăng nhập">
			  </div>
          </form>
        </div>
      </div>
    </div>
</div> 
</body>
</html>