<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
    $('#insertForm').submit(function(e) {
    	e.preventDefault(); // 폼 제출을 막음
        
        $.ajax({
            url: 'InsertBrandProc',
            method: 'POST',
            data: $('#insertForm').serialize(), // 폼 데이터 전송
            success: function(data) {
            	var msg = data.msg;
                if (msg === 'success') {
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
<title>브랜드</title>
</head>
<body>
	<div align="center">
		<table>
			<form action="InsertBrandProc" method="post" id="insertForm">
				<tr><th>
					<p>브랜드</p>
				</th></tr>
				<tr><td>
					이름 : <input type="text" name="brandName"><br>
				</td></tr>
				<tr><td align="center">
					<input type="submit" value="추가">
					<input type="button" value="목록" onclick="location.href='brandList'">
				</td></tr>
			</form>
		</table>
	</div>
</body>
</html>