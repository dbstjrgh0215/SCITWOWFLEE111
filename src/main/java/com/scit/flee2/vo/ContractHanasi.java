package com.scit.flee2.vo;

public class ContractHanasi {
	private int hanasinum;
	private int contractnum;
	private String sendId;
	private String receiveId;
	private String sendNickname;
	private String receiveNickname;
	private String message;
	private String indate;

	public ContractHanasi(int hanasinum, int contractnum, String sendId, String receiveId, String sendNickname,
			String receiveNickname, String message, String indate) {
		super();
		this.hanasinum = hanasinum;
		this.contractnum = contractnum;
		this.sendId = sendId;
		this.receiveId = receiveId;
		this.sendNickname = sendNickname;
		this.receiveNickname = receiveNickname;
		this.message = message;
		this.indate = indate;
	}

	public ContractHanasi() {
		super();
	}

	public int getHanasinum() {
		return hanasinum;
	}

	public void setHanasinum(int hanasinum) {
		this.hanasinum = hanasinum;
	}

	public int getContractnum() {
		return contractnum;
	}

	public void setContractnum(int contractnum) {
		this.contractnum = contractnum;
	}

	public String getSendId() {
		return sendId;
	}

	public void setSendId(String sendId) {
		this.sendId = sendId;
	}

	public String getReceiveId() {
		return receiveId;
	}

	public void setReceiveId(String receiveId) {
		this.receiveId = receiveId;
	}

	public String getSendNickname() {
		return sendNickname;
	}

	public void setSendNickname(String sendNickname) {
		this.sendNickname = sendNickname;
	}

	public String getReceiveNickname() {
		return receiveNickname;
	}

	public void setReceiveNickname(String receiveNickname) {
		this.receiveNickname = receiveNickname;
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

	@Override
	public String toString() {
		return "ContractHanasi [hanasinum=" + hanasinum + ", contractnum=" + contractnum + ", sendId=" + sendId
				+ ", receiveId=" + receiveId + ", sendNickname=" + sendNickname + ", receiveNickname=" + receiveNickname
				+ ", message=" + message + ", indate=" + indate + "]";
	}

}
