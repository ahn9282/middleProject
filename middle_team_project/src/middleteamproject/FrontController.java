package middleteamproject;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.command.BoardDeleteCommand;
import middleteamproject.command.BoardListCommand;
import middleteamproject.command.BoardModifyCommand;
import middleteamproject.command.BoardReadCommand;
import middleteamproject.command.BoardUpGoodCommand;
import middleteamproject.command.BoardUpHateCommand;
import middleteamproject.command.BoardWriteCommand;
import middleteamproject.command.Command;
import middleteamproject.command.CommentLikeCommand;
import middleteamproject.command.CommentWriteCommand;
import middleteamproject.command.GameAvoidBallCommand;
import middleteamproject.command.LogOutCommand;
import middleteamproject.command.MemberCheckCommand;
import middleteamproject.command.MemberDeleteCommand;
import middleteamproject.command.MemberInqueryCommand;
import middleteamproject.command.MemberJoinCommand;
import middleteamproject.command.MemberModifyCommand;
import middleteamproject.command.MembersaveCommand;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String nowUri = "/";

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
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		HttpSession session = request.getSession();
		if ((String) session.getAttribute("userId") != null) {
			// session에서 userId 꺼내오기
			String userId = (String) session.getAttribute("userId");
			String sessionId = session.getId();
			SessionListener sessionListener = new SessionListener();
			if (!sessionListener.checkValidSessionId(userId, sessionId) && com != "/check_member") {

				session.invalidate(); // 세션 무효화
				response.sendRedirect(request.getContextPath() + "/duplicated_member");
				return;
			}
		}

		request.setCharacterEncoding("UTF-8");
		String viewPage = null;
		Command command = null;

		System.out.println("uri : " + uri);
		System.out.println("conPath : " + conPath);
		System.out.println("com : " + com);

		if (com.equals("/home")) {
			viewPage = "index.jsp";
			nowUri = com;
			methodForward(request, response, viewPage);

		} else if (com.equals("/duplicated_member")) {
			request.setAttribute("isDuplicated", "Y");
			viewPage = "/home";

			methodForward(request, response, viewPage);

		} else if (com.equals("/join_member")) {

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
			viewPage = nowUri + ".jsp";

			methodForward(request, response, viewPage);

		} else if (com.equals("/board")) {
			command = new BoardListCommand();
			viewPage = command.process(request, response);
			nowUri = com;

			methodForward(request, response, viewPage);

		} else if (com.equals("/board_view")) {
			command = new BoardReadCommand();
			viewPage = command.process(request, response);
			String queryString = "?" + request.getQueryString();
			nowUri = com + queryString;

			methodForward(request, response, viewPage);

		} else if (com.equals("/board_modifyView")) {

			viewPage = "/board_modifyView.jsp";
			methodForward(request, response, viewPage);

		} else if (com.equals("/board_modify")) {

			command = new BoardModifyCommand();
			viewPage = command.process(request, response);
			methodRedirect(request, response, viewPage);

		} else if (com.equals("/board_delete")) {

			command = new BoardDeleteCommand();
			viewPage = command.process(request, response) + nowUri;
			methodRedirect(request, response, viewPage);

		} else if (com.equals("/board_WriteForm")) {

			viewPage = com + ".jsp";
			methodForward(request, response, viewPage);

		} else if (com.equals("/board_Write")) {

			command = new BoardWriteCommand();
			viewPage = command.process(request, response);
			methodRedirect(request, response, viewPage);

		} else if (com.equals("/board_good")) {

			command = new BoardUpGoodCommand();
			viewPage = command.process(request, response) + nowUri;
			methodRedirect(request, response, viewPage);

		} else if (com.equals("/board_hate")) {

			command = new BoardUpHateCommand();
			viewPage = command.process(request, response) + nowUri;
			methodRedirect(request, response, viewPage);

		} else if (com.equals("/comment_write")) {

			command = new CommentWriteCommand();
			viewPage = command.process(request, response) + nowUri;
			methodRedirect(request, response, viewPage);

		} else if (com.equals("/comment_like")) {

			command = new CommentLikeCommand();
			viewPage = command.process(request, response) + nowUri;
			methodRedirect(request, response, viewPage);

		} else if (com.equals("/inquery_member")) {

			command = new MemberInqueryCommand();
			viewPage = command.process(request, response) + com + ".jsp";
			methodForward(request, response, viewPage);

		} else if (com.equals("/modify_member")) {

			command = new MemberModifyCommand();
			viewPage = command.process(request, response);
			methodRedirect(request, response, viewPage);

		} else if (com.equals("/delete_member")) {

			command = new MemberDeleteCommand();
			viewPage = command.process(request, response);
			methodRedirect(request, response, viewPage);

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
		String redirectUri = request.getContextPath() + viewPage;
		try {
			response.sendRedirect(redirectUri);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
