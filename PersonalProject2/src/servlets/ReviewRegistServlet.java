package servlets;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MusicDao;
import dao.ReviewDao;
import vo.Review;

@WebServlet("/ReviewRegist")
public class ReviewRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");
		try {
			
			HttpSession session = request.getSession();
			String id = (String)session.getAttribute("id");
			
			String content = request.getParameter("comment");
			String encodedContent = URLEncoder.encode(content, "UTF-8"); //한글만 오류나서 인코딩하는 과정..
			String album = request.getParameter("album");
			String encodedAlbum = URLEncoder.encode(album, "UTF-8"); //한글만 오류나서 인코딩하는 과정..

			ReviewDao rdao = new ReviewDao();
			MusicDao mdao = new MusicDao();
			
			ArrayList<Integer> mnos = mdao.getMno(album);
			
			for (Integer mno : mnos) { //mno가 여러 개일 수도 있어서 반복문 사용
				Review r = new Review();
				r.setId(id);
				r.setContent(content);
				r.setMno(mno);
				
				rdao.registReview(r);
			}
			
			int mno1 = mnos.get(0);
			String singer = mdao.getSinger(mno1);
			String encodedSinger = URLEncoder.encode(singer, "UTF-8"); //한글만 오류나서 인코딩하는 과정..
			
			response.sendRedirect("ShowAlbumInfo?content="+encodedContent+"&album="+encodedAlbum+"&singer="+encodedSinger);
		} catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
