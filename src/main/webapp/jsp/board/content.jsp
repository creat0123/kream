<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ include file="../default/header.jsp"%>
<link rel="icon" href="/img/A.png">

<style>
.sidebar {
	position: absolute; /* 위치 조정 */
	top: 250px; /* 헤더 높이에 맞춤 */
	left: 150px;
	width: 150px; /* 사이드바 너비 설정 */
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

table {
	margin-top: 130px;
	border-collapse: collapse;
	width: 100%;
}

table, th, td {
	border: 1px solid #ccc;
}

th, td {
	padding: 8px;
	text-align: left;
	cursor: pointer
}

th {
	background-color: #f2f2f2;
}

.custom-button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #87ceeb;
	color: #fff;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	text-align: center;
	text-decoration: none;
}

.custom-button:hover {
	background-color: #AABEDC;
}

.custom-button:active {
	background-color: #87ceeb;
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
	margin: 0px 105px;
	text-align: center;
	width: 1500px;
	padding: 20px;
}
</style>

<body>
	<div class="sidebar">
		<button onclick="location.href='notice'">공지사항</button>
		<button onclick="location.href='faq'">자주 묻는 질문</button>
		<button onclick="location.href='list'">문의하기</button>
	</div>
	<div class="content">
		<div class="announcement">
			<h2>문의 내역</h2>
			<div class="table-container">
				<ul class="inquiry_list">
					<table class="board_view">
						<colgroup>
							<col width="15%">
							<col width="35%">
							<col width="15%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>글번호</th>
								<td>${board.num }</td>
								<th>조회수</th>
								<td>${board.readCount}</td>
							</tr>
							<tr>
								<th>작성자</th>
								<td>${board.writer}</td>
								<th>작성일</th>
								<td>${sdf.format(board.regDate)}</td>
							</tr>
							<tr>
								<th>글제목</th>
								<td colspan="3" class="contenttitle">${board.subject}${map.CONTENTS }</td>
							</tr>
							<tr>
								<th>글내용</th>
								<td colspan="3" class="content">${board.content }</td>
							</tr>
							<tr>
								<td colspan="4" class="attr"><button class="custom-button"
										input type="submit" value="글수정"
										onclick="document.location.href='boardUpdateForm?num=${board.num }&pageNum=${pageNum }'">글수정
									</button> &nbsp;&nbsp;&nbsp;&nbsp;
									<button class="custom-button" input type="button" value="글삭제"
										onclick="document.location.href='boardDeleteForm?num=${board.num }&pageNum=${pageNum }'">글삭제
									</button> &nbsp;&nbsp;&nbsp;&nbsp;
									<button class="custom-button" input type="button" value="글목록"
										onclick="document.location.href='list?pageNum=${pageNum }'">글목록
									</button> &nbsp;&nbsp;&nbsp;&nbsp;
									<button class="custom-button" input type="button" value="답글"
										onclick="document.location.href='writeForm?num=${board.num }&ref=${board.ref }&step=${board.step }&depth=${board.depth }'">답글달기
									</button></td>
							</tr>
						</tbody>
					</table>
				</ul>
			</div>
		</div>
	</div>
</body>
