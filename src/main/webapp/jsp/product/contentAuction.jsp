<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../default/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	// 현재 시간을 JavaScript Date 객체로 가져오기
	var currentDateTime = new Date();
	
	const startDateString = '${contents.auctionStartDay}';
	const startTimeString = '${contents.auctionStartTime}';
	const endDateString = '${contents.auctionEndDay}';
	const endTimeString = '${contents.auctionEndTime}';
	
	const partstart = startDateString.split(" "); // 날짜 변환
	//console.log(partstart); 			// 출력: ['Sat', 'Feb', '01', '00:00:00', 'KST', '2020']
	
	// 시작
	const yearS = partstart[5]; 		// 연도 : 2024
	const monthAbbS = partstart[1]; 	// 월 : Jan
	const dayS = partstart[2]; 			// 일 : 15
	
	const timeParts = startTimeString.split(':'); // 시간 변환
	const hoursS = timeParts[0];
	const minutesS = timeParts[1];
	const secondsS = timeParts[2];
	
	// 종료
	const partend = endDateString.split(" "); // 날짜 변환
	const yearE = partend[5];
	const monthAbbE = partend[1];
	const dayE = partend[2];
	
	const timeParte = endTimeString.split(':'); // 시간 변환
	const hoursE = timeParte[0];
	const minutesE = timeParte[1];
	const secondsE = timeParte[2];
	
	// 월의 약어를 숫자로 변환 (예: Feb -> 1월)
	const monthS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'].indexOf(monthAbbS);
	const monthE = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'].indexOf(monthAbbE);
	
	// 경매 시작일시를 JavaScript Date 객체로 변환
	var auctionStartDateTime = new Date(yearS, monthS, dayS, hoursS, minutesS, secondsS);
	var auctionEndDateTime = new Date(yearE, monthE, dayE, hoursE, minutesE, secondsE);
	
	//console.log(currentDateTime);
	//console.log(auctionStartDateTime);
	//console.log(auctionEndDateTime);
	
	// 경매가 이미 시작되었는지 확인
    if (currentDateTime < auctionStartDateTime) {
        // 경매가 아직 시작되지 않은 경우, 입찰 폼을 비활성화
        $('#bidForm input[type="text"]').prop('disabled', true);
        $('#submit').prop('disabled', true);
        //alert('이 경매는 아직 시작되지 않았습니다.');
    } else if (currentDateTime >= auctionEndDateTime) {
        // 경매가 이미 종료된 경우, 입찰 폼을 비활성화
        $('#bidForm input[type="text"]').prop('disabled', true);
        $('#submit').prop('disabled', true);
        //alert('이 경매는 종료되었습니다.');
    } else {
	    $('#bidForm').submit(function(e) {
	        e.preventDefault(); // 폼 제출을 막음
			
	        $.ajax({
	            url: 'auctionBid',
	            method: 'POST',
	            data: $('#bidForm').serialize()+'&no='+${contents.auctionNo }, // 폼 데이터 전송
	            success: function(data) {
	            	var msg = data.msg;
	                if (msg === 'success') {
	                    alert('입찰성공');
	                    location.reload();
	            	}else if (msg === 'over') {
	            		alert('현재 입찰가보다 높은금액을 입력해주세요');
	            		location.reload();
	            	}else if (msg === 'login') {
	            		alert('로그인을 해주세요');
	            		location.href="/login";
	            	}else {
	                    alert('오류발생');
	                }
	            },
	            error: function(xhr, status, error) {
	                console.log(error);
	            }
	        });
	    });
    }
});
</script>
<script>
	function formatAmount(input) {
		// 쉼표로 천 단위 구분자 추가
		input.value = Number(input.value.replace(/[^0-9]/g, '')).toLocaleString();
	}
	// 페이지 로딩 시 초기화
	document.addEventListener("DOMContentLoaded", function() {
	  // 초기 로딩 시에도 적용되도록 호출
	  formatAmount(document.getElementById('amountInput'));
	});
</script>
<style>
table {
	width: 30%;
	border-collapse: collapse;
}

th, td {
	text-align: center;
	padding: 8px;
	border: 1px solid #ddd;
}

div {
	display: block;
}

.nameKr[data-v-nameKr] {
	font-size: 25px;
	font-weight: 700;
	letter-spacing: -.1px;
	margin-top: 20px;
	margin-bottom: -10px;
}

.nameEn[data-v-nameEn] {
	font-size: 17px;
	font-weight: 400;
	margin-bottom: 4px;
}

