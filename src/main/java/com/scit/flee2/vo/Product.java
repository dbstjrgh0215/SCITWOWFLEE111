package com.scit.flee2.vo;

public class Product {
	private int productnum;
	private int sellernum;
	private String id;
	private String productname;
	private String prod_type;
	private String keyword;

	public Product(int productnum, int sellernum, String id, String productname, String prod_type, String keyword) {
		super();
		this.productnum = productnum;
		this.sellernum = sellernum;
		this.id = id;
		this.productname = productname;
		this.prod_type = prod_type;
		this.keyword = keyword;
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

	public String getProd_type() {
		return prod_type;
	}

	public void setProd_type(String prod_type) {
		this.prod_type = prod_type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Product [productnum=" + productnum + ", sellernum=" + sellernum + ", id=" + id + ", productname="
				+ productname + ", prod_type=" + prod_type + ", keyword=" + keyword + "]";
	}

}
