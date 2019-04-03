package com.scit.flee2.vo;

public class Qna {
	private int qnanum;
	private int boardnum;
	private String comments;
	private String reply;
	private String indate;
	private String replydate;

	public Qna(int qnanum, int boardnum, String comments, String reply, String indate, String replydate) {
		super();
		this.qnanum = qnanum;
		this.boardnum = boardnum;
		this.comments = comments;
		this.reply = reply;
		this.indate = indate;
		this.replydate = replydate;
	}

	public Qna() {
		super();
	}

	public int getQnanum() {
		return qnanum;
	}

	public void setQnanum(int qnanum) {
		this.qnanum = qnanum;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}

	public String getIndate() {
		return indate;
	}

	public void setIndate(String indate) {
		this.indate = indate;
	}

	public String getReplydate() {
		return replydate;
	}

	public void setReplydate(String replydate) {
		this.replydate = replydate;
	}

	@Override
	public String toString() {
		return "Qna [qnanum=" + qnanum + ", boardnum=" + boardnum + ", comments=" + comments + ", reply=" + reply
				+ ", indate=" + indate + ", replydate=" + replydate + "]";
	}

}