/*  */
.lg .detail_product_wrap[data-v-7e3f3043], .md .detail_product_wrap[data-v-7e3f3043]
	{
	border: none;
}

.lg .detail-product-container[data-v-7e3f3043] {
	display: flex;
	margin-bottom: 20px;
	overflow: visible;
}

.lg .detail-product-container>div[data-v-7e3f3043] {
	flex: 1;
}

.detail-product-container[data-v-7e3f3043] {
	-webkit-overflow-scrolling: touch;
	min-height: 20px;
	overflow-x: auto;
	overflow-y: hidden;
	padding-bottom: 20px;
	padding-top: 20px;
	white-space: nowrap;
}

.detail-price[data-v-2e0618fe] {
	cursor: pointer;
	display: inline-block;
	height: 48px;
	vertical-align: top;
}

.detail-price .amount[data-v-2e0618fe] {
	font-size: 0;
	margin-top: 4px;
}



/*  */
.main-title-container[data-v-e50e2e68] {
    margin-bottom: 20px;
    margin-top: 20px
}

.title[data-v-e50e2e68] {
    font-size: 15px;
    font-weight: 400;
    margin-bottom: 4px;
}

.lg .title[data-v-e50e2e68] {
    font-size: 18px;
    letter-spacing: -.09px
}

.sub-title[data-v-e50e2e68] {
    color: rgba(34,34,34,.5);
    font-size: 15px;
    letter-spacing: -.07px;
    letter-spacing: -.15px;
    line-height: 17px
}

.lg .sub-title[data-v-e50e2e68] {
    font-size: 14px;
    letter-spacing: -.21px
}
/*  */

/*  */
.triangle[data-v-2e0618fe] {
    font-size: 8px;
    margin-right: 1px
}

.detail-price[data-v-2e0618fe] {
    cursor: pointer;
    display: inline-block;
    height: 48px;
    vertical-align: top
}

.detail-price .title-text[data-v-2e0618fe] {
    color: rgba(34,34,34,.5);
    font-size: 12px;
    letter-spacing: -.06px;
    letter-spacing: -.33px;
    line-height: 23px
}

.detail-price .amount[data-v-2e0618fe] {
    font-size: 0;
    margin-top: 4px;
}

.detail-price .price-info[data-v-2e0618fe] {
    color: rgba(34,34,34,.8);
    font-size: 13px;
    line-height: 17px;
    margin-top: 4px;
    word-break: break-word
}

.lg .detail-price .price-info[data-v-2e0618fe] {
    font-size: 14px
}

.detail-price .fluctuation[data-v-2e0618fe] {
    color: rgba(34,34,34,.5);
    font-size: 11px;
    margin-top: 2px
}

.detail-price .fluctuation.increase[data-v-2e0618fe] {
    color: #f15746
}

.detail-price .fluctuation.decrease[data-v-2e0618fe] {
    color: #31b46e
}

.detail-price .fluctuation.same[data-v-2e0618fe] {
    color: rgba(34,34,34,.5)
}

/*  */
.detail-box[data-v-7e3f3043] {
    border-left: 1px solid #ebebeb;
    display: inline-block;
    height: 48px;
    margin-left: 16px;
    max-width: 120px;
    min-width: 60px;
    padding-left: 16px;
    vertical-align: top
}

.detail-box[data-v-7e3f3043]:last-child {
    max-width: 280px
}

.lg .detail-box[data-v-7e3f3043]:last-child {
    margin-right: 0;
    max-width: none
}

.detail-box:last-child .product_info[data-v-7e3f3043] {
    text-transform: capitalize
}

.lg .detail-box[data-v-7e3f3043] {
    display: block;
    height: auto;
    margin-left: 16px;
    margin-right: 0;
    padding-left: 16px
}

.product_title[data-v-7e3f3043] {
    color: rgba(34,34,34,.5);
    font-size: 12px;
    letter-spacing: -.06px;
    letter-spacing: -.33px;
    line-height: 23px
}

.detail-product-container[data-v-7e3f3043] {
    -webkit-overflow-scrolling: touch;
    min-height: 20px;
    overflow-x: auto;
    overflow-y: hidden;
    padding-bottom: 20px;
    padding-top: 20px;
    white-space: nowrap
}

.lg .detail-product-container[data-v-7e3f3043] {
    display: flex;
    margin-bottom: 20px;
    overflow: visible
}

