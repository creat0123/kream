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
	function openEditAuction(productNo) {
		window.open('editProduct?no=' + productNo, 'EditProduct', 'width=470, height=700, top=150, left=700');
	}
	function openAddAuction(productNo) {
		window.open('addAuction?no=' + productNo, 'AddAuction', 'width=550, height=400, top=150, left=700');
	}
	function deleteCheck(productNo) {
		result = confirm('진짜로 삭제하겠습니까?');
		if(result == true){
			$.ajax({
                url: 'deleteProduct?no=' + productNo,
                type: 'DELETE',
                success: function(data) {
                	var msg = data.msg;
                    if (msg === 'success') {
                    	alert("삭제성공");
                    	window.location.href='list';
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
</script>

<meta charset="UTF-8">
<title>상품목록</title>
</head>
<body>
	<h3 align="center">상품목록</h3>
	<div align="center">
		<div class="buttons" style="text-align: left; margin-left: 20%;">
			<button type="button" onclick="window.open(
				'InsertCategory1', 'InsertCategory1', 'width=300, height=200, top=200, left=300');"
					style="position: relative;">카테고리1 등록</button>
			<button type="button" onclick="window.open(
				'InsertCategory2', 'InsertCategory2', 'width=350, height=300, top=200, left=300');"
					style="position: relative;">카테고리2 등록</button>
			<button type="button" onclick="window.open(
				'InsertBrand', 'InsertBrand', 'width=350, height=300, top=200, left=300');"
					style="position: relative;">브랜드 등록</button>
		</div>
		<div class="buttons" style="text-align: right; margin-right: 20%; margin-bottom: 10px; margin-top:-24px;">
			<a href="insert"><button>상품등록</button></a>
			<a href="auctionList"><button>경매목록</button></a>
		</div>
	</div>
	<c:choose>
		<c:when test="${empty product}">
			<h3>등록된 데이터가 없습니다</h3>
		</c:when>
		<c:otherwise>
			<table border="1" align="center" style="text-align: center;">
				<tr>
					<th style="width: 40px;">상품번호</th>
					<th>모델번호</th>
					<th>카테고리</th>
					<th>브랜드</th>
					<th style="width: 120px;">상품이름</th>
					<th style="width: 150px;">상품설명</th>
					<th>출시가격</th>
					<th>출시일</th>
					<th style="width: 90px;">상품 등록일</th>
					<th>색상</th>
					<th>사이즈</th>
					<th style="width: 200px;">사진</th>
					<th>수정</th>
					<th>삭제</th>
					<th>경매등록</th>
				</tr>
				<c:forEach var="product" items="${product}">
					<tr>
						<td>${product.productNo }</td>
						<td>${product.productId }</td>
						<td>${product.cate1Name } / ${product.cate2Name }</td>
						<td>${product.brandName }</td>
						<td style="font-size: 14px;">${product.nameKr }<br>(${product.nameEn })</td>
						<td style="font-size: 12px;">${product.content }</td>
						<td><fmt:formatNumber value="${product.firstPrice}" pattern="#,###" />원</td>
						<td><fmt:formatDate value="${product.releaseDay}" pattern="yyyy/MM/dd" /></td>
						<td><fmt:formatDate value="${product.registDay}" pattern="yyyy/MM/dd HH:mm:ss" /></td>
						<td>${product.color }</td>
						<td>${product.size }</td>
						<td><%-- ${product.image } --%>
							<%-- <img th:src="@{/img/product/ + ${product.image}}" alt="Product Image" /> --%>
							<%-- <img src="/img/product/${product.image}" alt="Product Image" /> --%>
							<img src="https://****/****/${product.image }"
								alt="Product Image" width="200px"/>
						</td>
						<td><button onclick="openEditAuction(${product.productNo})" style="position: relative;">edit</button></td>
						<td><button onclick="deleteCheck(${product.productNo})">delete</button></td>
						<%-- <td><button onclick="openAddAuction(${product.productNo})">등록</button></td> --%>
						<td><a href="addAuction?no=${product.productNo }">등록</a></td>
					</tr>
				</c:forEach>
			</table>
			<br><br>
		</c:otherwise>
	</c:choose>
</body>
<div>
	<c:import url="/footer"/>
</div>
</html>
