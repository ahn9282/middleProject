package middleteamproject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import middleteamproject.controller.Controller;
import middleteamproject.controller.LogOutController;
import middleteamproject.controller.MemberCheckController;
import middleteamproject.controller.MemberJoinController;
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
		String nowUri = "";

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());
		
		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("com : " + com);

		if (com.equals("/")) {
			System.out.println("index.jsp");
			viewPage = "index.jsp";
			nowUri=com;
			methodForward(request, response, viewPage);

		} else if (com.equals("/join_member")) {
			controller = new MemberJoinController();
			viewPage = controller.process(request, response);
			
			methodForward(request, response, viewPage);

		} else if (com.equals("/save_member")) {
			
			controller = new MembersaveController();
			viewPage = controller.process(request, response);
			
			methodRedirect(request, response, viewPage);

		} else if (com.equals("/check_member")) {
			controller = new MemberCheckController();
			viewPage = controller.process(request, response);
			methodForward(request, response, nowUri);
			
		} else if (com.equals("/logout")) {
			controller = new LogOutController();
			viewPage = controller.process(request, response);
			methodRedirect(request, response, nowUri);


		}

	}

	protected void methodForward(HttpServletRequest request, HttpServletResponse response, String viewPage) {
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);

		try {
			dispatcher.forward(request, response);
		} catch (ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	protected void methodRedirect(HttpServletRequest request, HttpServletResponse response, String viewPage) {
		String redirectUri = "/middle_team_project" + viewPage;
		try {
			response.sendRedirect(redirectUri);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
