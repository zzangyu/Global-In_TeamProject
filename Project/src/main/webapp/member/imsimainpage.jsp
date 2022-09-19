<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="loginID" value="${sessionScope.loginID}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지 임시</title>
</head>
<body>
<c:if test="${requestScope.check eq 0 }">
	<script type="text/javascript">
		alert('비밀번호가 틀렸습니다.')
		history.go(-1)
	</script>
</c:if>
<c:if test="${requestScope.check eq -1 }">
	<script type="text/javascript">
		alert('ID가 존재하지않습니다.')
		history.go(-1)
	</script>
</c:if>
<c:if test="${loginID ne null}">

 <div class = "header">  
 	<nav id= "navcc">
 		<div class ="nav-wrapper navWidth">
 	<ul>
 	 <li id="loginlogoutNav">
		<div class ="nav-profile-btn-container">
		<span id ="logout"></span>
		<button class =  "nav-profile-btn"  aria-expanded ="true"></button>
		</div>	
		<li>
			<a href ="cityPlan.mb?cmd=mypage">마이페이지</a>
		</li>
		<li>
			<a href ="cityPlan.mb?cmd=logout">로그아웃</a>
		</li>
	</ul>
	</div>
</nav>
</div>
</c:if>
</body>
</html>