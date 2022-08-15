<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, com.dbcp.*, java.util.*"%>
    <jsp:useBean id="dao1" class="com.dbcp.DBCP" />
    <jsp:useBean id="dao2" class="com.dbcp.DBCPPlanCityInfo" />
    <% 
    	List<CityVO> arry1 = dao1.getCity();
    	List<PlanCityInfoVO> arry2 = dao2.getPlanInfo();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메로옹</title>
<link rel="stylesheet" type="text/css" href="css/planCityInfo.css" />
<link href="https://fonts.googleapis.com/css2?family=DynaPuff:wght@700&display=swap" rel="stylesheet"> <!-- 폰트 -->
</head>
<body>
	<div id="container">
		<div id="title">이름 가이드북</div>
		<div id="imgWrap">
			<img src="">
		</div>
		<div id="mainWrap">
			<h3>이름</h3>
			<div>
				<span>짧은설명(배경#ccc)</span>
				<span id="wishList" onclick="#">위시리스트(온클릭(이름 파라미터값으로 보내기))</span>
			</div>
		</div>
		<div id="routeWrap">
			<div>성수기</div>
			<div>
				<div>1박-1일</div>
				<div>1박-2일</div>
			</div>
			<div>
				<div>2박-1일</div>
				<div>2박-2일</div>
				<div>2박-3일</div>
			</div>
			<div>추천루트</div>
		</div>
	</div>
	<script type="text/javascript" src="js/MyPlan.js"></script>
</body>
</html>