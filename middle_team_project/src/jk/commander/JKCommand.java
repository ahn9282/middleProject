package jk.commander;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface JKCommand {
	public void execute(HttpServletRequest request, HttpServletResponse response);
}