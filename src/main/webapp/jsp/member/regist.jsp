
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>






<script>
	function sample6_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
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
						document.getElementById("sample6_detailAddress")
								.focus();
					}
				}).open();
	}
</script>

<script>

function allCheck() {
	console.log('allCheck 함수 실행됨'); // 로그 추가
	let id = document.getElementById('id');
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	userName = document.getElementById('name');
	address = document.getElementById('sample6_address');
	email = document.getElementById('email');
	tel = document.getElementById('tel');
	let number = document.getElementById('number');
	// 추가된 부분: 인증번호 입력 체크

	if (id.value == "") {
		alert('아이디를 입력해 주세요.');
	} else if (pw.value == "") {
		alert('비밀번호를 입력해 주세요.');
	} else if (confirm.value == "") {
		alert('비밀번호 확인은 필수 항목입니다.');
	} else if (userName.value == "") {
		alert('이름을 입력해 주세요.');
	} else if (address.value == "") {
		alert('주소를 입력해 주세요.');
	} else if (email.value == "") {
		alert('email을 입력해 주세요.');
	} else if (tel.value == "") {
		alert('전화번호를 입력해 주세요.');
	} else if (number.value == "") {  // 추가된 부분: 인증번호 입력 체크
	alert('인증번호를 입력해 주세요.');
	} else {

		var f = document.getElementById('f');
		f.submit();

	}
}
function pwCheck() {
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	label = document.getElementById('label');
	if (pw.value == confirm.value) {
		label.innerHTML = '일치'
	} else {
		label.innerHTML = '불일치'
	}
	// window.alert('pwCheck 호출')
}


 function sendNumber() {
	 var email = $("#email").val();

	    if (email.trim() === "") {
	        alert("이메일을 입력하세요.");
	        return;
	    }
	    if (!isValidEmail(email)) {
	        alert("이메일 형식이 아닙니다.");
	        return;
	    }
	 
	 
    $("#mail_number").css("display", "block");

    $.ajax({
        url: "/mail", // 서버의 /mail 엔드포인트로 이메일 전송 요청
        type: "post",
        dataType: "json",
        contentType: "application/json",
        data: JSON.stringify({ "mail": $("#email").val() }),
        success: function (data) {
            console.log("Server response:", data);

            var serverNumber = data && data.number !== undefined ? parseInt(data.number, 10) : undefined;

            if (!isNaN(serverNumber)) {
                alert("인증번호 발송");
                $("#Confirm").data("server-number", serverNumber);
            } else {
                console.error("서버 응답에서 숫자를 올바르게 파싱할 수 없습니다.");
            }
        },
        error: function (error) {
            console.error("서버에서 데이터를 가져오는 중 오류 발생", error);
            alert("서버에서 데이터를 가져오는 중 오류가 발생했습니다. 다시 시도해주세요.");
        }
    });
}
 function isValidEmail(email) {
	    // 이메일 유효성을 간단히 체크하는 정규표현식 사용
	    var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,6}$/;
	    return emailRegex.test(email);
	}
function confirmNumber() {
	var serverResponseData = $("#Confirm").data("server-number");

	if (serverResponseData !== undefined && serverResponseData !== null) {
		// 데이터가 정상적으로 찾아졌을 때의 처리
		console.log("Server response:", serverResponseData);

		// 이하 로직 계속...
		var serverGeneratedNumber = serverResponseData; // 이미 number 속성으로 값을 받았으므로 따로 .number 할 필요 없음

		console.log("Server generated number:", serverGeneratedNumber);
		console.log("Type of server data:", typeof serverGeneratedNumber);
		// 이후 로직 계속...

		// 입력된 번호가 숫자인지 확인
		var clientInputNumber = $("#number").val();

		if (!isNaN(serverGeneratedNumber)) {
			// 서버에서 받은 번호와 일치하는지 확인
			if (parseInt(clientInputNumber, 10) === serverGeneratedNumber) {
				alert("인증되었습니다.");
				// 여기에 폼 전송이나 다음 단계로 진행하는 로직 추가
			} else {
				alert("번호가 다릅니다.");
			}
		} else {
			alert("유효한 숫자를 입력하세요.");
		}
	} else {
		console.error("Server response is undefined or null");
	}
}
 

</script>





<style>
.card {
	width: 800px;
	margin: 0 auto;
}

.selectBox {
	position: relative;
	text-align: center;
	width: 100px;
	height: 35px;
	border-radius: 10px;
	border: 1px solid #999;
}

.card-header1 h1 {
	font-size: 30px;
	font-weight: 600;
}

.card-write {
	padding: 20px;
}

.card-write input, texarea {
	margin-left: 10px;
	padding: 10px;
	border: 1px solid #999;
	border-radius: 10px;
	box-shadow: 3px 3px 10px #e6e6e6;
}

.card-write .subject_title {
	font-size: 13px;
	font-family: 600;
	margin-right: 10px;
}

.card-write .myinfo input[type="text"] {
	width: 25%;
}

.card-write .title-w input[type="text"] {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 85.5%
}

.btn-w {
	text-align: left;
	margin: 0 auto;
	padding: 10px;
}

.btn-w input {
	border: none;
	background-color: #87CEEB;
	padding: 10px;
	color: #fff;
	border-radius: 10px;
}
</style>

<div align="center" style="margin-top: 100px;">
    <div id="Confirm" data-server-number="number"></div>
    <div class="card">
		<div class="card-header1" style="text-align: center;">
			<h1>회원 등록</h1>
		</div>

		<div class="card-write">

			<tr>
				<td align="center"><font color="red">${msg}</font><br> <font
					color="blue">*전부 입력해 주세요.*</font></td>
			</tr>


			<form action="registProc" method="post" id="f" align="left"
				style="margin-left: 36%">
			<input type="text" name="id" placeholder="아이디" id="id"> <br>
			<input type="password" name="pw" placeholder="비밀번호" id="pw"><br>
			<input type="password" name="confirm" placeholder="비밀번호 확인 "
				id="confirm" onchange="pwCheck()"> <label id="label"></label><br>
			<input type="text" name="name" id="name" placeholder="이름"><br>
			<input type="text" name="postcode" id="sample6_postcode"
				placeholder="우편번호"> <input type="button"
				style="text-align: left;" onclick="sample6_execDaumPostcode()"
				value="우편번호 찾기"><br> <input type="text" name="address"
				id="sample6_address" placeholder="주소"><br> <input
				type="text" name="detailAddress" id="sample6_detailAddress"
				placeholder="상세주소"><br> <input type="text" name="email"
				id="email" placeholder="E-Mail">


			<button type="button" id="sendBtn" name="sendBtn"
				onclick="sendNumber()">인증번호</button>

			<br>
			<div id="mail_number" name="mail_number" style="display: none">
				<input type="number" name="number" id="number" placeholder="인증번호 입력">
				<button type="button" name="confirmBtn" id="confirmBtn"
					onclick="confirmNumber()">이메일 인증</button>
			</div>
			
			<input type="text" name="tel" id="tel" placeholder="전화번호"><br>

			<div class="btn-w" style="margin-left: 4%">
				<input type="button" value="회원가입" onclick="allCheck()"> <input
					type="button" value="취소" onclick="location.href='index'"><br>
			</div>
				</form>


		</div>