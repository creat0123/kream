package com.kream.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.ErrorResponse;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MaxUploadSizeExceededException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.http.HttpSession;
import okhttp3.internal.http2.ErrorCode;

@Controller
@RequestMapping("product")
public class ProductController {
	@Autowired private ProductService service;
	@Autowired private HttpSession session;
	@Autowired private ProductMapper mapper;
	
	@RequestMapping("list")
	public String productList(Model model) {
		service.productList(model);
		return "product/productList";
	}
	
	@RequestMapping("insert")
	public String index(Model model) {
		service.cate1List(model);
		service.cate2List(model);
		service.brandList(model);
		return "product/InsertProduct";
	}
	
	@ResponseBody
	@RequestMapping("/getSubcategories")
	public List<Category2DTO> getSubcategories(@RequestParam("num") int num) {
		List<Category2DTO> dto = service.subcateList(num);
		return dto;
	}
	
	@RequestMapping("insertProc")
	private String insertProc(ProductDTO dto, Model model, RedirectAttributes ra) {
		// 이미지 파일 처리
	    MultipartFile imageFile = dto.getImageFile();
	    if (imageFile != null && !imageFile.isEmpty()) {
	        String fileName = service.uploadImage(imageFile);
	        dto.setImage(fileName);
	    }
		String msg = service.insertProc(dto);
		
		if(msg.equals("success")) {
			ra.addFlashAttribute("msg", msg);
			return "redirect:list";
		}
		return "product/insert";
	}
	
	// 카테고리1
	@RequestMapping("InsertCategory1")
	public String InsertCategory1() {
		return "product/InsertCategory1";
	}
	
