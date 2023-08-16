package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.DBCon;
import vo.Withdrawal;

public class WdDao {
	
	//날짜 최신순으로 보여주기
	public ArrayList<Withdrawal> wdList() throws Exception {
		Connection con = DBCon.getConnection();
		Statement st = con.createStatement();
		String query = "SELECT * FROM withdrawal ORDER BY wddate desc";
		ResultSet rs = st.executeQuery(query);
		
		ArrayList<Withdrawal> list = new ArrayList<>();
		
		if (rs.getRow() == 0) { //데이터가 없으면 빈 배열 상태일테니 null로 return시키기
			return null;
		};
		
		while (rs.next()) {
			Withdrawal wd = new Withdrawal();
			wd.setWddate(rs.getDate("wddate"));
			wd.setWdcnt(rs.getInt("wdcnt"));
			
			list.add(wd);
		}
		return list;
	}
	
	//특정 년도와 특정 월의 자료 보여주기
	public ArrayList<Withdrawal> specificWdList(int year, int month) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT * FROM withdrawal WHERE YEAR(wddate)=? AND MONTH(wddate)=? ORDER BY wddate desc";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, year);
		st.setInt(2, month);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<Withdrawal> list = new ArrayList<>();
		
		while (rs.next()) {
			Withdrawal wd = new Withdrawal();
			wd.setWddate(rs.getDate("wddate"));
			wd.setWdcnt(rs.getInt("wdcnt"));
			
			list.add(wd);
		}
		return list;
	}
	
	//특정 년도의 자료 보여주기
	public ArrayList<Withdrawal> yearWdList(int year) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT * FROM withdrawal WHERE YEAR(wddate)=? ORDER BY wddate desc";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, year);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<Withdrawal> list = new ArrayList<>();
		
		while (rs.next()) {
			Withdrawal wd = new Withdrawal();
			wd.setWddate(rs.getDate("wddate"));
			wd.setWdcnt(rs.getInt("wdcnt"));
			
			list.add(wd);
		}
		return list;
	}
	
	//특정 월의 자료 보여주기
	public ArrayList<Withdrawal> monthWdList(int month) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT * FROM withdrawal WHERE MONTH(wddate)=? ORDER BY wddate desc";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, month);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<Withdrawal> list = new ArrayList<>();
		
		while (rs.next()) {
			Withdrawal wd = new Withdrawal();
			wd.setWddate(rs.getDate("wddate"));
			wd.setWdcnt(rs.getInt("wdcnt"));
			
			list.add(wd);
		}
		return list;
	}
	
	//데이터가 존재하는 년도만 추출하기
	public ArrayList<Integer> getYears() throws Exception {
		Connection con = DBCon.getConnection();
		Statement st = con.createStatement();
		String query = "SELECT DISTINCT YEAR(wddate) FROM withdrawal ORDER BY YEAR(wddate) desc";
		
		ResultSet rs = st.executeQuery(query);
		
		ArrayList<Integer> list = new ArrayList<>();
		
		while (rs.next()) {
			int years = rs.getInt("YEAR(wddate)");
			list.add(years);
		}
		return list;
	}
	
	//데이터가 존재하는 달만 추출하기
	public ArrayList<Integer> getMonths() throws Exception {
		Connection con = DBCon.getConnection();
		Statement st = con.createStatement();
		String query = "SELECT DISTINCT MONTH(wddate) FROM withdrawal ORDER BY MONTH(wddate) desc";
		
		ResultSet rs = st.executeQuery(query);
		
		ArrayList<Integer> list = new ArrayList<>();
		
		while (rs.next()) {
			int months = rs.getInt("MONTH(wddate)");
			list.add(months);
		}
		return list;
	}
	
	public void addWdCnt() throws Exception {
		Connection con = DBCon.getConnection();
		Statement st = con.createStatement();
		String query = "INSERT INTO withdrawal VALUES (NOW(),1)";
		st.executeUpdate(query);
	}
	
	public int upWdCnt() throws Exception {
		Connection con = DBCon.getConnection();
		Statement st = con.createStatement();
		String query = "UPDATE withdrawal SET wdcnt=wdcnt+1 WHERE wddate=CURDATE()";
		int result = st.executeUpdate(query);
		return result;
	}
}
