<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, com.dbcp.*, java.util.*"%>
    <jsp:useBean id="dao" class="com.dbcp.DBCPPlanCityInfo" />
    <% 
    	List<PlanCityInfoVO> arry = dao.getPlanInfo();
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메로옹</title>
<link rel="stylesheet" type="text/css" href="css/planCityInfo.css" />
<link href="https://fonts.googleapis.com/css2?family=DynaPuff:wght@700&display=swap" rel="stylesheet"> <!-- 폰트 -->
<script type="text/javascript">
<% /* 왜인지 모르겠는데 name만 전역변수로 선언 해줘야됨.. */
for(int i = 0; i < arry.size(); i++) {
%>
	var <%= arry.get(i).getCitynameimg()%> = "<%= arry.get(i).getCitynameimg()%>";
nameCheck = function() {
const urlParams = new URL(location.href).searchParams;
const nameStr = urlParams.get('name');

	if(nameStr === <%= arry.get(i).getCitynameimg()%>){
		document.getElementById('container').style.display = 'block';
	}
	
}
<%
}
%>
</script>
</head>
	<%
	for(int i = 0; i < arry.size(); i++) {	
	%>
<body onload="nameCheck()">
	<div id="container">
		<div id="title"><%= arry.get(i).getCityinfoname() %> - 가이드북</div>
		<div id="imgWrap">
			<img src="img/<%= arry.get(i).getCitynameimg() %>.jpg">
		</div>
		<div id="mainWrap">
			<div id="forFlex">
				<h2><%= arry.get(i).getCityinfoname() %></h2>
				<div id="cityInfoS"><b><%= arry.get(i).getCityinfoS() %></b></div>
				<div id="wishList">☆</div>
			</div>
			<div id="infoWrap">
				<div id="peakMonth">
					<div id="peakMonth_title">성수기</div>
					<div id="peakMonth_value"><%= arry.get(i).getCitypeakseason()%></div>
				</div>
				<div id="days2">
					<div id="days2_title">1박 2일</div>
					<div class="days2_value"><%= arry.get(i).getCitytwodays1() %></div>
					<div class="days2_value"><%= arry.get(i).getCitytwodays2() %></div>
				</div>
				<div id="days3">
					<div id="days3_title">2박 3일</div>
					<div class="days3_value"><%= arry.get(i).getCitythreedays1() %></div>
					<div class="days3_value"><%= arry.get(i).getCitythreedays2() %></div>
					<div class="days3_value"><%= arry.get(i).getCitythreedays3() %></div>
				</div>
			</div>
			<div id="routeWrap">
				<div id="routeWrap_title"><span style="color: red;">Top 3</span> 추천 루트</div>
				<div class="routeWrap_value"><%= arry.get(i).getCityroute1() %></div>
				<div class="routeWrap_value"><%= arry.get(i).getCityroute2() %></div>
				<div class="routeWrap_value"><%= arry.get(i).getCityroute3() %></div>
			</div>
		</div>
	</div>
		<%
	}
		%>
	<script type="text/javascript" src="js/MyPlan.js"></script>
	<script type="text/javascript" src="js/planCityInfo.js"></script>
</body>
</html>