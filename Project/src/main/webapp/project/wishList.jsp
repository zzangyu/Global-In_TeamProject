<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		<div id="profile"><a href="modifyForm.jsp">프로필 수정</a></div>
		<div id="myPlan_wishList_wrap">
			<div id="myPlan" onclick="myPlanClick()">내 일정</div>
			<div id="wishList" onclick="wishListClick()">위시리스트</div>
		</div>
	</div>
	<c:forEach var="planList" items="${planList}">
	<div id="mP"> <!-- 일정이 있으면 나오게 하기 없으면 일정 만들기 뜨게하기 -->
		<h2>님의 일정</h2>
		<div class="mP_wrap">
			<div></div>
			<div><a href="">수정</a></div>
			<div><a href="myPlan.do?cmd=deletePlan&idCheck=${list}">삭제</a></div>
		</div>
		<div id="wishList_makePlan"><a href="cityPlan.do?cmd=myPlanClick">저장된 일정이 없습니다! 만들러 가버려잇</a></div>
	</div>
	<div id="wL">
		<h2>님의 위시리스트</h2>
		<div class="wL_wrap"></div>
	</div>
	</c:forEach>
<script type="text/javascript" src="js/wishList.js"></script>
</body>
</html>