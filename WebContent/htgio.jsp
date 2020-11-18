<%@page import="bean.giohangbean"%>
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
<title>Sách</title>
<linkhref="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,900;1,300;1,400;1,500;1,700&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="asset/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="asset/plugins/font-awesome/css/all.min.css">
<link rel="stylesheet" href="asset/css/index.css">
<link rel="stylesheet" href="asset/css/style.css">
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
			          		 	<h6 style="text-align:center; color:#fff; ">0</h6>
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


 <div class="row">
			<%
				loaibo lbo=new loaibo();
				ArrayList<loaibean> ds2=lbo.getloai();
				int a=ds2.size();
			%>
			<div class="col-3">
		 <nav class="navbar navbar-light bg-light">
		            <form class="form-inline m-auto" action="SachController" method="post">
		              <input
		                class="form-control mr-sm-2"
		                type="search"
		                placeholder="Search..."
		                name="txttk"
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
			     <a href="SachController?maloai=<%=ds2.get(i).getMaloai()%>" class="list-group-item list-group-item-action list-group-item-light">
			     <%=ds2.get(i).getTenloai() %>
			     </a>
			</div>
			<%}%>			
		</div> 
		
	
<div class="col-9">
	<div class="row">	
		<div class="col-9">
			<h1 class="text-center" style="background-color: #FBF8EF; color: #FE2E2E">Giỏ hàng</h1>
			<div class="container-card">
			 	
				<% 
					giohangbo gh=(giohangbo) session.getAttribute("gh");
				if(gh!=null){
					for(giohangbean g: gh.ds){ %>
					<div class="card" style="width: 250px; margin-top: 20px; padding: 5px">
					 <img  class="card-img-top" style="height: 250px;" alt="" src="<%=g.getAnh() %>">
					  <div class="card-body">
					    <h5 class="card-title over"><%=g.getTensach() %></h5>
					    <p class="card-text over"><%=g.getTacgia() %></p><br>	
					    <form method="post" action="SuaController?ms=<%=g.getMasach()%>">
				    		<input style=" width: 100px" name="txtsl" type="text" min="1" value="<%=g.getSoluong()%>">
				    		
				    		<input class="btn btn-success" style="padding:0px 8px"name="btn2" type="submit" value="-">
				    		<input class="btn btn-success" style="padding:0px 5px" name="btn3" type="submit" value="+">
				    		
				    		<br>	<br>	
				    		<h5 class="card-text">Thành tiền: <br>	<%=g.getThanhtien() %> VND</h5>
				    		<br>
				    		<button class="btn btn-danger"><a style="margin-top:0;color:#fff;" href="XoaController?ms=<%=g.getMasach()%>">Delete</a></button>
				    		<button class="btn btn-success"><a style="margin-top:0;margin-left:0;color:#fff;" href="#">Thanh Toán</a></button>
				  		</form>
					    
					     
					  </div>
					</div> 
				<%}} %>
			</div>	
		</div>
		
		<%
		giohangbo ab=(giohangbo) session.getAttribute("gh");
				if (ab != null) {
			%>
			<div class="col-3">
			<table class="table table-bordered" style="background-color: #FBF8EF">
			  <thead>
			    <tr>
			      <th scope="col" colspan="3">Tổng tiền: <%=gh.tongtien()%>đ</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <td colspan="3">
			     	 <a class="tiep-tuc-mua-hang" href="SachController">Tiếp tục mua hàng</a>
			      </td>
			    </tr>
			    <td colspan="3">
			     	 <a class="tiep-tuc-mua-hang" href="SachController">Thanh Toán</a>
			      </td>
			    </tr>
			  </tbody>
			</table>
				
			<%
				} else {
			%>
			<h5 style="margin-top: 50px; margin-left: 160px">Không có sản phẩm nào trong giỏ hàng!</h5>
			<%
				}
			%>	
	</div>		
</div>		
</div> 
</div>
</body>
</html>