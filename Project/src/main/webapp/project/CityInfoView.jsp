<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.dbcp.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메롱</title>
<link href="css/CityInfo.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<script src="https://kit.fontawesome.com/e14a2b80fa.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id="cityContainer">
		<div id="Search">
			<form action="CityInfoSearch.jsp">
				<div id="submitBtn">
					<input type="text" name="userSearch" id="userSearch" placeholder="나라-도시 검색">
					<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
				</div>
			</form>
				<div class="menu">
					<button class="menu-link" onclick="SearchAll()">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
					<button class="menu-link" onclick="SearchAsia()">&nbsp;&nbsp;&nbsp;Asia&nbsp;&nbsp;&nbsp;</button>
					<button class="menu-link" onclick="SearchAmerica()">America</button>
					<button class="menu-link" onclick="SearchEurope()">Europe</button>
				</div>
		</div>

	<jsp:useBean id="dao" class="com.dbcp.DBCP" scope="page" />
	<%
		List<CityVO> arry = dao.getCity();
		for (int i = 0; i < arry.size(); i++) {	
	%>	
		<div class="<%= arry.get(i).getBtn()%>">
			<div class="btn-open-popup">
				<a class="btn" href="#<%= arry.get(i).getCityname() %>">
					<div  class="img"><img src="./img/<%= arry.get(i).getCityname() %>.jpg" width="300" height="300"></div>
					<div id="citytext">
						<div><b><%= arry.get(i).getCityname() %></b></div>
				   	 <div><%= arry.get(i).getCityinfo() %></div>
					</div>
				</a>
			</div>
		</div>
		<div class="modal" id="<%= arry.get(i).getCityname() %>" style="max-width:90%; height:60%; padding: 0;">	
			<div id="cityWrap2" class="modal_body">
				<div id="cityImage2"><img src="./img/<%= arry.get(i).getCityname() %>.jpg"></div>
				<div id="cityText">
					<h1><%= arry.get(i).getCityname() %></h1>
					<div><b><%= arry.get(i).getCityinfo() %></b></div>
					<p><%= arry.get(i).getInfo() %></p>
					<div id="cityInfo">
						<div class="icon"><div><i class="fa-solid fa-bolt"></i></div><div><%= arry.get(i).getVolt() %></div></div>
						<div class="icon"><div><i class="fa-solid fa-clock-rotate-left"></i></div><div><%= arry.get(i).getHour() %></div></div>
						<div class="icon"><div><i class="fa-solid fa-plane-departure"></i></div><div><%= arry.get(i).getTimedifference() %></div></div>
					</div>
					<div id="plan" onclick="location.href='MyPlan.jsp?lat=<%= arry.get(i).getLatitude()%>&lng=<%= arry.get(i).getLongitude()%>'">일정 만들기</div>
				</div>
			</div>
		</div>
	<script type="text/javascript">	
    	$('a[href="#<%= arry.get(i).getCityname() %>"]').click(function(event) {
      		event.preventDefault();
 
      		$(this).modal({
        	fadeDuration: 250
     		});
  		});
	</script>	
	<%
		}
		
	%>
	</div>
	<script type="text/javascript" src="js/CityInfo.js"></script>
	<script type="text/javascript" src="js/MyPlan.js"></script>
</body>
</html>