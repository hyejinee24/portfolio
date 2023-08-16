package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import dao.WdDao;
import vo.Withdrawal;

@WebServlet("/ShowWithdrawalData")
public class ShowWithdrawalDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json; charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String selYear_ = request.getParameter("year");
            String selMonth_ = request.getParameter("month");
            
            WdDao dao = new WdDao();
            ArrayList<Withdrawal> list = null;
            
            if (selYear_ == null && selMonth_ == null) {
				list = dao.wdList();
			} else if (selYear_ != null && selMonth_ != null) {
				int year = Integer.parseInt(selYear_);
				int month = Integer.parseInt(selMonth_);
				list = dao.specificWdList(year, month);
			} else if (selYear_ != null) {
                int year = Integer.parseInt(selYear_);
                list = dao.yearWdList(year);
            } else if (selMonth_ != null) {
                int month = Integer.parseInt(selMonth_);
                list = dao.monthWdList(month);
            }

            JSONArray jsonArr = new JSONArray();
            if (list != null) {
                for (Withdrawal wd : list) {
                    JSONObject jsonObj = new JSONObject();
                    jsonObj.put("wddate", wd.getWddate());
                    jsonObj.put("wdcnt", wd.getWdcnt());
                    jsonArr.put(jsonObj);
                }
            } else {
            	// 데이터가 없는 경우에도 빈 JSON 배열을 생성하여 반환
                jsonArr = new JSONArray();
            }
            out.print(jsonArr.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}