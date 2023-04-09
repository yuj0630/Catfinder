package properties;

import java.util.ArrayList;

public class MyCatListVO {
	private ArrayList<String> filePath = new ArrayList<String>();
	private ArrayList<String> name = new ArrayList<String>();
	private ArrayList<Integer> id = new ArrayList<Integer>();
	
	public String[] getFilePath() {
		return filePath.toArray(new String[filePath.size()]);
	}
	public void setFilePath(ArrayList<String> filePath) {
		this.filePath = filePath;
	}
	public String[] getName() {
		return name.toArray(new String[name.size()]);
	}
	public void setName(ArrayList<String> name) {
		this.name = name;
	}
	public Integer[] getId() {
		return id.toArray(new Integer[id.size()]);
	}
	public void setId(ArrayList<Integer> id) {
		this.id = id;
	}
	
	public int getListSize() {
		return id.size();
	}
	
}
