package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import db.DBCon;
import vo.Music;

public class MusicDao {
	//앨범 정보 조회 시
	public ArrayList<Music> abMusicList() throws Exception {
		Connection con = DBCon.getConnection();
		Statement st = con.createStatement();
		String query = "SELECT * FROM music GROUP BY album";
		ResultSet rs = st.executeQuery(query);
		
		ArrayList<Music> list = new ArrayList<Music>();
		
		while(rs.next()) {
			Music m = new Music();
			m.setMno(rs.getInt("mno"));
			m.setMfile(rs.getString("mfile"));
			m.setAlbum(rs.getString("album"));
			m.setAlbumImg(rs.getString("albumImg"));
			m.setTitle(rs.getString("title"));
			m.setSinger(rs.getString("singer"));
			m.setLyrics(rs.getString("lyrics"));
			m.setGenre(rs.getString("genre"));
			m.setReldate(rs.getInt("reldate"));
			
			list.add(m);
		}
		return list;
	}
	
	//관리자 음악 조회 시
	public ArrayList<Music> musicList() throws Exception {
		Connection con = DBCon.getConnection();
		Statement st = con.createStatement();
		String query = "SELECT * FROM music ORDER BY title";
		ResultSet rs = st.executeQuery(query);
		
		ArrayList<Music> list = new ArrayList<Music>();
		
		while(rs.next()) {
			Music m = new Music();
			m.setMno(rs.getInt("mno"));
			m.setMfile(rs.getString("mfile"));
			m.setAlbum(rs.getString("album"));
			m.setAlbumImg(rs.getString("albumImg"));
			m.setTitle(rs.getString("title"));
			m.setSinger(rs.getString("singer"));
			m.setLyrics(rs.getString("lyrics"));
			m.setGenre(rs.getString("genre"));
			m.setReldate(rs.getInt("reldate"));
			
			list.add(m);
		}
		return list;
	}
	
