<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*, com.dbcp.*, java.util.*"%>
    <jsp:useBean id="dao" class="com.dbcp.DBCP" />
    <% List<CityVO> arry = dao.getCity(); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script> <!-- 구글맵 스트립트 -->
<script type="text/javascript" src="js/MyPlan.js"></script>
<link rel="stylesheet" type="text/css" href="css/planCityInfo.css" />
<link href="https://fonts.googleapis.com/css2?family=DynaPuff:wght@700&display=swap" rel="stylesheet"> <!-- 폰트 -->
<script src="https://kit.fontawesome.com/e14a2b80fa.js" crossorigin="anonymous"></script> <!-- 폰트어썸 아이콘 -->
</head>
<body>

		<div id="map" onload="initMap()"></div>

<script type="text/javascript">
function initMap() {
	const urlParams = new URL(location.href).searchParams; /* url 읽어오기 */

	const latStr = urlParams.get('lat'); /* url에서 lat 파라미터 값 읽기 */
	const lngStr = urlParams.get('lng'); /* url에서 lon 파라미터 값 읽기 */
	var lats = parseInt(latStr); /* 문자->인트형으로 형변환 */
	var lngs = parseInt(lngStr); /* 문자->인트형으로 형변환 */
	
 	var map = new google.maps.Map(document.getElementById("map"), {
  	 	mapId: "4d7ece8ee77fe4c0",
    	center: { lat: lats, lng: lngs },
    	zoom: 8,
		panControl: false,
  		zoomControl: false,
  		mapTypeControl: false,
 		scaleControl: false,
 		streetViewControl: false,
 		overviewMapControl: false
 	});  
}


</script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCY1oDgXTf55jiJBGLsiTsCgf9DyrlU66E&callback=initMap&v=weekly" defer></script>
</body>
</html>