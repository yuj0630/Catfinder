

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
		String id = "";
		String password = "";
		String passwordConfirm = "";
		String email = "";
		
		id = (String) request.getParameter("user-id");
		password = (String) request.getParameter("password");
		passwordConfirm = (String) request.getParameter("passwordConfirm");
		email = (String) request.getParameter("Email");
		
		if(id.equals("") || password.equals("") || passwordConfirm.equals("") || email.equals("")) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('입력되지 않은 정보가 있습니다.');");
			out.println("history.back(); </script>");
			out.close();
		}
		
		else if(!password.equals(passwordConfirm)) {
			PrintWriter out = response.getWriter();
			out.println("<script>alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.back(); </script>");
			out.close();
		}
		
		else {
			UserDAO dao = new UserDAO();
			int result = dao.regist(id, password, email);
			
			//디비 오류
			if(result == 0) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('회원가입 실패(디비)');");
				out.println("history.back(); </script>");
				out.close();
			}
			
			//있는 아이디
			else if(result == 2) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('이미 존재하는 아이디 입니다.');");
				out.println("history.back(); </script>");
				out.close();
			}
			
			//성공
			else if(result == 1) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('회원가입에 성공 했습니다.'); </script>");
				HttpSession session = request.getSession();
				session.setAttribute("user-id", id);
				response.sendRedirect("index.jsp");
				out.close();
			}
			dao.close();
		}
	}

}
