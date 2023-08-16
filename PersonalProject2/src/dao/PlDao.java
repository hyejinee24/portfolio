package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import db.DBCon;
import vo.Playlist;

public class PlDao {
	public ArrayList<Playlist> playlist(String id) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT albumImg,title,singer FROM playlist WHERE userid=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, id);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<Playlist> playlist = new ArrayList<>();
		
		while(rs.next()) {
			Playlist p = new Playlist();
			//p.setPno(rs.getInt("pno"));
			//p.setUserid(rs.getString("userid"));
			p.setAlbumImg(rs.getString("albumImg"));
			p.setTitle(rs.getString("title"));
			p.setSinger(rs.getString("singer"));
			
			playlist.add(p);
		}
		return playlist;
	}
	
	public void addPlaylist(Playlist p) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "INSERT INTO playlist VALUES (null,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, p.getUserid());
		st.setString(2, p.getAlbumImg());
		st.setString(3, p.getTitle());
		st.setString(4, p.getSinger());
		
		st.executeUpdate();
	}
	
	public void delMusic(Playlist p) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "DELETE FROM playlist WHERE userid=? AND title=? AND singer=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, p.getUserid());
		st.setString(2, p.getTitle());
		st.setString(3, p.getSinger());
		
		st.executeUpdate();
	}
	
	//플리 내에서 검색 (제목이나 가수)
	public ArrayList<Playlist> searchMusic(String kw) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT albumImg,title,singer FROM playlist WHERE title LIKE ? OR singer LIKE ?";
		PreparedStatement st = con.prepareStatement(query);
		
		String searchKw = "%" + kw + "%";
		st.setString(1, searchKw);
		st.setString(2, searchKw);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<Playlist> playlist = new ArrayList<>();
		while(rs.next()) {
			Playlist p = new Playlist();
			p.setPno(rs.getInt("pno"));
			p.setAlbumImg(rs.getString("albumImg"));
			p.setTitle(rs.getString("title"));
			p.setSinger(rs.getString("singer"));
			
			playlist.add(p);
		}
		return playlist;
	}
	
	//한 사람의  플레이리스트에 같은 음악이 중복해서 들어가지 않도록 하기 위해 확인하기
	public int countMusic(String id, String title, String singer) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT COUNT(*) FROM playlist WHERE userid=? AND title=? AND singer=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, id);
		st.setString(2, title);
		st.setString(3, singer);
		
		ResultSet rs = st.executeQuery();
		rs.next();
		
		int count = rs.getInt(1);
		
		return count;
	}
}