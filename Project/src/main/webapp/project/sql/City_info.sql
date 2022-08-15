create table plancityinfo(
	cityinfoname varchar2(30) primary key,
	citynameimg varchar2(20) not null,
	cityinfoS varchar2(100) not null,
	cityinfoL varchar2(1000) not null,
	citypeakseason varchar2(50) not null,
	citytwodays1 varchar2(100) not null,
	citytwodays2 varchar2(100) not null,
	citythreedays1 varchar2(100) not null,
	citythreedays2 varchar2(100) not null,
	citythreedays3 varchar2(100) not null,
	cityroute varchar2(100) not null
);
drop table plancityinfo;
insert into plancityinfo Values('', '', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values(나라이름, [이미지, 값비교], 한줄 설명, 길게 설명, 성수기, 1박1, 1박2, 2박1, 2박2, 2박3 ,추천 루트)
insert into plancityinfo Values('서울 Seoul', 'Seoul', '', '', '', '',, '', '', '' '', '');
insert into plancityinfo Values('부산 Busan', 'Busan', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('울릉도 Ulleung', 'Ulleung', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('제주도 Jeju', 'Jeju', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('인천 Incheon', 'Incheon', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('도쿄 Tokyo', 'Tokyo', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('오사카 Osaka', 'Osaka', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('교토 Kyoto', 'Kyoto', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('후쿠오카 Hukuoka', 'Hukuoka', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('삿포로 Sapporo', 'Sapporo', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('나고야 Nagoya', 'Nagoya', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('상하이 Shanghai', 'Shanghai', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('베이징 Beijing', 'Beijing', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('광저우 Guangzhou', 'Guangzhou', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('칭다오 Qingdao', 'Qingdao', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('하얼빈 Harbin', 'Harbin', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('타이페이 Taipei', 'Taipei', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('타이중 Taichung', 'Taichung', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('타이난 Tainan', 'Tainan', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('가오슝 Kaohsiung', 'Kaohsiung', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('홍콩 HongKong', 'HongKong', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('마카오 Macau', 'Macau', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('하와이 Hawaii', 'Hawaii', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('괌 Guam', 'Guam', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('사이판 Saipan', 'Saipan', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('로스앤젤레스 Losangeles', 'Losangeles', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('뉴욕 Newyork', 'Newyork', '', '', '', '', '', '', '', '', '')
insert into plancityinfo Values('샌프란시스코 Sanfrancisco', 'Sanfrancisco', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('라스베이거스 LasVegas', 'LasVegas', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('시카고 Chicago', 'Chicago', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('시애틀 Seattle', 'Seattle', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('샌디에이고 SanDiego', 'SanDiego', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('나이아가라 폭포 시티 NiagaraFalls', 'NiagaraFalls', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('빅토리아 Victoria', 'Victoria', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('퀘벡 QuebecCity', 'QuebecCity', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('오타와 Ottawa', 'Ottawa', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('벤쿠버 Vancouver', 'Vancouver', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('토론토 Toronto', 'Toronto', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('몬트리올 Montreal', 'Montreal', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('런던 London', 'London', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('파리 Paris', 'Paris', '꾸준히 사랑받는 유럽여행 no.1', '낭만의 대명사, 파리! 무슨 설명이 더 필요하랴! 맛있는 빵집,카페,디저트,미슐랭 5스타 레스토랑 등 세계 최고의 식도락여행 루브르 박물관, 오르세 미술관 등 예술여행 몽셍미셸, 지베르니, 오베르 쉬르 우아즈 등 아름다운 근교 마을까지 당일치기', '4월~5월, 9월~10월', 'D1.에펠탑 주변 시내 → 몽마르트', 'D2.샹젤리제 → 루브르 등 파리 시내', 'D1.샹젤리제 → 루브르 등 파리 시내', 'D2.베르사유 궁전', 'D3.몽생미셸 투어', '파리 → 스위스 | 파리 → 브리쉘 | 파리 → 영국');
insert into plancityinfo Values('니스 Nice', 'Nice', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('바르셀로나 Barcelona', 'Barcelona', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('마드리드 Madrid', 'Madrid', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('로마 Roma', 'Roma', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('나폴리 Napoli', 'Napoli', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('베니스 Venice', 'Venice', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('피렌체 Firenze', 'Firenze', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('밀라노 Milano', 'Milano', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('베를린 Berlin', 'Berlin', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('프랑크푸르트 Frankfurt', 'Frankfurt', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('함부르크 Hamburc', 'Hamburc', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('뮌헨 Munich', 'Munich', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('취리히 Zurich', 'Zurich', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('베른 Bern', 'Bern', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('인터라켄 Interlaken', 'Interlaken', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('제네바 Geneva', 'Geneva', '', '', '', '', '', '', '', '', '');
insert into plancityinfo Values('바젤 Basel', 'Basel', '', '', '', '', '', '', '', '', '');