package com.city.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FreeCommentDAO {
	private Connection conn;	//db�� �����ϴ� ��ü
	private ResultSet rs;
	
	public FreeCommentDAO() {
		try {
			String dbURL = "jdbc:oracle:thin:@localhost:1521:orcl";
			String dbID = "scott";
			String dbPassword = "tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	public String getDate() {
		String SQL = "SELECT SYSDATE FROM DUAL";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //�����ͺ��̽� ����
	}
	
	
	public int getNext() {
		String SQL = "SELECT freecommentID FROM freecommentDB ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return rs.getInt(1) + 1;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return 1; //ù��° ����� ���
	}
	
	
	public int write(int num, String userID, String commentText, String userName, String imageUID) {
		String SQL = "INSERT INTO freecommentDB VALUES(?, ?, ?, ?, ?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setInt(2, num);
			pstmt.setString(3, userID);
			pstmt.setString(4, userName);
			pstmt.setString(5, getDate());
			pstmt.setString(6, commentText);
			pstmt.setInt(7, 1);
			pstmt.setString(8, imageUID);
			pstmt.executeUpdate();
			return getNext();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	public String getUpdateComment(int commentID) {
		String SQL = "SELECT commentText FROM freecommentDB WHERE commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return ""; //����
	}
	public ArrayList<FreeCommentVO> getList(int num){
		String SQL = "SELECT * FROM freecommentDB WHERE num= ? AND commentAvailable = 1 ORDER BY commentID"; 
		ArrayList<FreeCommentVO> list = new ArrayList<FreeCommentVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FreeCommentVO cmt = new FreeCommentVO();
				cmt.setCommentID(rs.getInt(1));
				cmt.setNum(rs.getInt(2));
				cmt.setUserID(rs.getString(3));
				cmt.setUserName(rs.getString(4));
				cmt.setCommentDate(rs.getString(5));
				cmt.setCommentText(rs.getString(6));
				cmt.setCommentAvilable(rs.getInt(7));
				cmt.setImageUID(rs.getString(8));
				list.add(cmt);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //�����ͺ��̽� ����
	}
	
	public int update(int commentID, String commentText, String imageUID) {
		String SQL = "UPDATE freecommentDB SET commentText = ?, imageUID = ? WHERE commentID LIKE ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, commentText);
			pstmt.setString(2, imageUID);
			pstmt.setInt(3, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	public FreeCommentVO getComment(int commentID) {
		String SQL = "SELECT * FROM freecommentDB WHERE commentID = ? ORDER BY commentID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1,  commentID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FreeCommentVO cmt = new FreeCommentVO();
				cmt.setCommentID(rs.getInt(1));
				cmt.setNum(rs.getInt(2));
				cmt.setUserID(rs.getString(3));
				cmt.setUserName(rs.getString(4));
				cmt.setCommentDate(rs.getString(5));
				cmt.setCommentText(rs.getString(6));
				cmt.setCommentAvilable(rs.getInt(7));
				cmt.setImageUID(rs.getString(8));
				return cmt;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	public int delete(int commentID) {
		String SQL = "DELETE FROM freecommentDB WHERE commentID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	public int countComment(int commentNum) {
		
		int cmt = 0;
		
		String SQL = "select count(*) from freecommentDB where num = ?";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, commentNum);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cmt = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cmt;
	}
}
