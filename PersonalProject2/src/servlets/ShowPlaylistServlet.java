package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.PlDao;
import vo.Playlist;

@WebServlet("/ShowPlaylist")
public class ShowPlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		try {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			
			PlDao dao = new PlDao();
			ArrayList<Playlist> playlist = dao.playlist(id);
			
			request.setAttribute("playlist", playlist);
			request.getRequestDispatcher("playlistpage.jsp").forward(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
