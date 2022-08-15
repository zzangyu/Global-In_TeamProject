
infoGo = function(name) {
		const names = name;
    	const url="planCityInfo.jsp?check=y&name="+names; /* name값 넘겨주기 위해 url에 파라미터로 담아서 보냄*/
		var screenW = screen.availWidth;  // 스크린 가로사이즈
 		var screenH = screen.availHeight; // 스크린 세로사이즈
  		var popW = 1200; // 띄울창의 가로사이즈
  		var popH = 600; // 띄울창의 세로사이즈
  		var posL=( screenW-popW ) / 2;   // 띄울창의 가로 포지션 
  		var posT=( screenH-popH ) / 2;   // 띄울창의 세로 포지션 
    	window.open(url,"post",'width='+ popW +',height='+ popH +',top='+ posT +',left='+ posL +"toolbar=no, directories=no, status=yes, scrollbars=yes, menubar=no");
		/*새로 뜨는 창 설정*/ 
    };