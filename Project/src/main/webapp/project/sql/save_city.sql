create table saveCity(
save_city_eng varchar2(30) not null,
save_city_kor varchar2(30) not null,
regDate timestamp(6) default sysdate
);

select * from saveCity;