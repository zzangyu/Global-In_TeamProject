create table saveCity(
save_city_id varchar2(30) not null,
save_city_idCheck varchar2(1000) not null,
save_city_eng varchar2(30),
save_city_kor varchar2(30),
save_schedule varchar2(30),
CONSTRAINT saveCity_pk PRIMARY KEY (save_city_id, save_city_idCheck)
);
insert into saveCity values(1,1,1,1,1);
drop table saveCity;
select * from saveCity;

create table saveCityInfo(
save_city_id varchar2(30),
save_city_idCheck varchar2(1000),
save_city_title varchar2(500),
save_city_time varchar2(500),
save_city_tourRange varchar2(30),
CONSTRAINT saveCityInfo_fk foreign key(save_city_id, save_city_idCheck) references saveCity(save_city_id, save_city_idCheck) ON DELETE CASCADE 
);
drop table saveCityInfo;
select * from saveCityInfo;
