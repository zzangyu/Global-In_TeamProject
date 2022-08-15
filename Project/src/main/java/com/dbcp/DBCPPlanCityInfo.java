package com.dbcp;

import java.sql.Connection;
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
				vo.setCityinfoL(rs.getString("cityinfoL"));
				vo.setCitypeakseason(rs.getString("citypeakseason"));
				vo.setCitytwodays1(rs.getString("citytwodays1"));
				vo.setCitytwodays2(rs.getString("citytwodays2"));
				vo.setCitythreedays1(rs.getString("citythreedays1"));
				vo.setCitythreedays2(rs.getString("citythreedays2"));
				vo.setCitythreedays3(rs.getString("citythreedays3"));
				vo.setCityroute(rs.getString("cityroute"));
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
	
}
