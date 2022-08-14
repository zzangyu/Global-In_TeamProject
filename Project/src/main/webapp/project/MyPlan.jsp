<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, com.dbcp.*, java.util.*"%>
    <jsp:useBean id="dao" class="com.dbcp.DBCP" />
    <% List<CityVO> arry = dao.getCity(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script> <!-- 구글맵 스트립트 -->
<script type="text/javascript" src="js/MyPlan.js"></script>
<link rel="stylesheet" type="text/css" href="css/MyPlan.css" />
<link href="https://fonts.googleapis.com/css2?family=DynaPuff:wght@700&display=swap" rel="stylesheet"> <!-- 폰트 -->
<script src="https://kit.fontawesome.com/e14a2b80fa.js" crossorigin="anonymous"></script> <!-- 폰트어썸 아이콘 -->
</head>
<body>
	<div id="mapWrap">
		<div id="hello">Let's &nbsp;make &nbsp;a &nbsp;plan</div>
		<input type="text" name="userSearch" placeholder="도시를 입력해주세요.">
		<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button>
		<div id="plan"> <!-- 일정 div -->
			<div class="plan_cities"></div>
		</div>
		<!-- google map div -->

	</div>
    	<div id="map" onload="initMap()">
    	</div>
<!-- google map key, 맵 구현 -->
<script type="text/javascript">
function initMap() {
 	var map = new google.maps.Map(document.getElementById("map"), {
  	 	mapId: "4d7ece8ee77fe4c0",
    	center: { lat: 37.3357, lng: 126.5842 },
    	zoom: 6,
		panControl: false,
  		zoomControl: false,
  		mapTypeControl: false,
 		scaleControl: false,
 		streetViewControl: false,
 		overviewMapControl: false
 	});

  	const icons = {
   		info: {
      		icon: "img/dot.png",
    	},
    };
  		
  	var features = [
		<%
  		for(int i = 0; i < arry.size(); i++) {
  		%>
  						{
  	      					position: new google.maps.LatLng(<%= arry.get(i).getLatitude()%>, <%= arry.get(i).getLongitude()%>),
  	      					type: "info",
  	      					place: '<div class="placeinfo"><h2><%= arry.get(i).getCityinfo()%></h2></div>'
  	    				},
 		<%
  		}
		%>

    ];
  	var infowindow = new google.maps.InfoWindow();
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
                infowindow.open(map, marker);
            }
            features[i].place.classList.add('placeinfo');
        })(marker, i));
  	}
  
}


</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCY1oDgXTf55jiJBGLsiTsCgf9DyrlU66E&callback=initMap&v=weekly" defer></script>
</body>
</html>