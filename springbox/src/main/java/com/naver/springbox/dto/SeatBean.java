package com.naver.springbox.dto;


public class SeatBean {

 private int seat_num;
 private String seat_seat;
 private int concert_num;
 private String seat_date;
 private String seat_time;
  
public int getSeat_num() {
	return seat_num;
}
public void setSeat_num(int seat_num) {
	this.seat_num = seat_num;
}
public String getSeat_seat() {
	return seat_seat;
}
public void setSeat_seat(String seat_seat) {
	this.seat_seat = seat_seat;
}
public int getConcert_num() {
	return concert_num;
}
public void setConcert_num(int concert_num) {
	this.concert_num = concert_num;
	
}
public String getSeat_date() {
	return seat_date;
}
public void setSeat_date(String seat_date) {
	this.seat_date = seat_date;
}
public String getSeat_time() {
	return seat_time;
}
public void setSeat_time(String seat_time) {
	this.seat_time = seat_time;
}

}
