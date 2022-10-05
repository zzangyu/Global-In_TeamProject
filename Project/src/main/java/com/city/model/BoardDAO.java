package com.city.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	
	//�̷��� �ϸ� �ܺο��� ������ ���� ����	
	private static BoardDAO instance =null;
	
	//�����ڸ� private�� 
	private BoardDAO() {   }
	
	
	public static BoardDAO getInstance() {
		if(instance ==null) {
		synchronized (BoardDAO.class) {
			instance = new BoardDAO();
		}
	}
		return instance;
	}
	//�̰����� ���� �Խ��� �۾� ����� �ϳ��� �޼ҵ带 �߰��ؼ� �ۼ� �ϸ� ��
	//insertArticle ���� ������ ���̽��� �߰��ϴ� �޼ҵ�
	public void insertArticle(BoardVO article) {
	
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null; //rs�� �ʿ��� ������ �亯 ��
		
		int num = article.getNum();
		
		
		int number = 0;
		String strQuery ="";
		
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select max(num) from p_board"); //���忡�� ����� �� ū��
			rs = pstmt.executeQuery();
			
			if(rs.next()) number = rs.getInt(1) +1 ;  //rs�� �ִٸ� 1�� �߰� 
			else number = 1;  //������ 1
			
			
			strQuery = "insert into p_board(num, writer, subject, readcount, regdate, content) " 
					+ "values(boardone_seq.nextval, ?, ?, ?, ?, ?)";
				//������ ���̺� �ڵ����� �ϳ��� ���� �� �� �ֵ��� �̹� �����س���
			
			pstmt = conn.prepareStatement(strQuery);
			//num�� �������� �̹� ó���߱� ������ writer
			pstmt.setString(1, article.getWriter());
			pstmt.setString(2, article.getSubject());
			pstmt.setInt(3, article.getReadcount());
			pstmt.setTimestamp(4, article.getRegdate());
			pstmt.setString(5, article.getContent());
			
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException s1) {
			s1.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException s1){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
			if(conn != null) try{conn.close();}catch(SQLException s3){}		
		}
		
		
	} //end of insertArticle 
	
	/*
	 *  �� �ۼ��� �����ϰ� ���� list.jsp�� redirect �ϴٷ� �Ǿ� �ִ�.
	 *  ���� ����� ������ list.jsp�� �ۼ��ؾ���
	 *  �� ��ü ���� ������ �����ͼ� ����� ������� �ȴ�.
	 */
	
	//��ü ���� ����� ��Ʈ������ �޼ҵ�
	public int getArticleCount() {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int x =0;
		
		try {
			conn = ConnUtil.getConnection();
			pstmt = conn.prepareStatement("select count(*) from p_board"); //��ü ������ ��� �´�
			rs = pstmt.executeQuery();
			if(rs.next()) {
				x = rs.getInt(1); //ù��° �÷��� �����´� ù��° �÷��� num?
			}
			//list�� arraylist�� ������ ������ �װɷ� �ѷ��ش�.
			
			
		}catch (SQLException s1) {
			s1.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException s1){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
			if(conn != null) try{conn.close();}catch(SQLException s3){}		
		}
		
		return x;
	}// end of  getArticleCount
	
	/*
	 * board ���̺��� �����͸� �����ͼ� ������ �޼ҵ带 �߰�
	 * �̶� ���°��� List<BoardVO>
	 */
	
	
	//����� �� �Խ��� ������ ���� ����ߵ�
	//start : ���۹�ȣ , end ��������
	public List<BoardVO> getArticles(int start, int end){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<BoardVO> articleList = null; //������ ��ü ����
		
		try {
			conn = ConnUtil.getConnection();                 //������������
			/* pstmt = conn.prepareStatement("select * from board order by num desc"); */
			//���� ������ ���� �ٱ��� ������ ����
			pstmt = conn.prepareStatement("select * from (select rownum rnum, num, writer, subject, regdate, readcount, content from (select * from p_board order by num desc)) where rnum >= ? and rnum <= ?"); //rnum�� ���۹�ȣ 
			
			//���� ���������� ���ε� �Լ��� 2����
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			
			rs = pstmt.executeQuery();
 			
 			if(rs.next()) {
 				articleList = new ArrayList<>(end - start +1);
 				do {
 					
 					BoardVO article = new BoardVO();
 					
 					article.setNum(rs.getInt("num"));
 					article.setWriter(rs.getString("writer"));
 					article.setSubject(rs.getString("subject"));
 					article.setRegdate(rs.getTimestamp("regdate"));
 					article.setReadcount(rs.getInt("readcount"));
 					article.setContent(rs.getString("content"));
 				
 				
 					articleList.add(article);
 				}while(rs.next()); //�ȿ� ������ ��� �ݺ��ؼ� ������
 				
 			}
			
		}catch (SQLException s1) {
			s1.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException s1){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
			if(conn != null) try{conn.close();}catch(SQLException s3){}		
		}
		
		return articleList;
	} //end of getArticles
	
	/* 
	 * list.jsp ���������� �� ������ ������ �� ������ �� �� �ֵ��� ������
	 * ���� num�� �Ű������� �ؼ� �ϳ��� ���� �����ͼ� ������
	 * ������ �����ͺ��̽����� �����;ߵȴ�.
	 * 
	 * �� �ϳ��� ������ �������� �޼ҵ带 ���� �ؾ� �Ѵ�.
	 */
	
	 public BoardVO getArticle(int num) {
		 Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			BoardVO article = null;
		 
		try {
			
		conn = ConnUtil.getConnection();
		pstmt = conn.prepareStatement("update p_board set readcount=readcount+1 where num=?"); //���� ������ ��ȸ���� �ö󰡾ߵ� ���� �Ǿߵȴٴ¶��̴�.
		pstmt.setInt(1, num);
		
		pstmt.executeUpdate();	
		
		pstmt = conn.prepareStatement("select * from p_board where num=? "); //��ȸ
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
				article = new BoardVO(); //��ü ����
			
				//db���� �����;ߵ�
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setSubject(rs.getString("subject"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));;
				article.setContent(rs.getString("content"));
				
		}
			
		}catch (SQLException s1) {
			s1.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException s1){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
			if(conn != null) try{conn.close();}catch(SQLException s3){}		
		}
		
		return article;
		
	 } // end getArticle
	
	 /*
	  * �� ���� ��ư��  ���� ��� updateForm.jsp �������� �̵��ϵ��� ��ũ�� �ɾ���.
	  * �� ���� ��  �� ��� ����� �ٸ��� ��ȸ���� ������ų �ʿ�� ����.
	  * 
	  * ��ȸ�� ������ �����ϰ� num�� �ش��ϴ� �۸� �������� �޼ҵ带 �����Ѵ�
	  * 
	  */
	
	 
	 public BoardVO updateGetArticle(int num) {
		 	
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			BoardVO article = null;
			
			int check = -1;
		 
		try {
			
		conn = ConnUtil.getConnection();
		/*
		 * pstmt =
		 * conn.prepareStatement("update board set readcount=readcount+1 where num=?");
		 * //���� ������ ��ȸ���� �ö󰡾ߵ� ���� �Ǿߵȴٴ¶��̴�. pstmt.setInt(1, num);
		 * 
		 * pstmt.executeUpdate(); ��� ��ȸ�� �̱� ������ �ʿ䰡 ���� �������� �� �Ȱ���
		 */
		
		
		
		pstmt = conn.prepareStatement("select * from p_board where num=? "); //��ȸ
		pstmt.setInt(1, num);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
				article = new BoardVO(); //��ü ����
			
				
				
				//db���� �����;ߵ�
				article.setNum(rs.getInt("num"));
				article.setWriter(rs.getString("writer"));
				article.setSubject(rs.getString("subject"));
				article.setRegdate(rs.getTimestamp("regdate"));
				article.setReadcount(rs.getInt("readcount"));
				article.setContent(rs.getString("content"));
		}
			
		}catch (SQLException s1) {
			s1.printStackTrace();
		} finally {
			if(rs != null) try{rs.close();}catch(SQLException s1){}
			if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
			if(conn != null) try{conn.close();}catch(SQLException s3){}		
		}
		
		return article;
			
			
	 }// end of updateGetArticle
	
	 public int updateArticle(BoardVO article) {
		 
		 	Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
		
			
			String strQuery ="";
			int result = -1; //�Խñ� ������ 
		
			try {
			
				conn = ConnUtil.getConnection();
				pstmt = conn.prepareStatement("select * from p_board where num =?");
				pstmt.setInt(1, article.getNum()); //������ ��ȣ�� ��ȣ�� article�� ������ ����
				rs = pstmt.executeQuery();
				
				
						strQuery = "update p_board set writer=?, subject=?, content=? where num=?";
						pstmt = conn.prepareStatement(strQuery); //������ ����
						
						pstmt.setString(1, article.getWriter());
						pstmt.setString(2, article.getSubject());
						pstmt.setString(3, article.getContent());
						pstmt.setInt(4, article.getNum());
						
						pstmt.executeUpdate();
						result =1; // ���� ����
						
					
				
				
				
			}catch (SQLException s1) {
				s1.printStackTrace();
			} finally {
				if(rs != null) try{rs.close();}catch(SQLException s1){}
				if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
				if(conn != null) try{conn.close();}catch(SQLException s3){}		
			}
			
			return result;
			
	 } // end of updateArticle
	 
	 /*
	  * �� ���� ó��
	  * �ۻ��� ������ ��й�ȣ�� �Է��ϰ� ������ �����ϸ� �����ͺ��̽����� ��й�ȣ�� �˻��ؼ�
	  * ��� ��ȣ�� ��ġ�ϸ� ���� ó���� �����ϰ� �׷��� ������ ��й�ȣ ���� ����
	  */
	 
	 public int deleteArticle(int num) {
			
		 	Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			
			
			int result = -1; 
		
			try {
			
				conn = ConnUtil.getConnection();
				
				pstmt = conn.prepareStatement("select pass from boardone where num =?"); //�н����带 �����;ߵȴ�
				// num�� ������ �´�
//				pstmt.setInt(1, num); 
//				rs = pstmt.executeQuery();
				
			
						
						pstmt = conn.prepareStatement("delete from p_board where num=?");
						
	
						pstmt.setInt(1, num);
						
						pstmt.executeUpdate();
						result =1; // �� ���� ����
						
		
				
				
			}catch (SQLException s1) {
				s1.printStackTrace();
			} finally {
				if(rs != null) try{rs.close();}catch(SQLException s1){}
				if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
				if(conn != null) try{conn.close();}catch(SQLException s3){}		
			}
			return result;
	 }
	 
	 //�����ε� �Ű������� �޸� �������� ����! 
	 //�˻��� ������ � �ִ����� ��ȯ�ϴ� ��� (what : �˻�����,  content : �˻����� )
	 public int getArticleCount(String what, String content) {

			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			int x =0;
			
			try {
				conn = ConnUtil.getConnection();								// 
				pstmt = conn.prepareStatement("select count(*) from p_board where "+what+" like '%"+content+"%' "); 
				rs = pstmt.executeQuery();
				if(rs.next()) {
					x = rs.getInt(1); 
				}
			
			}catch (SQLException s1) {
				s1.printStackTrace();
			} finally {
				if(rs != null) try{rs.close();}catch(SQLException s1){}
				if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
				if(conn != null) try{conn.close();}catch(SQLException s3){}		
			}
			
			return x;
		}// end of  getArticleCount
	 
	 //�����ε� �Ű����� 4
	 //�˻��� ������ ����Ʈ�� �޾ƿ� (what:�˻����� content:�˻�����, ���۹�ȣ, ����ȣ ) ���۹�ȣ�� ����ȣ�� ������ ó���� 
	 	public List<BoardVO> getArticles(String what, String content, int start, int end){
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			List<BoardVO> articleList = null; //������ ��ü ����
			
			try {
				conn = ConnUtil.getConnection();                
				
				
				
				
				
				//���� ������ ���� �ٱ��� ������ ����
				pstmt = conn.prepareStatement("select * from ( " 
				+ "select rownum rnum, num, writer, subject, "
				+ "regdate, readcount, content from ( "
				+ "select * from p_board where num "+what+" like '%" +content+"%' order by asc)) "
				+ "where rnum >=? and rnum <= ? "); //rnum�̽��۹�ȣ 
				
				//���� ���������� ���ε� �Լ��� 2����
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				
				
				rs = pstmt.executeQuery();
	 			
	 			if(rs.next()) {
	 				articleList = new ArrayList<>(end - start +1);
	 				do {
	 					
	 					BoardVO article = new BoardVO();
	 					
	 					article.setNum(rs.getInt("num"));
	 					article.setWriter(rs.getString("writer"));
	 					
	 					article.setSubject(rs.getString("subject"));
	 					
	 					article.setRegdate(rs.getTimestamp("regdate"));
	 					article.setReadcount(rs.getInt("readcount"));
	 					
	 					article.setContent(rs.getString("content"));
	 			
	 				
	 				
	 					articleList.add(article);
	 				}while(rs.next()); //�ȿ� ������ ��� �ݺ��ؼ� ������
	 				
	 			}
				
			}catch (SQLException s1) {
				s1.printStackTrace();
			} finally {
				if(rs != null) try{rs.close();}catch(SQLException s1){}
				if(pstmt != null) try{pstmt.close();}catch(SQLException s2){}
				if(conn != null) try{conn.close();}catch(SQLException s3){}		
			}
			
			return articleList;
		} //end of getArticles
}