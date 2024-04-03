package middleteamproject.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.dao.BoardDAO;


public class BoardWriteCommand implements Command {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String bWriterId = (String)session.getAttribute("userId");
		String bwriter =(String)session.getAttribute("username");
		String btitle = request.getParameter("btitle");
		String bcontent = request.getParameter("bcontent");
		
		BoardDAO writer = new BoardDAO();
		writer.write(bwriter, bWriterId, btitle, bcontent);
		

		return "/board";
	}

}
