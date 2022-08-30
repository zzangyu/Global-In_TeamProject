<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/home.css">
<link rel ="shortcut icon" href="#">
<link href="https://fonts.googleapis.com/css2?family=DynaPuff:wght@700&family=Gowun+Dodum&display=swap" rel="stylesheet">
<script type="text/javascript" src="js/jquery-1.11.0.min.js"></script> <!--jquery사용 -->
<script type="text/javascript" src="js/CityInfo.js"></script>
<title>Insert title here</title>
</head>
<body>
<div class="container" >
    <div class="header">
   	<script>
    	const header = document.querySelectorAll('.header');
    	function scrollFunc() {
        	if(pageYOffset >= 90) {
            	header[0].classList.add('on');
        	}else {
            	header[0].classList.remove('on');
        	}
    	}
    	window.addEventListener('scroll',scrollFunc);
    </script>
        <div class="logo">
        	<h1><a href="#">LOGO</a></h1>
        </div>
        <div class="menu_wrap">
            <ul class="dep1">
                <li>
                    <span>아시아</span>
                    <ul class="dep2">
                        <li><a href="">한국</a></li>
                        <li><a href="">일본</a></li>
                        <li><a href="">중국</a></li>
                        <li><a href="">대만</a></li>
                        <li><a href="">홍콩&마카오</a></li>
                        <li><a href="">&nbsp;</a></li>
                    </ul>
                </li>
                <li>
                    <span>아메리카</span>
                    <ul class="dep2">
                        <li><a href="">미국(동)</a></li>
                        <li><a href="">미국(서)</a></li>
                        <li><a href="">캐나다</a></li>
                        <li><a href="">하와이</a></li>
                        <li><a href="">괌</a></li>
                        <li><a href="">&nbsp;</a></li>
                    </ul>
                </li>
                <li>
                    <span>유럽</span>
                    <ul class="dep2">
                        <li><a href="">영국</a></li>
                        <li><a href="">프랑스</a></li>
                        <li><a href="">독일</a></li>
                        <li><a href="">이탈리아</a></li>
                        <li><a href="">스페인</a></li>
                        <li><a href="">스위스</a></li>
                    </ul>
                </li>
                <li>
                    <span>게시판</span>
                    <ul class="dep2">
                        <li><a href="">공지사항</a></li>
                        <li><a href="">자유게시판</a></li>
                        <li><a href="">동행게시판</a></li>
                        <li><a href="">루트소개</a></li>
                        <li><a href="">루트질문</a></li>
                        <li><a href="">나눔게시판</a></li>
                    </ul>
                </li>
                <li>
                    <span>내일정</span>
                    <ul class="dep2">
                    	<li><a href="">일정만들기</a></li>
                    	<li><a href="">준비물챙기기</a></li>
                    	<li><a href="">&nbsp;</a></li>
                    	<li><a href="">&nbsp;</a></li>
                    	<li><a href="">&nbsp;</a></li>
                    	<li><a href="">&nbsp;</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <div class="nav">
                <a href="#"><img src="images/free-icon-join-7988870.png" width="50px" height="50px"></a>
        </div>
    </div>
       
    <div class="mediafilm">
        <video src="images/cityVideo.mp4" width="100%" height="500px" autoplay loop></video>
    </div>
        
    <div class="button_container">
        <button class="startBtn" onclick="fnMove()"><span>시작하기!</span></button>
    </div>
	
</div>
</body>
</html>