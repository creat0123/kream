<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	table {
		border: 1px solid #000; /* 테두리 폭, 스타일, 색상 순서대로 설정 */
		margin: 20px; /* 상하좌우 20px의 외부 여백 설정 */
		border-collapse: collapse; /* 테두리 충돌 모델 설정 */
		border-collapse: separate; /* 테두리 분리 모델 설정 */
    	border-spacing: 5px; /* 셀 간격 설정 */
    	border-radius: 10px; /* 테두리 둥글게 만들기 */
    	box-shadow: 3px 3px 5px #888888; /* 그림자 설정 */
	}
</style>
<script>
	function formatAmount(input) {
		// 쉼표로 천 단위 구분자 추가
		input.value = Number(input.value.replace(/[^0-9]/g, '')).toLocaleString();
	}
</script>
<meta charset="UTF-8">
<title>경매등록</title>
</head>
<body>
	<div align="center">
		<table>
			<form action="addAuctionProc" method="post">
				<tr>
					<th colspan="2">
						<p>경매등록</p>
					</th>
				</tr>
				<tr>
					<td>상품번호 :</td>
					<td><input type="hidden" name="auctionId" value="${no }">${no }</td>
				</tr>
				<tr>
					<td>경매 시작일 :</td>
					<td><input type="Date" name="auctionStartDay"></td>
				</tr>
				<tr>
					<td>경매 시작시간 :</td>
					<td><input type="time" name="auctionStartTime"></td>
				</tr>
				<tr>
					<td>경매 종료일 :</td>
					<td><input type="Date" name="auctionEndDay"></td>
				</tr>
				<tr>
					<td>경매 종료시간 :</td>
					<td><input type="time" name="auctionEndTime"></td>
				</tr>
				<tr>
					<td>경매 시작가 :</td>
					<td>\ <!-- <input type="number" name="auctionStartPrice"> -->
					<input type="text" id="amountInput" name="auctionStartPrice" oninput="formatAmount(this)" required></td>
				</tr>
				<tr>
					<td>경매 현황 :</td>
					<td>
						<select name="auctionStatus">
							<option>==선택==</option>
							<c:forEach var="status" items="${status }">
								<option value="${status.statusNo }">${status.statusName }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<input type="submit" value="추가">
					<input type="button" value="취소" onclick="window.history.go(-1)">
					<input type="button" value="목록" onclick="location.href='auctionList'">
					</td>
				</tr>
			</form>
		</table>
	</div>
</body>
</html>