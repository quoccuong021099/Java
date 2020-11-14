package Controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/TestController")
public class TestController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public TestController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String a1=request.getParameter("txta");
		  String b1=request.getParameter("txtb");
		  if(a1 != null && b1!=null){
			  long kq= 0;
			  long a = Long.parseLong(a1);
			  long b = Long.parseLong(b1);
			  if(request.getParameter("btncong") != null)
				  kq = a+b;
			  if(request.getParameter("btntru") != null)
				  kq = a-b;
			  if(request.getParameter("btnnhan") != null)
				  kq = a*b;
			  if(request.getParameter("btnchia") != null)
				  kq = a/b;
			  request.setAttribute("a", a);
			  request.setAttribute("b", b);
			  request.setAttribute("kq", kq);
		  }
		  RequestDispatcher rd = request.getRequestDispatcher("maytinh1.jsp");
		  rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
