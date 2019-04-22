package com.scit.flee2.vo;

public class Zzim {
	private int zzimNo;
	private String id;
	private int boardnum;
	private String zzimDate;
	
	public Zzim(int zzimNo, String id, int boardnum, String zzimDate) {
		super();
		this.zzimNo = zzimNo;
		this.id = id;
		this.boardnum = boardnum;
		this.zzimDate = zzimDate;
	}

	public Zzim() {
		super();
	}

	public int getZzimNo() {
		return zzimNo;
	}

	public void setZzimNo(int zzimNo) {
		this.zzimNo = zzimNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getZzimDate() {
		return zzimDate;
	}

	public void setZzimDate(String zzimDate) {
		this.zzimDate = zzimDate;
	}

	@Override
	public String toString() {
		return "Zzim [zzimNo=" + zzimNo + ", id=" + id + ", boardnum=" + boardnum + ", zzimDate=" + zzimDate + "]";
	}
}
