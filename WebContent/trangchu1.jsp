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
  .margin{
  padding-left: 495px;
  }
   .margin1{
  padding-left: 350px;
  }
  </style>
</head>
<body>


<%
	String un = (String)session.getAttribute("tendangnhap");%>
	
						
<div class="container">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark ">
  <a class="navbar-brand" href="SachController"><i class="fa fa-atlas"></i> Nhà Sách Lạc Việt</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse " id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto ">
      <%if(un== null){%> 
				<li class="nav-item"><a class="nav-link" href="#" ><i
								class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
				<li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#myModal"><i
								class="fa fa-sign-in-alt"></i>Đăng ký</a></li>
				<li class="nav-item"><a class="nav-link" href="#" data-toggle="modal" data-target="#myModal1"><i
				class="fa fa-sign-in-alt"></i> Đăng nhập</a></li>
						<%}%>	
						
					<%if(un!=null){%>
						<li class="nav-item "><a class="nav-link" href="#" >
      							<%out.print("Xin Chào, "+ un);%></a></li>
						<li class="nav-item"><a class="nav-link" href="#" ><i
								class="fa fa-history"></i> Lịch sử mua hàng</a></li>
						<li class="nav-item"><a class="nav-link" href="giohangController" ><i
						class="fa fa-shopping-cart"></i> Giỏ hàng</a></li>
						<% giohangbo gh1=(giohangbo)session.getAttribute("gh");%>
			           	<% if (gh1==null){ %>
			          		 	<h6 style="text-align:center; color:#fff; ">0</h6>
			           	<%} %>
			           	<%if(gh1!=null){ %>
			           			<h6 style="text-align:center; color:#fff; "> <%=gh1.ds.size() %> </h6>
			         <%} %>
						<li class="nav-item"><a class="nav-link" href="LogoutController" ><i
								class="fa fa-sign-in-alt"></i>Đăng xuất</a></li>
						<%}%>	
    </ul>
    
  </div>
</nav>
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
				<input class="form-control mr-sm-2" style="width:50%;" type="search" placeholder="Search..." name="txttk" />
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
		    
		    <%if(un== null){%>
			<a
				href="#" data-toggle="modal" data-target="#myModal1">
				<img alt="" src="asset/img/buynow.jpg">
			</a>
			
			<%} %>
		    <%if(un!= null){%>
		    <a
				href="DatmuaController?ms=<%=ss.getMasach()%>&ts=<%=ss.getTensach()%>&tg=<%=ss.getTacgia()%>&gia=<%=ss.getGia()%>&ml=<%=ss.getMaloai()%>&anh=<%=ss.getAnh()%>">
				<img alt="" src="asset/img/buynow.jpg">
			</a>
			<%} %>
			
		  </div>
		</div> 
	<%} %>
	</div>	
 </div>
		
</div> 
</div>



	
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
