<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ include file="../default/header.jsp"%>
<link rel="icon" href="/img/A.png">
<html>
<head>
<style>
body {
	margin: 0;
	padding: 0;
	font-family: Arial, sans-serif;
}

.sidebar {
	position: absolute; /* 위치 조정 */
<<<<<<< HEAD
	top: 191px; /* 헤더 높이에 맞춤 */
	left: 150px;
	width: 150px; /* 사이드바 너비 설정 */
=======
	top: 250px; /* 헤더 높이에 맞춤 */
	left: 150px;
	width: 110px; /* 사이드바 너비 설정 */
>>>>>>> e723f6bb593ff26df1e187fd04c57a041f239ea4
	background-color: #f1f1f1;
	padding: 20px;
	display: flex;
	flex-direction: column;
}

.sidebar button {
	background-color: #f1f1f1;
	border: none;
	padding: 5px;
	margin-bottom: 5px;
	width: 100%;
	text-align: left;
	cursor: pointer;
}

.sidebar button:hover {
	background-color: #ddd;
}

.content {
<<<<<<< HEAD
	margin: 0px 105px;
	text-align: center;
	width: 1500px;
	padding: 20px;
	padding-top: 170px; /* 파란색 헤더 아래 공백 */
=======
	margin: 100px 320px;
	text-align: center;
	width: 1124px;
	padding: 20px;
	padding-top: 70px; /* 파란색 헤더 아래 공백 */
	margin-left: 0;
>>>>>>> e723f6bb593ff26df1e187fd04c57a041f239ea4
}

.announcement {
	text-align: center;
	margin-left: 300px;
	margin-bottom: 20px; /* 아래쪽 공간 확보 */
}

.announcement h2 {
	font-size: 24px; /* 큰 글씨 크기 */
	background-color: #f9f9f9;
	text-align: center; /* 가운데 정렬 */
	border-bottom: 1px solid #ddd;
	margin-bottom: 30px;
<<<<<<< HEAD
	width: 1220px;
=======
	width: 843px;
>>>>>>> e723f6bb593ff26df1e187fd04c57a041f239ea4
	padding: 10px 0;
}

.announcement-title {
	cursor: pointer;
	padding: 10px;
	background-color: #f9f9f9;
	border: none;
<<<<<<< HEAD
	text-align: left;
=======
	text-align: center;
>>>>>>> e723f6bb593ff26df1e187fd04c57a041f239ea4
	width: 100%;
	border-bottom: 1px solid #ddd; /* 각 제목 아래에 선을 추가합니다. */
}

.announcement-title:hover {
	background-color: #e9e9e9;
}

.announcement-content {
	display: none;
	padding: 10px;
	margin-bottom : 30px;
	background-color: #f9f9f9;
	border-top: 1px solid #ddd;
<<<<<<< HEAD
=======
	text-align: center;
	width: 100%;
>>>>>>> e723f6bb593ff26df1e187fd04c57a041f239ea4
}

.announcement-title:last-child {
	border-bottom: none;
}

.back-to-list {
	display: block;
	text-align: center;
	margin-top: 10px;
	padding: 5px;
	background-color: #d9d9d9;
	cursor: pointer;
}

.back-to-list:hover {
	background-color: #c9c9c9;
}
</style>
<script>
	function toggleContent(id) {
		var content = document.getElementById(id);
		if (content.style.display === 'block') {
			content.style.display = 'none';
		} else {
			content.style.display = 'block';
		}
	}
</script>
</head>
<body>
	<div class="sidebar">
		<button onclick="location.href='notice'">공지사항</button>
		<button onclick="location.href='faq'">자주 묻는 질문</button>
		<button onclick="location.href='list'">문의하기</button>
	</div>
