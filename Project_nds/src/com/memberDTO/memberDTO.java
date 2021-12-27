package com.memberDTO;

public class memberDTO {

	String id;
	String pw;
	String nickname;
	String tel;
	String part;
	

	public memberDTO(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	public memberDTO(String id, String nickname, String tel, String part) {
		this.id = id;
		this.nickname = nickname;
		this.tel = tel;
		this.part = part;
		
	}


	public memberDTO(String id, String pw, String nickname, String tel, String part) {
		this.id = id;
		this.pw = pw;
		this.nickname = nickname;
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

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
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