.lg .detail-product-container>div[data-v-7e3f3043] {
    flex: 1
}

.detail_product_wrap[data-v-7e3f3043] {
    border-bottom: 1px solid #ebebeb
}

.lg .detail_product_wrap[data-v-7e3f3043],.md .detail_product_wrap[data-v-7e3f3043] {
    border: none
}

.detail_product_wrap .product_info[data-v-7e3f3043] {
    color: rgba(34,34,34,.8);
    font-size: 13px;
    margin-top: 2px;
    white-space: normal
}

.mo .detail_product_wrap .product_info[data-v-7e3f3043],.sm .detail_product_wrap .product_info[data-v-7e3f3043] {
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    display: -webkit-box;
    overflow: hidden;
    text-overflow: ellipsis
}

.lg .detail_product_wrap .product_info[data-v-7e3f3043] {
    font-size: 14px;
    line-height: 17px;
    margin-top: 4px;
    word-break: break-word
}
/*  */





/*  */
.price-container[data-v-2387e107] {
    align-items: center;
    display: block;
}

.price-text-container[data-v-2387e107] {
    margin-right: 12px
}

/*  */
.price-label[data-v-2387e107] {
    font-size: 15px
}

.lg .price-label[data-v-2387e107] {
    font-size: 14px
}

.price[data-v-2387e107] {
    font-size: 20px;
    font-weight: 700;
    letter-spacing: -.1px;
    /* margin-top: 2px; */
}

.lg .price[data-v-2387e107] {
    font-size: 27px
}

.price-description[data-v-2387e107] {
    color: rgba(34,34,34,.5);
    font-size: 13px;
    margin-top: 2px
}

.lg .price-description[data-v-2387e107] {
    font-size: 14px
}



/*  */
.lg .product_figure_wrap[data-v-edcb119c] {
    padding-bottom: 20px
}

.product_figure_wrap.mo[data-v-edcb119c],.product_figure_wrap.sm[data-v-edcb119c] {
    margin-top: 20px
}

.product_figure_wrap.mo>div[data-v-edcb119c],.product_figure_wrap.sm>div[data-v-edcb119c] {
    flex: 1
}

.product_figure_wrap.mo[data-v-edcb119c] .detail_size,.product_figure_wrap.sm[data-v-edcb119c] .detail_size {
    border-bottom: 0;
    padding: 0;
    text-align: left
}

.product_figure_wrap.mo[data-v-edcb119c] .detail_size .size,.product_figure_wrap.sm[data-v-edcb119c] .detail_size .size {
    float: none
}

.product_figure_wrap.mo[data-v-edcb119c] .detail_size .btn_text,.product_figure_wrap.sm[data-v-edcb119c] .detail_size .btn_text {
    margin-right: 6px
}

.product_figure_wrap.mo[data-v-edcb119c] .detail_size .ico-arr-dir-down-circle,.product_figure_wrap.sm[data-v-edcb119c] .detail_size .ico-arr-dir-down-circle {
    height: 20px;
    vertical-align: middle;
    width: 20px
}

.product_figure_wrap.mo[data-v-edcb119c] .detail_price,.product_figure_wrap.sm[data-v-edcb119c] .detail_price {
    border-bottom: 0;
    flex: none;
    margin-top: 16px;
    text-align: right
}

.product_figure_wrap.mo[data-v-edcb119c] .detail_price .price,.product_figure_wrap.sm[data-v-edcb119c] .detail_price .price {
    float: none
}

.product_figure_wrap.mo[data-v-edcb119c] .detail_price .num,.product_figure_wrap.mo[data-v-edcb119c] .detail_price .won,.product_figure_wrap.sm[data-v-edcb119c] .detail_price .num,.product_figure_wrap.sm[data-v-edcb119c] .detail_price .won {
    font-size: 18px;
    letter-spacing: -.27px;
    line-height: 21px
}

.product_figure_wrap.mo[data-v-edcb119c] .detail_price .fluctuation,.product_figure_wrap.sm[data-v-edcb119c] .detail_price .fluctuation {
    display: inline-block;
    line-height: 16px;
    padding-top: 2px;
    vertical-align: top
}


/*  */
.header[data-v-1e2dbfd7] {
    box-shadow: 0 1px 0 0 rgba(0,0,0,.1)
}

.header.mo[data-v-1e2dbfd7],.header.sm[data-v-1e2dbfd7] {
    box-shadow: none
}

