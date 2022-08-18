<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dbcp.DBCPPlanCityInfo" %>
<%@ page import="java.sql.Timestamp" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="citySave" class="com.dbcp.SaveCityVO" scope="page">
	<jsp:setProperty name="citySave" property="*"></jsp:setProperty>
</jsp:useBean>
<jsp:useBean id="dao" class="com.dbcp.DBCPPlanCityInfo"></jsp:useBean>

<%
	String eng = request.getParameter("cityEn");
	System.out.println(eng);
	String kor = request.getParameter("cityKr");
	System.out.println(kor);
	citySave.setRegdate(new Timestamp(System.currentTimeMillis()));
	dao.savePlan(eng, kor);
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<meta http-equiv="Refresh" content="0; url=CityInfoView.jsp">
<body>

</body>
</html>