package com.kream.product;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
public class ProductService {
	@Autowired private ProductMapper mapper;
	
	// AJAX 사용
	public List<Category2DTO> subcateList(int num) {
		List<Category2DTO> dto = mapper.subcateList(num);
		return dto;
	}
	
	// 상품 등록
	public String insertProc(ProductDTO dto) {
		int result = mapper.productInsert(dto);
		if(result == 1)
			return "success";
		return "fail";
	}
	
	public void productList(Model model) {
		List<ProductDTO> product = mapper.productList();
		model.addAttribute("product", product);
	}
	
	// 카테고리1 등록
	public String cate1Proc(Category1DTO dto) {
		int result = mapper.cate1Insert(dto);
		if(result == 1)
			return "success";
		return "fail";
	}
	
	// 카테고리1 목록
	public void cate1List(Model model) {
		List<Category1DTO> cate1 = mapper.cate1List();
		model.addAttribute("cate1", cate1);
	}

	// 카테고리2 등록
	public String cate2Proc(Category2DTO dto) {
		int result = mapper.cate2Insert(dto);
		if(result == 1)
			return "success";
		return "fail";
	}
	
	public void cate2List(Model model) {
		List<Category2DTO> cate2 = mapper.cate2List();
		model.addAttribute("cate2", cate2);
	}

	// 브랜드 등록
	public String brandProc(BrandDTO dto) {
		int result = mapper.brandInsert(dto);
		if(result == 1)
			return "success";
		return "fail";
	}
	
	public void brandList(Model model) {
		List<BrandDTO> brand = mapper.brandList();
		model.addAttribute("brand", brand);
	}
	
	// 경매 등록
	public String addAuctionProc(AuctionDTO dto) {
		int result = mapper.addAuction(dto);
		if(result == 1)
			return "success";
		return "fail";
	}
	// 경매 현황 목록
	public void auctionStatusList(Model model) {
		List<AuctionDTO> status = mapper.auctionStatusList(model);
		model.addAttribute("status", status);
	}
	
	// 경매 목록 보기
	public void auctionList(Model model) {
		List<AuctionDTO> auction = mapper.auctionList();
		model.addAttribute("auction", auction);
	}

	// 파라미터 no받음 <오버로딩>
	public void productList(Model model, int no) {
		model.addAttribute("no", no);
	}

	// 경매 수정화면
	public void editAuction(Model model, int no) {
		AuctionDTO edit = mapper.editAuction(no);
		model.addAttribute("edit", edit);
	}
	
	public String editAuctionProc(AuctionDTO dto) {
		int result = mapper.editAuctionProc(dto);
		if (result == 1)
			return "success";
		return "fail";
	}

	public String deleteAuction(int no) {
		int result = mapper.deleteAuction(no);
		if (result == 1)
			return "success";
		return "fail";
	}
	
	// 상품 수정화면
	public void editProduct(Model model, int no) {
		ProductDTO edit = mapper.editProduct(no);
		model.addAttribute("edit", edit);
	}

	public String editProductProc(ProductDTO dto) {
		int result = mapper.editProductProc(dto);
		if (result == 1)
			return "success";
		return "fail";
	}

	public String deleteProduct(int no) {
		int result = mapper.deleteProduct(no);
		if (result == 1)
			return "success";
		return "fail";
	}

	public void contentAuction(Model model, int no) {
		AuctionDTO contents = mapper.contentAuction(no);
		int max = mapper.maxBidprice(no);
		System.out.println("max : "+max);
		model.addAttribute("contents", contents);
		model.addAttribute("max", max);
		

	}

	// 경매 입찰
	public String auctionBid(AuctionProgressDTO dto, int no, AuctionDTO dto1) {
		if(dto.getBidMemberId() == null || dto.getBidMemberId().trim().isEmpty())
			return "login";
		
		// 현재 시간
//	    Date currentDateTime = new Date();
//
//	    // 경매 시작일과 시작시간을 Date로 변환
//	    Date auctionStartDateTime = dto1.getAuctionStartDay();//convertStringToDate(dto1.getAuctionStartDay(), dto1.getAuctionStartTime());
//
//	    // 경매 종료일과 종료시간을 Date로 변환
//	    Date auctionEndDateTime = dto1.getAuctionEndDay();//convertStringToDate(dto1.getAuctionEndDay(), dto1.getAuctionEndTime());
//
//	    if (currentDateTime.before(auctionStartDateTime))
//	        return "auction_not_started";
//
//	    if (currentDateTime.after(auctionEndDateTime))
//	        return "auction_ended";

		int max = mapper.maxBidprice(no);
		if(max >= dto.getAuctionBidprice())
			return "over";
		
		int result = mapper.auctionBid(dto);
		if (result == 1)
			return "success";
		return "fail";
	}
	
	// 문자열을 Date로 변환하는 메소드
//    public Date convertStringToDate(Date date, String timeString) {
//        String combinedDateTimeString = date + " " + timeString;
//        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//
//        try {
//            return dateFormat.parse(combinedDateTimeString);
//        } catch (Exception e) {
//            // ParseException 발생 시 처리
//            e.printStackTrace();
//            return null; // 또는 예외 처리에 따른 적절한 반환값 설정
//        }
//    }
	
	/* -------------- */
	
	public List<String> getPlannedDates(){
		return mapper.getPlannedDates();
	}

	
}
