package com.kream.product;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

public class ProductDTO {
	private int productNo;
	private String productId;
	private String category1;
	private String category2;
	private String brand;
	private String brandName;
	private String nameKr;
	private String nameEn;
	private String content;
	private int firstPrice;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date releaseDay;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date registDay;
	private String color;
	private String size;
	private String image;
	private String cate1Name;
	private String cate2Name;
	private MultipartFile imageFile;
	
	public int getProductNo() {
		return productNo;
	}
	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}
	public String getProductId() {
		return productId;
	}
	public void setProductId(String productId) {
		this.productId = productId;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getBrand() {
		return brand;
	}
	public void setBrand(String brand) {
		this.brand = brand;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getNameKr() {
		return nameKr;
	}
	public void setNameKr(String nameKr) {
		this.nameKr = nameKr;
	}
	public String getNameEn() {
		return nameEn;
	}
	public void setNameEn(String nameEn) {
		this.nameEn = nameEn;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getFirstPrice() {
		return firstPrice;
	}
	public void setFirstPrice(String firstPrice) {
		this.firstPrice = Integer.parseInt(firstPrice.replaceAll(",", ""));
	}
	public Date getReleaseDay() {
		return releaseDay;
	}
	public void setReleaseDay(Date releaseDay) {
		this.releaseDay = releaseDay;
	}
	public Date getRegistDay() {
		return registDay;
	}
	public void setRegistDay(Date registDay) {
		this.registDay = registDay;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getCate1Name() {
		return cate1Name;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
        this.image = image;
    }
	public void setCate1Name(String cate1Name) {
		this.cate1Name = cate1Name;
	}
	public String getCate2Name() {
		return cate2Name;
	}
	public void setCate2Name(String cate2Name) {
		this.cate2Name = cate2Name;
	}
	public MultipartFile getImageFile() {
		return imageFile;
	}
	public void setImageFile(MultipartFile imageFile) {
		this.imageFile = imageFile;
	}
	

}
