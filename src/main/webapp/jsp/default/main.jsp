<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">

<div class="section">
    <input type="radio" name="slide" id="slide01" checked>
    <input type="radio" name="slide" id="slide02">
    <input type="radio" name="slide" id="slide03">
    
    <div class="slidewrap">
        <ul class="slidelist">
            <li>
                <a>
                    <label for="slide03" class="left"></label>
                    <img src="../img/auction.jpg">
                    <label for="slide02" class="right"></label>
                </a>
            </li>
            <li>
                <a>
                    <label for="slide01" class="left"></label>
                    <img src="../img/auction2.jpg">
                    <label for="slide03" class="right"></label>
                </a>
            </li>
            <li>
                <a>
                    <label for="slide02" class="left"></label>
                    <img src="../img/auction3.jpg">
                    <label for="slide01" class="right"></label>
                </a>
            </li>
        </ul>
        <ul class="slide-pagelist">
            <li><label for="slide01"></label></li>
            <li><label for="slide02"></label></li>
            <li><label for="slide03"></label></li>
        </ul>
        <!-- 왼쪽, 오른쪽 버튼 추가 -->
        <label for="slide02" class="arrow right"></label>
        <label for="slide03" class="arrow right"></label>
    </div>
</div>
