package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.UserDao;
import dao.WdDao;
import vo.User;

@WebServlet("/UserWithdrawal")
public class UserWithdrawalServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("UTF-8");
		try {
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			
			UserDao udao = new UserDao();
			User u = new User();
			u.setId(id);
			
			udao.deleteUserInfo(u); //해당 유저 정보 삭제
			session.invalidate(); //세션에 저장된 정보 삭제
			
			WdDao wddao = new WdDao();
			int result = wddao.upWdCnt();
			if (result == 0) { //해당 날짜의 행이 존재하지 않을 때
				wddao.addWdCnt();
			}
			response.sendRedirect("MainMusicList");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
