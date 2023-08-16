package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MusicDao;
import dao.PlDao;
import vo.Music;
import vo.Playlist;

@WebServlet("/AddPlaylist")
public class AddPlaylistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		try {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			
			String title = request.getParameter("title");
			String singer = request.getParameter("singer");
			
			MusicDao mDao = new MusicDao();
			Music m = mDao.musicInfo(title, singer);
			
			PlDao pDao = new PlDao();
			
			Playlist p = new Playlist();
			p.setUserid(id);
			p.setAlbumImg(m.getAlbumImg());
			p.setTitle(m.getTitle());
			p.setSinger(m.getSinger());
			
			int count = pDao.countMusic(id, title, singer);
			if (count == 1) { //중복일 때 기존꺼 삭제하고 새로 추가하기
				pDao.delMusic(p);
			}
			pDao.addPlaylist(p); //플레이리스트에 추가
			
			//음악 재생 화면으로 보내기
			request.getRequestDispatcher("MusicPlay?mfile=" + m.getMfile() + "&albumImg=" + m.getAlbumImg() + "&title="
					+ m.getTitle() + "&singer=" + m.getSinger() + "&lyrics=" + m.getLyrics())
			.forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
