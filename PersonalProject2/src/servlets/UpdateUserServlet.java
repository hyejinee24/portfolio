package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import vo.User;

@WebServlet("/UpdateUser")
public class UpdateUserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		try {
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			String name = request.getParameter("name");
			String gender = request.getParameter("gender");
			String bd = request.getParameter("bd");
			String tel = request.getParameter("tel");
			
			UserDao dao = new UserDao();
			User u = new User();
			u.setId(id);
			u.setPw(pw);
			u.setName(name);
			u.setGender(gender);
			u.setBirth(bd);
			u.setTel(tel);
			
			dao.updateUserInfo(u);
			response.sendRedirect("Mypage");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
