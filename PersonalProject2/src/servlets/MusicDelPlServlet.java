package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PlDao;
import vo.Playlist;

@WebServlet("/MusicDelPl")
public class MusicDelPlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		try {
			
			HttpSession session = request.getSession();
			String userid = (String)session.getAttribute("id");
			
			String title = request.getParameter("title");
			String singer = request.getParameter("singer");
			
			PlDao dao = new PlDao();
			Playlist p = new Playlist();
			p.setUserid(userid);
			p.setTitle(title);
			p.setSinger(singer);
			
			dao.delMusic(p);
			
			response.sendRedirect("ShowPlaylist");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
