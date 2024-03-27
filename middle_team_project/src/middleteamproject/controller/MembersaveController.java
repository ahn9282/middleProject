package middleteamproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middleteamproject.dao.MemberDAO;

public class MembersaveController implements Controller{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse reponse) {
	 String userId = request.getParameter("userID");
	 String userPw = request.getParameter("userPW");
	 String name = request.getParameter("youname");
	 
	 MemberDAO joinMember = new MemberDAO();
	 joinMember.saveMember(userId, userPw, name);
	 return "";
	}

}
