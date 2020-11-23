<%@page import="bean.loaibean"%>
<%@page import="bo.loaibo"%>
<%@page import="bo.giohangbo"%>
<%@page import="dao.LSMHdao"%>
<%@page import="bean.viewbean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<linkhref="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,900;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="asset/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="asset/plugins/font-awesome/css/all.min.css">
<link rel="stylesheet" href="asset/css/index.css">
<title>Insert title here</title>
<style type="text/css">

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


<%String un1 = (String)session.getAttribute("tendangnhap"); if(un1 == un){%>

<div class="container">
	<h4 >Lịch sử mua hàng</h4>
	
	<table class="container table table-hover table-border">
		<tr>
			<td>Mã KH</td>
			<td>Họ Tên</td>
			<td>Tên Sách</td>
			<td>Ngày Mua</td>
			<td>Địa Chỉ</td>
			<td>Số Lượng</td>
			<td>Giá</td>
			<td>Thành Tiền</td>
		</tr>

		 <%
			LSMHdao vdao = new LSMHdao();
		ArrayList<viewbean>listview = vdao.getview();
		for (viewbean ab : listview) {
		%>

		<tr>
			<td><%=ab.getMakh()%></td>
			<td><%=ab.getHoten()%></td>
			<td><%=ab.getTensach()%></td>
			<td><%=ab.getNgaymua()%></td>
			<td><%=ab.getDiachi()%> </td>
			<td><%=ab.getSoluong()%></td>
			<td><%=ab.getGia()%>VNĐ</td>
			<td><%=ab.getTt()%>VNĐ</td>
		</tr>
		<%
			}
		%> 
	</table>
</div>
<%} %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>