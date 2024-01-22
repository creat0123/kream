<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script type="text/javascript">
	function openEditAuction(auctionNo) {
		window.open('editAuction?no=' + auctionNo, 'EditAuction', 'width=520, height=400, top=150, left=700');
	}
</script>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>쇼핑몰 상품 페이지</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
		header {
			text-align: center;
		}

        .product-container {
            display: flex;
            justify-content: space-between;
            flex-wrap: wrap;
            padding: 20px;
        }

        .product {
            width: 23%;
            background-color: #fff;
            margin: 10px;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .product img {
            max-width: 100%;
            height: 400px;
        }

        footer {
            background-color: #333;
            color: #fff;
            padding: 10px;
            text-align: center;
        }
    </style>
</head>
<body>
<div>
	<c:import url="/header"/>
</div>
    <header>
        <h1>경매 상품 페이지</h1>
    </header>
<%-- <tr>
	<td onclick='openAuction(${auction.auctionNo})'>${auction.auctionNo }</td>
	<td onclick='openAuction(${auction.auctionNo})'>${auction.product.nameKr} | ${auction.product.color} | ${auction.product.size}</td>
	<td><fmt:formatDate value="${auction.auctionStartDay}" pattern="yyyy-MM-dd" /></td>
	<td><fmt:formatDate value="${auction.auctionEndDay}" pattern="yyyy-MM-dd" /></td>
	<td>${auction.auctionStartTime } ~ ${auction.auctionEndTime }</td>
	<td>₩<fmt:formatNumber value="${auction.auctionStartPrice}" pattern="#,###" /></td>
	<td><fmt:formatDate value="${auction.auctionRegist}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	<td>${auction.statusName }</td>
	<td><button onclick="openEditAuction(${auction.auctionNo})" style="position: relative;">edit</button></td>
	<td><button onclick="deleteCheck(${auction.auctionNo})">delete</button></td>
</tr> --%>
    <div class="product-container">
	<c:forEach var="auction" items="${auction}">
        <div class="product">
            <!-- <img src="/img/JJANG3.png" alt="Product 1"> -->
            <%-- <img src="/img/product/${auction.product.image}" alt="Product Image" onclick='openAuction(${auction.auctionNo})'> /> --%>
            <a href="contentAuction?no=${auction.auctionNo }">
			    <img src="/img/product/${auction.product.image}" alt="Product Image">
			</a>
            <h2>${auction.product.nameKr }</h2>
            <h5>${auction.product.nameEn }</h5>
            <p>${auction.product.brandName }</p>
            <p>상품 출시가: <fmt:formatNumber value="${auction.product.firstPrice}" pattern="#,###" /></p>
        </div>
	</c:forEach>

    </div>

    <footer>
        <p>&copy; 2024 쇼핑몰. All rights reserved.</p>
    </footer>
</body>
</html>
