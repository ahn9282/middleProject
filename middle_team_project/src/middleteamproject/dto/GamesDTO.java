package middleteamproject.dto;

public class GamesDTO {
	
	private String pid;
	private int coutPuzzle;
	private int winRsp;
	private int drawRsp;
	private int loseRsp;
	
	
	public GamesDTO() {
	}


	public GamesDTO(String pid, int coutPuzzle, int winRsp, int drawRsp, int loseRsp) {
		this.pid = pid;
		this.coutPuzzle = coutPuzzle;
		this.winRsp = winRsp;
		this.drawRsp = drawRsp;
		this.loseRsp = loseRsp;
	}


	public String getPid() {
		return pid;
	}


	public void setPid(String pid) {
		this.pid = pid;
	}


	public int getCoutPuzzle() {
		return coutPuzzle;
	}


	public void setCoutPuzzle(int coutPuzzle) {
		this.coutPuzzle = coutPuzzle;
	}


	public int getWinRsp() {
		return winRsp;
	}


	public void setWinRsp(int winRsp) {
		this.winRsp = winRsp;
	}


	public int getDrawRsp() {
		return drawRsp;
	}


	public void setDrawRsp(int drawRsp) {
		this.drawRsp = drawRsp;
	}


	public int getLoseRsp() {
		return loseRsp;
	}


	public void setLoseRsp(int loseRsp) {
		this.loseRsp = loseRsp;
	}
	
	

}
