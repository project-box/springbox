package com.naver.springbox.dto;

import java.util.Date;

public class PaymentBean {
	private int payment_num;
	private int concert_num;
	private String user_id;
	private String payment_check;
	private int payment_amount;
	private Date payment_registerdate;	
	private String payment_seat;
	private String payment_date;
	private String payment_time;
	private String payment_price;
	private String payment_address;		
	private String payment_title;
	private String cancel;
	private String payment_poster;
	
	
	public int getPayment_num() {
		return payment_num;
	}
	public void setPayment_num(int payment_num) {
		this.payment_num = payment_num;
	}
	public int getConcert_num() {
		return concert_num;
	}
	public void setConcert_num(int concert_num) {
		this.concert_num = concert_num;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPayment_check() {
		return payment_check;
	}
	public void setPayment_check(String payment_check) {
		this.payment_check = payment_check;
	}
	public int getPayment_amount() {
		return payment_amount;
	}
	public void setPayment_amount(int payment_amount) {
		this.payment_amount = payment_amount;
	}
	public Date getPayment_registerdate() {
		return payment_registerdate;
	}
	public void setPayment_registerdate(Date payment_registerdate) {
		this.payment_registerdate = payment_registerdate;
	}
	public String getPayment_seat() {
		return payment_seat;
	}
	public void setPayment_seat(String payment_seat) {
		this.payment_seat = payment_seat;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_time() {
		return payment_time;
	}
	public void setPayment_time(String payment_time) {
		this.payment_time = payment_time;
	}
	public String getPayment_price() {
		return payment_price;
	}
	public void setPayment_price(String payment_price) {
		this.payment_price = payment_price;
	}
	public String getPayment_address() {
		return payment_address;
	}
	public void setPayment_address(String payment_address) {
		this.payment_address = payment_address;
	}	
	public String getPayment_title() {
		return payment_title;
	}
	public void setPayment_title(String payment_title) {
		this.payment_title = payment_title;
	}
	public String getCancel() {
		return cancel;
	}
	public void setCancel(String cancel) {
		this.cancel = cancel;
	}
	public String getPayment_poster() {
		return payment_poster;
	}
	public void setPayment_poster(String payment_poster) {
		this.payment_poster = payment_poster;
	}
	
	

	
	
	
}
