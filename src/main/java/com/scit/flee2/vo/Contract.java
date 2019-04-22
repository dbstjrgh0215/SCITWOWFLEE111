package com.scit.flee2.vo;

public class Contract {
	private int contractnum;
	private String sellerId;
	private String spacerId;
	private String state;
	private int stockCount;
	private int soldCount;
	private int orderCount;
	private int sales;
	private String startDate;
	private String endDate;
	private String contractPeriod;
	private String spaceaddr1;
	private String spaceaddr2;
	private double longitude;
	private double latitude;
	private String spaceType;
	private String sellerType;

	public Contract(int contractnum, String sellerId, String spacerId, String state, int stockCount, int soldCount,
			int orderCount, int sales, String startDate, String endDate, String contractPeriod, String spaceaddr1,
			String spaceaddr2, double longitude, double latitude, String spaceType, String sellerType) {
		super();
		this.contractnum = contractnum;
		this.sellerId = sellerId;
		this.spacerId = spacerId;
		this.state = state;
		this.stockCount = stockCount;
		this.soldCount = soldCount;
		this.orderCount = orderCount;
		this.sales = sales;
		this.startDate = startDate;
		this.endDate = endDate;
		this.contractPeriod = contractPeriod;
		this.spaceaddr1 = spaceaddr1;
		this.spaceaddr2 = spaceaddr2;
		this.longitude = longitude;
		this.latitude = latitude;
		this.spaceType = spaceType;
		this.sellerType = sellerType;
	}

	public Contract() {
		super();
	}

	public int getContractnum() {
		return contractnum;
	}

	public void setContractnum(int contractnum) {
		this.contractnum = contractnum;
	}

	public String getSellerId() {
		return sellerId;
	}

	public void setSellerId(String sellerId) {
		this.sellerId = sellerId;
	}

	public String getSpacerId() {
		return spacerId;
	}

	public void setSpacerId(String spacerId) {
		this.spacerId = spacerId;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getStockCount() {
		return stockCount;
	}

	public void setStockCount(int stockCount) {
		this.stockCount = stockCount;
	}

	public int getSoldCount() {
		return soldCount;
	}

	public void setSoldCount(int soldCount) {
		this.soldCount = soldCount;
	}

	public int getOrderCount() {
		return orderCount;
	}

	public void setOrderCount(int orderCount) {
		this.orderCount = orderCount;
	}

	public int getSales() {
		return sales;
	}

	public void setSales(int sales) {
		this.sales = sales;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getContractPeriod() {
		return contractPeriod;
	}

	public void setContractPeriod(String contractPeriod) {
		this.contractPeriod = contractPeriod;
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

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public String getSpaceType() {
		return spaceType;
	}

	public void setSpaceType(String spaceType) {
		this.spaceType = spaceType;
	}

	public String getSellerType() {
		return sellerType;
	}

	public void setSellerType(String sellerType) {
		this.sellerType = sellerType;
	}

	@Override
	public String toString() {
		return "Contract [contractnum=" + contractnum + ", sellerId=" + sellerId + ", spacerId=" + spacerId + ", state="
				+ state + ", stockCount=" + stockCount + ", soldCount=" + soldCount + ", orderCount=" + orderCount
				+ ", sales=" + sales + ", startDate=" + startDate + ", endDate=" + endDate + ", contractPeriod="
				+ contractPeriod + ", spaceaddr1=" + spaceaddr1 + ", spaceaddr2=" + spaceaddr2 + ", longitude="
				+ longitude + ", latitude=" + latitude + ", spaceType=" + spaceType + ", sellerType=" + sellerType
				+ "]";
	}

}
