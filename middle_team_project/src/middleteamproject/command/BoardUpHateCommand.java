package middleteamproject.command;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middleteamproject.dao.BoardDAO;
import middleteamproject.dao.CommentDAO;
import middleteamproject.dto.BoardDTO;
import middleteamproject.dto.CommentDTO;


public class BoardUpHateCommand implements Command {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int boardnum = Integer.parseInt(request.getParameter("bidH"));
		BoardDAO boardDao = new BoardDAO();
		boardDao.upHate(boardnum);
		
		
		return "";
	}

}
