package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MyCatImageDAO {
	private ResultSet rs = null;
	private Connection conn = null;
	private PreparedStatement pstmt = null;

	public MyCatImageDAO() {
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

	public String getRealName(int catId) {
		String temp = "";
		String sql = "select realName from myCatImage where catId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, catId);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				temp = rs.getString(1);
				return temp;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return temp;
	}

	public String getFileName(int catId) {
		String temp = "";
		String sql = "select fileName from myCatImage where catId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, catId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				temp = rs.getString(1);
				return temp;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return temp;
	}
	
	public ArrayList<String> getRealNameList() {
		ArrayList<String> realName = new ArrayList<String>();
		String sql = "select realName from myCatImage order by catId desc";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				realName.add(rs.getString(1));
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return realName;
	}

	public int uploadImage(int catId, String fileName, String realName) {
		int result = 0;

		String sql = "insert into myCatImage(catId, fileName, realName) values(?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, catId);
			pstmt.setString(2, fileName);
			pstmt.setString(3, realName);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return result;
	}

	public void close() {

		try {
			if (rs != null) {
				rs.close();
			}
			if (conn != null) {
				conn.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
