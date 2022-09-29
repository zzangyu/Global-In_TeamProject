package com.city.model;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;
import java.util.*;

public class MembershipDAO {
		
	private static MembershipDAO instance = null;
	
	private MembershipDAO() { }
 		
	public static MembershipDAO getInstance() {
		
	/*
	 * data�� thread-safe �� �ϱ� ���� �ڹٿ����� synchronized Ű���带 ������ 
	 * �����尣 ����ȭ�� ���� data�� thread-safe�� �������մϴ�.
	 */
		
		if(instance == null) {
			synchronized (MembershipDAO.class) {
				instance = new MembershipDAO();			
		}		
	}
		return instance;
}
	private Connection getConnection() {
		
		Connection conn = null;
		
		try {
			Context initContext = new InitialContext();
			DataSource ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/myoracle");
			conn = ds.getConnection();
			
		} catch (NamingException ne) {
			System.out.println("Connection������");
			ne.printStackTrace();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}// �⺻ DB����

	
	//db���� IDcheck 
	public boolean idCheck(String id) {
	boolean result = true;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try {
		
		conn = getConnection();
			                //������ ���ε� �Լ� ���
		pstmt = conn.prepareStatement("select * from member where id = ?");
		
		pstmt.setString(1, id);
		
		rs = pstmt.executeQuery();
		if(!rs.next()) result = false;
		
		
	} catch (SQLException s1) {
		s1.printStackTrace();
		
		
	} finally {
		if(rs != null) try{rs.close();}catch(SQLException s1){}
		if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
		if(conn != null) try{conn.close();}catch(SQLException s3){}		
	}
	
	return result;
	
} // end of idCheck
	
//	�г��� �ߺ�üũ �ϱ� ���� DB�ȿ� �ִ��� ��
	public boolean nickCheck(String nick) {
		
		boolean result = true;
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		
		try {
			
				conn = getConnection();
														
				pstmt = conn.prepareStatement("select * from member where nick = ?");
				
				pstmt.setString(1, nick);
				 	
				rs = pstmt.executeQuery();
				if(!rs.next()) result = false;
				
				
		} catch (SQLException s1) {
			s1.printStackTrace();
			
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException s1){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
			if(conn != null) try{conn.close();}catch(SQLException s3){}		
		}
		
		return result;
	}//end of nickCheck 
	
	public String getNick(String id) {
		
		String result = "";
		Connection conn = null;
		PreparedStatement pstmt = null; 
		ResultSet rs = null;
		
		try {
			
				conn = getConnection();
														
				pstmt = conn.prepareStatement("select * from member where id = ?");
				
				pstmt.setString(1, id);
				 	
				rs = pstmt.executeQuery();
				if(rs.next()) result = rs.getString("nick");
				
				
		} catch (SQLException s1) {
			s1.printStackTrace();
			
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException s1){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
			if(conn != null) try{conn.close();}catch(SQLException s3){}		
		}
		
		return result;
	}//end of nickCheck 

	//DB�� ȸ�������� ����
	public boolean memberInsert(MembershipVO vo) {
		
		boolean flag = false; //true�� �Ǹ� ����
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = getConnection();
		
			String strQuery = "insert into member values(?,?,?,?)";
			
			pstmt = conn.prepareStatement(strQuery);
			
			pstmt.setString(1, vo.getId());
			pstmt.setString(2, vo.getPass());
			pstmt.setString(3, vo.getNick());
			pstmt.setString(4, vo.getEmail());
		
			int count = pstmt.executeUpdate();
			if(count > 0) flag = true;
		
		}catch(SQLException s1) {	
			s1.printStackTrace();
		
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException s1){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
			if(conn != null) try{conn.close();}catch(SQLException s3){}		
		}
		
		return flag;
	}// end of memberInsert
	
	public int loginCheck(String id, String pass) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int check = -1; //�ʱ�� ���̵� �������� ����
		
