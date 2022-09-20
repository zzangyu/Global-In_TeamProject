<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 스케쥴링 플래너 - 도죠</title>
</head>
<body>
<!--header  -->
<div class = "header">  
 	<nav id= "navcc">
 		<div class ="nav-wrapper navWidth">
 			<ul>
 	 			<li id="loginlogoutNav">
		<div class ="nav-profile-btn-container">
		<span id ="logout">
		<button class =  "nav-profile-btn"  aria-expanded ="true"></button>
		</div>	
			<li>
			<a href ="cityPlan.do?cmd=mypage">마이페이지</a>
		</li>
		<li>
			<a href ="cityPlan.do?cmd=logout">로그아웃</a>
		</li>
	</ul>
	</div>
</nav>
</div>
<!-- body  -->
	<div class ="wrapper">
		<div class = "container">
			<div class="top-container">
				<div class="profile-container">
					<div class =profile-text id = "profilePhoto">(김)</div>
					<div class = "text">김!!</div>
					<button class ="btn-normal" onclick="location.href='cityPlan.mb?cmd=modifyForm'">프로필 수정</button>
				</div>
				<!-- 나의 일정 나의 리뷰 묶음 -->
				<div></div>
				<div class = "row">
					<div class = "index-row">
						<div class ="myplan" onclick ="#">
						 <h5 style ="font-family: 'Montserrat' !important">
						 		<b>나의 일정</b>
						 </h5>
						 <div>
						 	<h3 style ="line-height:1 ; font-weight: 700" id ="myofplan"></h3>
						 </div>
						</div>				
							<div class = "index-row">
						<div class ="myreview" onclick ="#">
						 <h5 style ="font-family: 'Montserrat' !important">
						 		<b>나의 리뷰</b>
						 </h5>
						 <div>
						 	<h3 style ="line-height:1 ; font-weight: 700" id ="reivew-"></h3>
						 </div>
						</div>				
					 </div>				 
					 </div>
				  </div>				
				</div>
			
			
			
			
			
			
			</div>
		</div>
	
	</div>
	
	
</body>
</html>