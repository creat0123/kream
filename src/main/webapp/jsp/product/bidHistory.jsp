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
	<h3 align="center">입찰내역</h3>
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
					<th>입찰금액</th>
					<th>입찰시간</th>
					
					<th>경매 현황</th>
				</tr>
				<c:forEach var="bid" items="${bid}">
					<tr>
						<%-- <td>${bid.bidNo }</td> --%>
						<td>${bid.bidMemberId }</td>
						<td onclick='openAuction(${bid.bidAuctionNo})'><b>${bid.bidAuctionNo }</b></td>
						<td>₩ &nbsp<fmt:formatNumber value="${bid.auctionBidprice}" pattern="#,###" />&nbsp</td>
						<td>&nbsp<fmt:formatDate value="${bid.auctionBidtime}" pattern="yyyy-MM-dd HH:mm:ss" />&nbsp</td>
						
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