package com.kream.product;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AuctionDTO {
	private int auctionNo;
	private int auctionId;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date auctionStartDay;
	private String auctionStartTime;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date auctionEndDay;
	private String auctionEndTime;
	private int auctionStartPrice;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date auctionRegist;
	private String auctionStatus;
	private String statusName;
	private ProductDTO product;
	
	
	public int getAuctionNo() {
		return auctionNo;
	}
	public void setAuctionNo(int auctionNo) {
		this.auctionNo = auctionNo;
	}
	public int getAuctionId() {
		return auctionId;
	}
	public void setAuctionId(int auctionId) {
		this.auctionId = auctionId;
	}
	public Date getAuctionStartDay() {
		return auctionStartDay;
	}
	public void setAuctionStartDay(Date auctionStartDay) {
		this.auctionStartDay = auctionStartDay;
	}
	public String getAuctionStartTime() {
		return auctionStartTime;
	}
	public void setAuctionStartTime(String auctionStartTime) {
		this.auctionStartTime = auctionStartTime;
	}
	public Date getAuctionEndDay() {
		return auctionEndDay;
	}
	public void setAuctionEndDay(Date auctionEndDay) {
		this.auctionEndDay = auctionEndDay;
	}
	public String getAuctionEndTime() {
		return auctionEndTime;
	}
	public void setAuctionEndTime(String auctionEndTime) {
		this.auctionEndTime = auctionEndTime;
	}
	public int getAuctionStartPrice() {
		return auctionStartPrice;
	}
	public void setAuctionStartPrice(String auctionStartPrice) {
		this.auctionStartPrice = Integer.parseInt(auctionStartPrice.replaceAll(",", ""));
	}
	public Date getAuctionRegist() {
		return auctionRegist;
	}
	public void setAuctionRegist(Date auctionRegist) {
		this.auctionRegist = auctionRegist;
	}
	public String getAuctionStatus() {
		return auctionStatus;
	}
	public void setAuctionStatus(String auctionStatus) {
		this.auctionStatus = auctionStatus;
	}
	public String getStatusName() {
		return statusName;
	}
	public void setStatusName(String statusName) {
		this.statusName = statusName;
	}
	public ProductDTO getProduct() {
		return product;
	}
	public void setProduct(ProductDTO product) {
		this.product = product;
	}
	
}
