package middleteamproject.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.dao.BoardDAO;


public class BoardModifyCommand implements Command {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int bidnum = Integer.parseInt(request.getParameter("bid"));
		HttpSession session = request.getSession();
		String btitle = request.getParameter("btitle");
		String bwriter = (String) session.getAttribute("username");
		String bcontent = request.getParameter("bcontent");
		System.out.println("bwriter:" + bwriter);
		BoardDAO modifier = new BoardDAO();
		modifier.modify(bidnum, btitle, bwriter, bcontent);

		return "/board_view?bid="+bidnum;
	}

}
