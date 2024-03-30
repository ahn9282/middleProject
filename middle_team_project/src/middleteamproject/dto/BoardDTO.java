package middleteamproject.dto;

import java.sql.Timestamp;

public class BoardDTO {
	private int bid;
	private String bWriter;
	private String bWriterId;
	private String bTitle;
	private String bContent;
	private Timestamp bDate;
	private int bHit;
	private int bGood;
	private int bHate;

	public BoardDTO() {
	}

	
	public BoardDTO(int bid, String bWriter, String bWriterId, String bTitle, String bContent, Timestamp bDate,
			int bHit, int bGood, int bHate) {
	
		this.bid = bid;
		this.bWriter = bWriter;
		this.bWriterId = bWriterId;
		this.bTitle = bTitle;
		this.bContent = bContent;
		this.bDate = bDate;
		this.bHit = bHit;
		this.bGood = bGood;
		this.bHate = bHate;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getbWriter() {
		return bWriter;
	}

	public void setbWriter(String bWriter) {
		this.bWriter = bWriter;
	}

	public String getbTitle() {
		return bTitle;
	}

	public void setbTitle(String bTitle) {
		this.bTitle = bTitle;
	}

	public String getbContent() {
		return bContent;
	}

	public void setbContent(String bContent) {
		this.bContent = bContent;
	}

	public Timestamp getbDate() {
		return bDate;
	}

	public void setbDate(Timestamp bDate) {
		this.bDate = bDate;
	}

	public int getbHit() {
		return bHit;
	}

	public void setbHit(int bHit) {
		this.bHit = bHit;
	}

	public int getbGood() {
		return bGood;
	}

	public void setbGood(int bGood) {
		this.bGood = bGood;
	}

	public int getbHate() {
		return bHate;
	}

	public void setbHate(int bHate) {
		this.bHate = bHate;
	}
	public String getbWriterId() {
		return bWriterId;
	}

	public void setbWriterId(String bWriterId) {
		this.bWriterId = bWriterId;
	}

}
