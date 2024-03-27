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
	 System.out.println("입력 ID : "+userId);
	 System.out.println("입력 PW : " + userPw);
	 
	 
	 MemberDAO loginMember = new MemberDAO();
	 MemberDTO checkMember = loginMember.findMember(userId,userPw);
	if(checkMember.getUserId()==null) {
		System.out.println("로그인 정보 틀림");
		request.setAttribute("notFoundInfo",true );
		return "";
		
	}else {
		System.out.println("로그인 정보 맞음");
		System.out.println("로그인한 ㅁ메버의 Id : " + checkMember.getUserId());
		request.setAttribute("member",checkMember );
		request.setAttribute("notFoundInfo",false );
		HttpSession session = request.getSession();
		session.setAttribute("username", checkMember.getUserName());
		return "";
		
	}
	}

}
