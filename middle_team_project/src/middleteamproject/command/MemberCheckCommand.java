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
            
        } else {
        	
        	SessionListener sessionListener = new SessionListener();
        	HttpSession session = request.getSession();
        	session.setAttribute("username", checkMember.getUserName());
        	session.setAttribute("userId", checkMember.getUserId());
        	
            // 중복 로그인 체크
            if (SessionListener.duplicateLogin(checkMember.getUserId())) {
            	request.setAttribute("FoundInfo", "duplicate");
                System.out.println("중복 ID 여부 : OK");
                sessionListener.manageSession(session);
                
            } else {
            	sessionListener.manageSession(session);
                request.setAttribute("FoundInfo", true);
                request.setAttribute("member", checkMember);

            }
            return "/";
        }
    }
}
