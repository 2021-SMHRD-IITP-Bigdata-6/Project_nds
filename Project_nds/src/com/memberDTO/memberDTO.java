package com.memberDTO;

public class memberDTO {

	String email;
	String pw;
	String nickname;
	String sort;
	
	public memberDTO(String email, String pw, String nickname, String sort) {
		this.email = email;
		this.pw = pw;
		this.nickname = nickname;
		this.sort = sort;
	}
	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	
	
}
