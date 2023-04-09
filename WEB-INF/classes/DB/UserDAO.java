package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	
	private ResultSet rs;
	private Connection conn;
	private PreparedStatement pstmt = null;
	
	public UserDAO() {
	try {
			String dbURL = "jdbc:mysql://localhost:3306/CatFinder?serverTimeZone=UTC"; //스키마, 포트 설정
			String dbID = "root"; //디비 아이디 설정
			String dbPassword = "whitebread"; //디비 비밀번호 설정
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public String getNow() {
		String sql = "select now()";
		String now = "";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				now = rs.getString(1);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return now;
	}
	
	public int login(String id, String password) {
		String sql = "select userPassword from userInfo where userid = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(password.equals(rs.getString(1))) {
					return 1; //로그인 일치
				}
				else {
					return 0; //비밀번호 불일치
				}
			}
			else {
				return -1; //없는 아이디.
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
			
		return 2; //db오류.
	}
	
	public int regist(String id, String password, String email) {
		String sql = "insert into userInfo values(?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			pstmt.setString(3, email);
			pstmt.setString(4, getNow());
			return pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 2;
	}
	
	public int close() {
		try {
			if(conn != null)
				conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			if(rs != null)
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
