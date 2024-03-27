package middleteamproject.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LogOutController implements Controller{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse reponse) {
	 
		HttpSession session = request.getSession(false);
		if (session != null) {
		    session.invalidate(); // 세션 무효화
		}
		
	
		return "";
		
	}

}