<<<<<<< HEAD
	<div class="content">
		<div class="announcement">
			<h2>자주 묻는 질문</h2>

			<div class="announcement-title"
				onclick="toggleContent('announcement1')">자주 묻는 질문 제목</div>
			<div class="announcement-content" id="announcement1">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement1')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement2')">자주 묻는 질문 제목</div>
			<div class="announcement-content" id="announcement2">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement2')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement3')">자주 묻는 질문 제목</div>
			<div class="announcement-content" id="announcement3">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement3')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement4')">자주 묻는 질문 제목</div>
			<div class="announcement-content" id="announcement4">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement4')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement5')">자주 묻는 질문 제목</div>
			<div class="announcement-content" id="announcement5">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement5')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement6')">자주 묻는 질문 제목</div>
			<div class="announcement-content" id="announcement6">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement6')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement7')">자주 묻는 질문 제목</div>
			<div class="announcement-content" id="announcement7">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement7')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement8')">자주 묻는 질문 제목</div>
			<div class="announcement-content" id="announcement8">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement8')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement9')">자주 묻는 질문 제목</div>
			<div class="announcement-content" id="announcement9">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement9')">목록</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement10')">자주 묻는 질문 제목</div>
			<div class="announcement-content" id="announcement10">
				공지사항 입니다.<br> 공지사항 입니다.<br> 공지사항 입니다.<br> <span
					class="back-to-list" onclick="toggleContent('announcement10')">목록</span>
			</div>
		</div>
	</div>
