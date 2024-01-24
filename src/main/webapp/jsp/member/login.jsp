<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
.card{width: 800px; margin: 0 auto;}
.card-header1 h1{
    font-size: 30px;
    font-weight: 600;
}
.card-write{
    padding: 20px;
}
.card-write input, textarea { /* 'textarea'가 'texarea'로 오타 수정 */
    margin-left: 10px;
    padding: 10px;
    border: 1px solid #999;
    border-radius: 10px;
    box-shadow: 3px 3px 10px #e6e6e6;
}
.btn-w{
    text-align: left;
    margin: 0 auto;
    padding: 10px;
}
.btn-w input{
    border: none;
    background-color: #87CEEB;
    padding: 10px;
    color: #fff;
    border-radius: 10px;
}
</style>

<script>
function loginCheck() {
    let id = document.getElementById('id');
    let pw = document.getElementById('pw');

    if (id.value == "") {
        alert('아이디는 필수 항목입니다.');
    } else if (pw.value == "") {
        alert('비밀번호는 필수 항목입니다.');
    } else {
        var f = document.getElementById('f');
        f.submit();
    }
}


</script>

<div align="center" style="margin-top:100px;">
    <div class="card">
        <div class="card-header1" style="text-align: center;">
            <h1>로그인</h1>
        </div>
        <div class="card-write">
            <table>
                <tr><td>
                    <font color="red" align="center" >${msg}</font> <!-- FlashAttribute의 메시지 출력 -->
                </td></tr>
                <tr><td align="center">
                    <form action="loginProc" method="post" id="f">
                        <input type="text" name="id" placeholder="아이디" id="id"><br>
                        <input type="password" name="pw" placeholder="비밀번호" id="pw"><br>

                        <div class="btn-w" style="margin-left:5%">
                            <input type="button" value="  로그인  " onclick="loginCheck()">
                            <input type="button" value="  취소  " onclick="location.href='index'"><br>
                        </div>
                    </form>
                </td></tr>

                <tr><td align="center" >
                    <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=121eaec6c06288e329be3728aa90d173&redirect_uri=http://localhost:80/kakaoLogin">
                        <img src="https://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" style="margin-left:5%"/>
                    </a>
                </td></tr>
            </table>
        </div>
    </div>
</div>
