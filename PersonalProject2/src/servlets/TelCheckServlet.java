package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.LoginDao;

@WebServlet("/TelCheck")
public class TelCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			String tel = request.getParameter("tel");
			
			LoginDao dao = new LoginDao();
			int result = dao.telCheck(tel);
			
			out.print(result);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
