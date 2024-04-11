<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ include file="../default/header.jsp"%>
<link rel="icon" href="/img/A.png">

<script>
	function deleteCheck() {
		result = confirm('진짜로 삭제하겠습니까?');
		if (result == true) {
			location.href = "adminBoardDeleteProc?no=${board.no}"
		}
	}
</script>
<style>
.sidebar {
	position: absolute; /* 위치 조정 */
	top: 250px; /* 헤더 높이에 맞춤 */
	left: 150px;
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

.announcement {
	text-align: center;
	margin-left: 300px;
	margin-bottom: 20px; /* 아래쪽 공간 확보 */
}

.announcement h2 {
	font-size: 24px; /* 큰 글씨 크기 */
	background-color: #f9f9f9;
	text-align: center; /* 가운데 정렬 */
	border-bottom: 1px solid #ddd;
	margin-bottom: 30px;
	width: 930px;
	padding: 10px 0;
}

.announcement-title {
	cursor: pointer;
	padding: 10px;
	background-color: #f9f9f9;
	border: none;
	text-align: left;
	width: 100%;
	border-bottom: 1px solid #ddd; /* 각 제목 아래에 선을 추가합니다. */
}

.announcement-title:hover {
	background-color: #e9e9e9;
}

.content {
	margin: 100px 200px;
	text-align: center;
	width: 1500px;
	padding: 20px;
	padding-top: 70px; /* 파란색 헤더 아래 공백 */
}

.box1 {
	font-size: 15px;
	border: 1px solid #f9f9f9;
	border-collapse: collapse;
	margin-top: 100px;
	line-height: 20px;
}

.box1 img {
	max-width: 900px;
	margin: 0 auto;
}

.box1 th, td {
	border: 1px solid #f9f9f9;
}

.box1 th {
	width: 150px;
	height: 40px;
	background: #626363;
	color: #f9f9f9;
}

.box1 td {
	width: 270px;
	height: 40px;
}

.main_box {
	width: 930px;
	margin-left: 300px;
	margin-top: 50px;
	border: 1px solid #424242;
	border-radius: 5px 5px 5px 5px;
	text-align: left;
}

.ask_box {
	width: 930px;
	margin: 0 auto;
	margin-top: 50px;
}

.title, .user, .time {
	border-bottom: 1px solid #dedede;
	height: 45px;
	padding-left: 27px;
	font-size: 15px;
	line-height: 45px;
}

.contents {
	padding: 27px;
	font-size: 15px;
}

.contents img {
	display: block;
	margin: 0 auto;
	max-width: 880px
}

.button_bar {
	margin: 0 auto;
	width: 300px;
	margin-bottom: 15px;
	text-align: center;
}

.button_bar button {
	color: #f9f9f9;
	width: 65px;
	height: 30px;
	border-radius: 4px;
	border: 1px solid #87ceeb;
	background: #87ceeb;
	padding-left: 10px;
}
</style>

<div class="sidebar">
	<button onclick="location.href='notice'">공지사항</button>
	<button onclick="location.href='faq'">자주 묻는 질문</button>
	<button onclick="location.href='list'">문의하기</button>
</div>
<div class="content">
	<div class="announcement">
		<h2>공지사항</h2>
	</div>
	<div class="main_box">
		<div class="title">
			<span style="color: #424242; font-weight: 500;">제목 :</span>
			${board.title }
		</div>
		<div class="user">
			<span style="color: #424242; font-weight: 500;">작성자 : </span>${board.id }
		</div>
		<div class="time">
			<span style="color: #424242; font-weight: 500;">작성일 : </span>${board.time }
		</div>
		<div class="contents">
			<c:if test="${board.image != null}">
				<img src="https://****/****/${board.image}">
				<br>
			</c:if>
			${sessionScope.viewGetContent }
		</div>
		<div class="button_bar">
			<button type="button" style="cursor: pointer;"
				onclick="location.href='notice'">목록</button>
			<c:choose>
				<c:when test="${sessionScope.id eq 'admin'}">
					<button type="button"
						onclick="location.href='adminBoardModify?no=${board.no }'">수정</button>
					<button type="button" onclick="deleteCheck()">삭제</button>
				</c:when>
			</c:choose>
		</div>
	</div>
</div>

<%@ include file="../default/footer.jsp"%>
