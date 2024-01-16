<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ include file="../default/header.jsp"%>
<link rel="icon" href="/img/A.png">

<style>

html{
	margin: 0;
	padding: 0;
	overflow-x: hidden;
}
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
	font-size: 24px;
    background-color: #f9f9f9;
    text-align: center;
    border-bottom: 1px solid #ddd;
    margin-bottom: 30px;
    width: 1220px;
    padding: 10px 0
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







