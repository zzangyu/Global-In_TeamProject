<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="home.jsp" %>
<meta charset="UTF-8">
<%@ include file="Home.jsp" %>
<title>Insert title here</title>
<link href="css/CityInfo.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.0.0/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<script type="text/javascript" src="js/MyPlan.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link href="https://fonts.googleapis.com/css2?family=DynaPuff:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/e14a2b80fa.js" crossorigin="anonymous"></script>
</head>
<body>
	<div id="cityContainer">
		<div id="Search">
			<form action="cityPlan.do?cmd=cityInfoSearch" method="post">
				<div id="submitBtn">
					<input type="text" name="userSearch" id="userSearch" placeholder="나라-도시 검색">
					<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
				</div>
			</form>
				<div class="menu">
					<button class="menu-link" onclick="location.href='cityPlan.do?cmd=cityInfoView'">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;All&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
				</div>
		</div>
		<div id="top_btn">
			<i class="fa-solid fa-circle-chevron-up fa-2x"></i>
<<<<<<< HEAD
=======
		</div>
	<jsp:useBean id="dao" class="com.dbcp.DBCP" scope="page" />
	<%	
		boolean check = false;
		
		List<CityVO> arry = dao.getCity();
		for (int i = 0; i < arry.size(); i++) {
	
			if(arry.get(i).getCityinfo().contains(request.getParameter("userSearch"))){
				
				check = true; // 검색 결과가 있으면 true로 바꿔준다.
				
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
>>>>>>> bc37c0f6ad98ad64e6d52604340b5acb83c4fd0e
		</div>
	<c:forEach var="arry" items="${arry}">
		<c:set var="check" value="true" />
		<div class="${arry.getBtn()}">
				<div class="btn-open-popup">
					<a class="btn" href="#${arry.getCityname()}">
					<div  class="img"><img src="./img/${arry.getCityname()}.jpg" width="300" height="300"></div>
					<div id="citytext">
						<div><b>${arry.getCityname()}</b></div>
			    		<div>${arry.getCityinfo()}</div>
					</div>	
				</a>
			</div>
		</div>
		<div class="modal" id="${arry.getCityname()}" style="max-width:90%; height:60%; padding: 0;">	
			<div id="cityWrap2" class="modal_body">
				<div id="cityImage2"><img src="./img/${arry.getCityname()}.jpg"></div>
				<div id="cityText">
					<h1>${arry.getCityname()}</h1>
					<div><b>${arry.getCityinfo()}</b></div>
					<p>${arry.getInfo()}</p>
					<div id="cityInfo">
						<div class="icon"><div><i class="fa-solid fa-bolt"></i></div><div>${arry.getVolt()}</div></div>
						<div class="icon"><div><i class="fa-solid fa-clock-rotate-left"></i></div><div>${arry.getHour()}</div></div>
						<div class="icon"><div><i class="fa-solid fa-plane-departure"></i></div><div>${arry.getTimedifference()}</div></div>
					</div>
					<div id="plan" onclick="location.href='cityPlan.do?cmd=myPlan&lat=${arry.getLatitude()}&lng=${arry.getLongitude()}'">일정 만들기</div>
				</div>
			</div>
		</div>        
		<script>	
   		 	$('a[href="#${arry.getCityname()}"]').click(function(event) {
	    		event.preventDefault();
 		    	$(this).modal({
   				fadeDuration: 250
    				});
 				});
		</script>	                                  
	</c:forEach>
		<c:if test="${!check}">
			<script type='text/javascript'>
				alert('검색 결과가 없습니다.');
				history.go(-1);
			</script>
		</c:if>
	</div>
	<script type="text/javascript" src="js/CityInfo.js"></script>
</body>
</html>