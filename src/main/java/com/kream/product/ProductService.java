package com.kream.product;

import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

import jakarta.servlet.ServletContext;

@Service
public class ProductService {
	@Autowired private ProductMapper mapper;
	@Autowired ServletContext servletContext;
	
	// AJAX 사용
	public List<Category2DTO> subcateList(int num) {
		List<Category2DTO> dto = mapper.subcateList(num);
		return dto;
	}
	
	// 상품 등록
	public String insertProc(ProductDTO dto) {
		System.out.println("이미지 "+dto.getImage());
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
		ProductDTO product = mapper.productContent(no);
		model.addAttribute("product", product);
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
		System.out.println("이미지 "+dto.getImage());
		int result = mapper.editProductProc(dto);
		if (result == 1)
			return "success";
		return "fail";
	}
	
	public String deleteProduct(int no) {
		ProductDTO dto = mapper.imgName(no); // 삭제할 이미지 이름
		String imgName = dto.getImage();
		String key = "image/" + imgName;
		
		boolean isObjectExist = amazonS3Client.doesObjectExist(S3Bucket, key);
		if (isObjectExist) {
			int result = mapper.deleteProduct(no);
			if (result == 1) {
				amazonS3Client.deleteObject(S3Bucket, key);
				return "success";
			}
			return "fail-result";
		}
		return "fail-s3";
	}
	
	// 경매 페이지
	public void contentAuction(Model model, int no) {
		AuctionDTO contents = mapper.contentAuction(no);
		int max = mapper.maxBidprice(no);
		//System.out.println("max : "+max);
		model.addAttribute("contents", contents);
		model.addAttribute("max", max);
		
	}

	// 경매 입찰
	public String auctionBid(AuctionProgressDTO dto, int no, AuctionDTO dto1) {
		if(dto.getBidMemberId() == null || dto.getBidMemberId().trim().isEmpty())
			return "login";
		
		int max = mapper.maxBidprice(no);
		if(max >= dto.getAuctionBidprice())
			return "over";
		
		int result = mapper.auctionBid(dto);
		if (result == 1)
			return "success";
		return "fail";
	}
	
	public void bidHistory(Model model, String sessionId) {
		List<AuctionProgressDTO> bid = mapper.bidHistory(sessionId);
		model.addAttribute("bid", bid);
	}
	
	// 회원 입찰 결과 - 결제
	public void bidResult(Model model, String sessionId) {
		List<AuctionDTO> bid = mapper.bidResult(sessionId);
		model.addAttribute("bid", bid);
	}
	
	// 현황 업데이트
	public void updateStatus() {
		mapper.updateStatus();
	}
	
	/* -------------- */
	
	public List<String> getPlannedDates(){
		return mapper.getPlannedDates();
	}
	
	//private static final String UPLOAD_DIR = "C:\\javas\\final_workspace\\kream\\src\\main\\resources\\static\\img\\product\\";
	
	@Autowired AmazonS3Client amazonS3Client;
	private String S3Bucket = "asta-s3";
	
	public String uploadImage(MultipartFile imageFile) {
		System.out.println("Received image file: " + imageFile.getOriginalFilename());
		if (imageFile.isEmpty()) {
            return null; // 업로드된 파일이 없으면 null 반환하거나 에러 처리
        }
		try {
            // 파일명 중복을 피하기 위해 UUID를 사용하여 고유한 파일명 생성
            String originalFileName = imageFile.getOriginalFilename();
            
            int index = originalFileName.lastIndexOf(".");
            String ext = originalFileName.substring(index + 1);
            String storeFileName = UUID.randomUUID() + "." + ext;
            String key = "image/" + storeFileName;
            
            //String extension = originalFileName.substring(originalFileName.lastIndexOf("."));
            //String uploadedFileName = UUID.randomUUID().toString() + extension;
            
            ObjectMetadata objectMetaData = new ObjectMetadata();
			objectMetaData.setContentType(imageFile.getContentType());
			objectMetaData.setContentLength(imageFile.getSize()); // 파일크기
            
			// S3에 업로드
			amazonS3Client.putObject(
				new PutObjectRequest(S3Bucket, key, imageFile.getInputStream(), objectMetaData)
						.withCannedAcl(CannedAccessControlList.PublicRead));
            // 저장된 파일명 반환
            return storeFileName;
        } catch (IOException e) {
            e.printStackTrace();
            // 업로드 실패 시 예외 처리
            return null;
        }
    }
	
}
