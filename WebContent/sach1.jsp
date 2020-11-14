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
<title>Home| Sách</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <link rel="stylesheet" href="asset/css/index.css">
  
<link rel="stylesheet" href="asset/plugins/font-awesome/css/all.min.css">
  <style>
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
			<a class="navbar-brand" href="SachController"><i class="fa fa-atlas"></i> Nhà Sách Lạc Việt</a>
			<ul class="navbar-nav navbar-right" >
				<li class="nav-item"><a class="nav-link" href="#"><i
								class="fa fa-history"></i> Lịch sử mua hàng</a></li>
				<li class="nav-item"><a class="nav-link" href="giohangController"><i
								class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
					<% giohangbo gh1=(giohangbo)session.getAttribute("gh");%>
			           	<% if (gh1==null){ %>
			          		 	<h6 style="text-align:center; color:#fff; ">0 </h6>
			           	<%} %>
			           	<%if(gh1!=null){ %>
			           			<h6 style="text-align:center; color:#fff; "> <%=gh1.ds.size() %> </h6>
			         <%} %>
				<li class="nav-item"><a class="nav-link" href="TrangchuController"><i
								class="fa fa-sign-in-alt"></i> Đăng xuất</a></li>
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
			<form class="form-inline m-auto" action="SachController" method="post">
			  <div class="form-group">
				<input class="form-control mr-sm-2" style="width:155px;" type="search" placeholder="Search..." name="txttk" />
				<button class="btn btn-outline-success " type="submit" > Search</button>
			  </div>
			</form>
	    </nav>
	    <% for(int i=0;i<a;i++){ %>
			<div class="list-group">
			     <a href="SachController?maloai=<%=ds2.get(i).getMaloai()%>" class="list-group-item list-group-item-action list-group-item-light">
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
		    <a href="DatmuaController?ms=<%=ss.getMasach()%>&ts=<%=ss.getTensach()%>&tg=<%=ss.getTacgia()%>&gia=<%=ss.getGia()%>&ml=<%=ss.getMaloai()%>&anh=<%=ss.getAnh()%>"> 
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
<%-- 
<div class="container">

 <div class="menu">
		<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
			<div class="nav-right">
				<a class="navbar-brand" href="SachController"><i class="fas fa-home"></i> Trang chủ</a>
			</div>
			<div class="nav-left">
				<div class="collapse navbar-collapse" id="navbarNavDropdown">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" href="#"><i
								class="fas fa-history"></i> Lịch sử mua hàng</a></li>
						<li class="nav-item"><a class="nav-link" href="giohangController"><i
								class="fas fa-shopping-cart"></i> Giỏ hàng</a></li>
				<% giohangbo gh=(giohangbo)session.getAttribute("gh");%>
	           	<% if (gh==null){ %>
	           	<div >0</div>
	           	<%} %>
	           	<%if(gh!=null){ %>
	           	<div> <%=gh.ds.size() %> </div>
	           	<%} %>
						<li class="nav-item"><a class="nav-link" href="SachController"> Đăng Xuất <i
								class="fas fa-sign-out-alt"></i></a></li>
								
								
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
            <form class="form-inline m-auto" action="SachController" method="post">
              <input class="form-control mr-sm-2" type="search" placeholder="Search..." name="txttk" />
              <button class="btn btn-outline-primary my-2 my-sm-0" type="submit" > Search </button>
            </form>
          </nav>
	<% for(int i=0;i<a;i++){ %>
	<div class="list-group">
	     <a href="SachController?maloai=<%=ds2.get(i).getMaloai()%>" class="list-group-item list-group-item-action list-group-item-light">
	     <%=ds2.get(i).getTenloai() %>
	     </a>
	</div>
	<%}%>			
</div>

    <!-- Content -->

    <div class="col-9">
      <%
	/* sachbo sbo=new sachbo();
	ArrayList<sachbean> ds=sbo.getsach();
	String ml = request.getParameter("maloai");
	if (ml != null)
		ds = sbo.TimSachTheoMa(ml);
	String key = request.getParameter("txttk");
	if (key != null)
		ds = sbo.TimSach(key); */
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
		<a href="DatmuaController?ms=<%=ss.getMasach()%>&ts=<%=ss.getTensach()%>&tg=<%=ss.getTacgia()%>&gia=<%=ss.getGia()%>&ml=<%=ss.getMaloai()%>&anh=<%=ss.getAnh()%>"> <img alt="" src="asset/img/buynow.jpg"> </a> 
		</div>
	</div>
<%} %>
    </div>
    </div>
</div> 
</div> --%>