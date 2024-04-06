package middleteamproject.command;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middleteamproject.dao.BoardDAO;
import middleteamproject.dao.CommentDAO;
import middleteamproject.dto.BoardDTO;
import middleteamproject.dto.CommentDTO;


public class BoardReadCommand implements Command {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int boardnum = Integer.parseInt(request.getParameter("bid"));
		BoardDAO boardDao = new BoardDAO();
		boardDao.upHit(boardnum);
		BoardDTO boardContent = boardDao.boarRead(boardnum);
		
		CommentDAO cDao = new CommentDAO();
		List<CommentDTO> comments = cDao.commentList(boardnum);
		
		request.setAttribute("selectBoard", boardContent);
		request.setAttribute("comments", comments);
		
		return "/board_view.jsp";
	}

}
