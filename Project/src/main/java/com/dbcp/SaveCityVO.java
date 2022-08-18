package com.dbcp;

import java.sql.Timestamp;

public class SaveCityVO {
	private Timestamp regdate; 
	private String save_city_eng; 
	private String save_city_kor;
	
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	public String getSave_city_eng() {
		return save_city_eng;
	}
	public void setSave_city_eng(String save_city_eng) {
		this.save_city_eng = save_city_eng;
	}
	public String getSave_city_kor() {
		return save_city_kor;
	}
	public void setSave_city_kor(String save_city_kor) {
		this.save_city_kor = save_city_kor;
	}
	
}
