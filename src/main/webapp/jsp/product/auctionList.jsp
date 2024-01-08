<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	function openEditAuction(auctionNo) {
		window.open('editAuction?no=' + auctionNo, 'EditAuction', 'width=520, height=400, top=150, left=700');
	}
	function deleteCheck(auctionNo) {
		result = confirm('진짜로 삭제하겠습니까?');
		if(result == true){
			$.ajax({
                url: 'deleteAuction?no=' + auctionNo,
                type: 'DELETE',
                success: function(data) {
                	var msg = data.msg;
                    if (msg === 'success') {
                    	alert("삭제성공");
                    	window.location.href='auctionList';
                    }
                    else {
                        alert('오류가 발생했습니다.');
                    }
                },
                error: function (xhr, status, error) {
                	alert(xhr.status);
                	console.log(error);
                }
            });
		}
	}
	function openAuction(productNo) {
		window.location.href = 'contentAuction?no=' + productNo;
	}
</script>
<meta charset="UTF-8">
<title>경매목록</title>
</head>
<body>
	<h3>경매목록</h3>
	<c:choose>
		<c:when test="${empty auction}">
			<h3>등록된 데이터가 없습니다</h3>
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>경매번호</th>
					<th>경매 시작일</th>
					<th>경매 시작시간</th>
					<th>경매 종료일</th>
					<th>경매 종료시간</th>
					<th>경매 시작가</th>
					<th>경매 등록시간</th>
					<th>경매 현황</th>
					<th>수정</th>
					<th>삭제</th>
				</tr>
				<c:forEach var="auction" items="${auction}">
					<tr>
						<td onclick='openAuction(${auction.auctionNo})'>${auction.auctionNo }</td>
						<td><fmt:formatDate value="${auction.auctionStartDay}" pattern="yyyy-MM-dd" /></td>
						<td>${auction.auctionStartTime }</td>
						<td><fmt:formatDate value="${auction.auctionEndDay}" pattern="yyyy-MM-dd" /></td>
						<td>${auction.auctionEndTime }</td>
						<td>\<fmt:formatNumber value="${auction.auctionStartPrice}" pattern="#,###" /></td>
						<td><fmt:formatDate value="${auction.auctionRegist}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${auction.statusName }</td>
						<td><button onclick="openEditAuction(${auction.auctionNo})" style="position: relative;">edit</button></td>
						<td><button onclick="deleteCheck(${auction.auctionNo})">delete</button></td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>