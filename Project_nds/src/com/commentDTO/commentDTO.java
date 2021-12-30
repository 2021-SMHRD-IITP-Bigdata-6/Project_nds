package com.commentDTO;

public class commentDTO {

	String cm_sns_seq;
	String cm_ct;
	String mb_id;
	String lcm_ct;
	String lmb_id;
	

	public commentDTO(String cm_sns_seq, String cm_ct, String mb_id) {
		this.cm_sns_seq = cm_sns_seq;
		this.cm_ct = cm_ct;
		this.mb_id = mb_id;
	}
	

	public commentDTO(String lcm_ct, String lmb_id) {
		this.lcm_ct = lcm_ct;
		this.lmb_id = lmb_id;
	}

	public String getCm_sns_seq() {
		return cm_sns_seq;
	}

	public void setCm_sns_seq(String cm_sns_seq) {
		this.cm_sns_seq = cm_sns_seq;
	}

	public String getCm_ct() {
		return cm_ct;
	}

	public void setCm_ct(String cm_ct) {
		this.cm_ct = cm_ct;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}
	
	public String getLcm_ct() {
		return lcm_ct;
	}
	public void setLcm_ct(String lcm_ct) {
		this.lcm_ct = lcm_ct;
	}
	public String getLmb_id() {
		return lmb_id;
	}

	public void setLmb_id(String lmb_id) {
		this.lmb_id = lmb_id;
	}
	
}
