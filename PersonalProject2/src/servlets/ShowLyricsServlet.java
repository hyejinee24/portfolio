package servlets;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ShowLyrics")
public class ShowLyricsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		try {
			String lyricsFilename = request.getParameter("filename");
			String lyricsFilePath = getServletContext().getRealPath("/txt/" + lyricsFilename);
			
			BufferedReader br = new BufferedReader(new FileReader(lyricsFilePath));
			StringBuilder lyricsContent = new StringBuilder();
			String line; //가사가 저장되는 문자열
			boolean firstLine = true;
			while ((line = br.readLine()) != null) {
				if (firstLine) {
					lyricsContent.append("<br>"); //첫 줄에 br태그 추가
					firstLine = false;
				}
				lyricsContent.append(line).append("<br>");
			}
			lyricsContent.append("<br>"); //막 줄에 br태그 추가
			response.setContentType("text/html");
			out.write(lyricsContent.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
