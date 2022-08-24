<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.dbcp.*, java.util.*"%>
    <jsp:useBean id="dao" class="com.dbcp.DBCPPlanCityInfo" scope="page" />
    <jsp:useBean id="dao2" class="com.dbcp.DBCP" scope="page" />
    <% 
    	String id = "han"; // 임의로 지정 => session으로 받을 예정
    	String idCheck = "2han8"; // 임의로 지정 => 마이페이지 완성되면 변경
    	List<SaveCityVO> arry = dao.getCity(idCheck, id); // 저장되어 있던 나라들 호출
    %>
    <% List<CityVO> arry2 = dao2.getCity(); // 도시 전체 호출 %> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>My Plan</title>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script> <!-- 구글맵 스트립트 -->
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script> <!-- JQuery -->
<link rel="stylesheet" type="text/css" href="css/MyPlan.css" />
<link href="https://fonts.googleapis.com/css2?family=DynaPuff:wght@700&display=swap" rel="stylesheet"> <!-- 폰트 -->
<script src="https://kit.fontawesome.com/e14a2b80fa.js" crossorigin="anonymous"></script> <!-- 폰트어썸 아이콘 -->
<!-- daterangepicker -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
</head>
<body>
<form action="updateProc.jsp" method="post" name="updateForm"> <!-- 정보를 보내기 위해 form 생성 -->
	<div id="mapWrap">
		<div id="hello">Let's &nbsp;make &nbsp;a &nbsp;plan</div>
		<input id="input" type="text" name="userSearch" placeholder="도시를 입력해주세요. 엔터x"> <!-- 검색창 -->
		<button id="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button> <!-- 검색창 버튼 -->
		<div id="plan"> <!-- 일정 div -->
			<div id="plan_cities">
				<div id="labelBox">
					<div><label>날짜를 선택해주세요.</label></div>
					<input type="text" id="dateRange" name="dateRange" onclick="check()"/> <!-- daterangepicker 불러오기 위한 input -->
				</div>
				<script type="text/javascript" src="js/date.js"></script>
				<% for(int i = 0; i< arry.size(); i++) {%> <!-- 저장됐던 나라들을 미리 화면에 보여주기 위한 for문 -->
				<div class="planInsert_size">
					<input type="hidden" name="idCheck" value="<%= idCheck%>"> 
					<input type="hidden" name="bfcityEn<%= i+1%>" value="<%= arry.get(i).getSave_city_eng()%>">
					<input type="hidden" name="bfcityKr<%= i+1%>" value="<%= arry.get(i).getSave_city_kor()%>">
					<!-- 이전에 저장되었던 정보들을 updateProc.jsp에 보내기위해 hidden을 사용함 -->
					<div id="borderWrap">
						<div class="border1"></div> <!-- 추가된 공간에 border를 이용해서 꾸미기 위해 만든 div -->
						<div id="border2"></div>
						<div class="border1"></div>
					</div>
					<div id="planInsert"> <!-- 이 나라들이 부분에 추가됨 -->
						<div><%= arry.get(i).getSave_city_eng()%></div>
						<div class="insertPlanInfo"><%= arry.get(i).getSave_city_kor()%></div>
						<select name="bfsche<%= i+1%>">
							<option>당일치기</option>
							<option>1박2일</option>
							<option>2박3일</option>
							<option>3박4일</option>
							<option>4박5일</option>
							<option>5박6일</option>
							<option>6박7일</option>
							<option>7박8일</option>
							<option>8박9일</option>
							<option>9박10일</option>
							<option>10박11일</option>
							<option>11박12일</option>
							<option>12박13일</option>
							<option>13박14일</option>
						</select>
						<div class="listClose" onclick="deleteList(this)">삭제</div>
					</div>
				</div>
					<%} %>
			</div>
		</div>
		<!-- google map div -->
		<input id="savePlan" type="submit" value="저장하기">
	</div>
</form>
    	<div id="map" onload="initMap()"></div>
<script type="text/javascript" src="js/MyPlan.js"></script>
<!-- google map key, 맵 구현 -->
<script type="text/javascript">
	<% /* 왜인지 모르겠는데 name만 전역변수로 선언 해줘야됨.. */
	for(int i = 0; i < arry2.size(); i++) {
	%>
		var <%= arry2.get(i).getCityname()%> = "<%= arry2.get(i).getCityname()%>";
	<%
		}
	%>
	
