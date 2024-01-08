<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ include file="../default/header.jsp"%>
<link rel="icon" href="/img/A.png">
<html>
<head>
<style>
body {
	margin: 0px;
	padding: 0;
	font-family: Arial, sans-serif;
}

.sidebar {
	position: absolute; /* 위치 조정 */
	top: 191px; /* 헤더 높이에 맞춤 */
	left: 150px;
	width: 150px; /* 사이드바 너비 설정 */
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

.content {
	margin: 0px 105px;
	text-align: center;
	width: 1500px;
	padding: 20px;
	padding-top: 170px; /* 파란색 헤더 아래 공백 */
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
	width: 1220px;
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

.announcement-content {
	display: none;
	padding: 10px;
	margin-bottom : 30px;
	background-color: #f9f9f9;
	border-top: 1px solid #ddd;
}

.announcement-title:last-child {
	border-bottom: none;
}

.back-to-list {
	display: block;
	text-align: center;
	margin-top: 10px;
	padding: 5px;
	background-color: #d9d9d9;
	cursor: pointer;
}

.back-to-list:hover {
	background-color: #c9c9c9;
}
</style>
<script>
	function toggleContent(id) {
		var content = document.getElementById(id);
		if (content.style.display === 'block') {
			content.style.display = 'none';
		} else {
			content.style.display = 'block';
		}
	}
</script>
</head>
<body>
	<div class="sidebar">
		<button onclick="location.href='notice'">공지사항</button>
		<button onclick="location.href='faq'">자주 묻는 질문</button>
		<button onclick="location.href='list'">문의하기</button>
	</div>
	<div class="content">
		<div class="announcement">
			<h2>공지사항</h2>

			<div class="announcement-title"
				onclick="toggleContent('announcement1')">공지사항 제목 1</div>
			<div class="announcement-content" id="announcement1">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement1')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement2')">공지사항 제목 2</div>
			<div class="announcement-content" id="announcement2">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement2')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement3')">공지사항 제목 3</div>
			<div class="announcement-content" id="announcement3">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement3')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement4')">공지사항 제목 4</div>
			<div class="announcement-content" id="announcement4">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement4')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement5')">공지사항 제목 5</div>
			<div class="announcement-content" id="announcement5">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement5')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement6')">공지사항 제목 6</div>
			<div class="announcement-content" id="announcement6">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement6')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement7')">공지사항 제목 7</div>
			<div class="announcement-content" id="announcement7">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement7')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement8')">공지사항 제목 8</div>
			<div class="announcement-content" id="announcement8">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement8')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement9')">공지사항 제목 9</div>
			<div class="announcement-content" id="announcement9">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement9')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement10')">공지사항 제목 10</div>
			<div class="announcement-content" id="announcement10">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement10')">목록</span>
			</div>
		</div>
	</div>
</body>
</html>
