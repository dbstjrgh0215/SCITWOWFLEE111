package com.scit.flee2.vo;

public class Board {
	private int boardnum;
	private String id;
	private String title;
	private String image;
	private String indate;
	private String membertype;
	private String keyword;
	private String comments;
	private String precaution;
	private String name;
	private String type;
	private String contractperiod;
	private int price;
	private int stock;
	private String optime;
	private String offday;
	private double scale;
	private String spaceaddr1;
	private String spaceaddr2;
	private double latitude;
	private double longitude;
	private int recommend;

	public Board(int boardnum, String id, String title, String image, String indate, String membertype, String keyword,
			String comments, String precaution, String name, String type, String contractperiod, int price, int stock,
			String optime, String offday, double scale, String spaceaddr1, String spaceaddr2, double latitude,
			double longitude, int recommend) {
		super();
		this.boardnum = boardnum;
		this.id = id;
		this.title = title;
		this.image = image;
		this.indate = indate;
		this.membertype = membertype;
		this.keyword = keyword;
		this.comments = comments;
		this.precaution = precaution;
		this.name = name;
		this.type = type;
		this.contractperiod = contractperiod;
		this.price = price;
		this.stock = stock;
		this.optime = optime;
		this.offday = offday;
		this.scale = scale;
		this.spaceaddr1 = spaceaddr1;
		this.spaceaddr2 = spaceaddr2;
		this.latitude = latitude;
		this.longitude = longitude;
		this.recommend = recommend;
	}

	public Board() {
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

	public String getPrecaution() {
		return precaution;
	}

	public void setPrecaution(String precaution) {
		this.precaution = precaution;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getContractperiod() {
		return contractperiod;
	}

	public void setContractperiod(String contractperiod) {
		this.contractperiod = contractperiod;
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

	public String getOffday() {
		return offday;
	}

	public void setOffday(String offday) {
		this.offday = offday;
	}

	public double getScale() {
		return scale;
	}

	public void setScale(double scale) {
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

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public int getRecommend() {
		return recommend;
	}

	public void setRecommend(int recommend) {
		this.recommend = recommend;
	}

	@Override
	public String toString() {
		return "Board [boardnum=" + boardnum + ", id=" + id + ", title=" + title + ", image=" + image + ", indate="
				+ indate + ", membertype=" + membertype + ", keyword=" + keyword + ", comments=" + comments
				+ ", precaution=" + precaution + ", name=" + name + ", type=" + type + ", contractperiod="
				+ contractperiod + ", price=" + price + ", stock=" + stock + ", optime=" + optime + ", offday=" + offday
				+ ", scale=" + scale + ", spaceaddr1=" + spaceaddr1 + ", spaceaddr2=" + spaceaddr2 + ", latitude="
				+ latitude + ", longitude=" + longitude + ", recommend=" + recommend + "]";
	}

}
