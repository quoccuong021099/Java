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

@WebServlet("/SuaController")
public class SuaController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public SuaController() {
        super();
        
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		giohangbo gh= (giohangbo)session.getAttribute("gh");
		String ms=request.getParameter("ms");
		String ts=request.getParameter("ts");
		String tg=request.getParameter("tg");
		String giatam=request.getParameter("gia");
		String ml=request.getParameter("ml");
		String a=request.getParameter("anh");
		String sltam=request.getParameter("txtsl");
		/*
		 * String a2=request.getParameter("btn2"); String
		 * b2=request.getParameter("btn3");
		 */
		if(request.getParameter("btn3") != null) {
		gh.Them(ms, ts, tg, (long)0, Long.parseLong(sltam), ml, a);}
		if(request.getParameter("btn2") != null) {
		gh.Bot(ms, ts, tg, (long)0, Long.parseLong(sltam), ml, a);}
		if(request.getParameter("btn4") != null) {
			gh.bth(ms, ts, tg, (long)0, Long.parseLong(sltam), ml, a);}
		RequestDispatcher rd = request.getRequestDispatcher("htgio.jsp");
		rd.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
