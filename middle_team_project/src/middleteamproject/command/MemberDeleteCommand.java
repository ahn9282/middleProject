package middleteamproject.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.dao.AvoidBallDAO;
import middleteamproject.dao.GamesDAO;
import middleteamproject.dao.MemberDAO;
import middleteamproject.dto.MemberDTO;
import middleteamproject.SessionListener; 

public class MemberDeleteCommand implements Command {

  

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) {
    	HttpSession session = request.getSession();
        String userId = (String)session.getAttribute("userId");

        MemberDAO deletedao = new MemberDAO();
        deletedao.deleteMember(userId);
        GamesDAO games=new GamesDAO();
        games.deleteRecord(userId);
        AvoidBallDAO ball = new AvoidBallDAO();
        ball.deleteBallRecord(userId);
        
            return "/logout";
        }
    }