.content[data-v-1e2dbfd7] {
    margin-left: auto;
    margin-right: auto;
    max-width: 1280px;
    overflow: hidden;
    padding: 30px 40px 120px
}

.column_bind[data-v-1e2dbfd7] {
    position: relative
}

.column_bind[data-v-1e2dbfd7]:after {
    clear: both;
    content: "";
    display: block
}

.column[data-v-1e2dbfd7] {
    width: 50%
}

.column[data-v-1e2dbfd7]:first-child {
    float: left;
    padding-right: 3.334%
}

.column[data-v-1e2dbfd7]:nth-child(2) {
    float: right;
    padding-left: 3.334%;
    position: relative
}

.column[data-v-1e2dbfd7]:nth-child(2):before {
    border-left: 1px solid #ebebeb;
    bottom: 0;
    content: "";
    display: block;
    left: 0;
    position: absolute;
    top: 0
}

.is_fixed .column_box[data-v-1e2dbfd7] {
    position: fixed;
    top: 116px
}

.supported_alert .is_fixed .column_box[data-v-1e2dbfd7] {
    top: 166px
}

.is_absolute .column_box[data-v-1e2dbfd7] {
    bottom: 0;
    position: absolute
}

.lucky_draw_column .column[data-v-1e2dbfd7] {
    width: 50%
}

.lucky_draw_column .column[data-v-1e2dbfd7]:first-child {
    padding-right: 3.334%
}

.lucky_draw_column .column[data-v-1e2dbfd7]:nth-child(2) {
    margin-left: 0;
    padding-left: 3.334%;
    position: relative
}

.lucky_draw_column .column[data-v-1e2dbfd7]:nth-child(2):before {
    border-left: 1px solid #ebebeb;
    bottom: 0;
    content: "";
    display: block;
    left: 0;
    position: absolute;
    top: 0
}

.container.detail.lg .is_absolute .spread[data-v-1e2dbfd7],.container.detail.lg .is_fixed .spread[data-v-1e2dbfd7],.container.detail.md .is_absolute .spread[data-v-1e2dbfd7],.container.detail.md .is_fixed .spread[data-v-1e2dbfd7] {
    background-color: transparent;
    display: block;
    height: 560px;
    position: static
}

.container.detail.supported_alert[data-v-1e2dbfd7] {
    top: 0
}

.container.detail.mo[data-v-1e2dbfd7],.container.detail.sm[data-v-1e2dbfd7] {
    padding-bottom: 140px
}

.container.detail.mo .detail_wrap[data-v-1e2dbfd7],.container.detail.sm .detail_wrap[data-v-1e2dbfd7] {
    padding: 20px 24px 0
}

.container.detail.mo .detail_wrap.on_bottom[data-v-1e2dbfd7],.container.detail.sm .detail_wrap.on_bottom[data-v-1e2dbfd7] {
    margin-top: 0;
    padding-top: 0
}

.container.detail.mo .detail_wrap[data-v-1e2dbfd7] .open .dropdown_content,.container.detail.sm .detail_wrap[data-v-1e2dbfd7] .open .dropdown_content {
    border-bottom: none
}

.container.detail.mo.lucky_draw_column[data-v-1e2dbfd7],.container.detail.sm.lucky_draw_column[data-v-1e2dbfd7] {
    padding-bottom: 0
}

.container.detail.mo.lucky_draw_column .content[data-v-1e2dbfd7],.container.detail.sm.lucky_draw_column .content[data-v-1e2dbfd7] {
    padding: 0
}

.container.detail.mo.lucky_draw_column .column[data-v-1e2dbfd7]:nth-child(2),.container.detail.sm.lucky_draw_column .column[data-v-1e2dbfd7]:nth-child(2) {
    padding: 0 16px
}

.container.detail.mo.lucky_draw_column .on_bottom[data-v-1e2dbfd7],.container.detail.sm.lucky_draw_column .on_bottom[data-v-1e2dbfd7] {
    display: none
}

.container.detail.mo .content[data-v-1e2dbfd7],.container.detail.sm .content[data-v-1e2dbfd7] {
    padding: 0 0 30px
}

.container.detail.mo .column[data-v-1e2dbfd7],.container.detail.sm .column[data-v-1e2dbfd7] {
    float: none;
    margin: 0;
    padding: 0;
    width: 100%
}

.container.detail.mo .column_box[data-v-1e2dbfd7],.container.detail.sm .column_box[data-v-1e2dbfd7] {
    width: 100%!important
}

