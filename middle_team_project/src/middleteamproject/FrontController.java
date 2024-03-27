package middleteamproject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.controller.Controller;
import middleteamproject.controller.LogOutController;
import middleteamproject.controller.MemberCheckController;
import middleteamproject.controller.MembersaveController;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontController() {

		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost() ..");

		doAction(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost() ..");

		doAction(request, response);
	}

	protected void doAction(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("actionDo() ..");

		request.setCharacterEncoding("UTF-8");
		String viewPage = null;
		Controller controller = null;

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("com : " + com);

		if (com.equals("")) {
			System.out.println("index.jsp");
			viewPage = "index.jsp";

		} else if (com.equals("/join_member")) {
			viewPage = "/join_member.jsp";

		} else if (com.equals("/save_member")) {
			System.out.println("저장 완료");
			controller = new MembersaveController();
			viewPage = controller.process(request, response);

		} else if (com.equals("/check_member")) {
			controller = new MemberCheckController();
			viewPage = controller.process(request, response);

		} else if (com.equals("/logout")) {
			controller = new LogOutController();
			viewPage = controller.process(request, response);

		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);

		dispatcher.forward(request, response);
	}

}
