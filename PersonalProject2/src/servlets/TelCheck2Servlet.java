package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LoginDao;
import dao.UserDao;

@WebServlet("/TelCheck2")
public class TelCheck2Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			String tel = request.getParameter("tel");
			
			UserDao dao = new UserDao();
			String phone = dao.getTel(tel);
			
			if (tel.equals(phone)) {
				out.print("me");
			} else {
				out.print("no");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
