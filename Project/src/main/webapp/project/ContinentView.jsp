<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.dbcp.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/CityInfo.css" rel="stylesheet" type="text/css">
</head>
<body>

	<div id="cityContainer">
		<div id="Search">
			<form action="ContinentSearch.jsp" >
				<label id="userSearch"></label>
				<input type="text" name="userSearch">
				<input type="submit" value="Search">
			</form>
		</div>
	<jsp:useBean id="dao" class="com.dbcp.DBCP" scope="page" />
	<%
		List<CityVO> arry = dao.getCity();
		for (int i = 0; i < arry.size(); i++) {	
	%>
		<div class="btn-open-popup">
				<img src="./img/01.jpeg" width="300" height="300">
				<div id="citytext">
					<div><b><%= arry.get(i).getCityname() %></b></div>
				    <%= arry.get(i).getCityinfo() %>
				</div>	
		</div>
		<div class="modal">	
			<div id="cityWrap2" class="modal_body">
				<div id="cityImage2"><img src="./img/01.jpeg"></div>
				<div>
					<h1><%= arry.get(i).getCityname() %></h1>
					<div><%= arry.get(i).getCityinfo() %></div>
					<p><%= arry.get(i).getInfo() %></p>
					<div id="cityInfo">
						<div><%= arry.get(i).getVolt() %></div>
						<div><%= arry.get(i).getHour() %></div>
						<div><%= arry.get(i).getTimedifference() %></div>
					</div>
				</div>
			</div>
		</div>                                    
	
	<%
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