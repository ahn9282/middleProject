package middleteamproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import middleteamproject.dto.BoardDTO;

public class BoardDAO {
private DataSource dataSource = null;
	
	
	public BoardDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<BoardDTO> boardList(){
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from  projectboard order by bdate desc";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int bid = rs.getInt("bid");
				String bWriter = rs.getString("bWriter");
				String bWriterId = rs.getString("bWriterId");
				String bTitle = rs.getString("bTitle");
				String bContent = rs.getString("bContent");
				Timestamp bDate = rs.getTimestamp("bDate");
				int bHit = rs.getInt("bHit");
				int bGood= rs.getInt("bGood");
				int bHate= rs.getInt("bHate");
				BoardDTO board = new BoardDTO( bid,  bWriter,  bWriterId,  bTitle,  bContent,  bDate, bHit,  bGood,  bHate);
				list.add(board);
			}
		} catch (Exception e) {
		}finally {
			try {
				if (rs != null)
					rs.close();

				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
