package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Music;

@WebServlet("/MusicPlay")
public class MusicPlayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		try {
			
			String mfile = request.getParameter("mfile");
			String albumImg = request.getParameter("albumImg");
			String title = request.getParameter("title");
			String singer = request.getParameter("singer");
			String lyrics = request.getParameter("lyrics");
			
			Music m = new Music();
			m.setMfile(mfile);
			m.setAlbumImg(albumImg);
			m.setTitle(title);
			m.setSinger(singer);
			m.setLyrics(lyrics);
			
			request.setAttribute("musicInfo", m);
			request.getRequestDispatcher("musicplaypage.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
