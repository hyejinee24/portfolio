package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBCon;
import vo.Review;

public class ReviewDao {
	public ArrayList<Review> rvList(Review r) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT * FROM review WHERE mno=? ORDER BY regdate DESC";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, r.getMno());
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<Review> list = new ArrayList<>();
		
		while (rs.next()) {
			Review rv = new Review();
			rv.setRno(rs.getInt("rno"));
			rv.setMno(rs.getInt("mno"));
			rv.setId(rs.getString("id"));
			rv.setContent(rs.getString("content"));
			rv.setRegdate(rs.getDate("regdate"));
			
			list.add(rv);
		}
		return list;
	}
	
	//감상평 개수
	public int getCount(int mno) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT COUNT(*) FROM review WHERE mno=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, mno);
		
		ResultSet rs = st.executeQuery();
		rs.next();
		int count = rs.getInt(1);
		
		return count;
	}
	
	public void registReview(Review r) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "INSERT INTO review VALUES (NULL,?,?,?,NOW())";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, r.getMno());
		st.setString(2, r.getId());
		st.setString(3, r.getContent());
		
		st.executeUpdate();
	}
	
	public void delReview(Review r) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "DELETE FROM review WHERE rno=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, r.getRno());
		
		st.executeUpdate();
		
	}
	
	//
	
	//rno로 내용 추출
	public String getContent(int rno) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT content FROM review WHERE rno=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, rno);
		
		ResultSet rs = st.executeQuery();
		rs.next();
		String content = rs.getString(1);
		
		return content;
	}
	
}
