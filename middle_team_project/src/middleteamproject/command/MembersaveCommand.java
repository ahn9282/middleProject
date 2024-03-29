package middleteamproject.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middleteamproject.dao.MemberDAO;

public class MembersaveCommand implements Command{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
	 String userId = request.getParameter("userID");
	 String userPw = request.getParameter("userPW");
	 String name = request.getParameter("youname");
	 System.out.println("userId : " + userId);
	 
	 MemberDAO joinMember = new MemberDAO();
	 joinMember.saveMember(userId, userPw, name);
	 return "/";
	}

}
