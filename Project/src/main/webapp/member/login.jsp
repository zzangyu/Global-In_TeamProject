<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 스케쥴링 플래너 - 도죠</title>
<link rel="stylesheet" type="text/css" href="memberstyle.css">
<script type="text/javascript" src = "memberscript.js"></script>
</head>
<body class ="login-body">
<form action="cityPlan.mb?cmd=loginProc" method = "post">
<div class = "center">
	<div class ="container">
	   <div class = "text"><h2>LOG IN</h2></div>
	   <div class = "small-text">여행 스케쥴링 플래너 - 도죠</div>
	<div class = "form-container">
	   		<div class = "data">
	   	 		<label>ID</label>
	   	 		<input class="data-input" type = "text" name = "id">
	   	 	</div>
	   	 	
	   	 	<div class = "data">
	   	 		<label>PASSWORD</label>
	   	 		<input class="data-input" type = "password" name = "pass">
	   	 	</div>
	   	 	
	   	 	<!--비밀번호 찾기  -->
	   	 	<div class = "forget-pass">
	   	 	<a class="fg-pass" href ="cityPlan.mb?cmd=findpassword">비밀번호를 잊으셨나요?</a>
	   	 	</div>
	   	 	
	   	 	<!--로그인 버튼  -->
	   	 	<div class = "btn"> 
	   	 	 	<div class = "log-button"></div>
	   	 	 	<input type ="submit" value = "login">
	   	 	</div>
	   	 	
	   	 	<!--회원가입 링크  -->
	   	 	<div class = "signup-link">회원이 아니신가요?
	   	 	 <a class= "link" href = "cityPlan.mb?cmd=regForm">회원가입하기</a>
	   	 	</div>
	   	 	
	   	 	<!-- -->
	   	 	<div class = "divider-container">
	   	 	<div class = "divider"></div>
	   	 		<span class ="or">or</span>
	   	 	</div>
	   	 	
	   		 <!--소셜 로그인 연동 (수정해야됨)-->
	   	 	<div class = "sns-text">SNS 간편 로그인</div>
	   		 <div class = "social-container">
	   		 	<div class = "socialBtn">
	   		 		<div class="btn-image1" >
	   		 		<img alt="logo" src="./image/ggbtn.png">
	   		 		</div>
	   		 	</div>	
	   		 	<div class = "socialBtn">
	   		 		<div class ="btn-image2" onclick ="#">
	   		 		<img src ="./image/linebtn.png" alt="logo">
	   		 		</div>
	   		 	</div>	
	   		 	<div class = "socialBtn">
	   		 		<div class = "btn-image3" onclick = "#">
	   		 		<img src = "./image/ffbtn.png" alt="logo">
				</div>
			</div>	   		 
	   	</div>
	  </div>
	</div>
	</div>
</form>

</body>
</html>