package middleteamproject.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import middleteamproject.dao.AvoidBallDAO;
import middleteamproject.dto.AvoidBallDTO;

public class GameAvoidBallCommand implements Command {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		int record; //현재 기록 저장 변수
		int topRecord = 0; //회원의 최고 기록 에 사용될 변수
		String playerId = (String) session.getAttribute("userId");
		String userName = (String) session.getAttribute("username");
		AvoidBallDAO dao = new AvoidBallDAO();
		//공피하기 게임 전용 DB접근 객체
		if (request.getParameter("recordtext") == null) {
			record = 0;//처음 입장의 경우 기록은 null이기에 해당 경우 0으로 초기화
		} else {
			//게임을 마치고 기록이 null이 아닐 경우 해당 기록 값으로 초기화
			record = Integer.parseInt(request.getParameter("recordtext"));
		}

		if (playerId != null) { //로그인 시 유저의 최고기록을 db에 접근해 가져옴
			AvoidBallDTO player = dao.topRecord(playerId);
			if (player.getPlayerdate() == null) {
				topRecord = 0; // 게임을 하지않아 기록이 없을 경우 0으로 초기화
			} else {
				topRecord = player.getPlayerRecord();
			}	//player객체의 최고 기록을 가져와 최고 기록으로 저장
			if (record != 0) {//현재 기록이 0이 아닐 경우 <- 게임을 진행하여 마쳤다.
				if (player.getPlayerdate() == null) {
					// 기록이 없어 null일 경우 기록 추가

					dao.insertPlayer(playerId, record, userName);
				} else {
					// 기록이 존재할 경우 갱신
					dao.updateRecord(playerId, record);
				}
			}
		}

		request.setAttribute("topRecord", topRecord);
		List<AvoidBallDTO> topList = dao.topranklist();
		request.setAttribute("topList", topList);
		//마지막에 TOP5 기록 리스트를 가져와 기록 생신 및 추가 시 실시간으로 list를 request로 전달
		return "";

	}

}