.container.detail.mo .is_absolute .column_box[data-v-1e2dbfd7],.container.detail.mo .is_fixed .column_box[data-v-1e2dbfd7],.container.detail.sm .is_absolute .column_box[data-v-1e2dbfd7],.container.detail.sm .is_fixed .column_box[data-v-1e2dbfd7] {
    bottom: auto;
    position: relative;
    top: auto
}

.container.detail.mo .point_guide[data-v-1e2dbfd7],.container.detail.sm .point_guide[data-v-1e2dbfd7] {
    padding-top: 30px
}

.container.detail.sm .detail_wrap[data-v-1e2dbfd7] {
    padding-left: 16px;
    padding-right: 16px
}

.container.detail.sm .other_product_area .product_list[data-v-1e2dbfd7] {
    padding-left: 10px;
    padding-right: 10px
}

.container.detail.sm.lucky_draw_column .column[data-v-1e2dbfd7]:nth-child(2) {
    padding-left: 16px;
    padding-right: 16px
}

.header-btn[data-v-1e2dbfd7] {
    display: flex
}

.header-btn svg[data-v-1e2dbfd7] {
    height: 22px;
    width: 22px
}

.header-btn.btn_share[data-v-1e2dbfd7] {
    margin-left: 20px
}

.is-branding-product[data-v-1e2dbfd7] .product_detail_item_wrap:first-child {
    padding-top: 24px
}

</style>
<meta charset="UTF-8">
<title>경매상세</title>

</head>
<body>
	<!-- <h2 align="center">경매상세</h2> -->
	<c:choose>
		<c:when test="${empty contents}">
			<h3>등록된 데이터가 없습니다</h3>
		</c:when>
		<c:otherwise>
			<div align="center" style="margin-top:40px;">
				<div></div>
				<div data-v-1e2dbfd7="" class="column">
					<div data-v-edcb119c="" data-v-1e2dbfd7="" class="column_box">
						<div data-v-edcb119c="" class="column_top">
							<div data-v-2387e107="" data-v-edcb119c=""
								class="price-container">
								<div data-v-2387e107="" class="price-text-container">
									<p data-v-5bb7af92="" data-v-2387e107="" class="price display_paragraph"
										style="color: rgb(34, 34, 34);">${contents.product.nameKr }</p>
									<p data-v-5bb7af92="" data-v-2387e107="" class="price-label display_paragraph"
										style="color: rgb(34, 34, 34);">${contents.product.nameEn }</p>
									<p data-v-5bb7af92="" data-v-2387e107=""
										class="price-description display_paragraph"></p>
								</div>
							</div>
							<div data-v-e50e2e68="" data-v-edcb119c="" class="main-title-container">
								<p data-v-e50e2e68="" class="title">
									${contents.product.cate1Name } - ${contents.product.cate2Name }
								</p>
								<p data-v-e50e2e68="" class="title">브랜드 : ${contents.product.brandName }</p>
								<p data-v-e50e2e68="" class="sub-title">${contents.product.content }</p>
							</div>
							<div data-v-edcb119c="" class="product_info_wrap">
								<div data-v-7e3f3043="" data-v-edcb119c=""
									class="detail_product_wrap">
									<dl data-v-7e3f3043="" class="detail-product-container">
										<div data-v-2e0618fe="" data-v-7e3f3043=""
											class="detail-price">
											<div data-v-2e0618fe="" class="title-text">사이즈</div>
											<div data-v-2e0618fe="">
												<div data-v-2e0618fe="" class="amount">
													<span data-v-2e0618fe="" class="price-info">${contents.product.size }</span>
												</div>
											</div>
										</div>
										<div data-v-7e3f3043="" class="detail-box">
											<div data-v-7e3f3043="" class="product_title">발매가</div>
											<div data-v-7e3f3043="" class="product_info"><fmt:formatNumber value="${contents.product.firstPrice }"
												pattern="#,###" />원</div>
										</div>
										<div data-v-7e3f3043="" class="detail-box">
											<div data-v-7e3f3043="" class="product_title">모델번호</div>
											<div data-v-7e3f3043="" class="product_info">3923859</div>
										</div>
										<div data-v-7e3f3043="" class="detail-box">
											<div data-v-7e3f3043="" class="product_title">출시일</div>
											<div data-v-7e3f3043="" class="product_info"><fmt:formatDate value="${contents.product.releaseDay}"
												pattern="yy/MM/dd" /></div>
										</div>
										<div data-v-7e3f3043="" class="detail-box">
											<div data-v-7e3f3043="" class="product_title">대표 색상</div>
											<div data-v-7e3f3043="" class="product_info color-target">
												${contents.product.color }</div>
										</div>
									</dl>
								</div>
							</div>
						<!---->
						</div>
						<!---->
						<!---->
						<div class="bid_class" style="margin-top: 10px;">
							<b>현재 입찰가 : ₩
								<fmt:formatNumber value="${max == 0 ? contents.auctionStartPrice : max}" pattern="#,###" />
							</b>
							<form action="auctionBid" method="post" id="bidForm" style="margin: 5px;">
								<input type="hidden" name="bidAuctionNo" value="${contents.auctionNo }">
								<input type="hidden" name="bidMemberId" value="${sessionScope.id }"> 
								<input type="text" id="amountInput" name="auctionBidprice"
									value="${max == 0 ? contents.auctionStartPrice : max}"
									oninput="formatAmount(this)" required size="7">원
								<button class="reset" type="button">초기화</button>
								<button id="submit" type="submit">입찰</button>
							</form>
			
							<button class="up1000" alt="수량증가">+1,000</button>
							<button class="up5000" alt="수량증가">+5,000</button>
							<button class="up10000" alt="수량증가">+10,000</button>
							<button class="up50000" alt="수량증가">+50,000</button>
							<br>
						</div>
					</div>
				</div>
				<table border="1" style="text-aligin: center;">
					<tr>
						<%-- <img src="/img/product/${contents.product.image}" alt="Product Image"> --%>
						<img src="https://****/****/${contents.product.image}" alt="Product Image">
					</tr>
					<tr>
						<th>경매 시작</th>
						<td><fmt:formatDate value="${contents.auctionStartDay}" pattern="yyyy-MM-dd" />
								&nbsp&nbsp${contents.auctionStartTime }</td>
					</tr>
					<tr>
						<th>경매 종료</th>
						<td><fmt:formatDate value="${contents.auctionEndDay}" pattern="yyyy-MM-dd" />
								&nbsp&nbsp${contents.auctionEndTime }</td>
					</tr>
					<tr>
						<th>경매 시작가</th>
						<td>₩<fmt:formatNumber value="${contents.auctionStartPrice}" pattern="#,###" /></td>
					</tr>
					<tr>
						<th>경매 현황</th>
						<td>${contents.statusName }</td>
					</tr>
				</table>
				<%-- <fmt:formatNumber value="${contents.auctionStartPrice}" pattern="#,###" /> --%>
				
			</div>
		</c:otherwise>
	</c:choose>
	<div align="center" style="margin-bottom: 10px;">
		<button type="button" onclick="window.history.go(-1)">뒤로</button>
		<button type="button" onclick="location.href='auctionList'">목록</button>
	</div>
