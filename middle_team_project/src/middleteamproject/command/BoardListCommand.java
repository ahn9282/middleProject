package middleteamproject.command;

import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import middleteamproject.dao.BoardDAO;
import middleteamproject.dto.BoardDTO;


public class BoardListCommand implements Command {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO boardDao = new BoardDAO();
		List<BoardDTO> list = boardDao.boardList();
		request.setAttribute("boardList", list);
		request.setAttribute("boardQuantity", list.size());
		System.out.println("보드 사이즈" + list.size());

		return "/board_main.jsp";
	}

}
