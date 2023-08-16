package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import db.DBCon;

public class LoginDao {
	public int idCheck(String id) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT COUNT(*) FROM user WHERE id=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, id);
		
		ResultSet rs = st.executeQuery();
		int result = 0;
		if (rs.next()) {
			result = rs.getInt(1);
		};
		return result;
	}
	
	public int loginCheck(String id, String pw) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT COUNT(*) FROM user WHERE id=? AND pw=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, id);
		st.setString(2, pw);
		
		ResultSet rs = st.executeQuery();
		int result = 0;
		if (rs.next()) {
			result = rs.getInt(1);
		}
		return result;
		
	}
	
	public String getName(String id) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT name FROM user WHERE id=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, id);
		
		ResultSet rs = st.executeQuery();
		String name = "";
		if(rs.next()) {
			name = rs.getString(1);			
		}
		
		return name;
	}
	
	public int telCheck(String tel) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT COUNT(*) FROM user WHERE tel=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, tel);
		
		ResultSet rs = st.executeQuery();
		int result = 0;
		if (rs.next()) {
			result = rs.getInt(1);
		}
		return result;
	}
}
