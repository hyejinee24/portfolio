package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import vo.User;

@WebServlet("/ShowMemberList")
public class ShowMemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		try {
			UserDao dao = new UserDao();
			ArrayList<User> list = dao.userList();
			int count = dao.getCount();
			
			request.setAttribute("list", list);
			request.setAttribute("count", count);
			request.getRequestDispatcher("adminmembernowpage.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
