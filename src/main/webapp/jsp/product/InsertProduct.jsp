<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../default/header.jsp"%>
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
		position: relative;
	}
	.buttons{
		position: relative;
		margin-top: 8%;
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
//페이지가 로드될 때 실행될 코드
$(document).ready(function() {
    // 주 카테고리 선택 상자의 값이 변경될 때의 동작을 정의
    $('#mainCate').change(function() {
        // 주 카테고리 선택 상자에서 선택된 값을 가져옴
        var selectedMainCategory = $(this).val();
        // 하위 카테고리 선택 상자에 대한 jQuery 객체 생성
        var subCategorySelect = $('#subCate');
        // Ajax를 사용하여 서버에서 2차 카테고리 데이터를 가져오기
        $.get('getSubcategories', { "num": selectedMainCategory }, function(data) {
            // 하위 카테고리 선택 상자의 옵션을 비움
            subCategorySelect.empty();
            // 서버에서 받은 데이터를 순회하면서 하위 카테고리 옵션을 생성하고 추가
            $.each(data, function(index, subCategory) {
                subCategorySelect.append($('<option>').val(subCategory.cate2No).text(subCategory.cate2Name));
            });
        });
    });
});

</script>
<meta charset="UTF-8">
<title>상품추가</title>
</head>
<body align="center">
	<div class="buttons">
		<button type="button" onclick="window.open(
			'InsertCategory1', 'InsertCategory1', 'width=300, height=200, top=200, left=300');"
				style="position: relative;">카테고리1 등록</button>
		<button type="button" onclick="window.open(
			'InsertCategory2', 'InsertCategory2', 'width=350, height=300, top=200, left=300');"
				style="position: relative;">카테고리2 등록</button>
		<button type="button" onclick="window.open(
			'InsertBrand', 'InsertBrand', 'width=350, height=300, top=200, left=300');"
				style="position: relative;">브랜드 등록</button><br>
		<a href="list"><button>상품목록</button></a>
		<a href="auctionList"><button>경매목록</button></a>
	</div>
	
	<div align="center">
		<table class="table">
			<form action="insertProc" method="post">
				<tr>
					<th colspan="2">
						<p>상품추가</p>
					</th>
				</tr>
				<tr>
					<td>모델번호 :</td>
					<td><input type="text" name="productId"></td>
				</tr>
				<tr>
					<td>카테고리1</td>
					<td>
						<select id="mainCate" name="category1">
								<option>==선택==</option>
								<c:forEach var="cate1" items="${cate1 }">
									<option value="${cate1.cate1No }">${cate1.cate1Name }</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>카테고리2</td>
					<td>
						<select id="subCate" name="category2">
								<option>==선택==</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>브랜드</td>
					<td>
						<select name="brand">
								<option>==선택==</option>
								<c:forEach var="brand" items="${brand }">
									<option value="${brand.brandNo }">${brand.brandName }</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>상품이름(한글) :</td>
					<td><input type="text" name="nameKr"></td>
				</tr>
				<tr>
					<td>상품이름(영문) :</td>
					<td><input type="text" name="nameEn"></td>
				</tr>
				<tr>
					<td>상품설명 :</td>
					<td><textarea rows="5" cols="22" type="text" name="content"></textarea></td>
				</tr>
				<tr>
					<td>출시가격 :</td>
					<td>\ <input type="text" id="amountInput" name="firstPrice" placeholder="0"
						oninput="formatAmount(this)" required size="7"></td>
				</tr>
				<tr>
					<td>출시일 :</td>
					<td><input type="Date" name="releaseDay"></td>
				</tr>
				<tr>
					<td>색상 :</td>
					<td><input type="text" name="color"></td>
				</tr>
				<tr>
					<td>사이즈 :</td>
					<td><input type="text" name="size"></td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<input type="submit" value="추가">
					<input type="button" value="목록" onclick="location.href='list'">
					</td>
				</tr>
			</form>
		</table>
	</div>
</body>
</html>
<%@ include file="../default/footer.jsp"%>