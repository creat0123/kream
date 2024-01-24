<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../default/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script src="https://cdn.iamport.kr/v1/iamport.js"></script>

<script type="text/javascript">
	function openAuction(auctionNo) {
		window.location.href = 'contentAuction?no=' + auctionNo;
	}
</script>

<script>
IMP.init("imp81866635");

function requestPay(memberId, auctionNo, productName, maxBidPrice, bidTime) {
    IMP.request_pay({
        pg: "nice",
        pay_method: "card",
        merchant_uid: auctionNo + new Date().getTime(), // 고유한 거래번호 생성
        name: productName,
        amount: maxBidPrice,
        buyer_name: memberId,
    }, function (rsp) { // 콜백 함수
        if (rsp.success) {
            console.log(rsp);
            alert("결제가 완료되었습니다.");
            window.location.href = 'http://localhost/userInfo';
        } else {
            console.log(rsp);
            alert("결제에 실패했습니다.");
        }
    });
}    
</script>

<style>
.sidebar {
	position: absolute; /* 위치 조정 */
	top: 150px; /* 헤더 높이에 맞춤 */
	left: 350px;
	width: 110px; /* 사이드바 너비 설정 */
	background-color: #f1f1f1;
	padding: 20px;
	display: flex;
	flex-direction: column;
}

.sidebar button {
	background-color: #f1f1f1;
	border: none;
	padding: 5px;
	margin-bottom: 5px;
	width: 100%;
	text-align: left;
	cursor: pointer;
}

.sidebar button:hover {
	background-color: #ddd;
}
</style>


<div class="sidebar">
	<button onclick="location.href='bidHistory'">입찰 내역</button>
	<button onclick="location.href='bidResult'">낙찰 내역</button>
</div>

</head>
<body>
	<h3 align="center">낙찰내역</h3>
	<c:choose>
		<c:when test="${empty bid}">
			<h3>등록된 데이터가 없습니다</h3>
		</c:when>
		<c:otherwise>
			<table border="1" align="center">
				<tr>
					<!-- <th>고유번호</th> -->
					<th>회원아이디</th>
					<th>경매번호</th>
					<th>상품명(한글)</th>
					<th>낙찰금액</th>
					<th>입찰시간</th>
					<th></th>
				</tr>
				<c:forEach var="bid" items="${bid}">
					<tr>
						<%-- <td>${bid.bidNo }</td> --%>
						<td>${bid.progress.bidMemberId }</td>
						<td onclick='openAuction(${bid.progress.bidAuctionNo})'><b>${bid.progress.bidAuctionNo }</b></td>
						<td>${bid.product.nameKr}</td>
						<td>₩ &nbsp<fmt:formatNumber
								value="${bid.progress.maxBidprice}" pattern="#,###" />&nbsp
						</td>
						<td>&nbsp<fmt:formatDate
								value="${bid.progress.auctionBidtime}"
								pattern="yyyy-MM-dd HH:mm:ss" />&nbsp
						</td>

						<td>
							<button
								onclick="requestPay('${bid.progress.bidMemberId}', '${bid.progress.bidAuctionNo}', '${bid.product.nameKr}', ${bid.progress.maxBidprice}, '${bid.progress.auctionBidtime}')">결제하기</button>
						</td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<br>
		</c:otherwise>
	</c:choose>
</body>
</html>

<c:import url="/footer" />