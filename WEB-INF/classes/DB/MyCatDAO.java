package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import properties.MyCatVO;

public class MyCatDAO {
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;
	
	public MyCatDAO() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/CatFinder?serverTimeZone=UTC"; // 스키마, 포트 설정
			String dbID = "root"; // 디비 아이디 설정
			String dbPassword = "whitebread"; // 디비 비밀번호 설정
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public MyCatVO getMyCat(int id) {
		String sql = "select * from myCatInfo where id = ?";
		MyCatVO vo = new MyCatVO();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				vo.setId(id);
				vo.setAttitude(rs.getString("attitude"));
				vo.setAge(rs.getString("age"));
				vo.setComment(rs.getString("comment"));
				vo.setFoodType(rs.getString("foodType"));
				vo.setName(rs.getString("name"));
				vo.setIsNeutered(rs.getInt("isNeutered"));
				
				pstmt.close();
				return vo;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return vo;
	}
	
	public int getLastId() {
		String sql = "select Id from myCatInfo order by Id desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}
	
	public int insertMyCat(String name, String age, String attitude, String foodType, String comment, int isNeutered) {
		String sql = "insert into myCatInfo(name, age, attitude, isNeutered, foodType, comment) values("
				+ "?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, age);
			pstmt.setString(3, attitude);
			pstmt.setInt(4, isNeutered);
			pstmt.setString(5, foodType);
			pstmt.setString(6, comment);
			
			int result = pstmt.executeUpdate();
			return result;
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return -1;
	}
	
	public ArrayList<MyCatVO> getAllMyCat(){
		ArrayList<MyCatVO> list = new ArrayList<MyCatVO>();
		String sql = "select * from myCatInfo order by id desc";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				MyCatVO vo = new MyCatVO();
				vo.setId(rs.getInt("Id"));
				vo.setAge(rs.getString("age"));
				vo.setAttitude(rs.getString("attitude"));
				vo.setComment(rs.getString("comment"));
				vo.setFoodType(rs.getString("foodType"));
				vo.setName(rs.getString("name"));
				vo.setIsNeutered(rs.getInt("isNeutered"));
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
	
	public int close() {
		try {
			if (conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if (rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 1;
	}
	
}
