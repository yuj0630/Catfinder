

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DB.*;
import properties.*;
/**
 * Servlet implementation class MyCatReadServlet
 */
@WebServlet("/MyCatReadAction")
public class MyCatReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		String id = request.getParameter("ID");
		
		MyCatDAO myDao = new MyCatDAO();
		MyCatVO myCat = myDao.getMyCat(Integer.parseInt(id));
		myDao.close();
		
		MyCatImageDAO iDao = new MyCatImageDAO();
		String image = iDao.getRealName(Integer.parseInt(id));
		String path = "";
		if(!image.equals("")) {
			path = "myCatImage/" + iDao.getRealName(Integer.parseInt(id));
		}
		else {
			path = "myCatImage/noImage.png";
		}

		iDao.close();
		
		request.setAttribute("PATH", path);
		request.setAttribute("CAT", myCat);
		RequestDispatcher dis = request.getRequestDispatcher("myCatRead.jsp");
		dis.forward(request, response);
	}

}
