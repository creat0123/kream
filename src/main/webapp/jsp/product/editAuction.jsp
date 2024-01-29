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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    $('#editForm').submit(function(e) {
        e.preventDefault(); // 폼 제출을 막음
		
        $.ajax({
            url: 'editAuctionProc',
            method: 'POST',
            data: $('#editForm').serialize(), // 폼 데이터 전송
            success: function(data) {
            	var msg = data.msg;
                if (msg === 'success') {
                    alert('수정완료');
                    window.close();
            		}
                else {
                    alert('오류발생');
                }
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    });
});
</script>
<meta charset="UTF-8">
<title>경매등록</title>
</head>
<body>
	<div align="center">
		<table>
			<form action="editAuctionProc" method="post" id="editForm">
				<input type="hidden" name="auctionId" value="${edit.auctionId }">
				<tr>
					<th colspan="2">
						<p>경매수정</p>
					</th>
				</tr>
				<tr>
					<td>경매번호 :</td>
					<td><input type="hidden" name="auctionNo" value="${edit.auctionNo }">${edit.auctionNo }</td>
				</tr>
				<tr>
					<td>경매 시작일 :</td>
					<td><input type="Date" name="auctionStartDay" 
							value="<fmt:formatDate value="${edit.auctionStartDay}" pattern="yyyy-MM-dd" />"></td>
				</tr>
				<tr>
					<td>경매 시작시간 :</td>
					<td><input type="time" name="auctionStartTime" value="${edit.auctionStartTime }"></td>
				</tr>
				<tr>
					<td>경매 종료일 :</td>
					<td><input type="Date" name="auctionEndDay" 
							value="<fmt:formatDate value="${edit.auctionEndDay}" pattern="yyyy-MM-dd"/>"></td>
				</tr>
				<tr>
					<td>경매 종료시간 :</td>
					<td><input type="time" name="auctionEndTime" value="${edit.auctionEndTime }"></td>
				</tr>
				<tr>
					<td>경매 시작가 :</td>
					<td>\ <!-- <input type="number" name="auctionStartPrice"> -->
					<input type="text" id="amountInput" name="auctionStartPrice" value="${edit.auctionStartPrice }"
						oninput="formatAmount(this)" required size="7"></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="window.close()">
					<input type="button" value="목록" onclick="location.href='auctionList'">
					</td>
				</tr>
			</form>
		</table>
	</div>
</body>
</html>