<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script>
	function formatAmount(input) {
		// 쉼표로 천 단위 구분자 추가
		input.value = Number(input.value.replace(/[^0-9]/g, '')).toLocaleString();
	}
	// 페이지 로딩 시 초기화
	document.addEventListener("DOMContentLoaded", function() {
	  // 초기 로딩 시에도 적용되도록 호출
	  formatAmount(document.getElementById('amountInput'));
	});
</script>
<style>
	table {
		width: 30%;
		border-collapse: collapse;
	}

	th, td {
		text-align: center;
		padding: 8px;
		border: 1px solid #ddd;
	}
</style>
<meta charset="UTF-8">
<title>경매상세</title>

</head>
<body>
	<h3>경매상세</h3>
	<c:choose>
		<c:when test="${empty contents}">
			<h3>등록된 데이터가 없습니다</h3>
		</c:when>
		<c:otherwise>
			<table border="1" style="text-aligin:center;">
				<tr>
					<th>경매번호</th>
					<td>${contents.auctionNo }</td>
				</tr>
				<tr>
					<th>경매 시작일</th>
					<td><fmt:formatDate value="${contents.auctionStartDay}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>경매 시작시간</th>
					<td>${contents.auctionStartTime }</td>
				</tr>
				<tr>
					<th>경매 종료일</th>
					<td><fmt:formatDate value="${contents.auctionEndDay}" pattern="yyyy-MM-dd" /></td>
				</tr>
				<tr>
					<th>경매 종료시간</th>
					<td>${contents.auctionEndTime }</td>
				</tr>
				<tr>
					<th>경매 시작가</th>
					<td>\<fmt:formatNumber value="${contents.auctionStartPrice}" pattern="#,###" /></td>
				</tr>
				<tr>
					<th>경매 등록시간</th>
					<td><fmt:formatDate value="${contents.auctionRegist}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
				<tr>
					<th>경매 현황</th>
					<td>${contents.statusName }</td>
				</tr>
			</table>
			<b>현재 입찰가 : \<fmt:formatNumber value="${contents.auctionStartPrice}" pattern="#,###" /></b><br>
			<span class="">
				<input type="text" id="amountInput" name="firstPrice" value="${contents.auctionStartPrice}" oninput="formatAmount(this)" required size="7">원 <br>
				
				<a href="javascript:;" class="up" alt="수량증가">+5,000</a>
				<button class="up" alt="수량증가">+5,000</button><br>
				
				<button>입찰</button>
			</span>
		</c:otherwise>
	</c:choose>
	<div align="center">
		<table>
			<tr>
				<td>모델번호</td>
				<td>${contents.product.productId }</td>
			</tr>
			<tr>
				<td>카테고리1</td>
				<td>${contents.product.cate1Name }</td>
			</tr>
			<tr>
				<td>카테고리2</td>
				<td>${contents.product.cate2Name }</td>
			</tr>
			<tr>
				<td>브랜드</td>
				<td>${contents.product.brandName }</td>
			</tr>
			<tr>
				<td>상품이름(한글)</td>
				<td>${contents.product.nameKr }</td>
			</tr>
			<tr>
				<td>상품이름(영문)</td>
				<td>${contents.product.nameEn }</td>
			</tr>
			<tr>
				<td>상품설명</td>
				<td>${contents.product.content }</td>
			</tr>
			<tr>
				<td>출시가격</td>
				<td>\<fmt:formatNumber value="${contents.product.firstPrice }" pattern="#,###" /></td>
			</tr>
			<tr>
				<td>출시일</td>
				<td><fmt:formatDate value="${contents.product.releaseDay}" pattern="yyyy-MM-dd" /></td>
			</tr>
			<tr>
				<td>색상</td>
				<td>${contents.product.color }</td>
			</tr>
			<tr>
				<td>사이즈</td>
				<td>${contents.product.size }</td>
			</tr>
			<tr>
				<td align="center" colspan="2">
				<input type="button" value="취소" onclick="window.location.go(-1)">
				<input type="button" value="목록" onclick="location.href='auctionList'">
				</td>
			</tr>
		</table>
	</div>
</body>
</html>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	function formatAmount(input) {
		// 쉼표로 천 단위 구분자 추가
		input.value = Number(input.value.replace(/[^0-9]/g, '')).toLocaleString();
	}
	// 수량 변경 액션
	$(".up").on("click", function(){
		let quantity = $(this).parent("span").find("input").val();
		console.log(quantity);
		$(this).parent("span").find("input").val(++quantity);
		// "수량 증가" 버튼을 클릭하면 현재 수량을 가져와서 1 증가시킵니다.
	});
});
</script>
