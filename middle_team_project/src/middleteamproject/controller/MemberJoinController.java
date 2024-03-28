package middleteamproject.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.*;

import middleteamproject.dao.MemberDAO;


public class MemberJoinController implements Controller{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse reponse) {
	 
		String joinId = request.getParameter("userID");
		System.out.println("입력한 id :  "+joinId);
		MemberDAO dao = new MemberDAO();
		List<String> list = dao.listID();
		for (String string : list) {
			System.out.println(string + "||");
		}
		int existId = list.indexOf(joinId);
		System.out.println("중복id확인 : " + existId);
		if(existId >= 0) {
			request.setAttribute("existingId", true);
		}
		return "/join_member.jsp";
		
	}

}
