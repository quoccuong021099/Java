package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try (PrintWriter out = response.getWriter()){
			String _username= request.getParameter("txtusername");
			String _password= request.getParameter("txtpassword");
			try {
				if(_username != null) {
					
					Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
					String url="jdbc:sqlserver://localhost:1433;databaseName=QlSach;user=sa; password=123;\r\n" + 
							"\r\n" + 
							"";
					Connection conn = DriverManager.getConnection(url);
					String Query = "select* from DangNhap where TenDangNhap = ? and MatKhau = ?";
					PreparedStatement psm = conn.prepareStatement(Query);
					psm.setString(1, _username);
					psm.setString(2, _password);
					ResultSet rs = psm.executeQuery();
					if(rs.next()) {
						response.sendRedirect("SachController?_username="+_username+"");
					}
					else {
						response.sendRedirect("DangNhap.jsp");
					}
				}
			} catch (Exception e) {
				out.println("Exception : "+e.getMessage());
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
