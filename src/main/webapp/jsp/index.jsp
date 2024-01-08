<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Asta</title>
 <style> 
 	.start {
	position: relative;
	margin-left: 50px;
	margin-right: 133px;
}

.start-effect-container {
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	height: 100vh;
	background-color: #fff;
	/* 시작 효과를 위한 배경색 설정 */
	display: flex;
	justify-content: center;
	align-items: center;
	animation: startEffect 2s ease-out forwards;
	z-index: 10000;
	/* 애니메이션 설정 */
}

.logo {
	width: 700px;
	/* 로고 이미지의 너비 설정 */
	height: 500px;
}

.main-content {
	display: none;
	/* 메인 페이지 컨텐츠를 처음에는 숨깁니다. */
}

@keyframes startEffect {
    0% {
        opacity: 3;
    }

    100% {
        opacity: 0.1;
    }
}
 </style>
 
 

 </head>
 	<div class="start">
		<!-- 시작 효과를 주기 위한 컨테이너 -->
		<div class="start-effect-container">
			<!-- 로고 이미지 -->
			<img class="logo" src="/img/asta-removebg-preview.png" alt="로고"
				width="30%" height="30%">
		</div>
	</div>
 <body>
	<c:import url="/header"/>
	
	<c:import url="/main"/>
	<div align="center" >
	</div>
	<c:import url="/footer"/>
</body>
<script>
		document
				.addEventListener(
						'DOMContentLoaded',
						function() {
							// 페이지가 로드될 때 실행되는 코드
							// 로고가 사라진 후에 메인 페이지를 표시합니다.
							setTimeout(
									function() {
										document
												.querySelector('.start-effect-container').style.display = 'none';
										document.querySelector('.main-content').style.display = 'block';
									}, 2000); // 2초 후에 실행
						});
	</script>
</html>



