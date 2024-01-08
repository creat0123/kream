<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ include file="../default/header.jsp"%>
<link rel="icon" href="/img/A.png">
<<<<<<< HEAD
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
=======

<style>
.sidebar {
	position: absolute; /* 위치 조정 */
	top: 250px; /* 헤더 높이에 맞춤 */
	left: 150px;
	width: 110px; /* 사이드바 너비 설정 */
>>>>>>> e723f6bb593ff26df1e187fd04c57a041f239ea4
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

<<<<<<< HEAD
.content {
	margin: 0px 105px;
	text-align: center;
	width: 1500px;
	padding: 20px;
	padding-top: 170px; /* 파란색 헤더 아래 공백 */
}

=======
>>>>>>> e723f6bb593ff26df1e187fd04c57a041f239ea4
.announcement {
	text-align: center;
	margin-left: 300px;
	margin-bottom: 20px; /* 아래쪽 공간 확보 */
}

.announcement h2 {
<<<<<<< HEAD
	font-size: 24px; /* 큰 글씨 크기 */
	background-color: #f9f9f9;
	text-align: center; /* 가운데 정렬 */
	border-bottom: 1px solid #ddd;
	margin-bottom: 30px;
	width: 1220px;
	padding: 10px 0;
=======
	font-size: 24px;
    background-color: #f9f9f9;
    text-align: center;
    border-bottom: 1px solid #ddd;
    margin-bottom: 30px;
    width: 1220px;
    padding: 10px 0
>>>>>>> e723f6bb593ff26df1e187fd04c57a041f239ea4
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

<<<<<<< HEAD
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
=======
.content {
	margin: 100px 305px;
	text-align: center;
	width: 1500px;
	padding: 20px;
	padding-top: 70px; /* 파란색 헤더 아래 공백 */
	margin-left: 0px;
}

.table-container {
	width: 1300px;
	overflow-x: auto; /* 테이블이 너무 넓으면 가로 스크롤 활성화 */
}

table {
	width: 1220px;
	border-collapse: collapse;
	text-align: left;
}

th, td {
	border: 1px solid #ddd; /* 연한 회색 테두리 */
	padding: 8px;
}

thead {
	background-color: #f2f2f2; /* 연한 회색 배경 */
}

tr:nth-child(even) {
	background-color: #f9f9f9; /* 줄마다 색상을 달리하여 줄무늬 효과 */
}

.write-button {
	padding: 10px 10px;
	background-color: #87ceeb; /* 버튼 배경색 */
	color: white; /* 버튼 글자색 */
	border: none;
	border-radius: 5px; /* 버튼 모서리 둥글게 */
	cursor: pointer; /* 마우스 오버 시 커서 변경 */
	margin-left: 800px;
	margin-top: 10px;
	font-size: 16px; /* 글자 크기 */
}

.write-button:hover {
	background-color: #AABEDC; /* 마우스 오버 시 배경색 변경 */
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}

.submit_button {
	margin-left: 700px;
	cursor: pointer;
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
		<div class="table-container">
			<article>
				<b class="sc-9cc45f0-1 iAKDCP">글 목록(전체 글:${count })</b>
				<form action="notice">

					<c:choose>
						<c:when test="${empty boards }">

							<table class="listtable">

								<tr>
									<td>게시판에 저장된 글이 없습니다.</td>
								</tr>
							</table>
						</c:when>
						<c:otherwise>
							<table class="listtable">
								<tr>
									<th width="50">번호</th>
									<th width="250">제목</th>
									<th width="100">작성자</th>
									<th width="100">작성일</th>
								</tr>

								<c:forEach var="board" items="${ boards}">
									<tr>
										<td class="center">${board.no }</td>
										<td class="left" style="cursor: pointer;"
											onclick="location.href='adminBoardContent?no=${board.no }'">
											${board.title }</td>
										<td class="center">${board.id }</td>
										<td class="center">${board.time }</td>
									</tr>
								</c:forEach>
							</table>
							<div class="center" style="margin-top: 18px;">${result}</div>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${sessionScope.id eq 'admin'}">
							<span class="right">
								<button type="button" onclick="location.href='adminBoardWrite'"
									class="submit_button">글쓰기</button>
							</span>
						</c:when>
					</c:choose>
			</article>
		</div>
	</div>
</div>







>>>>>>> e723f6bb593ff26df1e187fd04c57a041f239ea4
