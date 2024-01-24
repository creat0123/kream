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
        var formData = new FormData(this);
        
        $.ajax({
            url: 'editProductProc',
            method: 'POST',
            data: formData,
            contentType: false,
            processData: false,
            //data: $('#editForm').serialize(), // 폼 데이터 전송
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
            	alert(xhr.status);
                console.log(error);
            }
        });
    });
    
 	// 파일 입력(input type="file")이 변경되었을때
    $('#inputImage').change(function() {
        // 파일이 선택되었을 때 이미지를 미리보기
        previewImage(this);
    });
    
    function previewImage(input) {
    	console.log('File input changed');
    	// 입력된 파일이 존재하고, 첫 번째 파일이 있는 경우에만 실행
        if (input.files && input.files[0]) {
            var reader = new FileReader();
			
            reader.onload = function(e) {
            	console.log('Image preview updated');
            	// 미리보기 이미지의 src 속성을 읽어들인 데이터 URL로 설정
                $('#previewImage').attr('src', e.target.result);
            }
         	// FileReader를 사용하여 선택된 파일을 읽어들임
            reader.readAsDataURL(input.files[0]);
        }
    }
    
});
</script>
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
<title>상품수정</title>
</head>
<body>
	<div align="center">
		<table>
			<form action="editProductProc" method="post" id="editForm" enctype="multipart/form-data">
				<input type="hidden" name="productNo" value="${edit.productNo }">
				<tr>
					<th colspan="2">
						<p>상품수정</p>
					</th>
				</tr>
				<tr>
					<td width="115px">모델번호 :</td>
					<td width="1px"><input type="text" name="productId" value="${edit.productId }"></td>
				</tr>
				<tr>
					<td>카테고리1</td>
					<td>
						<select id="mainCate" name="category1">
								<option value="${edit.category1 }">==${edit.cate1Name }==</option>
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
								<option value="${edit.category2 }">==${edit.cate2Name }==</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>브랜드</td>
					<td>
						<select name="brand">
								<option value="${edit.brand }">==${edit.brandName }==</option>
								<c:forEach var="brand" items="${brand }">
									<option value="${brand.brandNo }">${brand.brandName }</option>
								</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>상품이름(한글) :</td>
					<td><input type="text" name="nameKr" value="${edit.nameKr }"></td>
				</tr>
				<tr>
					<td>상품이름(영문) :</td>
					<td><input type="text" name="nameEn" value="${edit.nameEn }"></td>
				</tr>
				<tr>
					<td>상품설명 :</td>
					<td><textarea rows="5" cols="22" type="text" name="content"">${edit.content }</textarea></td>
				</tr>
				<tr>
					<td>출시가격 :</td>
					<td>₩ <input type="text" id="amountInput" name="firstPrice" value="${edit.firstPrice }"
						oninput="formatAmount(this)" required size="7"></td>
				</tr>
				<tr>
					<td>출시일 :</td>
					<td><input type="Date" name="releaseDay" 
							value="<fmt:formatDate value="${edit.releaseDay}" pattern="yyyy-MM-dd" />"></td>
				</tr>
				<tr>
					<td>색상 :</td>
					<td><input type="text" name="color" value="${edit.color }"></td>
				</tr>
				<tr>
					<td>사이즈 :</td>
					<td><input type="text" name="size" value="${edit.size }"></td>
				</tr>
				<tr>
					<td>사진 :</td>
					<td><input type="file" name="imageFile" id="inputImage">
						<!-- 기존 이미지 미리보기 -->
        				<img id="previewImage" src="<c:if test="${not empty edit.image}">https://asta-s3.s3.ap-northeast-2.amazonaws.com/image/${edit.image}</c:if>" alt="Product Image" style="max-width: 200px; max-height: 200px;">
					</td>
				</tr>
				<tr>
					<td align="center" colspan="2">
					<input type="submit" value="수정">
					<input type="button" value="취소" onclick="window.close()">
					<input type="button" value="목록" onclick="location.href='list'">
					</td>
				</tr>
			</form>
		</table>
	</div>
</body>
</html>