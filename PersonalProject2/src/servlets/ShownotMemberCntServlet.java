package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.UserDao;
import dao.WdDao;
import vo.Withdrawal;

@WebServlet("/ShownotMemberCnt")
public class ShownotMemberCntServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		try {
			UserDao udao = new UserDao();
			int count = udao.getCount();
			
			WdDao wddao = new WdDao();
			ArrayList<Integer> years = wddao.getYears();
			ArrayList<Integer> months = wddao.getMonths();
			
			ArrayList<Withdrawal> list = wddao.wdList();
			
			request.setAttribute("count", count);
			
			request.setAttribute("years", years);
			request.setAttribute("months", months);
			request.setAttribute("list", list);
			
			request.getRequestDispatcher("adminmemberwithdrawpage.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
