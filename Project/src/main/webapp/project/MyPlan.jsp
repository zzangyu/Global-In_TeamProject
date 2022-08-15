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

<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/MyPlan.css" />
<link href="https://fonts.googleapis.com/css2?family=DynaPuff:wght@700&display=swap" rel="stylesheet"> <!-- 폰트 -->
<script src="https://kit.fontawesome.com/e14a2b80fa.js" crossorigin="anonymous"></script> <!-- 폰트어썸 아이콘 -->
</head>
<body>
<form action="#">
	<div id="mapWrap">
		<div id="hello">Let's &nbsp;make &nbsp;a &nbsp;plan</div>
		<input type="text" name="userSearch" placeholder="도시를 입력해주세요."> <!-- 검색창 -->
		<button type="submit"><i class="fa-solid fa-magnifying-glass"></i></button> <!-- 검색창 버튼 -->
		<div id="plan"> <!-- 일정 div -->
			<div class="plan_cities"></div>
		</div>
		<!-- google map div -->

	</div>
    	<div id="map" onload="initMap()">
    	</div>
</form>
<!-- google map key, 맵 구현 -->
<script type="text/javascript">

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
  	      					place: '<div class="placeinfo"><div class="placeinfo_img"><img src="./img/<%= arry.get(i).getCityname() %>.jpg"></div><div class="placeinfo_info"><div><b><%= arry.get(i).getCityinfo()%></b></div><div onclick="infoGo(<%= arry.get(i).getCityname()%>)">지도 보기</div></div></div>'
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
  
}


</script>
<script type="text/javascript" src="js/MyPlan.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCY1oDgXTf55jiJBGLsiTsCgf9DyrlU66E&callback=initMap&v=weekly" defer></script>
</body>
</html>