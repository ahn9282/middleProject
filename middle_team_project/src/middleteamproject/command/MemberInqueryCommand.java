package middleteamproject.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.dao.AvoidBallDAO;
import middleteamproject.dao.MemberDAO;
import middleteamproject.dto.AvoidBallDTO;
import middleteamproject.dto.MemberDTO;
import middleteamproject.SessionListener; 

public class MemberInqueryCommand implements Command {

  

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) {
    	HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("userId");

        MemberDAO loginMember = new MemberDAO();
        MemberDTO infoMember = loginMember.infoMember(userId);
        request.setAttribute("userName", infoMember.getUserName());
        request.setAttribute("userPw", infoMember.getUserPw());
        
        AvoidBallDAO player = new AvoidBallDAO();
        AvoidBallDTO toprecord = player.topRecord(userId);
        int ranking = player.showRanking(userId);
        request.setAttribute("toprecord", toprecord.getPlayerRecord());
        request.setAttribute("ranking", ranking);
        
            return "/";
        }
    }

