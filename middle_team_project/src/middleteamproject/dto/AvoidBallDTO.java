package middleteamproject.dto;

import java.sql.Timestamp;

public class AvoidBallDTO {

	private String playerId;
	private int playerRecord;
	private Timestamp playerdate;
	private String pname;

	public AvoidBallDTO() {

	}


	public AvoidBallDTO(String playerId, int playerRecord, Timestamp playerdate, String pname) {
		super();
		this.playerId = playerId;
		this.playerRecord = playerRecord;
		this.playerdate = playerdate;
		this.pname =pname;
	}

	public AvoidBallDTO(String playerId, int playerRecord) {
		super();
		this.playerId = playerId;
		this.playerRecord = playerRecord;
	}

	public String getPlayerId() {
		return playerId;
	}

	public void setPlayerId(String playerId) {
		this.playerId = playerId;
	}

	public int getPlayerRecord() {
		return playerRecord;
	}

	public void setPlayerRecord(int playerRecord) {
		this.playerRecord = playerRecord;
	}

	public Timestamp getPlayerdate() {
		return playerdate;
	}

	public void setPlayerdate(Timestamp playerdate) {
		this.playerdate = playerdate;
	}

	public String getPname() {
		return pname;
	}
	
	public void setPname(String pname) {
		this.pname = pname;
	}
}
