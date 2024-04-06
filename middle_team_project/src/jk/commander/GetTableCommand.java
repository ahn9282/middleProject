package jk.commander;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.dao.JKDAO;

public class GetTableCommand implements JKCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		JKDAO dao = new JKDAO();
		int count = dao.number();
		System.out.println("count2 : " + count);
		
		request.setAttribute("count", count);
	}
}