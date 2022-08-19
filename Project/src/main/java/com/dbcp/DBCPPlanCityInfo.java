package com.dbcp;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBCPPlanCityInfo{
	
	DataSource ds;
	
	public DBCPPlanCityInfo() {
		
		try {
			
			Context initContext = new InitialContext();
			ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/myoracle");
			
		} catch (Exception e) {

			System.out.println("DBCP ERROR");
			
		}
		
	}
	
	public List<PlanCityInfoVO> getPlanInfo() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<PlanCityInfoVO> arry = new ArrayList<PlanCityInfoVO>();
		
		try {
			conn = ds.getConnection();
			
			String strQuery = "select * from plancityinfo";
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(strQuery);
			
			while(rs.next()) {
				PlanCityInfoVO vo = new PlanCityInfoVO();
				vo.setCityinfoname(rs.getString("cityinfoname"));
				vo.setCitynameimg(rs.getString("citynameimg"));
				vo.setCityinfoS(rs.getString("cityinfoS"));
				vo.setCitypeakseason(rs.getString("citypeakseason"));
				vo.setCitytwodays1(rs.getString("citytwodays1"));
				vo.setCitytwodays2(rs.getString("citytwodays2"));
				vo.setCitythreedays1(rs.getString("citythreedays1"));
				vo.setCitythreedays2(rs.getString("citythreedays2"));
				vo.setCitythreedays3(rs.getString("citythreedays3"));
				vo.setCityroute1(rs.getString("cityroute1"));
				vo.setCityroute2(rs.getString("cityroute2"));
				vo.setCityroute3(rs.getString("cityroute3"));
				arry.add(vo);
			}
			
		} catch (SQLException ss) {
			System.out.println("sql Exception");
		} catch (Exception e) {
			System.out.println("Exception");
		} finally {
			if(conn != null) try{ conn.close(); }catch(SQLException s1){}
			if(stmt != null) try{ stmt.close(); }catch(SQLException s2){}
			if(rs != null) try{ rs.close(); }catch(SQLException s3){}
		}	
		
		return arry;
		
	}
	public List<String> idCheck(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<String> saveCity_List = new ArrayList<String>();
		try {			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("select save_city_idCheck from saveCity where save_city_id=?");
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				SaveCityVO saveCity = new SaveCityVO();
				saveCity.setSave_city_idCheck(rs.getString("save_city_idCheck"));
				saveCity_List.add(saveCity.getSave_city_idCheck());
			}
			
		} catch (SQLException s1) {
			s1.printStackTrace();
		} finally {
			if(rs!=null) try {rs.close();} catch (SQLException s1) { }
			if(pstmt!=null) try {pstmt.close();} catch (SQLException s2) { }
			if(conn!=null) try {conn.close();} catch (SQLException s3) { }
		
		}
		return saveCity_List;
	}
	
	public void savePlan(String id, String idCheck,String eng, String kor, String sch) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {			
			conn = ds.getConnection();
			pstmt = conn.prepareStatement("insert into saveCity (save_city_id, save_city_idCheck, save_city_eng, save_city_kor, save_schedule) values (?, ?, ?, ?, ?)");
			pstmt.setString(1, id);
			pstmt.setString(2, idCheck);
			pstmt.setString(3, eng);
			pstmt.setString(4, kor);
			pstmt.setString(5, sch);
			pstmt.executeUpdate();
			
		} catch (SQLException s1) {
			s1.printStackTrace();
		} finally {
			if(rs!=null) try {rs.close();} catch (SQLException s1) { }
			if(pstmt!=null) try {pstmt.close();} catch (SQLException s2) { }
			if(conn!=null) try {conn.close();} catch (SQLException s3) { }
		}
	}
	public List<SaveCityVO> getCity(String idCheck, String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<SaveCityVO> arry = new ArrayList<SaveCityVO>();
		
		
		try {
			conn = ds.getConnection();
			
			String strQuery = "select * from saveCity where save_city_idCheck=? and save_city_id=?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, idCheck);
			pstmt.setString(2, id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				SaveCityVO vo = new SaveCityVO();
				vo.setSave_city_id(rs.getString("save_city_id"));
				vo.setSave_city_idCheck(rs.getString("save_city_idCheck"));
				vo.setSave_city_eng(rs.getString("save_city_eng"));
				vo.setSave_city_kor(rs.getString("save_city_kor"));
				vo.setSave_schedule(rs.getString("save_schedule"));
				
				arry.add(vo);
			}
			
		} catch (SQLException ss) {
			System.out.println("sql Exception");
		} catch (Exception e) {
			System.out.println("Exception");
		} finally {
			if(conn != null) try{ conn.close(); }catch(SQLException s1){}
			if(pstmt != null) try{ pstmt.close(); }catch(SQLException s2){}
			if(rs != null) try{ rs.close(); }catch(SQLException s3){}
		}	
		
		return arry;
		
	}
	
	public void deletePlan(String idCheck) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			
			String strQuery = "delete saveCity where save_city_idCheck=?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, idCheck);
			pstmt.executeUpdate();
			
		} catch (SQLException ss) {
			System.out.println("sql Exception 173");
		} catch (Exception e) {
			System.out.println("Exception");
		} finally {
			if(conn != null) try{ conn.close(); }catch(SQLException s1){}
			if(pstmt != null) try{ pstmt.close(); }catch(SQLException s2){}
		}	
		
	}
	public void deletePlan(String idCheck, String en) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
			
			String strQuery = "delete saveCity where save_city_idCheck=? and save_city_eng=?";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, idCheck);
			pstmt.setString(2, en);
			pstmt.executeUpdate();
			
		} catch (SQLException ss) {
			System.out.println("sql Exception 195");
		} catch (Exception e) {
			System.out.println("Exception");
		} finally {
			if(conn != null) try{ conn.close(); }catch(SQLException s1){}
			if(pstmt != null) try{ pstmt.close(); }catch(SQLException s2){}
		}	
		
	}
	public void updatePlan(String id, String idCheck, String eng, String kor, String sch) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ds.getConnection();
		
			String strQuery = "insert into saveCity values (?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(strQuery);
			pstmt.setString(1, id);
			pstmt.setString(2, idCheck);
			pstmt.setString(3, eng);
			pstmt.setString(4, kor);
			pstmt.setString(5, sch);
			pstmt.executeUpdate();
			
		} catch (SQLException ss) {
			System.out.println("sql Exception 218");
		} catch (Exception e) {
			System.out.println("Exception");
		} finally {
			if(conn != null) try{ conn.close(); }catch(SQLException s1){}
			if(pstmt != null) try{ pstmt.close(); }catch(SQLException s2){}
		}	
		
	}
}
