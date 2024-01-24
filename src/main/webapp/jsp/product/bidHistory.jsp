<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../default/header.jsp"%>
<!DOCTYPE html>
<html>
<head>

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
				</tr>
				<c:forEach var="bid" items="${bid}">
					<tr>
						<%-- <td>${bid.bidNo }</td> --%>
						<td>${bid.bidMemberId }</td>
						<td onclick='openAuction(${bid.bidAuctionNo})'><b>${bid.bidAuctionNo }</b></td>
						<td>₩ &nbsp<fmt:formatNumber value="${bid.auctionBidprice}"
								pattern="#,###" />&nbsp
						</td>
						<td>&nbsp<fmt:formatDate value="${bid.auctionBidtime}"
								pattern="yyyy-MM-dd HH:mm:ss" />&nbsp
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
<div>
	<c:import url="/footer" />
</div>