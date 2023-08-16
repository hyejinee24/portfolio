package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

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

@WebServlet("/AddPl")
public class AddPlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		try {
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			
			String title = request.getParameter("title");
			String singer = request.getParameter("singer");
			String encodedSinger = URLEncoder.encode(singer, "UTF-8"); //한글만 오류나서 인코딩하는 과정..
			
			MusicDao mDao = new MusicDao();
			Music m = mDao.musicInfo(title, singer);
			
			PlDao pDao = new PlDao();
			
			Playlist p = new Playlist();
			p.setUserid(id);
			p.setAlbumImg(m.getAlbumImg());
			p.setTitle(m.getTitle());
			p.setSinger(m.getSinger());
			
			int count = pDao.countMusic(id, title, singer);
			if (count == 1) { //중복일 때는 기존꺼 삭제하고 새로 추가하기
				pDao.delMusic(p);
			}
			pDao.addPlaylist(p); //플레이리스트에 추가
			response.sendRedirect("ShowAlbumInfo?album="+ m.getAlbum() + "&singer=" + encodedSinger);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
