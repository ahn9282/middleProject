package middleteamproject.dto;

public class MemberDTO {
	private String userId;
	private String userPw;
	private String userName;
	private String userNum;
	public MemberDTO() {}
	public MemberDTO(String userId, String userPw, String userName, String userNum) {
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userNum = userNum;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNum() {
		return userNum;
	}

	
}
