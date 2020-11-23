package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bo.giohangbo;

@WebServlet("/DatmuaController")
public class DatmuaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public DatmuaController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String ms=request.getParameter("ms");
		String ts=request.getParameter("ts");
		String tg=request.getParameter("tg");
		String giatam=request.getParameter("gia");
		String ml=request.getParameter("ml");
		String a=request.getParameter("anh");
		HttpSession session = request.getSession();
		if(ms!= null){
			giohangbo gh;
			//neu mua hang dau tien
			if(session.getAttribute("gh")==null){
				gh=new giohangbo(); //tạo giỏ hàng
				session.setAttribute("gh", gh); //khoi tao session
			}
			gh=(giohangbo)session.getAttribute("gh");//b1: lay session gan ra bien
			gh.Them(ms, ts,tg, Long.parseLong(giatam), 1, ml, a); //b2: thay doi bien
			session.setAttribute("gh", gh); //b3: luu bien vao session
			/* response.sendRedirect("htgio.jsp"); *///chay ra trang htgio
			RequestDispatcher rd = request.getRequestDispatcher("giohangController");
			rd.forward(request, response);
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
