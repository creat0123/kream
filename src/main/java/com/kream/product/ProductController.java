package com.kream.product;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("product")
public class ProductController {
	@Autowired private ProductService service;
	
	@RequestMapping("list")
	public String productList(Model model) {
		service.productList(model);
		return "product/productList";
	}
	
	@RequestMapping("list1")
	private String list1() {
		return "product/list1";
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
	public String InsertCategory1Proc(Category1DTO dto, Model model, RedirectAttributes ra) {
		String msg = service.cate1Proc(dto);
		
		if(msg.equals("success")) {
			ra.addFlashAttribute("msg", msg);
			return "redirect:cate1List";
		}
		return "product/InsertCategory1";
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
	public String InsertCategory2Proc(Category2DTO dto, Model model, RedirectAttributes ra) {
		String msg = service.cate2Proc(dto);
		
		if(msg.equals("success")) {
			ra.addAttribute("msg", msg);
			return "redirect:cate2List";
		}
		return "product/InsertCategory2";
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
	public String InsertBrandProc(BrandDTO dto, Model model, RedirectAttributes ra) {
		String msg = service.brandProc(dto);
		
		if(msg.equals("success")) {
			ra.addAttribute("msg", msg);
			return "redirect:brandList";
		}
		return "product/InsertBrand";
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
		return new ResponseEntity<>(response, HttpStatus.OK);
	}
	
}
