package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import dao.StDao;
import vo.Statistics;

@WebServlet("/UserSt")
public class UserStServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		try {
			StDao dao = new StDao();
			Map<String, List<Integer>> data = dao.getGenderData();
			
			response.setContentType("application/json");
			out.print(getJSonData(data));
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	private String getJSonData(Map<String, List<Integer>> data) throws JSONException {
		JSONArray jsonArr = new JSONArray();
		for (String genre : data.keySet()) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("genre", genre);
			
			List<Integer> genderData = data.get(genre);
			int maleCnt = 0;
			int femaleCnt = 0;
			for (Integer gender : genderData) {
				if (gender == 1) {
					maleCnt++;
				} else {
					femaleCnt++;
				}
			}
			jsonObj.put("male", maleCnt);
			jsonObj.put("female", femaleCnt);
			
			jsonArr.put(jsonObj);
		}
		return jsonArr.toString();
	}

}
