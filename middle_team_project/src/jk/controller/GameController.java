package jk.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jk.commander.GetTableCommand;
import jk.commander.JKCommand;
import jk.dao.JKDAO;
import jk.dto.JKDTO;
import jk.fns.Print;

@WebServlet("/jk/*")
public class GameController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public GameController() {
        super();
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet() .. ");
		actionDo(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost() .. ");
		
		//System.out.println("name: " + request.getParameter("name"));
		
		actionDo(request, response);
	}
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("actionDo() .. ");
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		
		//System.out.println("name: " + request.getParameter("name"));
		//System.out.println("eventNumber: " + request.getParameter("eventNumber"));
		//System.out.println("gridNumberHeavy: " + request.getParameter("gridNumberHeavy"));
		//System.out.println("en: " + request.getParameter("en"));
		
		//int eventNumber = Integer.parseInt(request.getParameter("eventNumber"));
		//int gridNumberHeavy = Integer.parseInt(request.getParameter("gridNumberHeavy"));

		

		
		
		
		String viewPage = null;
		JKCommand jkCommand = null;
		
		String uri = request.getRequestURI();
		String contextPath = request.getContextPath();
		String commandDo = uri.substring(contextPath.length());
		
		System.out.println("uri : " + uri);
		System.out.println("contextPath : " + contextPath);
		System.out.println("commandDo : " + commandDo);
		
		
		String eventNumberStr = request.getParameter("eventNumber");
		//String gridNumberHeavyStr = request.getParameter("gridNumberHeavy");
		
		//if (eventNumberStr != null && gridNumberHeavyStr != null) {
		if (eventNumberStr != null) {
			int eventNumber = Integer.parseInt(eventNumberStr);
			switch (eventNumber) {
				case 0: {
					String gridNumberHeavyStr = request.getParameter("gridNumberHeavy");
					int gridNumberHeavy = Integer.parseInt(gridNumberHeavyStr);
					System.out.println(gridNumberHeavy);
					JKDAO dao = new JKDAO();
					dao.update(gridNumberHeavy);
					
					
					List<JKDTO> characters = dao.getList();
					Print.append("<div>");
					for (JKDTO character : characters) {
						Print.append("<character>");
						
						Print.append("<member_id>");
						Print.append(character.getMember_id());
						Print.append("</member_id>");
						Print.append("<timestamp_latest>");
						Print.append(character.getTimestamp_latest());
						Print.append("</timestamp_latest>");
						Print.append("<timestamp_first>");
						Print.append(character.getTimestamp_first());
						Print.append("</timestamp_first>");
						Print.append("<member_name>");
						Print.append(character.getMember_name());
						Print.append("</member_name>");
						Print.append("<model_number>");
						Print.append(character.getModel_number());
						Print.append("</model_number>");
						Print.append("<map_number>");
						Print.append(character.getMap_number());
						Print.append("</map_number>");
						Print.append("<tile_number>");
						Print.append(character.getTile_number());
						Print.append("</tile_number>");
						Print.append("<is_moving>");
						Print.append(character.getIs_moving());
						Print.append("</is_moving>");
						Print.append("<from_where>");
						Print.append(character.getFrom_where());
						Print.append("</from_where>");
						Print.append("<is_flip>");
						Print.append(character.getIs_flip());
						Print.append("</is_flip>");
						Print.append("<is_chaton>");
						Print.append(character.getIs_chaton());
						Print.append("</is_chaton>");
						Print.append("<chat_text>");
						Print.append(character.getChat_text());
						Print.append("</chat_text>");
						Print.append("<is_jump>");
						Print.append(character.getIs_jump());
						Print.append("</is_jump>");
						
						Print.append("</character>");
					}
					Print.append("</div>");
					response.getWriter().write(Print.getString());
					break;
				}
				case 1 : {
					//System.out.println(request.getParameter("member_id"));
					
					JKDAO dao = new JKDAO();
					//JKDTO character = dao.getCharacter();
					JKDTO character = dao.getCharacter(request.getParameter("member_id"));
					//System.out.println(character);
					Print.append("<character>");
					
					Print.append("<member_id>");
					Print.append(character.getMember_id());
					Print.append("</member_id>");
					Print.append("<timestamp_latest>");
					Print.append(character.getTimestamp_latest());
					Print.append("</timestamp_latest>");
					Print.append("<timestamp_first>");
					Print.append(character.getTimestamp_first());
					Print.append("</timestamp_first>");
					Print.append("<member_name>");
					Print.append(character.getMember_name());
					Print.append("</member_name>");
					Print.append("<model_number>");
					Print.append(character.getModel_number());
					Print.append("</model_number>");
					Print.append("<map_number>");
					Print.append(character.getMap_number());
					Print.append("</map_number>");
					Print.append("<tile_number>");
					Print.append(character.getTile_number());
					Print.append("</tile_number>");
					Print.append("<is_moving>");
					Print.append(character.getIs_moving());
					Print.append("</is_moving>");
					Print.append("<from_where>");
					Print.append(character.getFrom_where());
					Print.append("</from_where>");
					Print.append("<is_flip>");
					Print.append(character.getIs_flip());
					Print.append("</is_flip>");
					Print.append("<is_chaton>");
					Print.append(character.getIs_chaton());
					Print.append("</is_chaton>");
					Print.append("<chat_text>");
					Print.append(character.getChat_text());
					Print.append("</chat_text>");
					Print.append("<is_jump>");
					Print.append(character.getIs_jump());
					Print.append("</is_jump>");
					
					Print.append("</character>");
					response.getWriter().write(Print.getString());					
					
					break;
				}
				case 2: {
					JKDAO dao = new JKDAO();
					JKDTO character = new JKDTO(
						request.getParameter("member_id"), 
						Integer.parseInt(request.getParameter("timestamp_latest")),
						Integer.parseInt(request.getParameter("timestamp_first")), 
						request.getParameter("member_name"),
						Integer.parseInt(request.getParameter("model_number")),
						Integer.parseInt(request.getParameter("map_number")),
						Integer.parseInt(request.getParameter("tile_number")),
						Integer.parseInt(request.getParameter("is_moving")),
						Integer.parseInt(request.getParameter("from_where")),
						Integer.parseInt(request.getParameter("is_flip")),
						Integer.parseInt(request.getParameter("is_chaton")), 
						request.getParameter("chat_text"),
						Integer.parseInt(request.getParameter("is_jump"))
					);
					//character.setMember_id(member_id);
					
					dao.updateCharacter(character);
					
					break;
				}
				default: {
				}
			}
		}
		
		switch (commandDo) {
			case "/jk/test1.do": {
				jkCommand = new GetTableCommand();
				
				jkCommand.execute(request, response);
				
				viewPage = "/test1.jsp";
				
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
				break;
			}
			case "/jk/game.do": {
				jkCommand = new GetTableCommand();
				
				jkCommand.execute(request, response);
				
				viewPage = "/game_jk.jsp";
				
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
				
				break;
			}
			case "/jk/refresh.do": {
				jkCommand = new GetTableCommand();
				
				jkCommand.execute(request, response);
				
				//viewPage = "/game_jk.jsp";
				//viewPage = "#";
				break;
			}
			default : {
			}
		};
		
		//RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		//dispatcher.forward(request, response);
	}
}
