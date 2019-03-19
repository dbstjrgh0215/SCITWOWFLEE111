package com.scit.flee2.vo;

public class Proposal {
	private int boardnum;
	private String id;
	private String title;
	private String image;
	private String indate;
	private String membertype;
	private String keyword;
	private String comments;
	private String name;
	private String type1;
	private String type2;
	private String type3;
	private int price;
	private int stock;
	private String optime;
	private int scale;
	private String spaceaddr1;
	private String spaceaddr2;
	private int latitude;
	private int longitude;
	public Proposal(int boardnum, String id, String title, String image, String indate, String membertype,
			String keyword, String comments, String name, String type1, String type2, String type3, int price,
			int stock, String optime, int scale, String spaceaddr1, String spaceaddr2, int latitude, int longitude) {
		super();
		this.boardnum = boardnum;
		this.id = id;
		this.title = title;
		this.image = image;
		this.indate = indate;
		this.membertype = membertype;
		this.keyword = keyword;
		this.comments = comments;
		this.name = name;
		this.type1 = type1;
		this.type2 = type2;
		this.type3 = type3;
		this.price = price;
		this.stock = stock;
		this.optime = optime;
		this.scale = scale;
		this.spaceaddr1 = spaceaddr1;
		this.spaceaddr2 = spaceaddr2;
		this.latitude = latitude;
		this.longitude = longitude;
	}
	public Proposal() {
		super();
	}
	public int getBoardnum() {
		return boardnum;
	}
	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getIndate() {
		return indate;
	}
	public void setIndate(String indate) {
		this.indate = indate;
	}
	public String getMembertype() {
		return membertype;
	}
	public void setMembertype(String membertype) {
		this.membertype = membertype;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType1() {
		return type1;
	}
	public void setType1(String type1) {
		this.type1 = type1;
	}
	public String getType2() {
		return type2;
	}
	public void setType2(String type2) {
		this.type2 = type2;
	}
	public String getType3() {
		return type3;
	}
	public void setType3(String type3) {
		this.type3 = type3;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getOptime() {
		return optime;
	}
	public void setOptime(String optime) {
		this.optime = optime;
	}
	public int getScale() {
		return scale;
	}
	public void setScale(int scale) {
		this.scale = scale;
	}
	public String getSpaceaddr1() {
		return spaceaddr1;
	}
	public void setSpaceaddr1(String spaceaddr1) {
		this.spaceaddr1 = spaceaddr1;
	}
	public String getSpaceaddr2() {
		return spaceaddr2;
	}
	public void setSpaceaddr2(String spaceaddr2) {
		this.spaceaddr2 = spaceaddr2;
	}
	public int getLatitude() {
		return latitude;
	}
	public void setLatitude(int latitude) {
		this.latitude = latitude;
	}
	public int getLongitude() {
		return longitude;
	}
	public void setLongitude(int longitude) {
		this.longitude = longitude;
	}
	@Override
	public String toString() {
		return "Proposal [boardnum=" + boardnum + ", id=" + id + ", title=" + title + ", image=" + image + ", indate="
				+ indate + ", membertype=" + membertype + ", keyword=" + keyword + ", comments=" + comments + ", name="
				+ name + ", type1=" + type1 + ", type2=" + type2 + ", type3=" + type3 + ", price=" + price + ", stock="
				+ stock + ", optime=" + optime + ", scale=" + scale + ", spaceaddr1=" + spaceaddr1 + ", spaceaddr2="
				+ spaceaddr2 + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}

	

}
