package middleteamproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import middleteamproject.dto.CommentDTO;

public class CommentDAO {
private DataSource dataSource = null;
	
	
	public CommentDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public List<CommentDTO> commentList(int cBelongNum){
		List<CommentDTO> comments = new ArrayList<CommentDTO>();
		
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select * from  board_comment where cbelong = ? order by cdate asc";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cBelongNum);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				 int cBelong = rs.getInt("cBelong");
				 Timestamp cDate =rs.getTimestamp("cDate");
				 String cContent =rs.getString("cContent");
				 int crecommand =rs.getInt("crecommand");
				CommentDTO comment = new CommentDTO( cBelong,  cDate,  cContent,  crecommand);
						comments.add(comment);
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
		return comments;
	}
	public void write( int cbelong,String commentContent) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "insert into board_comment(cbelong,cContent,crecommand) values (?,?,0)";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cbelong);
			pstmt.setString(2, commentContent);
			
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
	public void delete( int cbelong) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "delete from board_comment where cbelong = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, cbelong);
			
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
	public void upLike(int belong,String content, int recommand) {
		Connection conn=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "update board_comment set crecommand = crecommand+1 where cbelong = ? and cContent = ? and crecommand = ?";
		
		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, belong);
			pstmt.setString(2, content);
			pstmt.setInt(3, recommand);
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
