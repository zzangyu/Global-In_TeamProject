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
	Random rand = new Random(); /* idCheck를 랜덤으로 추가해주기 위해 객체 생성 */
	String id = "han";
	String idCheck_set = "";
	List<String> arry = dao.idCheck(id); /* ex) id가 han인 유저가 저장한 plan들을 모두 불러옴 */
	if(arry.size() == 0){ /* plan이 없으면 (처음 저장하는거면) */
		idCheck_set = rand.nextInt(10)+id+rand.nextInt(10); /* 아이디 양옆에 랜덤으로 숫자부여 ex) 9han8 */
	} else { /* plan이 있으면 그 idCheck의 숫자 옆에 추가 지정 */
		idCheck_set = rand.nextInt(10)+arry.get(arry.size()-1)+rand.nextInt(10) ; /* 기존 idCheck 양옆에 랜덤으로 숫자부여 ex) 9han8 => 89han82 */
	}
	if(request.getParameter("cityEn1") != null){ /* 들어온 값이 있을 때 ==> 맨 첫번째 값을 cityEn1로 지정해놨기 때문에 없으면 아무 값도 안온것 */
		int count = request.getParameterValues("count").length;
			for(int i = 1; i < count; i++){
			if(request.getParameter("cityEn"+i) != null) { /* 1,2,3,4,5 이렇게 저장하다가 3이나 4를 삭제 시켰을 때 값이 제대로 들어오게 하기 위함 (cityEn3의 값이 없으면 저장하지 않음)*/
				dao.savePlan(id, idCheck_set, request.getParameter("cityEn"+i), request.getParameter("cityKr"+i), request.getParameter("sche"+i));
			}
		}
	} else { /* 값이 없으면 도시 추가 요청 */
%>
	<script type="text/javascript">
		alert("<도시를 추가해주세요.>");
		history.go(-1);
	</script>
<%
	} 
%>
<!-- 위에 안걸리고 저장 되었으면 저장완료 선언 후 페이지 이동 -->
<meta http-equiv="Refresh" content="0; url=CityInfoView.jsp">
<script type="text/javascript">
	alert("<저장 완료>");
</script>
