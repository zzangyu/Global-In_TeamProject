<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.dbcp.DBCPPlanCityInfo" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:useBean id="citySave" class="com.dbcp.SaveCityVO" scope="page">
	<jsp:setProperty name="citySave" property="*"></jsp:setProperty>
</jsp:useBean>
<jsp:useBean id="dao" class="com.dbcp.DBCPPlanCityInfo"></jsp:useBean>

<%	
	if(request.getParameter("cityEn1") != null){
		for(int i = 1; i < 10; i++){
			if(request.getParameter("cityEn"+i) != null) {
				dao.savePlan(request.getParameter("cityEn"+i), request.getParameter("cityKr"+i));	
			}
		}
	} else { 
%>
	<script type="text/javascript">
		alert("<도시를 추가해주세요.>");
		history.go(-1);
	</script>
<%
	} 
%>
<meta http-equiv="Refresh" content="0; url=CityInfoView.jsp">
<script type="text/javascript">
	alert("<저장 완료>");
</script>
