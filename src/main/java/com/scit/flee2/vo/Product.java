package com.scit.flee2.vo;

public class Product {
	private int productnum;
	private int sellernum;
	private String id;
	private String productname;
	private String prod_type1;
	private String prod_type2;
	private String prod_type3;
	private String keyword;
	private String image;
	
	public Product(int productnum, int sellernum, String id, String productname, String prod_type1, String prod_type2,
			String prod_type3, String keyword, String image) {
		super();
		this.productnum = productnum;
		this.sellernum = sellernum;
		this.id = id;
		this.productname = productname;
		this.prod_type1 = prod_type1;
		this.prod_type2 = prod_type2;
		this.prod_type3 = prod_type3;
		this.keyword = keyword;
		this.image = image;
	}
	public Product() {
		super();
	}
	public int getProductnum() {
		return productnum;
	}
	public void setProductnum(int productnum) {
		this.productnum = productnum;
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
	public String getProductname() {
		return productname;
	}
	public void setProductname(String productname) {
		this.productname = productname;
	}
	public String getProd_type1() {
		return prod_type1;
	}
	public void setProd_type1(String prod_type1) {
		this.prod_type1 = prod_type1;
	}
	public String getProd_type2() {
		return prod_type2;
	}
	public void setProd_type2(String prod_type2) {
		this.prod_type2 = prod_type2;
	}
	public String getProd_type3() {
		return prod_type3;
	}
	public void setProd_type3(String prod_type3) {
		this.prod_type3 = prod_type3;
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
	@Override
	public String toString() {
		return "Product [productnum=" + productnum + ", sellernum=" + sellernum + ", id=" + id + ", productname="
				+ productname + ", prod_type1=" + prod_type1 + ", prod_type2=" + prod_type2 + ", prod_type3="
				+ prod_type3 + ", keyword=" + keyword + ", image=" + image + "]";
	}
	
	
}
