package middleteamproject.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.dao.BoardDAO;
import middleteamproject.dto.BoardDTO;


public class BoardModifyCommand implements Command {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int bidnum = Integer.parseInt(request.getParameter("bid"));
		String btitle = request.getParameter("btitle");
		String bwriter = request.getParameter("bwriter");
		String bcontent = request.getParameter("bcontent");
		
		BoardDAO modifier = new BoardDAO();
		modifier.modify(bidnum, btitle, bwriter, bcontent);

		return "/board_view?bid="+bidnum;
	}

}
