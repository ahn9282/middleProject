package middleteamproject.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.dao.MemberDAO;
import middleteamproject.dto.MemberDTO;
import middleteamproject.SessionListener; 

public class MemberCheckCommand implements Command {

  

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) {
        String userId = request.getParameter("loginID");
        String userPw = request.getParameter("loginPW");

        MemberDAO loginMember = new MemberDAO();
        MemberDTO checkMember = loginMember.findMember(userId, userPw);

        if (checkMember.getUserId() == null) {
            request.setAttribute("FoundInfo", false);
            return "/";
            //DB member테이블에 해당 정보가 틀리거나 없을 경우
        } else {
        	//중복 로그인 체크에 사용되는 SessionListener객체 호출
        	SessionListener sessionListener = new SessionListener();
        	HttpSession session = request.getSession();
        	// 해당 Session객체에 회원 클라이언트의 Id와 해당 sessionID 저장하여 로그인 유지
        	session.setAttribute("username", checkMember.getUserName());
        	session.setAttribute("userId", checkMember.getUserId());
            // 중복 로그인일 경우 "duplicate"를 보낸 다음
        	
        	// SessionListener객체에 현재 로그인 한 id를 우선은로 저장
            if (SessionListener.duplicateLogin(checkMember.getUserId())) {
            	request.setAttribute("FoundInfo", "duplicate");
                sessionListener.manageSession(session);
                
            } else {
            	sessionListener.manageSession(session);
                request.setAttribute("FoundInfo", true);
                request.setAttribute("member", checkMember);
                // 현재 로그인한 정보 sessionListener객체에 등록하여 관리
            }
            return "/";
        }
    }
}
