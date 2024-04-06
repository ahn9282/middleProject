package middleteamproject;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

//@WebListener는 java웹 어플리케이션에서 이벤트처리용 인터페이스
//해당 인터페이스는 Servlet에서 관리되고 웹 어플리케이션 내 전역으로 사용되기에 각자의 세션을 저장하여 중복로그인 감지에 사용
@WebListener
public class SessionListener implements HttpSessionListener {

	private static final Map<String,String> sessions = new ConcurrentHashMap<>();
	// key를 userId로 가지고 값을 당시에 로그인한 클라이언트의 sessionId로 가지는 Map sessions
	//static final로 선언
	//Map이기에 중복 로그인 시 userID키는 그대로 있지만, sessionId값이 바뀌어 이를 비교하여 중복로그인 체크가능
	public  static  boolean duplicateLogin(String userId) {
		//로그인 과정에서 해당 메서드 호출 시 이전에 같은 id로 로그인 되어있음을 boolean타입으로 반환
		return sessions.containsKey(userId);
	}
	
	//synchronized키워드로 톰캣의 멀티쓰레드로 인한 동시 접근을 막아 처리 순서를 보장
	public synchronized void manageSession(HttpSession session) {
		String userId = (String) session.getAttribute("userId");
		sessions.put(userId,session.getId());
		//해당 메서드 호출 시 sessions에 <아이디, 세션아이디>저장
	}
	
	public boolean checkValidSessionId(String userId,String sessionId) {
		// 해당 메서드에서 sessions 내 userId키의 값이 sessionId값이 맞는지 boolean으로 반환 
		
        return sessionId.equals(sessions.get(userId));
	}
	
	@Override
	public void sessionCreated(HttpSessionEvent hse) {
		  
	}

	// 해당 세션 종료 시 생명주기 종료 시 sessions에서도 해당 userId의 키를 가진 값 제거
	@Override
	public void sessionDestroyed(HttpSessionEvent hse) {
			sessions.remove((String)hse.getSession().getAttribute("userId"));
			// sessions에서 제거
		
	}
}
