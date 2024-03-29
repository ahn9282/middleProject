package middleteamproject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middleteamproject.command.Command;
import middleteamproject.command.GameAvoidBallCommand;
import middleteamproject.command.LogOutCommand;
import middleteamproject.command.MemberCheckCommand;
import middleteamproject.command.MemberJoinCommand;
import middleteamproject.command.MembersaveCommand;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String nowUri ="/";
	
	public FrontController() {

	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost() ..");

		doAction(request, response);
	}

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
		Command command = null;
		

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("com : " + com);

		if (com.equals("/")) {
			viewPage = "index.jsp";
			nowUri = com;
			methodForward(request, response, viewPage);

		} else if (com.equals("/join_member")) {


			viewPage = "/join_member.jsp";

			command = new MemberJoinCommand();
			viewPage = command.process(request, response);
			

			methodForward(request, response, viewPage);

		} else if (com.equals("/save_member")) {

			command = new MembersaveCommand();
			viewPage = command.process(request, response);

			methodRedirect(request, response, viewPage);

		} else if (com.equals("/check_member")) {
			command = new MemberCheckCommand();
			viewPage = command.process(request, response);
			methodForward(request, response, nowUri);

		} else if (com.equals("/logout")) {
			command = new LogOutCommand();
			viewPage = command.process(request, response);
			methodRedirect(request, response, nowUri);

		} else if (com.equals("/game_avoidBall")) {
			command = new GameAvoidBallCommand();
			viewPage = command.process(request, response);
			nowUri = com;
			viewPage =nowUri+".jsp";
			methodForward(request, response, viewPage);

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
