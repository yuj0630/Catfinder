package DB;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import properties.*;

public class FreeBoardDAO {
	private Connection conn = null;
	private ResultSet rs = null;
	private PreparedStatement pstmt = null;

	public FreeBoardDAO() {
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

	public int writeBoard(String title, String content, String id) {
		String sql = "insert into freeBoard (boardTitle, boardContent, userId)" + " values(?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, title);
			pstmt.setString(2, content);
			pstmt.setString(3, id);
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return 0;
	}

	public FreeBoardListVO listBoard() {
		FreeBoardListVO board = new FreeBoardListVO();
		String sql = "select * from freeBoard";

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				board.setBoardId(rs.getInt("boardID"));
				board.setBoardTitle(rs.getString("boardTitle"));
				board.setBoardDate(rs.getString("boardDate"));
				board.setUserId(rs.getString("userId"));
				board.setBoardAvailable(rs.getInt("boardAvailable"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return board;
	}

	public FreeBoardVO searchBoard(int id) {
		FreeBoardVO vo = new FreeBoardVO();
		String sql = "select boardTitle, boardContent, boardDate, userId from freeBoard where boardId = ?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				vo.setBoardTitle(rs.getString(1));
				vo.setBoardContent(rs.getString(2));
				vo.setBoardDate(rs.getString(3));
				vo.setUserId(rs.getString(4));
				vo.setBoardId(id);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return vo;
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
