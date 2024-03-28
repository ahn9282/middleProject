package middleteamproject.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

import middleteamproject.dao.MemberDAO;

public class MemberJoinController implements Controller {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {

		String joinId = request.getParameter("showID");

		MemberDAO dao = new MemberDAO();
		List<String> list = dao.listID();
		for (String string : list) {

			int existId = list.indexOf(joinId);
			request.setAttribute("validId", joinId);

			if (existId >= 0) {
				request.setAttribute("existingId", true);
			}
			if(existId == -1) {
				request.setAttribute("existingId", false);
				
			}

		}
		return "/join_member.jsp";

	}
}
