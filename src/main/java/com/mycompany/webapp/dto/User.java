package com.mycompany.webapp.dto;

public class User {
	private String uid;
	private String uname;
	private String upassword;
	private String uauthority;
	private int uenable;
	private String[] uhobby;
	private String ujob;
	
	
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpassword() {
		return upassword;
	}
	public void setUpassword(String upassword) {
		this.upassword = upassword;
	}
	public String[] getUhobby() {
		return uhobby;
	}
	public void setUhobby(String[] uhobby) {
		this.uhobby = uhobby;
	}
	public String getUjob() {
		return ujob;
	}
	public void setUjob(String ujob) {
		this.ujob = ujob;
	}
	
	public String getUauthority() {
		return uauthority;
	}
	public void setUauthority(String uauthority) {
		this.uauthority = uauthority;
	}
	public int getUenable() {
		return uenable;
	}
	public void setUenable(int uenable) {
		this.uenable = uenable;
	}
	
}
