package com.kream.board;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.kream.PageService;

import jakarta.servlet.http.HttpSession;

@Service
public class AdminBoardService {

	@Autowired IAdminBoardMapper mapper;
	@Autowired HttpSession session;

	public void notice(String cp, Model model, String search, String select) {
		int currentPage = 1;
		try {
			currentPage = Integer.parseInt(cp);
		} catch (Exception e) {
			currentPage = 1;
		}

		int pageBlock = 10; // 한 페이지에 보일 데이터의 수
		int end = pageBlock * currentPage; // 테이블에서 가져올 마지막 행번호
		int begin = end - pageBlock + 1; // 테이블에서 가져올 시작 행번호

		List<AdminBoardDTO> boards = mapper.notice(begin, end, select, search);
		int totalCount = mapper.totalCount(select, search);
		if (totalCount == 0) {
			return;
		}

		String url = "notice?currentPage=";
		String result = PageService.printPage(url, totalCount, pageBlock, currentPage);

		model.addAttribute("count", totalCount);
		model.addAttribute("boards", boards);
		model.addAttribute("result", result);
	}

	@Autowired AmazonS3Client amazonS3Client;
	private String S3Bucket = "asta-s3";
	
	public String adminBoardWriteProc(AdminBoardDTO dto) {
		String sessionId = (String) session.getAttribute("id");
		if (sessionId == null)
			return "redirect:login";
		
		String title = dto.getTitle();
		if (title == null || title.trim().isEmpty()) {
			return "redirect:adminBoardWrite";
		}
		
		System.out.println("이미지 "+dto.getImage());
		int result = mapper.adminBoardWriteProc(dto);
		if (result == 1)
			return "redirect:notice";
		else
			return "redirect:adminBoardWrite";
	}

	public AdminBoardDTO adminBoardContent(String no) {
		int n = 1;
		try {
			n = Integer.parseInt(no);
		} catch (Exception e) {
			return null;
		}

		AdminBoardDTO board = mapper.adminBoardContent(n);
		String content = board.getContent().replaceAll("\r\n", "<br>");
		session.setAttribute("viewGetContent", content);

		if (board != null && board.getImage() != null) {
			String[] names = ((String) board.getImage()).split("\\\\");

			for (String name : names) {
				System.out.println("BoardService-boardContent name : " + name);
			}

			// 이미지 경로가 포함된 배열의 길이가 1 이상인 경우에만 처리
			if (names.length >= 2) {
				String[] fileNames = names[names.length - 1].split("-", 2);

				for (String fileName : fileNames) {
					System.out.println("BoardService-boardContent fileName : " + fileName);
				}
				board.setImage(names[names.length - 1]);
			}
		}
		return board;
	}

	public String adminBoardDeleteProc(String no) {
		int n = 0;
		try {
			n = Integer.parseInt(no);
		} catch (Exception e) {
			return "게시글 번호에 문제가 발생했습니다. 다시 시도하세요.";
		}
		// 로그인한 아이디와 관리자 아이디가 같은지 확인
		String sessionId = (String)session.getAttribute("id");
		if (sessionId != "admin") {
			return "관리자만 삭제 할 수 있습니다.";
		}
		AdminBoardDTO board = mapper.adminBoardContent(n);
		if (board == null)
			return "게시글 번호에 문제가 발생했습니다. 다시 시도하세요.";
		
		AdminBoardDTO dto = mapper.adminBoardContent(n);
		String imgName = dto.getImage(); // 삭제할 데이터의 이미지 이름 받아옴
		String key = "board/" + imgName;
		
		boolean isObjectExist = amazonS3Client.doesObjectExist(S3Bucket, key);
		if (isObjectExist) {
			// 테이블에서 게시글번호와 일치하는 행(row)삭제
			mapper.adminBoardDeleteProc(n);
			amazonS3Client.deleteObject(S3Bucket, key);
			return "게시글 삭제 완료";
		}
		return "오류가 발생했습니다";
	}

	public String adminBoardModifyProc(MultipartHttpServletRequest multi, String no) {
		int n = 1;
		try {
			n = Integer.parseInt(no);
		} catch (Exception e) {
			return null;
		}
		
		String sessionId = (String) session.getAttribute("id");
		String title = multi.getParameter("title");
		if (title == null || title.trim().isEmpty()) {
			return "redirect:adminBoardModify";
		}

		AdminBoardDTO board = new AdminBoardDTO();
		board.setNo(n);
		board.setTitle(title);
		board.setContent(multi.getParameter("content"));
		board.setId(sessionId);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		board.setTime(sdf.format(new Date()));
		board.setImage("");

		MultipartFile file = multi.getFile("image");
		if (file.getSize() != 0) { // 클라이언트가 파일을 업로드 했다면
			// 파일의 이름
			sdf = new SimpleDateFormat("yyyyMMddHHmmss-");
			String fileTime = sdf.format(new Date());
			String fileName = file.getOriginalFilename();

//			String suffix = fileName.substring(fileName.lastIndexOf(".") + 1, fileName.length());
//			if (suffix.equalsIgnoreCase("jpeg") == false)
//				return "redirect:adminBoardModify";

			// 파일의 저장 경로
			String fileSaveDirectory = "C:\\DailyJava\\boot_workspace\\kream\\src\\main\\resources\\static\\img\\"
					+ sessionId;
			File f = new File(fileSaveDirectory);
			if (f.exists() == false) {
				f.mkdirs();
			}

			String fullPath = fileSaveDirectory + "\\" + fileTime + fileName;
			board.setImage(fullPath);
			f = new File(fullPath);
			try {
				file.transferTo(f);
			} catch (Exception e) {
				e.printStackTrace();
				board.setImage("");
			}

			/*
			 * file.transferTo(); //파일을 이동시키는 기능 <input type="file" name="upfile"> 을 사용하여
			 * 서버에 파일 데이터가 전달되면 웹서버가 임시파일로 저장을 함. 임시파일로 저장된 파일을 개발자가 원하는 경로로 이동시킬 때
			 * file.transferTo()를 사용함.
			 */
		}

		mapper.adminBoardModify(board);
		return "redirect:notice";

	}

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
            String key = "board/" + storeFileName;
            
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
