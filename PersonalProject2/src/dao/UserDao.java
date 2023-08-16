package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.DBCon;
import vo.User;

public class UserDao {
	public ArrayList<User> userList() throws Exception {
		Connection con = DBCon.getConnection();
		Statement st = con.createStatement();
		String query = "SELECT * FROM user";
		ResultSet rs = st.executeQuery(query);
		
		ArrayList<User> list = new ArrayList<User>();
		
		while (rs.next()) {
			User user = new User();
			user.setUno(rs.getInt("uno"));
			user.setId(rs.getString("id"));
			user.setPw(rs.getString("pw"));
			user.setName(rs.getString("name"));
			user.setGender(rs.getString("gender"));
			user.setBirth(rs.getString("birth"));
			user.setTel(rs.getString("tel"));
			
			list.add(user);
		}
		return list;
	}
	
	public User userInfo(String id) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT * FROM user WHERE id=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, id);
		
		ResultSet rs = st.executeQuery();
		
		User u = new User();
		if (rs.next()) {
			u.setUno(rs.getInt("uno"));
			u.setId(rs.getString("id"));
			u.setPw(rs.getString("pw"));
			u.setName(rs.getString("name"));
			u.setGender(rs.getString("gender"));
			u.setBirth(rs.getString("birth"));
			u.setTel(rs.getString("tel"));
		}
		return u;
	}
	
	public void registUser(User u) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "INSERT INTO user VALUES (null,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, u.getId());
		st.setString(2, u.getPw());
		st.setString(3, u.getName());
		st.setString(4, u.getGender());
		st.setString(5, u.getBirth());
		st.setString(6, u.getTel());
		
		st.executeUpdate();
	}
	
	public void updateUserInfo(User u) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "UPDATE user SET name=?, pw=?, tel=? WHERE id=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, u.getName());
		st.setString(2, u.getPw());
		st.setString(3, u.getTel());
		st.setString(4, u.getId());
		
		st.executeUpdate();
	}
	
	public void deleteUserInfo(User u) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "DELETE FROM user WHERE id=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, u.getId()); //세션에 저장된 아이디값 받아오기 .....
		
		st.executeUpdate();
	}
	
	//관리자가 회원 조회할 때 (검색 조건 - 아이디랑 이름)
	public ArrayList<User> searchUsers(String keyword) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT * FROM user WHERE id LIKE ? OR name LIKE ?";
		PreparedStatement st = con.prepareStatement(query);
		
		String searchKw = "%" + keyword + "%";
		st.setString(1, searchKw);
		st.setString(2, searchKw);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<User> list = new ArrayList<User>();
		
		while(rs.next()) {
			User u = new User();
			u.setUno(rs.getInt("uno"));
			u.setId(rs.getString("id"));
			u.setPw(rs.getString("pw"));
			u.setName(rs.getString("name"));
			u.setGender(rs.getString("gender"));
			u.setBirth(rs.getString("birth"));
			u.setTel(rs.getString("tel"));
			
			list.add(u);
		}
		return list;
	}
	
	//현재 회원 수
	public int getCount() throws Exception {
		Connection con = DBCon.getConnection();
		Statement st = con.createStatement();
		String query = "SELECT COUNT(*) FROM user";
		
		ResultSet rs = st.executeQuery(query);
		rs.next();
		int count = rs.getInt(1);
		
		return count;
	}
	
	//정보 수정할 때, 본인 전화번호면 수정 안해도 넘어가도록 설정
	public String getTel(String tel) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT tel FROM user WHERE id=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, tel);
		
		ResultSet rs = st.executeQuery();
		rs.next();
		String phone = rs.getString(1);
		
		return phone;
	}
}