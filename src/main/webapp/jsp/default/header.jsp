<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<link rel="icon" href="/img/A.png">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Asta</title>
<script src="dbQuiz.js"></script>
<style>
.head_wrap {
	background: white;
	position: fixed;
	top: 0;
	left: 0;
	width: 70%;
	height: 85px;
	z-index: 9999;
	box-shadow: 0px 0px 0px 0px rgba(0, 0, 0, 0.1);
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding: 0 10px; /* 좌우 padding을 10px로 조절 */
	text-align: center;
	transition: all 0.2s ease;
	-webkit-transition: all 0.2s ease;
	z-index: 9999;
	margin-left: 14%;
}

.head a {
	color: black;
}

.head_wrap .head {
	display: flex;
	align-items: center;
	justify-content: space-between;
	height: 100%;
}

.head_wrap .head .head_login_menu {
	order: 3;
	display: flex;
	align-items: center;
	gap: 10px; /* 각 버튼 사이의 간격 조절 */
}

.head_wrap .head .head_logo img {
	max-width: 186px;
	height: 140px;
}

.head_wrap .head .head_menu_wrap {
	order: 2;
	flex: 1;
	text-align: center;
}

.head_wrap .head .head_menu {
	text-align: center;
}

.head_wrap .head .head_menu>ul {
	display: flex;
	list-style: none;
	padding: 0;
}

.head_wrap .head .head_menu>ul>li {
	flex: 1;
	text-align: center;
	position: relative;
	padding: 10px 0;
	margin: 0;
	width: 116px;
	cursor: pointer;
}

.head_wrap .head .head_menu>ul>li a {
	display: block;
	font-weight: 500;
	font-size: 1.1em;
	position: relative;
	text-decoration: none;
}

.head_wrap .head .head_login_menu .cont_list_small ul {
	display: flex;
	list-style: none;
	padding: 0;
	margin: 0;
}

.head_wrap .head .head_login_menu .cont_list_small ul li {
	margin: 0;
	padding: 10px;
}

.head_wrap .head .head_login_menu .cont_list_small ul li a {
	font-weight: 500;
	font-size: 1.1em;
	text-decoration: none;
	display: block;
	color: black;
}

.head_wrap .head .head_menu>ul>li a::after {
	content: '';
	display: block;
	width: 0;
	height: 2px;
	background-color: #000;
	transition: width 0.3s;
}

.head_wrap .head .head_menu>ul>li a:hover::after {
	width: 100%;
}
</style>

</head>

<body>


	<!-- 메인 페이지 컨텐츠 -->
	<div class="head_wrap" style="height: 100px">
		<div class="head">
			<div class="head_logo">
				<a href="/index"> <img src="/img/asta-removebg-preview.png">
				</a>
			</div>
		</div>
		<div class="head">
			<div class="head_menu_wrap"
				style="flex-grow: 1; display: flex; justify-content: space-around;">
				<div class="head_menu">
					<ul>
						<li><a class="pc" href="../notice">고객센터</a></li>
						<li><a class="pc" href="../cal">경매일정</a></li>
						<li><a class="pc" href="../cal">상품</a></li>
					</ul>
				</div>
			</div>
		</div>
		<div class="head">
			<div class="head_login_menu">
				<div class="cont_list cont_list_small">
					<ul>
						<li>
						<c:choose>
							<c:when test="${sessionScope.id eq 'admin'}">
								<li><a class="small_button" href="/cal">회원관리</a></li>
								<li><a class="small_button" href="/logout">Logout</a></li>
							</c:when>
							<c:when test="${empty sessionScope.id}">
						<li><a class="small_button" href="/login">Login</a></li>
						<li><a class="small_button" href="/agree">SignUp</a></li>
							</c:when>
							<c:otherwise>
						<li><a class="small_button" href="/logout">Logout</a></li>
						<li><a class="small_button" href="/userInfo">MyPage</a></li>
							</c:otherwise>
						</c:choose>
							
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>

</html>


