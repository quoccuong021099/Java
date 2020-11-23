package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.HoaDonbean;
import bean.giohangbean;
import bo.DatHangBo;
import bo.giohangbo;

@WebServlet("/HoaDonController")
public class HoaDonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    HoaDonbean HD = new HoaDonbean();
   
    public HoaDonController() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		String tendn=null;
		tendn=(String) session.getAttribute("tendangnhap");
		if(tendn ==null) {
			RequestDispatcher rd1=request.getRequestDispatcher("SachController");
			rd1.forward(request, response);
		}
		else {
			boolean damua=true;
			DatHangBo datHangBo = new DatHangBo();
			try {
				datHangBo.ThemHoaDon(tendn, damua);
				giohangbo gh;
				gh=(giohangbo)session.getAttribute("gh");
				for (giohangbean g:gh.ds) 
				{
				HD.setMaSach(g.getMasach());
				HD.setSoLuongMua(g.getSoluong());
				datHangBo.themCTHD(HD);
				}
				session.removeAttribute("gh"); // khi đặt hàng thành công thì xóa đi dữ liệu của hóa đơn đó
				RequestDispatcher rd1=request.getRequestDispatcher("SachController");
				rd1.forward(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}