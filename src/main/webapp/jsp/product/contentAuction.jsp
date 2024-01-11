<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../default/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	// 경매 시작일시를 JavaScript Date 객체로 변환
	//var auctionStartDateTime = new Date('${contents.auctionStartDay}T${contents.auctionStartTime}');
	// 경매 종료일시를 JavaScript Date 객체로 변환
	//var auctionEndDateTime = new Date('${contents.auctionEndDay}T${contents.auctionEndTime}');
	// 현재 시간을 JavaScript Date 객체로 가져오기
	//var currentDateTime = new Date();
	
	//console.log('${contents.auctionStartDay}');
	//console.log('${contents.auctionStartTime}');
	//console.log('${contents.auctionStartDay} T ${contents.auctionStartTime}');
	//console.log(auctionStartDateTime);
	//console.log(auctionEndDateTime);
	//console.log(currentDateTime);
	
	
	/* // 경매가 이미 시작되었는지 확인
    if (currentDateTime < auctionStartDateTime) {
        // 경매가 아직 시작되지 않은 경우, 입찰 폼을 비활성화
        $('#bidForm input[type="text"]').prop('disabled', true);
        $('#submit').prop('disabled', true);
        alert('이 경매는 아직 시작되지 않았습니다.');
    } else if (currentDateTime >= auctionEndDateTime) {
        // 경매가 이미 종료된 경우, 입찰 폼을 비활성화
        $('#bidForm input[type="text"]').prop('disabled', true);
        $('#submit').prop('disabled', true);
        alert('이 경매는 이미 종료되었습니다.');
    } */
	
    $('#bidForm').submit(function(e) {
        e.preventDefault(); // 폼 제출을 막음
		
        $.ajax({
            url: 'auctionBid',
            method: 'POST',
            data: $('#bidForm').serialize()+'&no='+${contents.auctionNo }, // 폼 데이터 전송
            success: function(data) {
            	var msg = data.msg;
                if (msg === 'success') {
                    alert('입찰성공');
                    location.reload();
            	}else if (msg === 'over') {
            		alert('현재 입찰가보다 높은금액을 입력해주세요');
            		location.reload();
            	}else if (msg === 'login') {
            		alert('로그인을 해주세요');
            		location.href="/login";
            	}else {
                    alert('오류발생');
                }
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    });
});
</script>
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
	<br><br><br><br><br><br>
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
					<td>₩<fmt:formatNumber value="${contents.auctionStartPrice}" pattern="#,###" /></td>
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
			<%-- <fmt:formatNumber value="${contents.auctionStartPrice}" pattern="#,###" /> --%>
			<b>현재 입찰가 : ₩<fmt:formatNumber value="${max == 0 ? contents.auctionStartPrice : max}" pattern="#,###" /></b><br>
			<form action="auctionBid" method="post" id="bidForm">
				<input type="hidden" name="bidAuctionNo" value="${contents.auctionNo }">
				<input type="hidden" name="bidMemberId" value="${sessionScope.id }">
				<input type="text" id="amountInput" name="auctionBidprice" 
					value="${max == 0 ? contents.auctionStartPrice : max}" oninput="formatAmount(this)" required size="7">원
				
				<button class="reset" type="button">초기화</button>
   				<button id="submit" type="submit">입찰</button><br>
			</form>
			
			<button class="up1000" alt="수량증가">+1,000</button>
			<button class="up5000" alt="수량증가">+5,000</button>
			<button class="up10000" alt="수량증가">+10,000</button>
			<button class="up50000" alt="수량증가">+50,000</button><br>
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
				<td>₩<fmt:formatNumber value="${contents.product.firstPrice }" pattern="#,###" /></td>
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
<c:import url="/footer" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 함수로 입찰가 증가값 조정
	function updateQuantity(inputField, increaseBy) {
	    let quantityStr = inputField.val();
	    // 숫자 추출
	    let currentQuantity = Number(quantityStr.replace(/[^0-9]/g, '')); 
	    // Parameter에 따라 증가값 동적으로 변경
	    let newQuantity = currentQuantity + increaseBy;
		// 쉼표 추가
	    let formattedQuantity = newQuantity.toLocaleString(); 
	    // "수량 증가" 버튼을 클릭하면 현재 수량을 가져와서 increaseBy을 더한 후 쉼표가 포함된 문자열로 다시 설정
	    inputField.val(formattedQuantity);
	}
	// 수량 변경 액션
	$(".up1000").on("click", function(){
		let inputField = $("#amountInput");
		updateQuantity(inputField, 1000);
	});
	$(".up5000").on("click", function(){
		let inputField = $("#amountInput");
		updateQuantity(inputField, 5000);
	});
	$(".up10000").on("click", function(){
		let inputField = $("#amountInput");
		updateQuantity(inputField, 10000);
	});
	$(".up50000").on("click", function(){
		let inputField = $("#amountInput");
		updateQuantity(inputField, 50000);
	});
	
	// 초기화
	$(".reset").on("click", function() {
		//location.reload(true);
        let inputField = $("#amountInput");
        let reset = ${max == 0 ? contents.auctionStartPrice : max};
        inputField.val(reset.toLocaleString());
    });
	
});
</script>
