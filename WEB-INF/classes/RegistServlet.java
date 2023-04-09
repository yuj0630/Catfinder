

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DB.UserDAO;

@WebServlet("/RegistAction")
public class RegistServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public RegistServlet() {
		super();
	}
       
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");

		String id = (request.getParameter("user-id") == null)? "" : request.getParameter("user-id");
		String password = (request.getParameter("password") == null)? "" : request.getParameter("password");
		String passwordConfirm = (request.getParameter("passwordConfirm") == null)? "" : request.getParameter("passwordConfirm");
		String email = (request.getParameter("Email") == null)? "" : request.getParameter("Email");
		
		if(id.equals("") || password.equals("") || passwordConfirm.equals("") || email.equals("")) {
			response.sendRedirect("ResultForm/RegistResult.jsp?REGIST_RESULT=BACK");
		}
		
		else if(!password.equals(passwordConfirm)) {
			response.sendRedirect("ResultForm/RegistResult.jsp?REGIST_RESULT=PASSWORD_FAIL");
		}
		
		else {
			UserDAO dao = new UserDAO();
			int result = dao.regist(id, password, email);

			//있는 아이디
			if(result == 0) {
				response.sendRedirect("ResultForm/RegistResult.jsp?REGIST_RESULT=ID_FAIL");
			}
			
			//성공
			else if(result == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("LOGIN_ID", id);
				response.sendRedirect("ResultForm/RegistResult.jsp?REGIST_RESULT=SUCCESS");
			}
			else {
				response.sendRedirect("ResultForm/RegistResult.jsp?REGIST_RESULT=FAIL");
			}
			dao.close();
		}
	}

}
