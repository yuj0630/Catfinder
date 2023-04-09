

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
 * Servlet implementation class FreeBoardReadServlet
 */
@WebServlet("/FreeBoardReadAction")
public class FreeBoardReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		
		int id = 0;
		id = (request.getParameter("BOARD_ID") == null)? 0 : Integer.parseInt(request.getParameter("BOARD_ID"));
		
		FreeBoardDAO dao = new FreeBoardDAO();
		FreeBoardVO vo = new FreeBoardVO();
		vo = dao.searchBoard(id);
		
		request.setAttribute("BOARD", vo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("freeBoardRead.jsp");
		dispatcher.forward(request, response);
	}

}
