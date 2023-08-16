package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dao.LoginDao;

@WebServlet("/LoginCheck")
public class LoginCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		try {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			//관리자인지 확인
			if (id.equals("admin") && pw.equals("ad1234")) {
				out.print("admin");
				return;
			}
			
			LoginDao dao = new LoginDao();
			int idCheck = dao.idCheck(id);
			int result = dao.loginCheck(id, pw);
			String name = dao.getName(id);
			
			if (idCheck == 1) {
				if (result == 1) {
					HttpSession session = request.getSession();
					session.setAttribute("id", id);
					session.setAttribute("name", name);
					out.print("success");
				} else {
					out.print("wrong");
				}
			} else {
				out.print("fail");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
