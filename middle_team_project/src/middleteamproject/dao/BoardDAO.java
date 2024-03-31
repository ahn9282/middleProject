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
	public BoardDTO boarRead(int bidnum){
		BoardDTO boardContent  =new BoardDTO();
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from  projectboard where bid = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bidnum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardContent.setBid(rs.getInt("bid"));
				boardContent.setbWriter(rs.getString("bWriter"));
				boardContent.setbContent(rs.getString("bWriterId"));
				boardContent.setbTitle( rs.getString("bTitle"));
				boardContent.setbContent(rs.getString("bContent"));
				boardContent.setbDate(rs.getTimestamp("bDate"));
				boardContent.setbHit(rs.getInt("bHit"));
				boardContent.setbGood(rs.getInt("bGood"));
				boardContent.setbHate(rs.getInt("bHate"));
				
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
		return boardContent;
	}
	
	public void modify(int bid, String btitle,String bwriter, String bcontent) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "update projectboard set btitle = ? ,bwriter = ? ,bcontent = ? where bid = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, btitle);
			pstmt.setString(2, bwriter);
			pstmt.setString(3, bcontent);
			pstmt.setInt(4, bid);
			pstmt.executeUpdate();
			
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
	}
	public void delete(int bidnum) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "delete from projectboard where bid = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bidnum);
			pstmt.executeUpdate();
			
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
	}
	public void upHit(int bidnum) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "update projectboard set bhit = bhit+1 where bid = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bidnum);
			pstmt.executeUpdate();
			
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
	}
	public void write( String bwriter,String bWriterId,String btitle, String bcontent) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " insert into projectBoard (bid, bWriter,bWriterId, btitle,bcontent,bhit,bgood,bhate)" + 
				"values(pboard_seq.nextval,?,?,?,?,0,0,0)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bwriter);
			pstmt.setString(2, bWriterId);
			pstmt.setString(3, btitle);
			pstmt.setString(4, bcontent);
			pstmt.executeUpdate();
			
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
	}
	public void upHate(int bidnum) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "update projectboard set bhate = bhate+1 where bid = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bidnum);
			pstmt.executeUpdate();
			
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
	}
	public void upGood(int bidnum) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "update projectboard set bgood = bgood+1 where bid = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bidnum);
			pstmt.executeUpdate();
			
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
	}
}
