package middleteamproject.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import java.util.*;
import middleteamproject.dto.AvoidBallDTO;

public class AvoidBallDAO {

	DataSource dataSource = null;

	public AvoidBallDAO() {
		try {
			Context context = new InitialContext();
			dataSource = (DataSource) context.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void insertPlayer(String playerId, int record, String playerName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "INSERT INTO avoidballrecord (pid,precord,pname) VALUES ( ?,?,?)";

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, playerId);
			pstmt.setInt(2, record);
			pstmt.setString(3, playerName);
			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

	public AvoidBallDTO topRecord(String playerId) {
		AvoidBallDTO topRecord = new AvoidBallDTO();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from avoidballrecord where pId= ?";

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, playerId);
			rs = pstmt.executeQuery();

			if (rs.next()) {

				if (rs.getString("pId") == null) {
					return topRecord;
				}

				String pid = rs.getString("pId");
				int precord = rs.getInt("precord");
				String pname = rs.getString("pname");
				Timestamp recordDate = rs.getTimestamp("recordDate");
				topRecord = new AvoidBallDTO(pid, precord, recordDate, pname);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
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

		return topRecord;
	}

	public void updateRecord(String playerId, int record) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "update avoidballrecord set precord = ? where pId = ?";

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, record);
			pstmt.setString(2, playerId);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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

	public List<AvoidBallDTO> topranklist() {
		List<AvoidBallDTO> topList= new ArrayList<AvoidBallDTO>();
	

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from (select  * from avoidballrecord order by precord desc) where rownum <=5";

		try {
			conn = dataSource.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {

				String pid = rs.getString("pid");
				int precord = rs.getInt("precord");
				String pname = rs.getString("pname");
				Timestamp recordDate = rs.getTimestamp("recorddate");
				AvoidBallDTO ranker = new AvoidBallDTO(pid, precord, recordDate, pname);
				topList.add(ranker);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
		return topList;

	}
}
