package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
	
	private ResultSet rs;
	private Connection conn;
	
	public UserDAO() {
	try {
			String dbURL = "jdbc:mysql://localhost:3306/CatFinder?serverTimeZone=UTC"; //��Ű��, ��Ʈ ����
			String dbID = "root"; //��� ���̵� ����
			String dbPassword = "whitebread"; //��� ��й�ȣ ����
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
			PreparedStatement pstmt = conn.prepareStatement(sql);
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
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(password.equals(rs.getString(1))) {
					return 1; //�α��� ��ġ
				}
				else {
					return 0; //��й�ȣ ����ġ
				}
			}
			else {
				return -1; //���� ���̵�.
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
			
		return 2; //db����.
	}
	
	public int regist(String id, String password, String email) {
		String sql = "select userId from userInfo where userId = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				//�̹� �ִ� ���̵�.
				return 2;
			}
			else {
				sql = "insert into userInfo values(?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, id);
				pstmt.setString(2, password);
				pstmt.setString(3, email);
				pstmt.setString(4, getNow());
				return pstmt.executeUpdate();
				//1 : ����, 0 : ����.
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
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
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 1;
	}

}
