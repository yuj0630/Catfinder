

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
		String id = "";
		String password = "";
		id = request.getParameter("user-id");
		password = request.getParameter("password");
		
		if(id.equals("") || password.equals("")) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('아이디와 비밀번호를 입력해 주세요.');</script>");
			out.println("<script>history.back();</script>");
			out.close();
		}
		else {
			UserDAO dao = new UserDAO();
			int correct = dao.login(id, password);
			
			//로그인 일치.
			if(correct == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("user-id", id);
				response.sendRedirect("index.jsp");
			}
			
			//없는 아이디
			else if(correct == -1) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('없는 아이디 입니다.');</script>");
				out.println("<script>history.back();</script>");
				out.close();
			}
			
			//비밀번호
			else if(correct == 0) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('비밀번호가 틀렸습니다.');</script>");
				out.println("<script>history.back();</script>");
				out.close();
			}
			
			//디비 접속 오류
			else {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('디비 오류.');</script>");
				out.println("<script>history.back();</script>");
				out.close();
			}
			dao.close();
		}
	}

}
