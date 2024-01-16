<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
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

    <div class="product-container">
        <div class="product">
            <img src="/img/JJANG3.png" alt="Product 1">
            <h2>상품 1</h2>
            <p>상품 설명이 여기에 들어갑니다.</p>
            <p>가격: $20</p>        
        </div>

        <div class="product">
            <img src="/img/JJANG.png" alt="Product 2">
            <h2>상품 2</h2>
            <p>상품 설명이 여기에 들어갑니다.</p>
            <p>가격: $30</p>
        </div>
		
		 <div class="product">
            <img src="/img/JJANG3.png" alt="Product 1">
            <h2>상품 1</h2>
            <p>상품 설명이 여기에 들어갑니다.</p>
            <p>가격: $20</p>        
        </div>
        
         <div class="product">
            <img src="/img/JJANG3.png" alt="Product 1">
            <h2>상품 1</h2>
            <p>상품 설명이 여기에 들어갑니다.</p>
            <p>가격: $20</p>        
        </div>
        
         <div class="product">
            <img src="/img/JJANG3.png" alt="Product 1">
            <h2>상품 1</h2>
            <p>상품 설명이 여기에 들어갑니다.</p>
            <p>가격: $20</p>        
        </div>
        
         <div class="product">
            <img src="/img/JJANG3.png" alt="Product 1">
            <h2>상품 1</h2>
            <p>상품 설명이 여기에 들어갑니다.</p>
            <p>가격: $20</p>        
        </div>
        
         <div class="product">
            <img src="/img/JJANG3.png" alt="Product 1">
            <h2>상품 1</h2>
            <p>상품 설명이 여기에 들어갑니다.</p>
            <p>가격: $20</p>        
        </div>
        <!-- 추가 상품들을 원하는 만큼 복사하여 넣을 수 있습니다. -->

    </div>

    <footer>
        <p>&copy; 2024 쇼핑몰. All rights reserved.</p>
    </footer>
</body>
</html>
