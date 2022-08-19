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
	Random rand = new Random();
	String id = "han";
	String idCheck_set = "";
	List<String> arry = dao.idCheck(id);
	if(arry.size() == 0){
		idCheck_set = rand.nextInt(10)+id+rand.nextInt(10);
	} else {
		idCheck_set = rand.nextInt(10)+arry.get(arry.size()-1)+rand.nextInt(10) ;
	}
	if(request.getParameter("cityEn1") != null){
		for(int i = 1; i < 10; i++){
			if(request.getParameter("cityEn"+i) != null) {
				dao.savePlan(id, idCheck_set, request.getParameter("cityEn"+i), request.getParameter("cityKr"+i), request.getParameter("sche"+i));
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