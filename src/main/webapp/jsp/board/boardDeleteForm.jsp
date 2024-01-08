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

.custom-button {
	display: inline-block;
	padding: 10px 20px;
	background-color: #87ceeb;
	color: #fff;
	border: none;
	border-radius: 5px;
	cursor: pointer;
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

.deletetable {
	width: 300px; /* 필요한 경우에 따라 테이블의 너비를 조절하세요 */
	padding: 20px;
	margin-left: 800px;
	margin-top: 100px;
}

.deletetable input[type="password"] {
	width: 120px;
	padding: 10px;
}
</style>
<div class="sidebar">
	<button onclick="location.href='notice'">공지사항</button>
	<button onclick="location.href='faq'">자주 묻는 질문</button>
	<button onclick="location.href='list'">문의하기</button>
</div>

<article>
	<form method="post" action="boardDeleteProc?pageNum=${pageNum }">
		<table class="deletetable">
			<tr>
				<th><b>비밀번호를 입력 해 주세요.</b></th>
			</tr>
			<tr>
				<td>비밀번호 : <input type="password" name="pass" /> <input
					type="hidden" name="num" value="${num }">
				</td>
			</tr>
			<tr>
				<td colspan="2" class="attr">
					<button class="custom-button" input type="submit" value="글삭제" />글삭제
					</button>
					<button class="custom-button" input type="button" value="글목록"
						onclick="document.location.href='list?pageNum=${pageNum}'" />글목록
					</button>
				</td>
			</tr>
		</table>
	</form>
</article>