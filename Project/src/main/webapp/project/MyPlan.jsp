<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.dbcp.*, java.util.*"%>
    <jsp:useBean id="dao" class="com.dbcp.DBCP" scope="page" />
    <% List<CityVO> arry = dao.getCity(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메롱</title>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script> <!-- 구글맵 스트립트 -->

<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/MyPlan.css" />
<link href="https://fonts.googleapis.com/css2?family=DynaPuff:wght@700&display=swap" rel="stylesheet"> <!-- 폰트 -->
<script src="https://kit.fontawesome.com/e14a2b80fa.js" crossorigin="anonymous"></script> <!-- 폰트어썸 아이콘 -->
<!-- js -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

</head>
<body>
<form action="saveProc.jsp" method="post" name="saveForm">
	<div id="mapWrap">
		<div id="hello">Let's &nbsp;make &nbsp;a &nbsp;plan</div>
		<input id="input" type="text" name="userSearch" placeholder="도시를 입력해주세요. 엔터x"> <!-- 검색창 -->
		<button id="searchBtn"><i class="fa-solid fa-magnifying-glass"></i></button> <!-- 검색창 버튼 -->
		<div id="plan"> <!-- 일정 div -->
			<div id="plan_cities"></div>
		</div>
		<!-- google map div -->
		<input id="savePlan" type="submit" value="저장하기">
	</div>
    	<div id="map" onload="initMap()"></div>
<script type="text/javascript" src="js/MyPlan.js"></script>
<!-- google map key, 맵 구현 -->
<script type="text/javascript">
	<% /* 왜인지 모르겠는데 name만 전역변수로 선언 해줘야됨.. */
	for(int i = 0; i < arry.size(); i++) {
	%>
		var <%= arry.get(i).getCityname()%> = "<%= arry.get(i).getCityname()%>";
	<%
		}
	%>
	
function initMap() {
    const urlParams = new URL(location.href).searchParams; /* url 읽어오기 */
	const latStr = urlParams.get('lat'); /* url에서 lat 파라미터 값 읽기 */
	const lngStr = urlParams.get('lng'); /* url에서 lon 파라미터 값 읽기 */
	var lats = parseInt(latStr); /* 문자->인트형으로 형변환 */
	var lngs = parseInt(lngStr); /* 문자->인트형으로 형변환 */
	
 	var map = new google.maps.Map(document.getElementById("map"), { /* 맵 열기 */
  	 	mapId: "4d7ece8ee77fe4c0", /* 커스텀 맵 id (내가 지정한대로) */
    	center: { lat: lats, lng: lngs },
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
  	      					position: new google.maps.LatLng(<%= arry.get(i).getLatitude()%>, <%= arry.get(i).getLongitude()%>), /* 마커 위치 */
  	      					type: "info", /* 마커 아이콘 */
   	      					place: '<div class="placeInfo"><div class="insertPlan" onclick="sendValue(<%= arry.get(i).getCityname() %>)" class="<%= arry.get(i).getCityname() %>">+</div><div class="placeInfo_img"><img src="./img/<%= arry.get(i).getCityname() %>.jpg"></div><div class="placeInfo_info"><b><%= arry.get(i).getCityinfo()%></b></div><div class="guideBook" onclick="infoGo(<%= arry.get(i).getCityname()%>)"><b>가이드북 📘</b></div></div>'
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
  		  	      					position: new google.maps.LatLng(<%= arry.get(i).getLatitude()%>, <%= arry.get(i).getLongitude()%>), /* 마커 위치 */
  		  	      					type: "info", /* 마커 아이콘 */
  		   	      					place: '<div class="placeInfo"><div class="insertPlan" onclick="sendValue(<%= arry.get(i).getCityname() %>)" class="<%= arry.get(i).getCityname() %>">+</div><div class="placeInfo_img"><img src="./img/<%= arry.get(i).getCityname() %>.jpg"></div><div class="placeInfo_info"><b><%= arry.get(i).getCityinfo()%></b></div><div class="guideBook" onclick="infoGo(<%= arry.get(i).getCityname()%>)"><b>가이드북 📘</b></div></div>'
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
	var count = 1;	
	var sendValue = function(name) {
	<%
		for(int i = 0; i < arry.size(); i++){
	%>	
		if(name === '<%= arry.get(i).getCityname() %>'){
			document.getElementById("plan_cities").innerHTML += "<div class='planInsert_size'><input type='hidden' name='count' value='"+count+"'><input type='hidden' name='cityEn"+count+"' value='<%= arry.get(i).getCityname()%>'><input type='hidden' name='cityKr"+count+"' value='<%= arry.get(i).getCityinfo()%>'><div id='borderWrap'><div class='border1'></div><div id='border2'></div><div class='border1'></div></div><div id='planInsert'><input type='text' class='demo' name='sche"+count+"'/><div><%= arry.get(i).getCityname()%></div><div class='insertPlanInfo'><%= arry.get(i).getCityinfo()%></div><div class='listClose' onclick='deleteList(this)'>삭제</div></div></div>";			
			count++;
		}
	<%
		}
	%>
		$(function check() {
	    	$(".demo").daterangepicker({
	     	   "locale": {
	    	        "format": "YYYY-MM-DD",
	    	        "separator": " ~ ",
	    	        "applyLabel": "확인",
	    	        "cancelLabel": "취소",
	    	        "fromLabel": "From",
	    	        "toLabel": "To",
	     	       	"customRangeLabel": "Custom",
	    	        "weekLabel": "W",
	         	    "daysOfWeek": ["일", "월", "화", "수", "목", "금", "토"],
	    	        "monthNames": ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
	            	"firstDay": 1
	        	},
	        	"drops": "right"
	    	}, function (start, end, label) {
	        	console.log('New date range selected: ' + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD') + ' (predefined range: ' + label + ')');
	    	});
		});
	}
</script>
</form>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCY1oDgXTf55jiJBGLsiTsCgf9DyrlU66E&libraries=places&callback=initMap&v=weekly" defer></script>
</body>
</html>