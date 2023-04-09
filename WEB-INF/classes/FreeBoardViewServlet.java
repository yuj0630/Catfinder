

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.RequestDispatcher;

import DB.FreeBoardDAO;
import properties.*;

/**
 * Servlet implementation class FreeBoardViewAction
 */
@WebServlet("/FreeBoardViewAction")
public class FreeBoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		FreeBoardDAO dao = new FreeBoardDAO();
		FreeBoardListVO vo = new FreeBoardListVO();
		vo = dao.listBoard();
		dao.close();
		request.setAttribute("FREE_BOARD_LIST", vo);
		RequestDispatcher dispatcher = request.getRequestDispatcher("freeNoticeBoard.jsp");
		dispatcher.forward(request, response);
	}

}