function initMap() {
	
 	var map = new google.maps.Map(document.getElementById("map"), { /* 맵 열기 */
  	 	mapId: "4d7ece8ee77fe4c0", /* 커스텀 맵 id (내가 지정한대로) */
    	center: { lat: 37.4, lng: 126.9 },
    	zoom: 6, /* 실행되었을때 확대 정도 */
		panControl: false, /* 기본 설정들 off */
  		zoomControl: false,
  		mapTypeControl: false,
 		scaleControl: false,
 		streetViewControl: false,
 		overviewMapControl: false
 	});
	
  	const icons = { /* 커스텀 아이콘 설정 */
   		info: {
      		icon: "img/dot.png",
    	},
    };
	
  	var features = [ /* marker에 대한 정보들 설정 */
		<%
  		for(int i = 0; i < arry2.size(); i++) { /* 마커 전체에 넣어야돼서 for문 이용 */
		%>
  	
  						{
  	      					position: new google.maps.LatLng(<%= arry2.get(i).getLatitude()%>, <%= arry2.get(i).getLongitude()%>), /* 마커 위치 */
  	      					type: "info", /* 마커 아이콘 */
   	      					place: '<div class="placeInfo"><div class="insertPlan" onclick="sendValue(<%= arry2.get(i).getCityname() %>)" class="<%= arry2.get(i).getCityname() %>">+</div><div class="placeInfo_img"><img src="./img/<%= arry2.get(i).getCityname() %>.jpg"></div><div class="placeInfo_info"><b><%= arry2.get(i).getCityinfo()%></b></div><div class="guideBook" onclick="infoGo(<%= arry2.get(i).getCityname()%>)"><b>가이드북 📘</b></div></div>'
  	    				},  /* 마커를 눌렀을 때 나오는 창 -> html 태그 이용해서 틀 만들기 */
 		<%
  		}
		%>
    ];
  	
  	var infowindow = new google.maps.InfoWindow(); /* 마커 눌렀을 때 나오는 창 */
  	var infoclose = true; /* 마커 눌렀을 때 나오는 창 닫기 위해 만든 boolean*/
	// Create markers.
    for (let i = 0; i < features.length; i++) {
    	const marker = new google.maps.Marker({
     		position: features[i].position,
      		icon: icons[features[i].type].icon,
     		map: map,
    	});
    	
    	google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                //html로 표시될 인포 윈도우의 내용
                infowindow.setContent(features[i].place);
                //인포윈도우가 표시될 위치
                if(infoclose) {
                	infowindow.open(map, marker);
                	infoclose = false; /* 열렸으면 다음번에 닫기 위해 false로 바꿈 */
                } else {
                	infowindow.close();
                	infoclose = true;
                }
                
            }
            features[i].place.classList.add('placeinfo'); /* css 적용시키기 위해 class 추가 */
            
        })(marker, i)); /* 얜 모름; */
        
  	}
  	/* ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ 검색기능 코드 ㅡㅡㅡㅡㅡㅡㅡㅡ*/
  	autocomplete = new google.maps.places.Autocomplete(document.getElementById("input"),{
 
  		fields: ['geometry','name'],
  		type: ['establishment']
  	});
  	autocomplete.addListener("place_changed", () => {
  		const place = autocomplete.getPlace();
  		var map = new google.maps.Map(document.getElementById("map"), { /* 맵 열기 */
  	  	 	mapId: "4d7ece8ee77fe4c0", /* 커스텀 맵 id (내가 지정한대로) */
  	    	center: place.geometry.location,
  	    	zoom: 6, /* 실행되었을때 확대 정도 */
  			panControl: false, /* 기본 설정들 off */
  	  		zoomControl: false,
  	  		mapTypeControl: false,
  	 		scaleControl: false,
  	 		streetViewControl: false,
  	 		overviewMapControl: false
  	 	});
  		const icons = { /* 커스텀 아이콘 설정 */
  		   		info: {
  		      		icon: "img/dot.png",
  		    	},
  		    };
  			
  		  	var features = [ /* marker에 대한 정보들 설정 */
  				<%
  		  		for(int i = 0; i < arry.size(); i++) { /* 마커 전체에 넣어야돼서 for문 이용 */
  				%>
  		  	
  		  						{
  		  	      					position: new google.maps.LatLng(<%= arry2.get(i).getLatitude()%>, <%= arry2.get(i).getLongitude()%>), /* 마커 위치 */
  		  	      					type: "info", /* 마커 아이콘 */
  		   	      					place: '<div class="placeInfo"><div class="insertPlan" onclick="sendValue(<%= arry2.get(i).getCityname() %>)" class="<%= arry2.get(i).getCityname() %>">+</div><div class="placeInfo_img"><img src="./img/<%= arry2.get(i).getCityname() %>.jpg"></div><div class="placeInfo_info"><b><%= arry2.get(i).getCityinfo()%></b></div><div class="guideBook" onclick="infoGo(<%= arry2.get(i).getCityname()%>)"><b>가이드북 📘</b></div></div>'
  		  	    				},  /* 마커를 눌렀을 때 나오는 창 -> html 태그 이용해서 틀 만들기 */
  		 		<%
  		  		}
  				%>
  		    ];
  		  	
  		  	var infowindow = new google.maps.InfoWindow(); /* 마커 눌렀을 때 나오는 창 */
  		  	var infoclose = true; /* 마커 눌렀을 때 나오는 창 닫기 위해 만든 boolean*/
  			// Create markers.
  		    for (let i = 0; i < features.length; i++) {
  		    	const marker = new google.maps.Marker({
  		     		position: features[i].position,
  		      		icon: icons[features[i].type].icon,
  		     		map: map,
  		    	});
  		    	
  		    	google.maps.event.addListener(marker, 'click', (function(marker, i) {
  		            return function() {
  		                //html로 표시될 인포 윈도우의 내용
  		                infowindow.setContent(features[i].place);
  		                //인포윈도우가 표시될 위치
  		                if(infoclose) {
  		                	infowindow.open(map, marker);
  		                	infoclose = false; /* 열렸으면 다음번에 닫기 위해 false로 바꿈 */
  		                } else {
  		                	infowindow.close();
  		                	infoclose = true;
  		                }
  		                
  		            }
  		            features[i].place.classList.add('placeinfo'); /* css 적용시키기 위해 class 추가 */
  		            
  		        })(marker, i)); /* 얜 모름; */
  		        
  		  	}
  	});
}
</script>
<script type="text/javascript">
	var count = 1;	/* 정보를 보낼때 name을 구분해주기 위해 count라는 변수 선언 */
	var sendValue = function(name) {
	<%
		for(int i = 0; i < arry2.size(); i++){
	%>	
		if(name === '<%= arry2.get(i).getCityname() %>'){
			document.getElementById("plan_cities").innerHTML += "<div class='planInsert_size'><input type='hidden' name='count' value='"+count+"'><input type='hidden' name='idCheck' value='<%= idCheck%>'><input type='hidden' name='cityEn"+count+"' value='<%= arry2.get(i).getCityname()%>'><input type='hidden' name='cityKr"+count+"' value='<%= arry2.get(i).getCityinfo()%>'><div id='borderWrap'><div class='border1'></div><div id='border2'></div><div class='border1'></div></div><div id='planInsert'><div><%= arry2.get(i).getCityname()%></div><div class='insertPlanInfo'><%= arry2.get(i).getCityinfo()%></div>"
																+"<div style='display:inline-block;'><select name='sche"+count+"'><option>당일치기</option><option>1박2일</option><option>2박3일</option><option>3박4일</option><option>4박5일</option><option>5박6일</option><option>6박7일</option><option>7박8일</option><option>8박9일</option><option>9박10일</option><option>10박11일</option><option>11박12일</option><option>12박13일</option><option>13박14일</option></select></div>"
																+"<div class='listClose' onclick='deleteList(this)'>삭제</div></div></div>";			
			count++; /* plan_cities에 추가 했으면 count 증가 */
		}
<%
	}
%>
	}
	
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCY1oDgXTf55jiJBGLsiTsCgf9DyrlU66E&libraries=places&callback=initMap&v=weekly" defer></script>
</body>
</html>