package middleteamproject.command;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import middleteamproject.dao.CommentDAO;


public class CommentWriteCommand implements Command {

	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) {
		int cbelong = Integer.parseInt(request.getParameter("bidC"));
		String commentContent = request.getParameter("commentContent");
		
		CommentDAO writer = new CommentDAO();
		writer.write(cbelong, commentContent);
		
		

		return "";
	}

}
