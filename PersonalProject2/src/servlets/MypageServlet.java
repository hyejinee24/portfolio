package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import vo.User;

@WebServlet("/Mypage")
public class MypageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		try {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			
			UserDao dao = new UserDao();
			User u = dao.userInfo(id);
			
			session.setAttribute("userInfo", u);
			
			response.sendRedirect("myinfopage.jsp");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
