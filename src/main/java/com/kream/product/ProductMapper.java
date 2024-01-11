package com.kream.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.ui.Model;

@Mapper
public interface ProductMapper {

	List<Category2DTO> subcateList(int num);

	int productInsert(ProductDTO dto);

	List<ProductDTO> productList();

	int cate1Insert(Category1DTO dto);

	List<Category1DTO> cate1List();

	int cate2Insert(Category2DTO dto);

	List<Category2DTO> cate2List();

	int brandInsert(BrandDTO dto);

	List<BrandDTO> brandList();

	int addAuction(AuctionDTO dto);

	List<AuctionDTO> auctionStatusList(Model model);

	List<AuctionDTO> auctionList();

	AuctionDTO editAuction(int no);

	int editAuction(AuctionDTO dto);

	int editAuctionProc(AuctionDTO dto);

	int deleteAuction(int no);

	ProductDTO editProduct(int no);

	int editProductProc(ProductDTO dto);

	int deleteProduct(int no);

	AuctionDTO contentAuction(int no);

	List<String> getPlannedDates();

	int auctionBid(AuctionProgressDTO dto);

	int maxBidprice(int no);
	
}
