package middleteamproject;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class SessionListener implements HttpSessionListener {

	private static final Map<String,String> sessions = new ConcurrentHashMap<>();

	
	//synchronized키워드는 톰캣의 멀티쓰레드로 인한 동시 접근을 막아 처리 순서를 보장
	public synchronized static  boolean duplicateLogin(String userId) {
		
		return sessions.containsKey(userId);
	}
	
	public void manageSession(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		sessions.put(userId,session.getId());
	}
	
	public boolean checkValidSessionId(String userId,String sessionId) {
		
		
        return sessionId.equals(sessions.get(userId));
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent hse) {
		  
	}

	// 해당 세션 종료 시 생명주기 종료 시 sessions에서도 해당 userId의 키를 가진 값 제거
	@Override
	public void sessionDestroyed(HttpSessionEvent hse) {
			sessions.remove((String)hse.getSession().getAttribute("userId")); // sessions에서 제거
			System.out.println("세션 하나 제거");
		
	}
}
