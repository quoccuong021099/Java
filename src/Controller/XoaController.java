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

@WebServlet("/XoaController")
public class XoaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public XoaController() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); //lâìy dýÞ lên bãÌng unicode
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		giohangbo gh=(giohangbo)session.getAttribute("gh");
		gh.xoa(request.getParameter("ms"));
		RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
