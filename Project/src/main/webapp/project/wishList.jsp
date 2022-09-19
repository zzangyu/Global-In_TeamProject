<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="base.jsp"%>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=DynaPuff:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<link href="css/wishList.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="wishList_container">
		<div id="firstWord_id">한</div>
		<div id="nickname">닉네임</div>
		<div id="profile">프로필 수정</div>
		<div id="myPlan_wishList_wrap">
			<div id="myPlan" onclick="myPlan()">내 일정</div>
			<div id="wishList" onclick="wishList()">위시리스트</div>
		</div>
		<div id="mP"></div>
		<div id="wL"></div>
	</div>
<script type="text/javascript" src="js/wishList.js"></script>
</body>
</html>