package servlets;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MusicDao;
import dao.ReviewDao;
import vo.Music;
import vo.Review;

@WebServlet("/ShowAlbumInfo")
public class ShowAlbumInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			String album = request.getParameter("album");
			String singer = request.getParameter("singer");
			
			MusicDao mdao = new MusicDao();
			ArrayList<Music> list = mdao.albumInfo(album, singer);
			
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			
			String content = request.getParameter("content");
			
			ArrayList<Integer> mnos = mdao.getMno(album);
			ArrayList<Review> rvList = new ArrayList<>();
			
			ReviewDao rdao = new ReviewDao();
			
			for (int i = 0; i < mnos.size(); i++) {
				Review r = new Review();
				r.setId(id);
				r.setContent(content);
				r.setMno(mnos.get(i));
				
				if (i == 0) { //첫번째만 가져오기
					rvList.addAll(rdao.rvList(r));
				} else { //나머지는 빈 리스트에 추가해 숨김 처리
					rvList.addAll(new ArrayList<>());
				}
			}
			
			int count = rdao.getCount(mnos.get(0));
			
			request.setAttribute("list", list);
			request.setAttribute("rvList", rvList);
			request.setAttribute("count", count); //감상평 개수
			request.getRequestDispatcher("albumInfopage.jsp").forward(request, response);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
