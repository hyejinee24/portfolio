package servlets;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.MusicDao;
import vo.Music;

@MultipartConfig
@WebServlet("/MusicRegist")
public class MusicRegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private String getFilename(Part part) {
		String filename = null;
		String contentDispositionHeader = part.getHeader("Content-Disposition");
		String[] elements = contentDispositionHeader.split(";");
		for (String element : elements) {
			if (element.trim().startsWith("filename")) {
				filename = element.substring(element.indexOf("=") + 1).trim().replace("\"", "");
			}
		}
		//System.out.println("filename : " + filename);
		return filename;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.setContentType("text/html;charset=utf-8");
		response.setCharacterEncoding("UTF-8");

		MusicDao dao = new MusicDao();
		Music m = new Music();

		String album = request.getParameter("album");
		m.setAlbum(album);

		String title = request.getParameter("title");
		m.setTitle(title);

		String singer = request.getParameter("singer");
		m.setSinger(singer);

		String genre = request.getParameter("genre");
		if (genre.equals("dance")) {
			genre = "댄스";
		} else if (genre.equals("hiphop")) {
			genre = "힙합";
		} else if (genre.equals("balad")) {
			genre = "발라드";
		} else {
			genre = "해외 팝";
		}
		m.setGenre(genre);

		String _reldate = request.getParameter("reldate");
		int reldate = Integer.parseInt(_reldate);
		m.setReldate(reldate);

		//멀티 파일 업로드
		Collection<Part> parts = request.getParts();
		String savePath = null;

		for (Part part : parts) {
			if (part.getContentType() != null) {
				String filename = getFilename(part);
				if ((filename != null) && !filename.isEmpty()) {
					//String[] fileType = filename.split("[.]");
					Path path = Paths.get(filename);
		            String fileType = path.getFileName().toString();
					if (fileType.endsWith("png") || fileType.endsWith("jpg") || fileType.endsWith("jpeg") ) {
						savePath = "/albumImg";
						m.setAlbumImg(filename); //변수 설정 x, 조건에 따라 값 세팅
					} else if (fileType.endsWith("mp3")) {
						savePath = "/mp3";
						m.setMfile(filename);
					} else if (fileType.endsWith("txt")) {
						savePath = "/txt";
						m.setLyrics(filename);
					}
					part.write(getServletContext().getRealPath(savePath) + "/" + filename);
				}
			} else {
				String partName = part.getName();
				String fieldValue = request.getParameter(partName);
				System.out.println(partName + " : " + fieldValue);
			}
		}
		try {
			dao.registMusic(m);
			response.sendRedirect("ShowMusicList");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}	
}