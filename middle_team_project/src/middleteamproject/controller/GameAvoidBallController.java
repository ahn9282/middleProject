package middleteamproject.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class GameAvoidBallController implements Controller{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
	 HttpSession session = request.getSession();
		String record = request.getParameter("recordtext");
		String playerId = (String) session.getAttribute("userId");
		System.out.println("나의 기록은 " + record);
		System.out.println("나의 아이디 :  " + playerId);
	
		return "";
		
	}

}
