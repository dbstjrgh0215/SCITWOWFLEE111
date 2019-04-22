package com.scit.flee2.vo;

public class Request {
	private int requestnum;
	private String id;
	private String nickname;
	private int boardnum;
	private int proposalnum;
	private String contractperiod;
	private String approval;
	private String requestdate;
	private String approvaldate;

	public Request(int requestnum, String id, String nickname, int boardnum, int proposalnum, String contractperiod,
			String approval, String requestdate, String approvaldate) {
		super();
		this.requestnum = requestnum;
		this.id = id;
		this.nickname = nickname;
		this.boardnum = boardnum;
		this.proposalnum = proposalnum;
		this.contractperiod = contractperiod;
		this.approval = approval;
		this.requestdate = requestdate;
		this.approvaldate = approvaldate;
	}

	public Request() {
		super();
	}

	public int getRequestnum() {
		return requestnum;
	}

	public void setRequestnum(int requestnum) {
		this.requestnum = requestnum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public int getProposalnum() {
		return proposalnum;
	}

	public void setProposalnum(int proposalnum) {
		this.proposalnum = proposalnum;
	}

	public String getContractperiod() {
		return contractperiod;
	}

	public void setContractperiod(String contractperiod) {
		this.contractperiod = contractperiod;
	}

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	public String getRequestdate() {
		return requestdate;
	}

	public void setRequestdate(String requestdate) {
		this.requestdate = requestdate;
	}

	public String getApprovaldate() {
		return approvaldate;
	}

	public void setApprovaldate(String approvaldate) {
		this.approvaldate = approvaldate;
	}

	@Override
	public String toString() {
		return "Request [requestnum=" + requestnum + ", id=" + id + ", nickname=" + nickname + ", boardnum=" + boardnum
				+ ", proposalnum=" + proposalnum + ", contractperiod=" + contractperiod + ", approval=" + approval
				+ ", requestdate=" + requestdate + ", approvaldate=" + approvaldate + "]";
	}

}
