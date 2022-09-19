<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>여행 스케쥴링 플래너 - 도죠</title>
<link rel="stylesheet" type="text/css" href="memberstyle.css">
<script type="text/javascript" src = "memberscript.js"></script>
</head>
<body>
 	<div class ="center">
 		<div class="container">
  			<div class = "text">비밀번호 찾기</div>
  			<div class ="small-text">여행 스케쥴링 플래너 - 도죠</div>
  			
  			<div>
  			<label class="label-text">이메일</label>
  				<input class ="input" type ="email" id="findUserPwdEmail">
  			</div>
 		</div>
 		
 	<div>
 		<label class ="small-text">회원가입시 등록하셨던 이메일 주소를 입력해주세요.</label>
 		<div>
 			<button class ="button" type ="submit" id="sendNewPwdBtn">발급받기</button>
 	</div>
 		
 	<div>
 		<label class = "#">인증번호</label>
 			<input class="input" type ="text">
 	</div>
 		
 	<div>
 		<label class ="small-text">*메일이 도착하기 까지 몇 분 정도 소요 될 수 있습니다.</label>
 		<div>
			<input type ="button" class = "button" value = "뒤로가기" onclick="backbutton()"> 
		</div>
 	</div>
</body>
</html>