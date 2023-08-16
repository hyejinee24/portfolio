package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MusicDao;
import vo.Music;

@WebServlet("/MusicPlaylist")
public class MusicPlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		try {
			
			String title = request.getParameter("title");
			String singer = request.getParameter("singer");
			
			MusicDao mDao = new MusicDao();
			Music m = mDao.musicInfo(title, singer);
			
			request.setAttribute("musicInfo", m);
			request.getRequestDispatcher("musicplaypage.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
