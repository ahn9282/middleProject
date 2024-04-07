package jk.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import jk.dto.JKDTO;
import jk.fns.Print;

public class JKDAO {
	private DataSource dataSource = null;
	public JKDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int number() {
		int count = -1;
		
		Connection connection = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			String query = "select * from t1";
			connection = dataSource.getConnection();
			psmt = connection.prepareStatement(query);
			System.out.println(query);
			rs = psmt.executeQuery();
			
			while (rs.next()) {
				count = rs.getInt("count");
			};
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (connection != null) {
					connection.close();
				};
				if (psmt != null) {
					psmt.close();
				};
				if (rs != null) {
					rs.close();
				};			
			} catch(Exception e2) {
				e2.printStackTrace();
			};			
		};
		System.out.println("count: " + count);
		return count;
	}
	
	public void update(int count) {
		Connection conn = null;
		PreparedStatement psmt = null;
		try {
			//String query = "update mvc_board set bname = ?, btitle = ?, bcontent = ? where bid = ?";
			//String query = "update simple_board_1 set username = ?, posttitle = ?, posttext = ? where postid = ?";
			String query = "update t1 set count = ?";
			conn = dataSource.getConnection();
			psmt = conn.prepareStatement(query);
			System.out.println(query);
			//System.out.println("bIdStr: " + bIdStr);
			//int bId = Integer.parseInt(bIdStr);
			//psmt.setString(1, bName);
			//psmt.setString(2, bTitle);
			//psmt.setString(3, bContent);
			//psmt.setInt(4, bId);
			psmt.setInt(1, count);
			int rn = psmt.executeUpdate();
			System.out.println("rn: " + rn);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				};
				if (psmt != null) {
					psmt.close();
				};
			} catch(Exception e2) {
				e2.printStackTrace();
			};
		};
	}
	public List<JKDTO> getList() {
		List<JKDTO> dtos = new ArrayList<JKDTO>();
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			//String query = "select * from simple_board_1 order by postid desc";
			String query = "select * from character_on_map";
			conn = dataSource.getConnection();
			psmt = conn.prepareStatement(query);
			System.out.println(query);
			rs = psmt.executeQuery();
			while (rs.next()) {
				String member_id = rs.getString("member_id");
				int timestamp_latest = rs.getInt("timestamp_latest");
				int timestamp_first = rs.getInt("timestamp_first");
				String member_name = rs.getString("member_name");
				int model_number = rs.getInt("model_number");
				int map_number = rs.getInt("map_number");
				int tile_number = rs.getInt("tile_number");
				int is_moving = rs.getInt("is_moving");
				int from_where = rs.getInt("from_where");
				int is_flip = rs.getInt("is_flip");
				int is_chaton = rs.getInt("is_chaton");
				String chat_text = rs.getString("chat_text");
				int is_jump = rs.getInt("is_jump");				
				
				/*
				int bId = rs.getInt("postid");
				String bName = rs.getString("username");
				String bTitle = rs.getString("posttitle");
				String bContent = rs.getString("posttext");
				Timestamp bDate = rs.getTimestamp("postdate");
				int bHit = rs.getInt("posthit");
				JKDTO dto = new JKDTO(bId, bName, bTitle, bContent, bDate, bHit);
				*/
				
				JKDTO dto = new JKDTO(member_id, timestamp_latest, timestamp_first, member_name, model_number,
						map_number, tile_number, is_moving, from_where, is_flip, is_chaton,
						chat_text, is_jump);
				dtos.add(dto);
			};
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				};
				if (psmt != null) {
					psmt.close();
				};
				if (rs != null) {
					rs.close();
				};			
			} catch(Exception e2) {
				e2.printStackTrace();
			};
		};
		return dtos;		
		//return null;
	}
	public JKDTO getCharacter(String member_id) {
		//List<JKDTO> dtos = new ArrayList<JKDTO>();
		//JKDTO dto = new JKDTO();
		JKDTO dto = null;
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;
		
		try {
			//String query = "select * from simple_board_1 order by postid desc";
			//String query = "select * from character_on_map";
			//String query = "select * from character_on_map where member_id = 'membero'";
			String query = "select * from character_on_map where member_id = ?";
			System.out.println(query);
			conn = dataSource.getConnection();
			psmt = conn.prepareStatement(query);
			psmt.setString(1, member_id);
			
			rs = psmt.executeQuery();
			//int rn = psmt.executeUpdate();
			//System.out.println("rn1: " + rn);			
			
			
			
			
			while (rs.next()) {
				//String member_id = rs.getString("member_id");
				int timestamp_latest = rs.getInt("timestamp_latest");
				int timestamp_first = rs.getInt("timestamp_first");
				String member_name = rs.getString("member_name");
				int model_number = rs.getInt("model_number");
				int map_number = rs.getInt("map_number");
				int tile_number = rs.getInt("tile_number");
				int is_moving = rs.getInt("is_moving");
				int from_where = rs.getInt("from_where");
				int is_flip = rs.getInt("is_flip");
				int is_chaton = rs.getInt("is_chaton");
				String chat_text = rs.getString("chat_text");
				int is_jump = rs.getInt("is_jump");				
								
				dto = new JKDTO(member_id, timestamp_latest, timestamp_first, member_name, model_number,
						map_number, tile_number, is_moving, from_where, is_flip, is_chaton,
						chat_text, is_jump);
				//dtos.add(dto);
			};
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				};
				if (psmt != null) {
					psmt.close();
				};
				if (rs != null) {
					rs.close();
				};			
			} catch(Exception e2) {
				e2.printStackTrace();
			};
		};
		//return dtos;		
		return dto;		
		//return null;	
	}
	public void updateCharacter(JKDTO character) {
		Connection conn = null;
		PreparedStatement psmt = null;
		try {
			//String query = "update mvc_board set bname = ?, btitle = ?, bcontent = ? where bid = ?";
			//String query = "update simple_board_1 set username = ?, posttitle = ?, posttext = ? where postid = ?";
			//String query = "update t1 set count = ?";
			//String query = "update t1 set count = ?";
			
			Print.append("update character_on_map set ");
			Print.append("timestamp_latest = ?, ");
			Print.append("timestamp_first = ?, ");
			Print.append("member_name = ?, ");
			Print.append("model_number = ?, ");
			Print.append("map_number = ?, ");
			Print.append("tile_number = ?, ");
			Print.append("is_moving = ?, ");
			Print.append("from_where = ?, ");
			Print.append("is_flip = ?, ");
			Print.append("is_chaton = ?, ");
			Print.append("chat_text = ?, ");
			Print.append("is_jump = ? ");
			Print.append("where member_id = ?");
			
			String query = Print.getString();
			
			
			
			/*
			String query = update character_on_map set 
		    timestamp_latest = 0,
		    timestamp_first = 0,
		    member_name = 'ttt',
		    model_number = 5,
		    map_number = 0,
		    tile_number = 164,
		    is_moving = 0,
		    from_where = 0,
		    is_flip = 0,
		    is_chaton = 0,
		    chat_text = '',
		    is_jump = 0
		    where member_id = 'test';			
			*/
			
			
			
			
			conn = dataSource.getConnection();
			psmt = conn.prepareStatement(query);
			System.out.println(query);
			//System.out.println("bIdStr: " + bIdStr);
			//int bId = Integer.parseInt(bIdStr);
			//psmt.setString(1, bName);
			//psmt.setString(2, bTitle);
			//psmt.setString(3, bContent);
			//psmt.setInt(4, bId);
			psmt.setInt(1, character.getTimestamp_latest());
			psmt.setInt(2, character.getTimestamp_first());
			psmt.setString(3, character.getMember_name());
			psmt.setInt(4, character.getModel_number());
			psmt.setInt(5, character.getMap_number());
			psmt.setInt(6, character.getTile_number());
			psmt.setInt(7, character.getIs_moving());
			psmt.setInt(8, character.getFrom_where());
			psmt.setInt(9, character.getIs_flip());
			psmt.setInt(10, character.getIs_chaton());
			psmt.setString(11, character.getChat_text());
			psmt.setInt(12, character.getIs_jump());
			psmt.setString(13, character.getMember_id());
			
			int rn = psmt.executeUpdate();
			System.out.println("rn2: " + rn);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				};
				if (psmt != null) {
					psmt.close();
				};
			} catch(Exception e2) {
				e2.printStackTrace();
			};
		};		
		
		
		
	}
}