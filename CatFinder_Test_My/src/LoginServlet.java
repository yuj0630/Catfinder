

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
			out.println("<script>alert('���̵�� ��й�ȣ�� �Է��� �ּ���.');</script>");
			out.println("<script>history.back();</script>");
			out.close();
		}
		else {
			UserDAO dao = new UserDAO();
			int correct = dao.login(id, password);
			
			//�α��� ��ġ.
			if(correct == 1) {
				HttpSession session = request.getSession();
				session.setAttribute("user-id", id);
				response.sendRedirect("index.jsp");
			}
			
			//���� ���̵�
			else if(correct == -1) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('���� ���̵� �Դϴ�.');</script>");
				out.println("<script>history.back();</script>");
				out.close();
			}
			
			//��й�ȣ
			else if(correct == 0) {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.');</script>");
				out.println("<script>history.back();</script>");
				out.close();
			}
			
			//��� ���� ����
			else {
				PrintWriter out = response.getWriter();
				out.println("<script>alert('��� ����.');</script>");
				out.println("<script>history.back();</script>");
				out.close();
			}
			dao.close();
		}
	}

}
