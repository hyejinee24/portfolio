package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MusicDao;
import vo.Music;

@WebServlet("/MainMusicList")
public class MainMusicListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		try {
			MusicDao dao = new MusicDao();
			ArrayList<Music> list = dao.abMusicList();
			request.setAttribute("list", list);
			request.getRequestDispatcher("mainpage.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
