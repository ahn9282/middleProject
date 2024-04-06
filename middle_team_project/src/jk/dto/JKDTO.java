package jk.dto;

/*
MEMBER_ID        NOT NULL VARCHAR2(50)  
TIMESTAMP_LATEST          NUMBER(38)    
TIMESTAMP_FIRST           NUMBER(38)    
MEMBER_NAME               VARCHAR2(50)  
MODEL_NUMBER              NUMBER(2)     
MAP_NUMBER                NUMBER(2)     
TILE_NUMBER               NUMBER(3)     
IS_MOVING                 NUMBER(1)     
FROM_WHERE                NUMBER(2)     
IS_FLIP                   NUMBER(1)     
IS_CHATON                 NUMBER(1)     
CHAT_TEXT                 VARCHAR2(100) 
IS_JUMP                   NUMBER(1)     
*/

public class JKDTO {
	/*
	private String member_id;
	private String timestamp_latest;
	private String timestamp_first;
	private String member_name;
	private String model_number;
	private String map_number;
	private String tile_number;
	private String is_moving;
	private String from_where;
	private String is_flip;
	private String is_chaton;
	private String chat_text;
	private String is_jump;
	*/
	private String member_id;
	private int timestamp_latest;
	private int timestamp_first;
	private String member_name;
	private int model_number;
	private int map_number;
	private int tile_number;
	private int is_moving;
	private int from_where;
	private int is_flip;
	private int is_chaton;
	private String chat_text;
	private int is_jump;
	public JKDTO() {
	}
	public JKDTO(String member_id, int timestamp_latest, int timestamp_first, String member_name, int model_number,
			int map_number, int tile_number, int is_moving, int from_where, int is_flip, int is_chaton,
			String chat_text, int is_jump) {
		super();
		this.member_id = member_id;
		this.timestamp_latest = timestamp_latest;
		this.timestamp_first = timestamp_first;
		this.member_name = member_name;
		this.model_number = model_number;
		this.map_number = map_number;
		this.tile_number = tile_number;
		this.is_moving = is_moving;
		this.from_where = from_where;
		this.is_flip = is_flip;
		this.is_chaton = is_chaton;
		this.chat_text = chat_text;
		this.is_jump = is_jump;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getTimestamp_latest() {
		return timestamp_latest;
	}
	public void setTimestamp_latest(int timestamp_latest) {
		this.timestamp_latest = timestamp_latest;
	}
	public int getTimestamp_first() {
		return timestamp_first;
	}
	public void setTimestamp_first(int timestamp_first) {
		this.timestamp_first = timestamp_first;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public int getModel_number() {
		return model_number;
	}
	public void setModel_number(int model_number) {
		this.model_number = model_number;
	}
	public int getMap_number() {
		return map_number;
	}
	public void setMap_number(int map_number) {
		this.map_number = map_number;
	}
	public int getTile_number() {
		return tile_number;
	}
	public void setTile_number(int tile_number) {
		this.tile_number = tile_number;
	}
	public int getIs_moving() {
		return is_moving;
	}
	public void setIs_moving(int is_moving) {
		this.is_moving = is_moving;
	}
	public int getFrom_where() {
		return from_where;
	}
	public void setFrom_where(int from_where) {
		this.from_where = from_where;
	}
	public int getIs_flip() {
		return is_flip;
	}
	public void setIs_flip(int is_flip) {
		this.is_flip = is_flip;
	}
	public int getIs_chaton() {
		return is_chaton;
	}
	public void setIs_chaton(int is_chaton) {
		this.is_chaton = is_chaton;
	}
	public String getChat_text() {
		return chat_text;
	}
	public void setChat_text(String chat_text) {
		this.chat_text = chat_text;
	}
	public int getIs_jump() {
		return is_jump;
	}
	public void setIs_jump(int is_jump) {
		this.is_jump = is_jump;
	}
	
	
	
	

}
