package com.scit.flee2.vo;

public class Notice {
	private int noticenum;
	private String id;
	private String receiveid;
	private String message;
	private String indate;
	private String confirm;
	private String go;

	public Notice(int noticenum, String id, String receiveid, String message, String indate, String confirm,
			String go) {
		super();
		this.noticenum = noticenum;
		this.id = id;
		this.receiveid = receiveid;
		this.message = message;
		this.indate = indate;
		this.confirm = confirm;
		this.go = go;
	}

	public Notice() {
		super();
	}

	public int getNoticenum() {
		return noticenum;
	}

	public void setNoticenum(int noticenum) {
		this.noticenum = noticenum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReceiveid() {
		return receiveid;
	}

	public void setReceiveid(String receiveid) {
		this.receiveid = receiveid;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	public String getConfirm() {
		return confirm;
	}

	public void setConfirm(String confirm) {
		this.confirm = confirm;
	}

	public String getGo() {
		return go;
	}

	public void setGo(String go) {
		this.go = go;
	}

	@Override
	public String toString() {
		return "Notice [noticenum=" + noticenum + ", id=" + id + ", receiveid=" + receiveid + ", message=" + message
				+ ", indate=" + indate + ", confirm=" + confirm + ", go=" + go + "]";
	}

}
