package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ReviewDao;
import vo.Review;

@WebServlet("/ReviewDel")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setContentType("text/html;charset=utf-8");
		try {
			
			String[] rnos = request.getParameterValues("rno");
			
			if (rnos != null) {
				ReviewDao rdao = new ReviewDao();
				
				for (String _rno : rnos) {
					int rno = Integer.parseInt(_rno);
					Review r = new Review();
					r.setRno(rno);
					
					System.out.println(rno);
					//rdao.delReview(r);
				}
			}
			
			//앨범보기 페이지로 가기 위해서 content, album, singer 추출하기
			
			//String content = rdao.getContent(rno);
			//String album = ;
			//String singer = ;
			
			//response.sendRedirect("ShowAlbumInfo?content="+encodedContent+"&album="+encodedAlbum+"&singer="+singer);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
