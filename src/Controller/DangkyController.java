package Controller;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dungchung;

/**
 * Servlet implementation class DangkyController
 */
@WebServlet("/DangkyController")
public class DangkyController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DangkyController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			Random makh = new Random();
			int ID= makh.nextInt();
			String hoten = request.getParameter("txtname");
			String diachi = request.getParameter("txtdiachi");
			String sodt = request.getParameter("sodt");
			String email = request.getParameter("txtemail");
			String un=request.getParameter("txtun");
			String pass=request.getParameter("txtpass");
			
			Dungchung dc =new Dungchung();dc.KetNoi();
			//B2 thiet lap cau lenh
			String sql="insert into KhachHang values(?,?,?,?,?,?,?)";
			//B3 lấy dữ liệu
			PreparedStatement cmd = dc.cn.prepareStatement(sql);
			cmd.setInt(1,ID);
			cmd.setString(2,hoten);
			cmd.setString(3,diachi);
			cmd.setString(4,sodt);
			cmd.setString(5,email);
			cmd.setString(6,un);
			cmd.setString(7,pass);cmd.executeUpdate();
			RequestDispatcher rd = request.getRequestDispatcher("LoginController");
			rd.forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
