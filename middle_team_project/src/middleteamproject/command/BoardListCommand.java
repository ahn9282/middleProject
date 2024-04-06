package middleteamproject.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.dao.BoardDAO;
import middleteamproject.dto.BoardDTO;


public class BoardListCommand implements Command {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		BoardDAO boardDao = new BoardDAO();
		List<BoardDTO> list = boardDao.boardList();
		HttpSession session = request.getSession();
		request.setAttribute("boardList", list);
		request.setAttribute("boardQuantity", list.size());
		String userId = (String)session.getAttribute("userId");
		request.setAttribute("userId", userId);
		
		System.out.println("보드 사이즈" + list.size());

		return "/board_main.jsp";
	}

}