	@RequestMapping("InsertCategory1Proc")
	public ResponseEntity<Map<String, String>> InsertCategory1Proc(Category1DTO dto, Model model, RedirectAttributes ra) {
		Map<String, String> response = new HashMap<>();
		String msg = service.cate1Proc(dto);
		response.put("msg", msg);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	@RequestMapping("cate1List")
	private String cate1List(Model model) {
		service.cate1List(model);
		return "product/cate1List";
	}
	
	// 카테고리2
	@RequestMapping("InsertCategory2")
	public String InsertCategory2(Model model) {
		service.cate1List(model);
		return "product/InsertCategory2";
	}
	
	@RequestMapping("InsertCategory2Proc")
	public ResponseEntity<Map<String, String>> InsertCategory2Proc(Category2DTO dto, Model model, RedirectAttributes ra) {
		System.out.println("cate2 "+dto.getCate2Cate1() + dto.getCate2Name());
		Map<String, String> response = new HashMap<>();
		String msg = service.cate2Proc(dto);
		response.put("msg", msg);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	@RequestMapping("cate2List")
	private String cate2List(Model model) {
		service.cate2List(model);
		return "product/cate2List";
	}
	
	// 브랜드
	@RequestMapping("InsertBrand")
	public String InsertBrand(Model model) {
		return "product/InsertBrand";
	}
	
	@RequestMapping("InsertBrandProc")
	public ResponseEntity<Map<String, String>> InsertBrandProc(BrandDTO dto, Model model, RedirectAttributes ra) {
		Map<String, String> response = new HashMap<>();
		String msg = service.brandProc(dto);
		response.put("msg", msg);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	@RequestMapping("brandList")
	private String brandList(Model model) {
		service.brandList(model);
		return "product/brandList";
	}
	
	// 경매 등록
	@RequestMapping("addAuction")
	public String addAuction(Model model, int no) {
		service.productList(model, no);
		service.auctionStatusList(model); // 경매현황
		return "product/addAuction";
	}
	
	@RequestMapping("addAuctionProc")
	public String addAuctionProc(AuctionDTO dto, Model model, RedirectAttributes ra) {
		String msg = service.addAuctionProc(dto);
		
		if(msg.equals("success")) {
			ra.addAttribute("msg", msg);
			return "redirect:auctionList";
		}
		return "product/addAuction";
	}
	
	// 경매 목록
	@RequestMapping("auctionList")
	private String auctionList(Model model) {
		service.auctionList(model);
		return "product/auctionList";
	}
	
	// 경매 수정
	@RequestMapping("editAuction")
	private String editAuction(Model model, int no) {
		service.editAuction(model, no);
		service.auctionStatusList(model); // 경매현황
		return "product/editAuction";
	}
	
	@RequestMapping("editAuctionProc")
	private ResponseEntity<Map<String, String>> editAuctionProc(AuctionDTO dto, Model model, RedirectAttributes ra) {
		Map<String, String> response = new HashMap<>();
		String msg = service.editAuctionProc(dto);
		response.put("msg", msg);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	@RequestMapping("deleteAuction")
	public ResponseEntity<Map<String, String>> deleteAuction(int no, Model model, RedirectAttributes ra) {
		Map<String, String> response = new HashMap<>();
		String msg = service.deleteAuction(no);
		response.put("msg", msg);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	// 상품 수정
	@RequestMapping("editProduct")
	private String editProduct(Model model, int no) {
		service.editProduct(model, no);
		service.cate1List(model);
		service.cate2List(model);
		service.brandList(model);
		return "product/editProduct";
	}
	
	@RequestMapping("editProductProc")
	private ResponseEntity<Map<String, String>> editProductProc(ProductDTO dto, Model model, RedirectAttributes ra) {
		// 이미지 파일 처리
		//System.out.println("image "+dto.getImageFile());
	    MultipartFile imageFile = dto.getImageFile();
	    if (imageFile != null && !imageFile.isEmpty()) {
	        String fileName = service.uploadImage(imageFile);
	        dto.setImage(fileName);
	        System.out.println("Uploaded image file: " + fileName);
	    } else {
	        // 새로운 이미지가 선택되지 않았을 경우, 기존 이미지를 그대로 사용
	        ProductDTO existingProduct = mapper.getProduct(dto.getProductNo());
	        System.out.println(existingProduct);
	        dto.setImage(existingProduct.getImage());
	    }
		Map<String, String> response = new HashMap<>();
		String msg = service.editProductProc(dto);
		response.put("msg", msg);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	@RequestMapping("deleteProduct")
	public ResponseEntity<Map<String, String>> deleteProduct(int no, Model model, RedirectAttributes ra) {
		Map<String, String> response = new HashMap<>();
		String msg = service.deleteProduct(no);
		response.put("msg", msg);
		return new ResponseEntity<>(response, HttpStatus.OK); // uploadFilePath
	}
	
//	@RequestMapping("deleteProduct")
//	public ResponseEntity<Map<String, String>> deleteProduct(int no, Model model, RedirectAttributes ra) {
//		Map<String, String> response = new HashMap<>();
//		String msg = service.deleteProduct(no);
//		response.put("msg", msg);
//		return new ResponseEntity<>(response, HttpStatus.OK);
//	}
	
	@RequestMapping("contentAuction")
	private String contentAuction(Model model, int no) {
		service.contentAuction(model, no);
		return "product/contentAuction";
	}
	
	// 경매 입찰
	@RequestMapping("auctionBid")
	private ResponseEntity<Map<String, String>> auctionBid(AuctionProgressDTO dto, AuctionDTO dto1,
			Model model, RedirectAttributes ra, @RequestParam(name = "no", required = false) Integer no) {
		Map<String, String> response = new HashMap<>();
		String msg = service.auctionBid(dto, no != null ? no : 0, dto1); // 값이 있을 때는 그대로 사용하고, 값이 없을 때는 기본값 0으로 설정
		//String msg = service.auctionBid(dto, no);
		response.put("msg", msg);
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
	// 현황 업데이트
	@ResponseBody
	@RequestMapping("updateStatus")
	private String updateStatus() {
	    service.updateStatus();
	    return "success";
	}
	
	// 회원 입찰 내역
	@RequestMapping("bidHistory")
	private String bidHistory(Model model) {
		String sessionId = (String)session.getAttribute("id");
		System.out.println("sessionId : "+sessionId);
		service.bidHistory(model, sessionId);
		return "product/bidHistory";
	}
	
	// 회원 입찰 결과 - 결제
	@RequestMapping("bidResult")
	private String bidResult(Model model) {
		String sessionId = (String)session.getAttribute("id");
		//System.out.println("sessionId : "+sessionId);
		service.bidResult(model, sessionId);
		return "product/bidResult";
	}
	
	// 달력
	@RequestMapping("cal")
	public String showCalenar(Model model) {
		List<String> palnnedDates = service.getPlannedDates();
		model.addAttribute("plannedDates",palnnedDates);
		
		return "product/cal";
	} 
	
	
	// 상품 페이지 
	@RequestMapping("shop")
	public String Shop(Model model) {
		service.auctionList(model);
		return "product/shop";
	}
	
	
	
}
