<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file="../default/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	function openAuction(auctionNo) {
		window.location.href = 'contentAuction?no=' + auctionNo;
	}
</script>
<meta charset="UTF-8">
<title>경매목록</title>
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
					<!-- <th>회원아이디</th> -->
					<th>번호</th>
					<th>상품이름</th>
					<th>입찰금액</th>
					<th>입찰시간</th>
					<th>결제</th>
				</tr>
				<c:forEach var="bid" items="${bid}">
					<tr>
						<%-- <td>${bid.progress.bidMemberId }</td> --%>
						<td onclick='openAuction(${bid.progress.bidAuctionNo})'><b>${bid.progress.bidAuctionNo }</b></td>
						<td onclick='openAuction(${bid.progress.bidAuctionNo})'><b>${bid.product.nameKr }</b></td>
						<td>₩ &nbsp<fmt:formatNumber value="${bid.progress.maxBidprice}" pattern="#,###" />&nbsp</td>
						<td>&nbsp<fmt:formatDate value="${bid.progress.auctionBidtime}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp</td>
						<td><button value="${bid.progress.maxBidprice }">결제</button></td>
					</tr>
				</c:forEach>
			</table>
			<br><br>
		</c:otherwise>
	</c:choose>
</body>
</html>
<div>
	<c:import url="/footer"/>
</div>