package com.kream.product;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
	
	// 추가된 부분
    private LocalDateTime additionalStartDateTime;
    private LocalDateTime additionalEndDateTime;

    // 클라이언트에서 받은 데이터를 처리하는 setter 메소드
    public void setAdditionalStartDayAndTime(String auctionStartDay, String auctionStartTime) {
        // ISO 8601 형식의 문자열로 합치기
        String combinedDateTimeString = auctionStartDay + "T" + auctionStartTime;

        // LocalDateTime으로 변환
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        this.additionalStartDateTime = LocalDateTime.parse(combinedDateTimeString, formatter);
    }

    public void setAdditionalEndDayAndTime(String auctionEndDay, String auctionEndTime) {
        // ISO 8601 형식의 문자열로 합치기
        String combinedDateTimeString = auctionEndDay + "T" + auctionEndTime;

        // LocalDateTime으로 변환
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm:ss");
        this.additionalEndDateTime = LocalDateTime.parse(combinedDateTimeString, formatter);
    }

    // 추가된 부분의 getter 메소드
    public LocalDateTime getAdditionalStartDateTime() {
        return additionalStartDateTime;
    }
    public LocalDateTime getAdditionalEndDateTime() {
        return additionalEndDateTime;
    }
    
	
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
