package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import dao.UserDao;
import vo.User;

@WebServlet("/SearchUserAd")
public class SearchUserAdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		try {
			String searchkw = request.getParameter("search");
			
			UserDao dao = new UserDao();
			ArrayList<User> result = dao.searchUsers(searchkw);
			
			response.setContentType("application/json");
			PrintWriter out = response.getWriter();
			
			JSONArray jarray = new JSONArray(result);
			out.print(jarray.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