		try {
			conn = getConnection();
			
			String strQuery = "select pass from member where id =?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				String dbPass = rs.getString("pass"); //��й�ȣ�� ������ dbpass�� ����
				if(pass.equals(dbPass)) check =1; // �Ķ���Ͱ��� ���� �ϸ� �α��� ����
				else check = 0; // �ƴ� ��� ���̵�� ������ ����� ���� ������ ����
			}
		}catch(SQLException s1) {	
			s1.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException s1){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
			if(conn != null) try{conn.close();}catch(SQLException s3){}		
		}
		
		return check;
	} // end of loginCheck
	
	//�������� 
	public MembershipVO getMember(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;  
		ResultSet rs = null;
		
		
		MembershipVO vo = null;
		
		try {
			conn = getConnection();
			String strQuery = "select * from member where id=?";
			pstmt = conn.prepareStatement(strQuery);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
		
		if(rs.next()) {
			vo = new MembershipVO();
			
			vo.setId(rs.getString("id"));
			vo.setPass(rs.getString("pass"));
			vo.setNick(rs.getString("nick"));
			vo.setEmail(rs.getString("email"));
		
		}
	
		}catch(SQLException s1) {	
			s1.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException s1){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
			if(conn != null) try{conn.close();}catch(SQLException s3){}		
		}
		
		return vo;
		
	}//end of getMember
	
	//ȸ���������� �Ϸ�
	public void updateMember(MembershipVO vo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try { 
			conn = getConnection();
			
		String strQuery = "update member set pass =? where id=?";
		pstmt = conn.prepareStatement(strQuery);
			//��й�ȣ�� �ٲܲ���
		pstmt.setString(1, vo.getPass());
		pstmt.setString(2, vo.getId());
		
		pstmt.executeUpdate();
			
			
			
		}  catch(SQLException s1) {	
			s1.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
			if(conn != null) try{conn.close();}catch(SQLException s3){}		
		}
		
		
	}//end of updateMember
	
	
	//ȸ��Ż��
	
	  public int deleteMember(String id, String pass) { 
	  
      Connection conn = null;
	  PreparedStatement pstmt = null; 
	  ResultSet rs = null;
	  
	  String dbPass="";
	  
	  int result = -1; 
	  
	  try {
		  conn = getConnection();
		  
		  String strQuery = "select pass from member where id=?";
		  
		  pstmt = conn.prepareStatement(strQuery);
		  pstmt.setString(1, id);
		  rs = pstmt.executeQuery();
		  //���̵� ��ȸ�ؼ� ��й�ȣ�� ������ Ż���ų���ְ�
		  
		  if(rs.next()) {
			 
			  dbPass = rs.getString("pass");
			  
			 if(dbPass.equals(pass)) {
				 
			  pstmt = conn.prepareStatement("delete from member where id =?");
			  pstmt.setString(1, id);
			  pstmt.executeUpdate();
			  
			  result = 1; //ȸ��Ż�� OK
		  } else { //��й�ȣ�� �����϶� ����
			  result = 0;
		  }
		 }
		  
	  	}catch(SQLException s1) {	
			s1.printStackTrace();
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
		  if(rs != null) try{rs.close();}catch(SQLException s1){}
		  if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
		  if(conn != null) try{conn.close();}catch(SQLException s3){}		
		}
	  
	  
	  return result; 
	  }//end of deleteMember

	  //2022-09-26 ��й�ȣã��
	  public String findpw(String id, String email) {
		  Connection conn = null;
		  PreparedStatement pstmt = null; 
		  ResultSet rs = null;
		  
		  String fpw = "";
		  
			try {
				conn = getConnection();
				String strQuery = "select * from member where id=? and email=?"; 
				pstmt = conn.prepareStatement(strQuery);
				
				pstmt.setString(1, id);
				pstmt.setString(2, email);
				
				rs=pstmt.executeQuery();
			
			if(rs.next()) {
				fpw = rs.getString("pass");
			
			}
		
			}catch(SQLException s1) {	
				s1.printStackTrace();
			}catch(Exception e) {
				e.printStackTrace();
			} finally {
				if(rs != null) try{rs.close();}catch(SQLException s1){}
				if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
				if(conn != null) try{conn.close();}catch(SQLException s3){}		
			}
			
			return fpw;
	  }
	  
	  
	  
	  
	  
	  
} //end of DAO
	

