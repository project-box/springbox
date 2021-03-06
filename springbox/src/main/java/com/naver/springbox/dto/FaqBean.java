package com.naver.springbox.dto;

import java.sql.Date;

public class FaqBean {
	private int faq_num;
	private String faq_subject;
	private String faq_content;
	private int faq_readcount;
	private Date faq_date;

	public FaqBean() {
		super();
	}

	public FaqBean(int faq_num, String faq_subject, String faq_content, int faq_readcount, Date faq_date) {
		super();
		this.faq_num = faq_num;
		this.faq_subject = faq_subject;
		this.faq_content = faq_content;
		this.faq_readcount = faq_readcount;
		this.faq_date = faq_date;
	}

	public int getFaq_num() {
		return faq_num;
	}

	public void setFaq_num(int faq_num) {
		this.faq_num = faq_num;
	}

	public String getFaq_subject() {
		return faq_subject;
	}

	public void setFaq_subject(String faq_subject) {
		this.faq_subject = faq_subject;
	}

	public String getFaq_content() {
		return faq_content;
	}

	public void setFaq_content(String faq_content) {
		this.faq_content = faq_content;
	}

	public int getFaq_readcount() {
		return faq_readcount;
	}

	public void setFaq_readcount(int faq_readcount) {
		this.faq_readcount = faq_readcount;
	}
		
	public Date getFaq_date() {
			return faq_date;
    }

	public void setFaq_Date(Date faq_date) {
			this.faq_date = faq_date;
	}

	@Override
	public String toString() {
		return "FaqBean [faq_num=" + faq_num + ", faq_subject=" + faq_subject + ", faq_content=" + faq_content
				+ ",faq_readcount=" + faq_readcount + ",faq_date=" + faq_date + "]";
	}
}