</body>
</html>
<c:import url="/footer" />

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	// 함수로 입찰가 증가값 조정
	function updateQuantity(inputField, increaseBy) {
	    let quantityStr = inputField.val();
	    // 숫자 추출
	    let currentQuantity = Number(quantityStr.replace(/[^0-9]/g, '')); 
	    // Parameter에 따라 증가값 동적으로 변경
	    let newQuantity = currentQuantity + increaseBy;
		// 쉼표 추가
	    let formattedQuantity = newQuantity.toLocaleString(); 
	    // "수량 증가" 버튼을 클릭하면 현재 수량을 가져와서 increaseBy을 더한 후 쉼표가 포함된 문자열로 다시 설정
	    inputField.val(formattedQuantity);
	}
	// 수량 변경 액션
	$(".up1000").on("click", function(){
		let inputField = $("#amountInput");
		updateQuantity(inputField, 1000);
	});
	$(".up5000").on("click", function(){
		let inputField = $("#amountInput");
		updateQuantity(inputField, 5000);
	});
	$(".up10000").on("click", function(){
		let inputField = $("#amountInput");
		updateQuantity(inputField, 10000);
	});
	$(".up50000").on("click", function(){
		let inputField = $("#amountInput");
		updateQuantity(inputField, 50000);
	});
	
	// 초기화
	$(".reset").on("click", function() {
		//location.reload(true);
        let inputField = $("#amountInput");
        let reset = ${max == 0 ? contents.auctionStartPrice : max};
        inputField.val(reset.toLocaleString());
    });
	
});
</script>
