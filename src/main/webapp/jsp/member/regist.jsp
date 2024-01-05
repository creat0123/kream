
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/js/dbQuiz.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<style>
.card{width: 800px; margin: 0 auto;}
.selectBox {
		  position: relative;
		  text-align:center;
		  width: 100px;
		  height: 35px;
		  border-radius: 10px;
		  border: 1px solid #999;
		}
.card-header1 h1{
	font-size: 30px;
	font-weight: 600;
}

.card-write{
	padding: 20px;
}
.card-write input, texarea{
	margin-left: 10px;
	padding: 10px;
	border: 1px solid #999;
	border-radius: 10px;
	box-shadow: 3px 3px 10px #e6e6e6;
}
.card-write .subject_title{
	font-size:13px;
	font-family: 600;
	margin-right: 10px;
}
.card-write .myinfo input[type="text"]{
	width: 25%;

}
.card-write .title-w input[type="text"]{
	margin-top: 20px;
	margin-bottom: 20px;
	width: 85.5%
}

.btn-w{
	text-align:left;
	margin:0 auto;
	padding: 10px;
}
.btn-w input{
	border:none;
	background-color: #87CEEB;
	padding: 10px;
	color: #fff;
	border-radius: 10px;
}
</style>

<div align="center" style="margin-top: 100px;">
	<div class="card">
		<div class="card-header1" style="text-align: center;">
		<h1>회원 등록</h1>
		</div>
		
		<div class="card-write">
	
	<tr><td align="center">
		<font color="red">${msg}</font><br>
		<font color="blue">*전부 입력해 주세요.*</font>
	</td></tr>
	<tr><td>
	<form action="registProc" method="post" id="f" align="left" style="margin-left:36%">
		<input type="text" name="id" placeholder="아이디" id="id"> <br>
		<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
		<input type="password" name="confirm" placeholder="비밀번호 확인 " id="confirm"
		onchange="pwCheck()">
		<label id="label" ></label><br>
		<input type="text" name="name" id="name" placeholder="이름" ><br>
		<input type="text" name = "postcode" id="sample6_postcode" placeholder="우편번호"><br>
		<input type="button" style="text-align: left;" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
		<input type="text" name = "address" id="sample6_address" placeholder="주소"><br>
		<input type="text" name = "detailAddress" id="sample6_detailAddress" placeholder="상세주소"><br>
		<input type="text" name="email" id="email" placeholder="E-Mail"><br>
		<input type="text" name="tel" id="tel" placeholder="전화번호" ><br>
		<div class="btn-w" style="margin-left:4%">
		<input type="button" value="회원가입" onclick="allCheck()">
		<input type="button" value="취소" onclick="location.href='index'"><br>
		</div>
	</form>
	</td></tr>

	</div>
</div>





