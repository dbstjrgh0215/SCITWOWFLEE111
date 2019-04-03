package com.scit.flee2.vo;

public class Space {
	private int spacenum;
	private String id;
	private String spacename;
	private String space_type;
	private String keyword;
	private String tel;
	private String comments;
	private String spaceaddr1;
	private String spaceaddr2;
	private double latitude;
	private double longitude;

	public Space(int spacenum, String id, String spacename, String space_type, String keyword, String tel,
			String comments, String spaceaddr1, String spaceaddr2, double latitude, double longitude) {
		super();
		this.spacenum = spacenum;
		this.id = id;
		this.spacename = spacename;
		this.space_type = space_type;
		this.keyword = keyword;
		this.tel = tel;
		this.comments = comments;
		this.spaceaddr1 = spaceaddr1;
		this.spaceaddr2 = spaceaddr2;
		this.latitude = latitude;
		this.longitude = longitude;
	}

	public Space() {
		super();
	}

	public int getSpacenum() {
		return spacenum;
	}

	public void setSpacenum(int spacenum) {
		this.spacenum = spacenum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getSpacename() {
		return spacename;
	}

	public void setSpacename(String spacename) {
		this.spacename = spacename;
	}

	public String getSpace_type() {
		return space_type;
	}

	public void setSpace_type(String space_type) {
		this.space_type = space_type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
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

	@Override
	public String toString() {
		return "Space [spacenum=" + spacenum + ", id=" + id + ", spacename=" + spacename + ", space_type=" + space_type
				+ ", keyword=" + keyword + ", tel=" + tel + ", comments=" + comments + ", spaceaddr1=" + spaceaddr1
				+ ", spaceaddr2=" + spaceaddr2 + ", latitude=" + latitude + ", longitude=" + longitude + "]";
	}

}
