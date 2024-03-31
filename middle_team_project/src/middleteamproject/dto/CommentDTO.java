package middleteamproject.dto;

import java.sql.Timestamp;

public class CommentDTO {
	private int cBelong;
	private Timestamp cDate;
	private String cContent;
	private int crecommand;
	
	public CommentDTO() {}
	
	public CommentDTO(int cBelong, Timestamp cDate, String cContent, int crecommand) {
		super();
		this.cBelong = cBelong;
		this.cDate = cDate;
		this.cContent = cContent;
		this.crecommand = crecommand;
	}
	public int getcBelong() {
		return cBelong;
	}
	public void setcBelong(int cBelong) {
		this.cBelong = cBelong;
	}
	public Timestamp getcDate() {
		return cDate;
	}
	public void setcDate(Timestamp cDate) {
		this.cDate = cDate;
	}
	public String getcContent() {
		return cContent;
	}
	public void setcContent(String cContent) {
		this.cContent = cContent;
	}
	public int getCrecommand() {
		return crecommand;
	}
	public void setCrecommand(int crecommand) {
		this.crecommand = crecommand;
	}
	
	
}
