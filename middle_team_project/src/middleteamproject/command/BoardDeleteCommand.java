package middleteamproject.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middleteamproject.dao.BoardDAO;
import middleteamproject.dao.CommentDAO;


public class BoardDeleteCommand implements Command {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int bidnum = Integer.parseInt(request.getParameter("deleteBid"));
		
		BoardDAO deleteBoard = new BoardDAO();
		deleteBoard.delete(bidnum);
		
		CommentDAO deleteComment = new CommentDAO();
		deleteComment.delete(bidnum);

		return "";
	}

}