=======
	<table>
	<div class="content">
		<div class="announcement">
			<h2>자주 묻는 질문</h2>
			
			<div class="announcement-title"
				onclick="toggleContent('announcement1')"><strong>[입찰 참여 및 보증금 안내]</strong><br>입찰에 참여하려면 어떤 조건이 필요한가요?</div><br>
			<div class="announcement-content" id="announcement1">
				<br> 경매에 참여하시려면 해당 물품의 경매시작가의 10%에 해당하는 금액을 보증금으로 예치해야 합니다. <br><br>
				이 보증금은 경매 참여의 진정성을 보장하고, 낙찰 시에는 최종 결제에 차감됩니다. <br><br>
				보증금은 안전하게 관리되며, 입찰이 낙찰되지 않았을 경우에는 즉시 환불 처리됩니다. <br><br>
				<span class="back-to-list" onclick="toggleContent('announcement1')">접기</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement2')"><strong>[계정 및 참여]</strong><br>어떻게 경매에 참여하고 입찰할 수 있나요?</div><br>
			<div class="announcement-content" id="announcement2">
				<br> 회원가입 후 로그인하여 원하는 물품의 경매에 참여하실 수 있습니다. <br><br>
				해당 경매품의 입찰 창에서 원하는 가격을 입력하고, <br><br>
				입찰 버튼을 클릭하여 참여할 수 있습니다. <br><br>
				<span class="back-to-list" onclick="toggleContent('announcement2')">접기</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement3')"><strong>[입찰 및 가격]</strong><br>최저입찰가와 현재 입찰가의 차이는 무엇인가요?</div><br>
			<div class="announcement-content" id="announcement3">
				<br> 최저입찰가는 해당 물품의 경매 시작 가격이며, <br><br>
				현재 입찰가는 최고 입찰가로서 최저입찰가보다 높은 금액입니다. <br><br>
				다른 입찰자들이 참여할 때마다 입찰가가 증가합니다. <br><br>
				<span class="back-to-list" onclick="toggleContent('announcement3')">접기</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement4')"><strong>[낙찰 및 결제]</strong><br>낙찰 후 어떻게 결제를 진행하나요?</div><br>
			<div class="announcement-content" id="announcement4">
				<br> 낙찰된 물품은 마이페이지에서 확인 가능하며, <br><br>
				경매 종료 후 일정 기간 내에 결제를 완료해주셔야 합니다. <br><br>
				다양한 결제 수단을 지원하며, 상세한 결제 안내는 결제 페이지에서 확인 가능합니다.<br><br>
				<span class="back-to-list" onclick="toggleContent('announcement4')">접기</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement5')"><strong>[물품 상태와 반품]</strong><br>물품이 손상되었거나 기대와 다를 경우 어떻게 하나요?</div><br>
			<div class="announcement-content" id="announcement5">
				<br> 물품 수령 후 7일 이내에 물품 상태에 이의를 제기할 수 있습니다. <br><br>
				손상 또는 불일치 사항이 확인되면 교환 또는 환불이 가능하니, <br><br>
				고객센터로 문의하여 자세한 안내를 받아보세요.<br><br>
				<span class="back-to-list" onclick="toggleContent('announcement5')">접기</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement6')"><strong>[경매 일정 및 종료]</strong><br>경매는 언제 시작되며 어떻게 종료되나요?</div><br>
			<div class="announcement-content" id="announcement6">
				<br> 경매 시작 및 종료 시간은 각 물품마다 다를 수 있습니다. <br><br>
				해당 물품의 상세 페이지나 경매 일정 페이지에서 시작 및 종료 시간을 확인하실 수 있습니다.<br><br>
				<span class="back-to-list" onclick="toggleContent('announcement6')">접기</span>
			</div>

			<div class="announcement-title"
				onclick="toggleContent('announcement7')"><strong>[경매 이력과 참여 현황]</strong><br>나의 경매 참여 이력과 현재 입찰 현황은 어디에서 확인할 수 있나요?</div><br>
			<div class="announcement-content" id="announcement7">
				<br> 마이페이지에서 나의 경매 이력과 현재 입찰 중인 물품을 확인할 수 있습니다. <br><br>
				또한, 입찰 알림 기능을 활성화하여 새로운 입찰 상황을 실시간으로 받아보실 수 있습니다.<br><br>
				<span class="back-to-list" onclick="toggleContent('announcement7')">접기</span>
			</div>
			
			<div class="announcement-title"
				onclick="toggleContent('announcement8')"><strong>[배송 및 수령]</strong><br>낙찰된 물품은 어떻게 배송되며 얼마나 걸립니까?</div><br>
			<div class="announcement-content" id="announcement8">
				<br> 낙찰 후 지정된 배송업체를 통해 배송됩니다. <br><br>
				배송 소요 시간은 지역과 물품의 특성에 따라 다를 수 있습니다. <br><br>
				또한, 배송 상태는 마이페이지에서 실시간으로 확인 가능합니다. <br><br>
				<span class="back-to-list" onclick="toggleContent('announcement8')">접기</span>
			</div>
			
			<div class="announcement-title"
				onclick="toggleContent('announcement9')"><strong>[회원정보 보호와 보안]</strong><br>회원정보는 어떻게 보호되나요? 결제 정보는 안전한가요?</div><br>
			<div class="announcement-content" id="announcement9">
				<br> 저희는 회원정보 보호를 위해 최선을 다하고 있습니다. <br><br>
				안전한 전송을 위해 SSL 암호화를 사용하며, 결제 정보는 안전한 결제 시스템을 통해 처리됩니다.<br><br>
				<span class="back-to-list" onclick="toggleContent('announcement9')">접기</span>
			</div>
			
			<div class="announcement-title"
				onclick="toggleContent('announcement10')"><strong>[경매 물품의 상세 정보와 사진]</strong><br>경매 물품에 대한 상세 정보와 실제 상품 사진을 어떻게 확인할 수 있나요?</div><br>
			<div class="announcement-content" id="announcement10">
				<br> 각 경매 물품은 상세 페이지에 해당하는 상품 정보와 실제 사진이 함께 제공됩니다. <br><br>
				품질 및 상태에 대한 정보는 신뢰성을 유지하기 위해 신중하게 기재되어 있습니다. <br><br>
				<span class="back-to-list" onclick="toggleContent('announcement10')">접기</span>
			</div>
			
			<div class="announcement-title"
				onclick="toggleContent('announcement11')"><strong>[고객지원 및 문의]</strong><br>문제 또는 궁금한 사항이 있을 때 어떻게 도움을 받을 수 있나요?</div><br>
			<div class="announcement-content" id="announcement11">
				<br> 고객센터를 통해 문의 및 문제 해결이 가능합니다. <br><br>
				이메일 또는 전화로 연락할 수 있으며, 운영 시간과 담당자 정보는 홈페이지에 안내되어 있습니다. <br><br>
				<span class="back-to-list" onclick="toggleContent('announcement11')">접기</span>
			</div>
			
			</div>
		</div>
	</table>
>>>>>>> e723f6bb593ff26df1e187fd04c57a041f239ea4
</body>
</html>
