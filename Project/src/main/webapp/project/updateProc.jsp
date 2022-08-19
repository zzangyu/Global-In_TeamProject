<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dbcp.DBCPPlanCityInfo" %>
<%@ page import="java.util.*" %>
<%@ page import="com.dbcp.SaveCityVO" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="citySave" class="com.dbcp.SaveCityVO" scope="page">
	<jsp:setProperty name="citySave" property="*"></jsp:setProperty>
</jsp:useBean>
<jsp:useBean id="dao" class="com.dbcp.DBCPPlanCityInfo"></jsp:useBean>

<%	
	String id = "han";
	String idCheck = request.getParameter("idCheck");
	boolean deleteCheck = false;
	for(int i = 1; i < 10; i++){
		dao.deletePlan(idCheck, request.getParameter("bfcityEn"+i));
	}
	for(int i = 1; i < 10; i++){
		if(request.getParameter("bfcityEn"+i) != null) {
			
			deleteCheck = true;
		}
	}
	if(!deleteCheck) {
		dao.deletePlan(idCheck);
	}
	
	if(idCheck == ""){
%>
	<script type="text/javascript">
		alert("<도시를 추가해주세요.>");
		history.go(-1);
	</script>
<%
	}else {
		for(int i = 1; i < 10; i++){
			if(request.getParameter("cityEn"+i) != "") {
				dao.updatePlan(id, idCheck, request.getParameter("cityEn"+i), request.getParameter("cityKr"+i), request.getParameter("sche"+i));
			}
		}	
	}
		
%>
<!-- <meta http-equiv="Refresh" content="0; url=CityInfoView.jsp"> -->
<script type="text/javascript">
	alert("<저장 완료>");
</script>
