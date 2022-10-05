package com.city.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FreeEvaluationDAO {

	private Connection conn;	//db�� �����ϴ� ��ü
	private ResultSet rs;
	
	public FreeEvaluationDAO() {
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
	
	public int write(int num, String userID,int gechu, int bichu) {
		String SQL = "INSERT INTO freeevaluation VALUES(?,?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			pstmt.setString(2, userID);
			pstmt.setInt(3, gechu);
			pstmt.setInt(4, bichu);
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //�����ͺ��̽� ����
	}
	public ArrayList<FreeEvaluationVO> whereList(int num, String userID){
		String SQL = "SELECT * FROM freeevaluation WHERE num = ? AND userID =?"; 
		ArrayList<FreeEvaluationVO> list = new ArrayList<FreeEvaluationVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			pstmt.setString(2, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FreeEvaluationVO eva = new FreeEvaluationVO();
				eva.setNum(rs.getInt(1));
				eva.setUserID(rs.getString(2));
				eva.setGechu(rs.getInt(3));
				eva.setBichu(rs.getInt(4));
				list.add(eva);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //�����ͺ��̽� ����
	}
	
	public ArrayList<FreeEvaluationVO> getList(int num){
		String SQL = "SELECT * FROM freeevaluation WHERE num = ?"; 
		ArrayList<FreeEvaluationVO> list = new ArrayList<FreeEvaluationVO>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				FreeEvaluationVO eva = new FreeEvaluationVO();
				eva.setNum(rs.getInt(1));
				eva.setUserID(rs.getString(2));
				eva.setGechu(rs.getInt(3));
				eva.setBichu(rs.getInt(4));
				list.add(eva);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return list; //�����ͺ��̽� ����
	}
	
	public int update(int num, String userID,int gechu, int bichu) {
		String SQL = "UPDATE freeevaluation SET gechu=?, bichu=? WHERE num = ? AND userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, gechu);
			pstmt.setInt(2, bichu);
			pstmt.setInt(3, num);
			pstmt.setString(4, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	public int delete(int num, String userID) {
		String SQL = "DELETE FROM freeevaluation WHERE num = ? AND userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			pstmt.setString(2, userID);
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // �����ͺ��̽� ����
	}
	
	public int countGechu(int num) {
		
		int cnt = 0;
		
		String SQL = "select count(gechu) from freeevaluation where num = ? and gechu = 1";
		try {
			
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				cnt = rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return cnt;
}
}
