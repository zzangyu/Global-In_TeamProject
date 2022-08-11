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

public class DBCP{
	
	DataSource ds;
	
	public DBCP() {
		
		try {
			
			Context initContext = new InitialContext();
			ds = (DataSource)initContext.lookup("java:/comp/env/jdbc/myoracle");
			
		} catch (Exception e) {

			System.out.println("DBCP ERROR");
			
		}
		
	}
	
	public List<CityVO> getCity() {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<CityVO> arry = new ArrayList<CityVO>();
		
		try {
			conn = ds.getConnection();
			
			String strQuery = "select * from City order by num asc";
			stmt = conn.createStatement();
			
			rs = stmt.executeQuery(strQuery);
			
			while(rs.next()) {
				CityVO vo = new CityVO();
				vo.setCityname(rs.getString("cityname"));
				vo.setCityinfo(rs.getString("cityinfo"));
				vo.setContinent(rs.getString("continent"));
				vo.setLongitude(rs.getString("longitude"));
				vo.setLatitude(rs.getString("latitude"));
				vo.setInfo(rs.getString("info"));
				vo.setVolt(rs.getString("volt"));
				vo.setHour(rs.getString("hour"));
				vo.setTimedifference(rs.getString("timedifference"));
				vo.setBtn(rs.getString("btn"));
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
