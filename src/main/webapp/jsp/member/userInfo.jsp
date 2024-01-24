<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:import url="/header" />
<link rel="icon" href="/img/A.png">

<style>
.card {
	width: 800px;
	margin: 0 auto;
}

.selectBox {
	position: relative;
	text-align: center;
	width: 100px;
	height: 35px;
	border-radius: 10px;
	border: 1px solid #999;
}

.card-header1 h1 {
	font-size: 30px;
	S font-weight: 600;
}

.card-write {
	padding: 20px;
}

.btn-w1 {
	text-align: left;
	margin: 0 auto;
	padding: 10px;
}

.btn-w1 input1, button1 {
	border: none;
	background-color: #87ceeb;
	padding: 10px;
	color: #fff;
	border-radius: 10px;
}

/* 스타일 추가: 기존 스타일을 조절하거나 새로운 스타일을 추가할 수 있습니다. */
.card {
	width: 800px;
	margin: 0 auto;
}

.sidebar {
	position: absolute; /* 위치 조정 */
	top: 250px; /* 헤더 높이에 맞춤 */
	left: 450px;
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
	<button onclick="location.href='product/bidHistory'">입찰 내역</button>
	<button onclick="location.href='product/bidResult'">낙찰 내역</button>
</div>
<div style="margin-top: 100px; margin-left: 30%; text-align: left;">
	<div class="card">
		<div class="card-write">
			<tr>
				<td><font color="red">${msg}</font></td>
			</tr>
			<form action="update" method="post" id="f">
				<input type="hidden" id="id" name="id" value="${member.id}">
				<input type="hidden" id="name" name="name" value="${member.name}">
				<input type="hidden" id="email" name="email" value="${member.email}">
				<input type="hidden" id="tel" name="tel" value="${member.tel}">
				<h1>회원 정보</h1>
				<br> <br> <b>아이디 : ${member.id } <br> 이름 :
					${member.name }<br> 우편번호 : ${postcode}<br> 주소 :
					${member.address } <br> 상세주소 : ${detailAddress } <br>
					E-mail : ${member.email } <br> 전화번호 : ${member.tel }
				</b> <br> <br>
				<div class="btn-w1">
					<input type="submit" value="회원 수정">
					<button type="button"
						onclick="location.href='delete?id=${member.id }'">회원 탈퇴</button>
				</div>
			</form>
		</div>
	</div>
</div>

<%@ include file="../default/footer.jsp"%>



















