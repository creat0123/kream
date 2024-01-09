<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<link rel="icon" href="/img/A.png">
<head>
<meta charset="UTF-8">
<title>경매 일정표</title>

<style>
.rap {
	display: flex;
	flex-direction: column;
	max-width: 1200px;
	margin: 120px auto;
	padding: 20px;
}

.calendar-container {
	position: relative;
	z-index: 1;
	flex: 0 0 auto;
	max-width: 626px;
	padding: 0 1.4rem;
	margin-top: .3rem;
	box-shadow: 0px 0px 19px 0px;
}

.schedule-container {
	position: relative;
	flex: 1;
	padding-left: 20px;
}

.scheduleContent {
	margin: 61px;
	/* 추가: 스케줄 내용 스타일 조정 */
	padding: 7px;
	background-color: #696969;
	border-radius: 5px;
	position: relative;
	top: -60px;
	height: 40px;
	left: 18%;
	margin-right: 39%;
}

.dateHead {
	margin-bottom: .4rem;
}

.dateHead div {
	background: #e31b20;
	color: #fff;
	text-align: center;
}

.grid {
	display: grid;
	grid-template-columns: repeat(7, 1fr);
	grid-gap: 5px;
}

.grid div {
	padding: .6rem;
	font-size: .9rem;
	cursor: pointer;
	position: relative; /* 추가: 상대 위치 설정 */
}

.dateBoard div {
	color: #222;
	font-weight: bold;
	min-height: 6rem;
	padding: .6rem .8rem;
	border-radius: .6rem;
	border: 3px solid black;
	position: relative; /* 추가: 상대 위치 설정 */
}

.noColor {
	background: #eee;
}

/* 추가: 일정이 있는 날에 빨간 점 스타일 */
.hasSchedule::before {
	content: '';
	position: absolute;
	top: 5px; /* 조절: 점의 위치 조절 가능 */
	left: 5px; /* 조절: 점의 위치 조절 가능 */
	width: 10px;
	height: 10px;
	background-color: #e31b20;
	border-radius: 50%;
}

.header {
	display: flex;
	justify-content: space-between;
	padding: 1rem 2rem;
	align-items: center;
}

.btn {
	display: block;
	width: 20px;
	height: 20px;
	border: 3px solid #000;
	border-width: 3px 3px 0 0;
	cursor: pointer;
}

.prevDay {
	transform: rotate(-135deg);
}

.nextDay {
	transform: rotate(45deg);
}

.dateBoard div p {
	font-weight: normal;
	margin-top: .2rem;
}

.addScheduleBtn{
	width: 10%;
    position: relative;
    left: 90%;
    margin-top: 1%;
    margin-bottom: 2%;
}

/* ------------- */
@import
	url("https://cdn.jsdelivr.net/gh/orioncactus/pretendard/dist/web/static/pretendard.css")
	;

* {
	margin: 0;
	padding: 0;
	list-style: none;
	box-sizing: border-box;
	font-family: Pretendard;
}
</style>
</head>
<body>
	<%@ include file="../default/header.jsp"%>
	<div class='rap'>
		<div class="header">
			<div class="btn prevDay"></div>
			<h2 class='dateTitle'></h2>
			<div class="btn nextDay"></div>
			
			
		</div>
		<c:choose>
                <c:when test="${sessionScope.id eq 'admin'}">
                    <button class="addScheduleBtn">일정 추가</button>
                </c:when>
                <c:otherwise>
                    <!-- 아무 작업 안 함 또는 다른 작업 수행 -->
                </c:otherwise>
            </c:choose>
		<div class="grid dateHead">
			<div>일</div>
			<div>월</div>
			<div>화</div>
			<div>수</div>
			<div>목</div>
			<div>금</div>
			<div>토</div>
		</div>

		<div class="grid dateBoard"></div>
	</div>
	<div class="scheduleContainer">
		<!-- 예시: 달력 일정표에 내용이 들어갈 경우 -->
		<div class="scheduleContent">
			<!-- 일정 내용이 여기에 들어갑니다. -->
			예시: 2023-01-01: 특별한 일정이 있습니다.
			예시: 2023-01-01: 특별한 일정이 있습니다.
		</div>
	</div>
	<div>
		<c:import url="/footer" />
	</div>
	<script src="../js/cal.js"></script>
</body>
</html>
