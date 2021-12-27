package com.snsDTO;

public class snsDTO {
	String sns_seq;
	String sns_content;
	String sns_date;
	int sns_likes;
	String mb_id;
	String hash_tag;
	public snsDTO(String sns_seq, String sns_content, int sns_likes, String mb_id, String hash_tag) {
		super();
		this.sns_seq = sns_seq;
		this.sns_content = sns_content;
		this.sns_likes = sns_likes;
		this.mb_id = mb_id;
		this.hash_tag = hash_tag;
	}

	public String getSns_seq() {
		return sns_seq;
	}
	public void setSns_seq(String sns_seq) {
		this.sns_seq = sns_seq;
	}
	public String getSns_content() {
		return sns_content;
	}
	public void setSns_content(String sns_content) {
		this.sns_content = sns_content;
	}
	public int getSns_likes() {
		return sns_likes;
	}
	public void setSns_likes(int sns_likes) {
		this.sns_likes = sns_likes;
	}
	public String getMb_id() {
		return mb_id;
	}
	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	public String getHash_tag() {
		return hash_tag;
	}
	public void setHash_tag(String hash_tag) {
		this.hash_tag = hash_tag;
	}

}
