

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.*;
import properties.*;

@WebServlet("/MyCatViewAction")
public class MyCatViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		//고양이 정보 받아오고
		MyCatDAO myDao = new MyCatDAO();
		ArrayList<MyCatVO> myCatList = new ArrayList<MyCatVO>();
		myCatList = myDao.getAllMyCat();
		myDao.close();
		ArrayList<String> nameList = new ArrayList<String>();
		ArrayList<Integer> idList = new ArrayList<Integer>();
		ArrayList<String> pathList = new ArrayList<String>();
		
		MyCatImageDAO iDao = new MyCatImageDAO();
		/*ServletContext sc = request.getServletContext();
		String path = sc.getRealPath("/myCatImage/");*/
		for(int i = 0; i < myCatList.size(); i++) {
			nameList.add(myCatList.get(i).getName());
			idList.add(myCatList.get(i).getId());
			String temp = iDao.getRealName(myCatList.get(i).getId());
			
			if(temp.equals(""))
			{
				pathList.add("myCatImage/noImage.png");
				System.out.println("myCatImage/noImage.png");
			}
			else {
				pathList.add("myCatImage/" + iDao.getRealName(myCatList.get(i).getId()));
				System.out.println("myCatImage/" + iDao.getRealName(myCatList.get(i).getId()));
			}
		}
		
		iDao.close();
		
		MyCatListVO myList = new MyCatListVO();
		myList.setFilePath(pathList);
		myList.setId(idList);
		myList.setName(nameList);
		
		request.setAttribute("MY_CAT_LIST", myList);
		RequestDispatcher dis = request.getRequestDispatcher("myCatList.jsp");
		dis.forward(request, response);
	}

}
