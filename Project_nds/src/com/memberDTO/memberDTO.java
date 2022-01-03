package com.memberDTO;

public class memberDTO {

	String id;
	String pw;
	String tel;
	String part;
	String sys;
	String ad;
	public memberDTO(String id, String pw, String tel, String part, String sys, String ad,
			String sns_likes) {
		super();
		this.id = id;
		this.pw = pw;
		this.tel = tel;
		this.part = part;
		this.sys = sys;
		this.ad = ad;
		this.sns_likes = sns_likes;
	}

	String sns_likes;
	

	public String getSys() {
		return sys;
	}

	public void setSys(String sys) {
		this.sys = sys;
	}

	public String getAd() {
		return ad;
	}

	public void setAd(String ad) {
		this.ad = ad;
	}

	public memberDTO(String id, String pw, String tel, String part, String sns_likes) {
		super();
		this.id = id;
		this.pw = pw;
		this.tel = tel;
		this.part = part;
		this.sns_likes = sns_likes;
	}

	public String getSns_likes() {
		return sns_likes;
	}

	public void setSns_likes(String sns_likes) {
		this.sns_likes = sns_likes;
	}

	public memberDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	public memberDTO(String id, String tel, String part) {
		this.id = id;
		this.tel = tel;
		this.part = part;
		
	}


	public memberDTO(String id, String pw, String tel, String part) {
		this.id = id;
		this.pw = pw;
		this.tel = tel;
		this.part = part;
	}
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}


	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getPart() {
		return part;
	}

	public void setPart(String part) {
		this.part = part;
	}


	
}
