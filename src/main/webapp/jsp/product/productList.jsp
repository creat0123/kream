<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	function openEditAuction(productNo) {
		window.open('editProduct?no=' + productNo, 'EditProduct', 'width=520, height=600, top=150, left=700');
	}
	function openAddAuction(productNo) {
		window.open('addAuction?no=' + productNo, 'AddAuction', 'width=520, height=400, top=150, left=700');
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
	<h3>상품목록</h3>
	<c:choose>
		<c:when test="${empty product}">
			<h3>등록된 데이터가 없습니다</h3>
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>상품번호</th>
					<th>모델번호</th>
					<th>카테고리1</th>
					<th>카테고리2</th>
					<th>브랜드</th>
					<th>상품이름(한글)</th>
					<th>상품이름(영어)</th>
					<th>상품설명</th>
					<th>출시가격</th>
					<th>출시일</th>
					<th>상품 등록일</th>
					<th>색상</th>
					<th>사이즈</th>
					<th>수정</th>
					<th>삭제</th>
					<th>경매등록</th>
				</tr>
				<c:forEach var="product" items="${product}">
					<tr>
						<td>${product.productNo }</td>
						<td>${product.productId }</td>
						<td>${product.cate1Name }</td>
						<td>${product.cate2Name }</td>
						<td>${product.brand }</td>
						<td>${product.nameKr }</td>
						<td>${product.nameEn }</td>
						<td>${product.content }</td>
						<td><fmt:formatNumber value="${product.firstPrice}" pattern="#,###" /></td>
						<td><fmt:formatDate value="${product.releaseDay}" pattern="yyyy-MM-dd" /></td>
						<td><fmt:formatDate value="${product.registDay}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
						<td>${product.color }</td>
						<td>${product.size }</td>
						<td><button onclick="openEditAuction(${product.productNo})" style="position: relative;">edit</button></td>
						<td><button onclick="deleteCheck(${product.productNo})">delete</button></td>
						<%-- <td><button onclick="openAddAuction(${product.productNo})">등록</button></td> --%>
						<td><a href="addAuction?no=${product.productNo }">등록</a></td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>