<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.dbcp.*, java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<input type="text" name="userSearch" id="userSearch">
					<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
				</div>
			</form>
				<div class="menu">
					<button value="All" class="menu-link">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
					<button value="Asia" class="menu-link">&nbsp;&nbsp;&nbsp;Asia&nbsp;&nbsp;&nbsp;</button>
					<button value="America" class="menu-link">America</button>
					<button value="Europe" class="menu-link">Europe</button>
				</div>
		</div>
	<jsp:useBean id="dao" class="com.dbcp.DBCP" scope="page" />
	<%	
		boolean check = false;
		List<CityVO> arry = dao.getCity();
		for (int i = 0; i < arry.size(); i++) {
			
			if(arry.get(i).getCityinfo().contains(request.getParameter("userSearch"))){
				check = true; // 검색 결과가 있으면 true로 바꿔준다.
				
	%>
		<div class="btn-open-popup">	
			<a class="btn" href="#<%= arry.get(i).getCityname() %>">
				<img src="./img/01.jpeg" width="300" height="300">
				<div id="citytext">
					<div><b><%= arry.get(i).getCityname() %></b></div>
				    <div><%= arry.get(i).getCityinfo() %></div>
				</div>	
			
			</a>
		</div>
		<div class="modal" id="<%= arry.get(i).getCityname() %>" style="max-width:80%; height:80%;">	
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
		<script>	
   		 	$('a[href="#<%= arry.get(i).getCityname() %>"]').click(function(event) {
	      		event.preventDefault();
 
      			$(this).modal({
        		fadeDuration: 250
     			});
  			});
		</script>	                                  
	
	<%
			}		
		}
		
		if(!check){ // 결과가 없으면 경고창을 띄우고 전체 목록을 보여준다.
			PrintWriter writer = response.getWriter();
			writer.println("<script type='text/javascript'>");
			writer.println("alert('검색 결과가 없습니다.');");
			writer.println("location.href='CityInfoView.jsp';");
			writer.println("</script>");
			writer.flush();
		}
		
	%>
	</div>
	<script type="text/javascript" src="js/CityInfo.js"></script>
</body>
</html>