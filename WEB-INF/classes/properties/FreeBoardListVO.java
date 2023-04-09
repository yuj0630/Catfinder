package properties;

import java.util.*;

public class FreeBoardListVO {
	private ArrayList<Integer> boardId = new ArrayList<Integer>();
	private ArrayList<String> boardTitle = new ArrayList<String>();
	private ArrayList<String> boardContent = new ArrayList<String>();
	private ArrayList<String> boardDate = new ArrayList<String>();
	private ArrayList<String> userId = new ArrayList<String>();
	private ArrayList<Integer> boardAvailable = new ArrayList<Integer>();
	
	public void setBoardId(int id) {
		boardId.add(id);
	}
	
	public Integer[] getBoardId() {
		return boardId.toArray(new Integer[boardId.size()]);
	}
	
	public void setBoardTitle(String title) {
		boardTitle.add(title);
	}
	
	public String[] getBoardTitle() {
		return boardTitle.toArray(new String[boardTitle.size()]);
	}
	
	public void setBoardContent(String content) {
		boardContent.add(content);
	}
	
	public String[] getBoardContent() {
		return boardContent.toArray(new String[boardContent.size()]);
	}
	
	public void setBoardDate(String date) {
		boardDate.add(date);
	}
	
	public String[] getBoardDate() {
		return boardDate.toArray(new String[boardDate.size()]);
	}
	
	public void setUserId(String id) {
		userId.add(id);
	}
	
	public String[] getUserId() {
		return userId.toArray(new String[userId.size()]);
	}
	
	public void setBoardAvailable(int available) {
		boardAvailable.add(available);
	}
	
	public Integer[] getBoardAvailable() {
		return boardAvailable.toArray(new Integer[boardAvailable.size()]);
	}
	
	public int getListSize() {
		return boardId.size();
	}

}
