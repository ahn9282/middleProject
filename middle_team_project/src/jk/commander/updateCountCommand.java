package jk.commander;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.dao.JKDAO;

public class updateCountCommand implements JKCommand {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		JKDAO dao = new JKDAO();
		
		//System.out.println("bId in BoardUpdateCommand: " + request.getParameter("bId"));
		
		//int 
		
		//dao.update();

	}

}
