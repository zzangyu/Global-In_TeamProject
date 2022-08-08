<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%// 변수 선언
	String word = request.getParameter("userSearch");
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String user = "scott";
	String passwd = "tiger";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String sql = "select cityinfo, info, volt, hour, timedifference from City where cityinfo Like %"+word+"%";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<link href="css/CityInfo.css" rel="stylesheet" type="text/css">
</head>
<body>
	<%
		try {
		// 데이터베이스를 접속하기 위한 드라이버 SW 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");
		// 데이터베이스에 연결하는 작업 수행
		conn = DriverManager.getConnection(url, user, passwd);
		// 쿼리를 생성할 객체 생성
		stmt = conn.createStatement();
		// 쿼리 생성
		rs = stmt.executeQuery(sql);
	%>
	<form action="ContinentSearch.jsp">
		<label id="userSearch"></label>
		<input type="text" name="userSearch">
		<input type="submit" value="Search">
	</form>
	<div id="cityContainer">	
	<%
		while(rs.next()){
	%>
		<div class="btn-open-popup" onclick=>
				<img src="./img/01.jpeg" width="300" height="300">
				<div id="citytext">
					<div><b><%= rs.getString("cityname") %></b></div>
				    <%= rs.getString("cityinfo") %>
				</div>
	
		</div>
		<div class="modal">	
			<div id="cityWrap2" class="modal_body">
				<div id="cityImage2"><img src="./img/01.jpeg"></div>
				<div>
					<h1><%= rs.getString("cityname") %></h1>
					<div><%= rs.getString("cityinfo") %></div>
					<p><%= rs.getString("info") %></p>
					<div id="cityInfo">
						<div><%= rs.getString("volt") %></div>
						<div><%= rs.getString("hour") %></div>
						<div><%= rs.getString("timedifference") %></div>
					</div>
				</div>
			</div>
		</div>                                    
	<%
		}
	} catch (Exception e) {
	e.printStackTrace();
	} finally {
	try {
	if (rs != null) {
		rs.close();
	}
	if (stmt != null) {
		stmt.close();
	}
	if (conn != null) {
		conn.close();
	}
	} catch (Exception e) {
	e.printStackTrace();
	}
	}
	%>
	</div>
	
	<script>
		
		const body = document.querySelector('body');
  		const modal = document.querySelector('.modal');
 	    const OpenPopup = document.querySelector('.btn-open-popup');

  		OpenPopup.addEventListener('click', () => {
    	modal.classList.toggle('show');

      	if (modal.classList.contains('show')) {
        	body.style.overflow = 'hidden';
      		}
   		});

   		modal.addEventListener('click', (event) => {
     	if (event.target === modal) {
        modal.classList.toggle('show');

       		if (!modal.classList.contains('show')) {
        		body.style.overflow = 'auto';
        	}
      	}
    	});
    </script>
</body>
</html>