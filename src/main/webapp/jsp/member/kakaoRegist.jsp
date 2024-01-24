<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function kakaoCheck() {
        var address = document.getElementById('sample6_address');
        var email = document.getElementById('email');
        var tel = document.getElementById('tel');

        if (address.value === "") {
            alert('주소를 입력해 주세요.');
        } else if (email.value === "") {
            alert('email을 입력해 주세요.');
        } else if (tel.value === "") {
            alert('전화번호를 입력해 주세요.');
        } else {
            var f = document.getElementById('f');
            f.submit();
        }
    }

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                var addr = '';
                if (data.userSelectedType === 'R') {
                    addr = data.roadAddress;
                } else {
                    addr = data.jibunAddress;
                }

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById('sample6_address').value = addr;
                document.getElementById('sample6_detailAddress').focus();
            }
        }).open();
    }
</script>
<div align="center" style="margin-top: 100px;">
    <h1>추가 정보 기입</h1>
    <table>
        <tr>
            <td align="center">
                <font color="red">${msg}</font><br>
                <font color="blue">*전부 입력해 주세요.*</font>
            </td>
        </tr>
        <tr>
            <td>
                <form action="kakaoregistProc" method="post" id="f">
                    <input type="text" name="id" placeholder="아이디" id="id" value="${sessionScope.kakaoid}" readonly> <br>
                    <label id="label"></label><br>
                    <input type="text" name="name" id="name" placeholder="이름" value="${sessionScope.kakaonickname}" readonly><br>
                    <input type="text" name="postcode" id="sample6_postcode" placeholder="우편번호">
                    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
                    <input type="text" name="address" id="sample6_address" placeholder="주소"><br>
                    <input type="text" name="detailAddress" id="sample6_detailAddress" placeholder="상세주소"><br>
                    <input type="text" name="email" id="email" placeholder="E-Mail"><br>
                    <input type="text" name="tel" id="tel" placeholder="전화번호"><br>
                    <input type="button" value="회원가입" onclick="kakaoCheck()">
                    <input type="button" value="취소" onclick="location.href='logout'"><br>
                </form>
            </td>
        </tr>
    </table>
</div>
<c:import url="/footer" />
