create table saveCity(
save_city_id varchar2(30) not null,
save_city_idCheck varchar2(1000) not null,
save_city_eng varchar2(30),
save_city_kor varchar2(30),
save_schedule varchar2(30)
);
drop table saveCity;
select * from saveCity;

create table imsimember ( 
id varchar2 (35) not null,
pass varchar2 (50) not null,
nick varchar2 (35) not null,
email varchar2 (50)not null,
constraint imsi_pk primary key(id)
);

create table wishlist (
id varchar2 (50) not null,
wish varchar2 (60) not null
);

