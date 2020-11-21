package Controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.DangNhapDao;

import java.sql.*;
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public LoginController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String un = request.getParameter("txtun");
			String pass = request.getParameter("txtpass");
			//goi de kt trong db
			boolean isValid = DangNhapDao.checkLogin(un, pass);
			if(isValid) {
				HttpSession session = request.getSession();
				session.setAttribute("tendangnhap", un);
				session.setAttribute("matkhau", pass);
				RequestDispatcher rd = request.getRequestDispatcher("SachController");
				rd.forward(request, response);
			} else {
				RequestDispatcher rd = request.getRequestDispatcher("SachController");
				rd.forward(request, response);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	}

