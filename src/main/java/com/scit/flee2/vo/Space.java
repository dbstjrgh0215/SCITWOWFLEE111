package com.scit.flee2.vo;

public class Space {
	private int spacenum;
	private String id;
	private String spacename;
	private String space_type1;
	private String space_type2;
	private String space_type3;
	private String keyword;
	private String image;
	private String tel;
	private String comments;
	private double latitude;
	private double longitude;
	
	public Space(int spacenum, String id, String spacename, String space_type1, String space_type2, String space_type3,
			String keyword, String image, String tel, String comments, double latitude, double longitude) {
		super();
		this.spacenum = spacenum;
		this.id = id;
		this.spacename = spacename;
		this.space_type1 = space_type1;
		this.space_type2 = space_type2;
		this.space_type3 = space_type3;
		this.keyword = keyword;
		this.image = image;
		this.tel = tel;
		this.comments = comments;
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
	public String getSpace_type1() {
		return space_type1;
	}
	public void setSpace_type1(String space_type1) {
		this.space_type1 = space_type1;
	}
	public String getSpace_type2() {
		return space_type2;
	}
	public void setSpace_type2(String space_type2) {
		this.space_type2 = space_type2;
	}
	public String getSpace_type3() {
		return space_type3;
	}
	public void setSpace_type3(String space_type3) {
		this.space_type3 = space_type3;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
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
		return "Space [spacenum=" + spacenum + ", id=" + id + ", spacename=" + spacename + ", space_type1="
				+ space_type1 + ", space_type2=" + space_type2 + ", space_type3=" + space_type3 + ", keyword=" + keyword
				+ ", image=" + image + ", tel=" + tel + ", comments=" + comments + ", latitude=" + latitude
				+ ", longitude=" + longitude + "]";
	}
	
}
