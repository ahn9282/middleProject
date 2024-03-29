package middleteamproject.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.dao.AvoidBallDAO;
import middleteamproject.dto.AvoidBallDTO;

public class GameAvoidBallCommand implements Command {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int record;
		int topRecord = 0;
		String playerId = (String) session.getAttribute("userId");
		String userName = (String) session.getAttribute("username");
		AvoidBallDAO dao = new AvoidBallDAO();
		List<AvoidBallDTO> topList = dao.topranklist();
		request.setAttribute("topList", topList);
		
		
		if (request.getParameter("recordtext") == null) {
			 record = 0;
		} else {

			 record = Integer.parseInt(request.getParameter("recordtext"));
		}
		
	
		
		if(playerId != null) {
			AvoidBallDTO player = dao.topRecord(playerId);
			if(player.getPlayerdate()==null) {
				topRecord = 0;
			}else {
				topRecord = player.getPlayerRecord();
			}
			String pname = player.getPname();
			
			if(record >0 && player.getPlayerdate()==null) {
				//추가
			
				dao.insertPlayer(playerId,record,userName);
			}else {
				//업데이트
				dao.updateRecord(playerId,record);
			}
			
		}
		
		request.setAttribute("topRecord", topRecord);
		

		return "";

	}

}
