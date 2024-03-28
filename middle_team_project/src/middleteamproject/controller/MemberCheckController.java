package middleteamproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.dao.MemberDAO;
import middleteamproject.dto.MemberDTO;

public class MemberCheckController implements Controller{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse reponse) {
	 String userId = request.getParameter("loginID");
	 String userPw = request.getParameter("loginPW");
	
	 
	 
	 MemberDAO loginMember = new MemberDAO();
	 MemberDTO checkMember = loginMember.findMember(userId,userPw);
	if(checkMember.getUserId()==null) {
		
		request.setAttribute("FoundInfo",false );
		return "/";
		
	}else {
		
		request.setAttribute("member",checkMember );
		request.setAttribute("FoundInfo",true );
		HttpSession session = request.getSession();
		session.setAttribute("username", checkMember.getUserName());
		return "/";
		
	}
	}

}
