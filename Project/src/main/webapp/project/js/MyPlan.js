infoGo = function(lat, lng) {
    	url="planCityInfo.jsp?check=y&lat="+lat+"&lng="+lng; /*lat, lng값 넘겨주기 위해 url에 파라미터로 담아서 보냄*/
    	window.open(url,"post","toolbar=no, width=1500, height=800, directories=no, status=yes, scrollbars=yes, menubar=no");
		/*새로 뜨는 창 설정*/ 
    };