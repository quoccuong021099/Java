<%@page import="bean.giohangbean"%>
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
 .fixed-bottom{
 background-color: #343a40;
 height: 7%;
 }
 .margin{
 margin-top: 100px}
 .position{
 position:absolute;
 right: 0;
 padding: 10px;
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
	  		<li class="nav-item"><a class="nav-link" href="#" ><i
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
			<button class="btn col-lg-3 col-md-4  col-6"><a href="SachController?maloai=<%=ds2.get(i).getMaloai()%>" ><%=ds2.get(i).getTenloai() %></a></button>
			<%}%>
		</div>	
	</div>
</div>
<div class="container">
<%-- <h2 class="text-center">Giỏ hàng</h2>
	<div class="row">
	<div class="col-4">	
	<% giohangbo gh=(giohangbo) session.getAttribute("gh"); if(gh!=null){for(giohangbean g: gh.ds){ %>
	  <div class="card m-2 " style="width:250px">
	      
	      <img  class="card-img-top" style="height: 250px;" alt="" src="<%=g.getAnh() %>">
		  <div class="card-body">
		    <h5 class="card-title over"><%=g.getTensach() %></h5>
		    <p class="card-text over"><%=g.getTacgia() %></p>	
		    <form method="post" action="SuaController?ms=<%=g.getMasach()%>">
		   		<input style=" width: 50px" name="txtsl" type="text" min="1" value="<%=g.getSoluong()%>">
		   		<input class="btn btn-success" style="padding:0px 8px"name="btn2" type="submit" value="-">
		   		<input class="btn btn-success" style="padding:0px 5px" name="btn3" type="submit" value="+">
		   		<h6 class="card-text" style="font-size:18px">Tổng tiền: <%=g.getThanhtien() %> VND</h6>
		   		<button class="btn btn-danger"><a style="margin-top:0;color:#fff;" href="XoaController?ms=<%=g.getMasach()%>">Delete</a></button>
		   		<button class="btn btn-success"><a style="margin-top:0;margin-left:0;color:#fff;" href="#">Thanh Toán</a></button>
		 		</form>
		  </div>
	   </div>
	   </div>
	  </div>
<%}} %> --%>
<div class="row">	
<div class="col-12">
	<h2 class="text-center">Giỏ hàng</h2>
	<div class="container-card">
	<% giohangbo gh=(giohangbo) session.getAttribute("gh"); if(gh!=null){ for(giohangbean g: gh.ds){ %>
			<div class="card" style="width: 250px;">
			 <img  class="card-img-top" style="height: 250px;" alt="" src="<%=g.getAnh() %>">
			  <div class="card-body">
			    <h5 class="card-title over"><%=g.getTensach() %></h5>
			    <p class="card-text over"><%=g.getTacgia() %></p>	
			    <form method="post" action="SuaController?ms=<%=g.getMasach()%>">
		    		<input style=" width: 100px" name="txtsl" type="text" min="1" value="<%=g.getSoluong()%>">
		    		<input class="btn btn-success" style="padding:0px 8px"name="btn2" type="submit" value="-">
		    		<input class="btn btn-success" style="padding:0px 5px" name="btn3" type="submit" value="+"> 
		    		<h5 class="card-text" style="font-size:18px">Thành tiền: <%=g.getThanhtien() %> VND</h5>
		    		<button class="btn btn-danger"><a style="margin-top:0;color:#fff;" href="XoaController?ms=<%=g.getMasach()%>">Delete</a></button>
		    		<button class="btn btn-success"><a style="margin-top:0;margin-left:0;color:#fff;" href="#">Thanh Toán</a></button>
		  		</form>
			  </div>
			</div> 
		<%}} %>
	</div>	
</div>
<div class="container margin">
<% giohangbo ab=(giohangbo) session.getAttribute("gh"); if (ab != null) { %>
	<div class="fixed-bottom">
		<div class="position">
	     <h4 style="margin-right:30px;  display: inline-block; color:#fff;!important">Tổng tiền: <%=gh.tongtien()%>đ</h4>
	   	 <a class="tiep-tuc-mua-hang btn btn-primary"  href="SachController">Thanh Toán</a> 
	   	 <a class="tiep-tuc-mua-hang btn btn-primary"  href="SachController">Tiếp tục mua hàng</a> 
	   	</div> 
	<% } else { %> <h5 class="text-center">Không có sản phẩm nào trong giỏ hàng!</h5> <% }  %>	
	</div>		
</div>	
</body>
</html>