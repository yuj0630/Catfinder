

import java.io.IOException;
import java.io.PrintWriter;
import DB.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.websocket.SendResult;
import javax.websocket.Session;
import javax.xml.ws.Dispatch;

@WebServlet("/LoginAction")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();

    }
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		String id = (request.getParameter("user-id") == null)? "" : request.getParameter("user-id");
		String password = (request.getParameter("password") == null)? "" : request.getParameter("password");
		
		if(id.equals("") || password.equals("")) {
			response.sendRedirect("ResultForm/LoginResult.jsp?LOGIN_RESULT=BACK");
		}
		else {
			UserDAO dao = new UserDAO();
			int correct = dao.login(id, password);
			
			//로그인 일치.
			if(correct == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("LOGIN_ID", id);
				response.sendRedirect("ResultForm/LoginResult.jsp?LOGIN_RESULT=SUCCESS");
			}
			
			//없는 아이디
			else if(correct == -1) {
				response.sendRedirect("ResultForm/LoginResult.jsp?LOGIN_RESULT=ID_FAIL");
			}
			
			//비밀번호
			else if(correct == 0) {
				response.sendRedirect("ResultForm/LoginResult.jsp?LOGIN_RESULT=PASSWORD_FAIL");
			}
			
			dao.close();
		}
	}

}