	public void registMusic(Music m) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "INSERT INTO music VALUES (null,?,?,?,?,?,?,?,?)";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, m.getMfile());
		st.setString(2, m.getAlbum());
		st.setString(3, m.getAlbumImg());
		st.setString(4, m.getTitle());
		st.setString(5, m.getSinger());
		st.setString(6, m.getLyrics());
		st.setString(7, m.getGenre());
		st.setInt(8, m.getReldate());
		
		st.executeUpdate();
	}
	
	public void updateMusic(Music m) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "UPDATE music SET mfile=?, album=?, albumImg=?, title=?, singer=?, lyrics=?, genre=?, reldate=? WHERE mno=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, m.getMfile());
		st.setString(2, m.getAlbum());
		st.setString(3, m.getAlbumImg());
		st.setString(4, m.getTitle());
		st.setString(5, m.getSinger());
		st.setString(6, m.getLyrics());
		st.setString(7, m.getGenre());
		st.setInt(8, m.getReldate());
		st.setInt(9, m.getMno());
		
		st.executeUpdate();
	}
	
	public void deleteMusic(Music m) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "DELETE FROM music WHERE mno=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, m.getMno());
		
		st.executeUpdate();
	}
	
	public ArrayList<Music> searchTitle(String kw) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT * FROM music WHERE title LIKE ?";
		PreparedStatement st = con.prepareStatement(query);
		
		String searchKw = "%" + kw + "%";
		st.setString(1, searchKw);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<Music> list = new ArrayList<Music>();
		while(rs.next()) {
			Music m = new Music();
			m.setMno(rs.getInt("mno"));
			m.setMfile(rs.getString("mfile"));
			m.setAlbum(rs.getString("album"));
			m.setAlbumImg(rs.getString("albumImg"));
			m.setTitle(rs.getString("title"));
			m.setSinger(rs.getString("singer"));
			m.setLyrics(rs.getString("lyrics"));
			m.setGenre(rs.getString("genre"));
			m.setReldate(rs.getInt("reldate"));
			
			list.add(m);
		}
		return list;
	}
	
	public ArrayList<Music> searchSinger(String kw) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT * FROM music WHERE singer LIKE ?";
		PreparedStatement st = con.prepareStatement(query);
		
		String searchKw = "%" + kw + "%";
		st.setString(1, searchKw);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<Music> list = new ArrayList<Music>();
		while(rs.next()) {
			Music m = new Music();
			m.setMno(rs.getInt("mno"));
			m.setMfile(rs.getString("mfile"));
			m.setAlbum(rs.getString("album"));
			m.setAlbumImg(rs.getString("albumImg"));
			m.setTitle(rs.getString("title"));
			m.setSinger(rs.getString("singer"));
			m.setLyrics(rs.getString("lyrics"));
			m.setGenre(rs.getString("genre"));
			m.setReldate(rs.getInt("reldate"));
			
			list.add(m);
		}
		return list;
	}
	
	public ArrayList<Music> searchalbum(String kw) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT * FROM music WHERE album LIKE ? ORDER BY reldate DESC";
		PreparedStatement st = con.prepareStatement(query);
		
		String searchKw = "%" + kw + "%";
		st.setString(1, searchKw);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<Music> list = new ArrayList<Music>();
		while(rs.next()) {
			Music m = new Music();
			m.setMno(rs.getInt("mno"));
			m.setMfile(rs.getString("mfile"));
			m.setAlbum(rs.getString("album"));
			m.setAlbumImg(rs.getString("albumImg"));
			m.setTitle(rs.getString("title"));
			m.setSinger(rs.getString("singer"));
			m.setLyrics(rs.getString("lyrics"));
			m.setGenre(rs.getString("genre"));
			m.setReldate(rs.getInt("reldate"));
			
			list.add(m);
		}
		return list;
	}
	
	//가사 검색 - 파일 내용으로 검색 되는 지는 테스트를 해봐야 할 듯 ..
	public ArrayList<Music> searchLyrics(String kw) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT * FROM music WHERE lyrics LIKE ?";
		PreparedStatement st = con.prepareStatement(query);
		
		String searchKw = "%" + kw + "%";
		st.setString(1, searchKw);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<Music> list = new ArrayList<Music>();
		while(rs.next()) {
			Music m = new Music();
			m.setMno(rs.getInt("mno"));
			m.setMfile(rs.getString("mfile"));
			m.setAlbum(rs.getString("album"));
			m.setAlbumImg(rs.getString("albumImg"));
			m.setTitle(rs.getString("title"));
			m.setSinger(rs.getString("singer"));
			m.setLyrics(rs.getString("lyrics"));
			m.setGenre(rs.getString("genre"));
			m.setReldate(rs.getInt("reldate"));
			
			list.add(m);
		}
		return list;
	}
	
	//관리자 페이지에서 음악 조회(기준-제목,가수명,장르,발매일)
	public ArrayList<Music> srMusicInfo(String kw) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT * FROM music WHERE title LIKE ? OR singer LIKE ? OR genre LIKE ? OR reldate LIKE ?";
		PreparedStatement st = con.prepareStatement(query);
		
		String searchKw = "%" + kw + "%";
		st.setString(1, searchKw);
		st.setString(2, searchKw);
		st.setString(3, searchKw);
		st.setString(4, searchKw);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<Music> list = new ArrayList<Music>();
		while(rs.next()) {
			Music m = new Music();
			m.setMno(rs.getInt("mno"));
			m.setMfile(rs.getString("mfile"));
			m.setAlbum(rs.getString("album"));
			m.setAlbumImg(rs.getString("albumImg"));
			m.setTitle(rs.getString("title"));
			m.setSinger(rs.getString("singer"));
			m.setLyrics(rs.getString("lyrics"));
			m.setGenre(rs.getString("genre"));
			m.setReldate(rs.getInt("reldate"));
			
			list.add(m);
		}
		return list;
	}
	
	//플레이리스트에 저장할 음악 정보 찾기
	public Music musicInfo(String title, String singer) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT * FROM music WHERE title=? AND singer=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, title);
		st.setString(2, singer);
		
		ResultSet rs = st.executeQuery();		
		rs.next();
		
		Music m = new Music();
		m.setMno(rs.getInt("mno"));
		m.setMfile(rs.getString("mfile"));
		m.setAlbum(rs.getString("album"));
		m.setAlbumImg(rs.getString("albumImg"));
		m.setTitle(rs.getString("title"));
		m.setSinger(rs.getString("singer"));
		m.setLyrics(rs.getString("lyrics"));
		m.setGenre(rs.getString("genre"));
		m.setReldate(rs.getInt("reldate"));
		
		return m;
	}
	
	//앨범 정보
	public ArrayList<Music> albumInfo(String album, String singer) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT * FROM music WHERE album=? AND singer=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, album);
		st.setString(2, singer);
		
		ResultSet rs = st.executeQuery();		
		
		ArrayList<Music> list = new ArrayList<>();
		
		while(rs.next()) {
			Music m = new Music();
			m.setMno(rs.getInt("mno"));
			m.setMfile(rs.getString("mfile"));
			m.setAlbum(rs.getString("album"));
			m.setAlbumImg(rs.getString("albumImg"));
			m.setTitle(rs.getString("title"));
			m.setSinger(rs.getString("singer"));
			m.setLyrics(rs.getString("lyrics"));
			m.setGenre(rs.getString("genre"));
			m.setReldate(rs.getInt("reldate"));
			
			list.add(m);
		}
		return list;
	}
	
	//감상평 등록을 위해 mno 알아내기
	public ArrayList<Integer> getMno(String album) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT mno FROM music WHERE album=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, album);
		
		ResultSet rs = st.executeQuery();
		
		ArrayList<Integer> mnos = new ArrayList<>();
		while (rs.next()) {
			mnos.add(rs.getInt("mno"));
		}
		return mnos;
	}
	
	//감상평 조회를 위해 파라미터로 보낼 singer 가져오기
	public String getSinger(int mno) throws Exception {
		Connection con = DBCon.getConnection();
		String query = "SELECT singer FROM music WHERE mno=?";
		PreparedStatement st = con.prepareStatement(query);
		st.setInt(1, mno);
		
		ResultSet rs = st.executeQuery();
		rs.next();
		String singer = rs.getString("singer");
		
		return singer;
	}
	
	// 
}