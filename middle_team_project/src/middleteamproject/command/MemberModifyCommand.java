package middleteamproject.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.dao.MemberDAO;
import middleteamproject.dto.MemberDTO;
import middleteamproject.SessionListener; 

public class MemberModifyCommand implements Command {

  

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) {
    	HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("userId");
        String userName = request.getParameter("nameUser");
        String userPw = request.getParameter("pwUser");

        MemberDAO modifyDao = new MemberDAO();
        modifyDao.modifyMember(userId,userName,userPw);
            return "/logout";
        }
    }

