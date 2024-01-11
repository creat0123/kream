package com.kream.product;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class AuctionProgressDTO {
	private int bidNo;
	private String bidMemberId;
	private int bidAuctionNo;
	private int auctionBidprice;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date auctionBidtime;
	
	
	public int getBidNo() {
		return bidNo;
	}
	public void setBidNo(int bidNo) {
		this.bidNo = bidNo;
	}
	public String getBidMemberId() {
		return bidMemberId;
	}
	public void setBidMemberId(String bidMemberId) {
		this.bidMemberId = bidMemberId;
	}
	public int getBidAuctionNo() {
		return bidAuctionNo;
	}
	public void setBidAuctionNo(int bidAuctionNo) {
		this.bidAuctionNo = bidAuctionNo;
	}
	public int getAuctionBidprice() {
		return auctionBidprice;
	}
	public void setAuctionBidprice(String auctionBidprice) {
		this.auctionBidprice = Integer.parseInt(auctionBidprice.replaceAll(",", ""));
	}
	public Date getAuctionBidtime() {
		return auctionBidtime;
	}
	public void setAuctionBidtime(Date auctionBidtime) {
		this.auctionBidtime = auctionBidtime;
	}
}
