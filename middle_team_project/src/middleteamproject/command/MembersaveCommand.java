package middleteamproject.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middleteamproject.dao.GamesDAO;
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
	 //DB 내 member Table에 회원 저장
	 GamesDAO gameRecord = new GamesDAO();
	 gameRecord.createRecord(userId);
	 gameRecord.createChat(userId, name);
	 //DB 내 Games Table에 default값 0 으로 회원 저장
	 return "/home";
	}

}
