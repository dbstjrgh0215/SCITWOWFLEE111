package com.scit.flee2.vo;

public class Seller {
	private int sellernum;
	private String id;
	private String sellername;
	private String tel;
	private String comments;

	public Seller(int sellernum, String id, String sellername, String tel, String comments) {
		super();
		this.sellernum = sellernum;
		this.id = id;
		this.sellername = sellername;
		this.tel = tel;
		this.comments = comments;
	}

	public Seller() {
		super();
	}

	public int getSellernum() {
		return sellernum;
	}

	public void setSellernum(int sellernum) {
		this.sellernum = sellernum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSellername() {
		return sellername;
	}

	public void setSellername(String sellername) {
		this.sellername = sellername;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "Seller [sellernum=" + sellernum + ", id=" + id + ", sellername=" + sellername + ", tel=" + tel
				+ ", comments=" + comments + "]";
	}

}
