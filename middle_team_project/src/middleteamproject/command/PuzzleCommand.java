package middleteamproject.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.dao.GamesDAO;


public class PuzzleCommand implements Command {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int countResult = 0;
		if(request.getParameter("playTime") != null) {
		 countResult=Integer.parseInt(request.getParameter("playTime"));
		}else{
			
		}
		System.out.println("내 기록은 " + countResult);
		HttpSession session = request.getSession();
		String userId = (String)session.getAttribute("userId");
		GamesDAO puzzle = new GamesDAO();
		int record = puzzle.showPuzzleCount(userId);
		
		if(countResult < record && countResult!=0) {
			puzzle.brakingCountPuzzle(userId, countResult);
			
			try {
				Thread.sleep(5000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		
		return "";
	}

}
