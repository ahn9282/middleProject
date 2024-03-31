package middleteamproject.command;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middleteamproject.dao.CommentDAO;


public class CommentLikeCommand implements Command {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int boardnum = Integer.parseInt(request.getParameter("commentBelong"));
		String commentCont = request.getParameter("commentCont");
		int commentReco = Integer.parseInt(request.getParameter("commentReco"));
		CommentDAO comment = new CommentDAO();
		comment.upLike(boardnum,commentCont,commentReco);
		
		return "";
	}

}
