package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import db.DBCon;

public class StDao {
	public Map<String, List<Integer>> getGenderData() throws Exception {
		Connection con = DBCon.getConnection();
		Statement st = con.createStatement();
		String query = "SELECT gender,genre FROM v_statistics";
		ResultSet rs = st.executeQuery(query);
		
		Map<String, List<Integer>> genreGenderData = new HashMap<>();
		
		while (rs.next()) {
			String gender = rs.getString("gender");
			String genre = rs.getString("genre");
			
			// genreGenderData Map에 해당 장르가 없으면 새로운 List 생성
			genreGenderData.putIfAbsent(genre, new ArrayList<>());
			
			// 해당 장르의 List에 성별 데이터 추가
            genreGenderData.get(genre).add(gender.equals("남") ? 1 : 0);
		}
		return genreGenderData;
	}
	
	public Map<String, Map<String,Integer>> getAgeData() throws Exception {
		Connection con = DBCon.getConnection();
		Statement st = con.createStatement();
		String query = "SELECT age,genre FROM v_statistics";
		ResultSet rs = st.executeQuery(query);
		
		Map<String, Map<String,Integer>> genreAgeData = new HashMap<>();
		
		while (rs.next()) {
			int age = rs.getInt("age");
			String genre = rs.getString("genre");
			
			String ageGroup = getAgeGroup(age);
			
			// genreAgeData Map에 해당 장르가 없으면 새로운 map? 생성
            genreAgeData.putIfAbsent(genre, new HashMap<>());

            // 해당 장르의 List에서 해당 나이대 인덱스에 데이터 추가
            Map<String,Integer> ageCounts = genreAgeData.get(genre);
           
            ageCounts.put(ageGroup, ageCounts.getOrDefault(ageGroup, 0) + 1);
		}
		return genreAgeData;
	}
	
	private String getAgeGroup(int age) {
		if (age >= 0 && age <= 19) {
			return "10대(0~19세)";
		} else if (age >= 20 && age <= 29) {
			return "20대(20~29세)";
		} else if (age >= 30 && age <= 39) {
			return "30대(30~39세)";
		} else {
			return "40대 이상";
		}
	}
}
