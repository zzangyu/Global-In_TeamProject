<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script> <!-- 구글맵 스트립트 -->
<script type="text/javascript" src="js/MyPlan.js"></script>
<link rel="stylesheet" type="text/css" href="css/MyPlan.css" />
<link href="https://fonts.googleapis.com/css2?family=DynaPuff:wght@700&display=swap" rel="stylesheet"> <!-- 폰트 -->
<script src="https://kit.fontawesome.com/e14a2b80fa.js" crossorigin="anonymous"></script> <!-- 폰트어썸 아이콘 -->
</head>
<body>
	<div id="mapWrap">
		<div id="hello">Let's &nbsp;make &nbsp;a &nbsp;plan</div>
		<input type="text" name="userSearch" placeholder="도시를 입력해주세요.">
		<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
		<div id="plan"> <!-- 일정 div -->
			<div class="plan_cities"></div>
		</div>
		<!-- google map div -->

	</div>
    	<div id="map"></div>
<!-- google map key, 맵 구현 -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCY1oDgXTf55jiJBGLsiTsCgf9DyrlU66E&callback=initMap&v=weekly" defer></script>
</body>
</html>