import java.io.IOException.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import jsp.common.util.DBConnection;

public class BoardDAO 
{
    private static final Statement DBConnection = null;
	private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;
    
    private static BoardDAO instance;
    
    private BoardDAO(){}
    public static BoardDAO getInstance(){
        if(instance==null)
            instance=new BoardDAO();
        return instance;
    }
    
    // �������� �����´�.
    public int getSeq()
    {
        int result = 1;
        
        try {
            conn = DBConnection.getConnection();
            
            // ������ ���� �����´�. (DUAL : ������ ���� ������������ �ӽ� ���̺�)
            StringBuffer sql = new StringBuffer();
            sql.append("SELECT BOARD_NUM.NEXTVAL FROM DUAL");
            
            pstmt = conn.prepareStatement(sql.toString());
            // ���� ����
            rs = pstmt.executeQuery();
            
            if(rs.next())    result = rs.getInt(1);
 
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        
        close();
        return result;    
    } // end getSeq
    
    // �� ����
    public boolean boardInsert(BoardBean board)
    {
        boolean result = false;
        
        try {
            conn = DBConnection.getConnection();
            
            // �ڵ� Ŀ���� false�� �Ѵ�.
            conn.setAutoCommit(false);
            
            StringBuffer sql = new StringBuffer();
            sql.append("INSERT INTO MEMBER_BOARD");
            sql.append("(BOARD_NUM, BOARD_ID, BOARD_SUBJECT, BOARD_CONTENT, BOARD_FILE");
            sql.append(", BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_COUNT, BOARD_DATE)");
            sql.append(" VALUES(?,?,?,?,?,?,?,?,?,sysdate)");
 
            // ������ ���� �۹�ȣ�� �׷��ȣ�� ���
            int num = board.getBoard_num();
 
            pstmt = conn.prepareStatement(sql.toString());
            pstmt.setInt(1, num);
            pstmt.setString(2, board.getBoard_id());
            pstmt.setString(3, board.getBoard_subject());
            pstmt.setString(4, board.getBoard_content());
            pstmt.setString(5, board.getBoard_file());
            pstmt.setInt(6, num);
            pstmt.setInt(7, 0);
            pstmt.setInt(8, 0);
            pstmt.setInt(9, 0);
            
            int flag = pstmt.executeUpdate();
            if(flag > 0){
                result = true;
                // �Ϸ�� Ŀ��
                conn.commit(); 
            }
            
        } catch (Exception e) {
            try {
                conn.rollback();
            } catch (SQLException sqle) {
                sqle.printStackTrace();
            } 
            throw new RuntimeException(e.getMessage());
        }
        
        close();
        return result;    
    } // end boardInsert();
    
    
    // �۸�� ��������
    public ArrayList<BoardBean> getBoardList(HashMap<String, Object> listOpt)
    {
        ArrayList<BoardBean> list = new ArrayList<BoardBean>();
        
        String opt = (String)listOpt.get("opt"); // �˻��ɼ�(����, ����, �۾��� ��..)
        String condition = (String)listOpt.get("condition"); // �˻�����
        int start = (Integer)listOpt.get("start"); // ���� ��������ȣ
        
        try {
            conn = DBConnection.getConnection();
            StringBuffer sql = new StringBuffer();
            
            // �۸�� ��ü�� ������ ��
            if(opt == null)
            {
                // BOARD_RE_REF(�׷��ȣ)�� �������� ���� �� ������ �׷��ȣ�� ����
                // BOARD_RE_SEQ(�亯�� ����)�� ������������ ���� �� �Ŀ�
                // 10���� ���� �� ȭ�鿡 �����ִ�(start��° ���� start+9����) ����
                // desc : ��������, asc : �������� ( ���� ���� )
                sql.append("select * from ");
                sql.append("(select rownum rnum, BOARD_NUM, BOARD_ID, BOARD_SUBJECT");
                sql.append(", BOARD_CONTENT, BOARD_FILE, BOARD_COUNT, BOARD_RE_REF");
                sql.append(", BOARD_RE_LEV, BOARD_RE_SEQ, BOARD_DATE ");
                sql.append("FROM");
                sql.append(" (select * from MEMBER_BOARD order by BOARD_RE_REF desc, BOARD_RE_SEQ asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setInt(1, start);
                pstmt.setInt(2, start+9);
                
                // StringBuffer�� ����.
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("0")) // �������� �˻�
            {
                sql.append("select * from ");
                sql.append("(select rownum rnum, BOARD_NUM, BOARD_ID, BOARD_SUBJECT");
                sql.append(", BOARD_CONTENT, BOARD_FILE, BOARD_DATE, BOARD_COUNT");
                sql.append(", BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ ");
                sql.append("FROM ");
                sql.append("(select * from MEMBER_BOARD where BOARD_SUBJECT like ? ");
                sql.append("order BY BOARD_RE_REF desc, BOARD_RE_SEQ asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, "%"+condition+"%");
                pstmt.setInt(2, start);
                pstmt.setInt(3, start+9);
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("1")) // �������� �˻�
            {
                sql.append("select * from ");
                sql.append("(select rownum rnum, BOARD_NUM, BOARD_ID, BOARD_SUBJECT");
                sql.append(", BOARD_CONTENT, BOARD_FILE, BOARD_DATE, BOARD_COUNT");
                sql.append(", BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ ");
                sql.append("FROM ");
                sql.append("(select * from MEMBER_BOARD where BOARD_CONTENT like ? ");
                sql.append("order BY BOARD_RE_REF desc, BOARD_RE_SEQ asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, "%"+condition+"%");
                pstmt.setInt(2, start);
                pstmt.setInt(3, start+9);
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("2")) // ����+�������� �˻�
            {
                sql.append("select * from ");
                sql.append("(select rownum rnum, BOARD_NUM, BOARD_ID, BOARD_SUBJECT");
                sql.append(", BOARD_CONTENT, BOARD_FILE, BOARD_DATE, BOARD_COUNT");
                sql.append(", BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ ");
                sql.append("FROM ");
                sql.append("(select * from MEMBER_BOARD where BOARD_SUBJECT like ? OR BOARD_CONTENT like ? ");
                sql.append("order BY BOARD_RE_REF desc, BOARD_RE_SEQ asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, "%"+condition+"%");
                pstmt.setString(2, "%"+condition+"%");
                pstmt.setInt(3, start);
                pstmt.setInt(4, start+9);
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("3")) // �۾��̷� �˻�
            {
                sql.append("select * from ");
                sql.append("(select rownum rnum, BOARD_NUM, BOARD_ID, BOARD_SUBJECT");
                sql.append(", BOARD_CONTENT, BOARD_FILE, BOARD_DATE, BOARD_COUNT");
                sql.append(", BOARD_RE_REF, BOARD_RE_LEV, BOARD_RE_SEQ ");
                sql.append("FROM ");
                sql.append("(select * from MEMBER_BOARD where BOARD_ID like ? ");
                sql.append("order BY BOARD_RE_REF desc, BOARD_RE_SEQ asc)) ");
                sql.append("where rnum>=? and rnum<=?");
                
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, "%"+condition+"%");
                pstmt.setInt(2, start);
                pstmt.setInt(3, start+9);
                
                sql.delete(0, sql.toString().length());
            }
            
            rs = pstmt.executeQuery();
            while(rs.next())
            {
                BoardBean board = new BoardBean();
                board.setBoard_num(rs.getInt("BOARD_NUM"));
                board.setBoard_id(rs.getString("BOARD_ID"));
                board.setBoard_subject(rs.getString("BOARD_SUBJECT"));
                board.setBoard_content(rs.getString("BOARD_CONTENT"));
                board.setBoard_file(rs.getString("BOARD_FILE"));
                board.setBoard_count(rs.getInt("BOARD_COUNT"));
                board.setBoard_re_ref(rs.getInt("BOARD_RE_REF"));
                board.setBoard_re_lev(rs.getInt("BOARD_RE_LEV"));
                board.setBoard_re_seq(rs.getInt("BOARD_RE_SEQ"));
                board.setBoard_date(rs.getDate("BOARD_DATE"));
                list.add(board);
            }
            
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        
        close();
        return list;
    } // end getBoardList
    
    // ���� ������ �������� �޼���
    public int getBoardListCount(HashMap<String, Object> listOpt)
    {
        int result = 0;
        String opt = (String)listOpt.get("opt"); // �˻��ɼ�(����, ����, �۾��� ��..)
        String condition = (String)listOpt.get("condition"); // �˻�����
        
        try {
            conn = DBConnection.getConnection();
            StringBuffer sql = new StringBuffer();
            
            if(opt == null)    // ��ü���� ����
            {
                sql.append("select count(*) from MEMBER_BOARD");
                pstmt = conn.prepareStatement(sql.toString());
                
                // StringBuffer�� ����.
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("0")) // �������� �˻��� ���� ����
            {
                sql.append("select count(*) from MEMBER_BOARD where BOARD_SUBJECT like ?");
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, '%'+condition+'%');
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("1")) // �������� �˻��� ���� ����
            {
                sql.append("select count(*) from MEMBER_BOARD where BOARD_CONTENT like ?");
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, '%'+condition+'%');
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("2")) // ����+�������� �˻��� ���� ����
            {
                sql.append("select count(*) from MEMBER_BOARD ");
                sql.append("where BOARD_SUBJECT like ? or BOARD_CONTENT like ?");
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, '%'+condition+'%');
                pstmt.setString(2, '%'+condition+'%');
                
                sql.delete(0, sql.toString().length());
            }
            else if(opt.equals("3")) // �۾��̷� �˻��� ���� ����
            {
                sql.append("select count(*) from MEMBER_BOARD where BOARD_ID like ?");
                pstmt = conn.prepareStatement(sql.toString());
                pstmt.setString(1, '%'+condition+'%');
                
                sql.delete(0, sql.toString().length());
            }
            
            rs = pstmt.executeQuery();
            if(rs.next())    result = rs.getInt(1);
            
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
        
        close();
        return result;
    } // end getBoardListCount
 
    
    // DB �ڿ�����
    private void close()
    {
        try {
            if ( pstmt != null ){ pstmt.close(); pstmt=null; }
            if ( conn != null ){ conn.close(); conn=null;    }
        } catch (Exception e) {
            throw new RuntimeException(e.getMessage());
        }
    } // end close()
}

