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

.board {
	margin: 0 auto; /* 수평 가운데 정렬을 위한 스타일 */
	margin-top: 140px;
}

.board input[type="text"], .board input[type="email"], .board input[type="password"],
	.board textarea {
	width: calc(100% - 30px);
	padding: 10px;
	box-sizing: border-box;
}
</style>
<div class="sidebar">
	<button onclick="location.href='notice'">공지사항</button>
	<button onclick="location.href='faq'">자주 묻는 질문</button>
	<button onclick="location.href='list'">문의하기</button>
</div>
<article>
	<form method="post" name="writeForm" action="writeProc"
		onsubmit="return writeSave()">
		<input type="hidden" name="num" value="${num }" /> <input
			type="hidden" name="ref" value="${ref }" /> <input type="hidden"
			name="step" value="${step }" /> <input type="hidden" name="depth"
			value="${depth }" />
		<table class="board">
			<tr>
				<td class="attr">*이름</td>
				<td><input type="text" name="writer" /></td>
			</tr>
			<tr>
				<td class="attr">*이메일</td>
				<td><input type="email" name="email" /></td>
			</tr>
			<tr>
				<td class="attr">*제목</td>
				<c:choose>
					<c:when test="${empty num or num == '0'}">
						<td><input class="input" type="text" name="subject" /></td>
					</c:when>
					<c:otherwise>
						<td><input class="input" type="text" name="subject"
							value="[답변]" /></td>
					</c:otherwise>
				</c:choose>
			</tr>
			<tr>
				<td class="attr">*내용</td>
				<td><textarea name="content" rows="13" cols="50"></textarea></td>
			</tr>
			<br>
			<tr>
				<td class="attr">*비밀번호</td>
				<td><input type="password" name="pass" /></td>
			</tr>
			<br>
			<tr>
				<td colspan="2" class="attr">
					<button class="custom-button" input type="submit" value="글쓰기" />글쓰기
					</button>
					<button class="custom-button" input type="reset" value="다시 작성" />다시
					작성
					</button>
				</td>
			</tr>
			</button>
			</td>
			</tr>
		</table>
	</form>
</article>
</body>
