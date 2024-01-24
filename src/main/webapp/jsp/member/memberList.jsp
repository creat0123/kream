<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ include file="../default/header.jsp"%>
<link rel="icon" href="/img/A.png">
<!-- memberListAd.jsp -->

<style
	data-styled="iFGKHS lfNSWn jaUjww ldTxFv kQQofr kygvRy htgTVp jhybdY lcTCNU iDwWzL fsmwuN ghYPiI epZuoe jmiASf eqsdiJ fnPcIe iSNjUC iInHaG efkGzl cCHXXw ufBpS cloNtw iRXRoK gfaUh bkOisR cDorvW gvDVXQ gVjVQf gpItyx gkrGGR hDhFxO HJrqw bZDVgX iFwSNh dLKbDW ctBiin dpCWkS GRTmj kTEMLB jMTeQI jvGoYZ kzUiXx jgghsP cotrnF gDUEFP kkQHfB kZAzLH cmgOJO htptkG ecNmlG hLgxlS jHEoic jINSKL evcPSM giryCd gGDijT feXfBe jITbLL eRIVNX bGNoIL dhHnTg edaBgK iXLHyW dgzhTf fPdiQx esfhng kzmXai eTeirw bomZSQ qRuIr fXSwsk gRADYt cUKEed cLPxpt goRphv dYtrdl iWpTzO gtxTta kZicqF bKbOkt lbyeAc eBkiiY hGaZXf bCZsOW kdegsu hjsqzA kYwFNq eFYsYO cLNLtU kCUwwN bcgCNq"
	data-styled-version="4.4.1">
/* sc-component-id: sc-50d6daba-0 */
@media all and (max-width:800px) {
	.iFGKHS {
		position: fixed;
		top: 0;
		left: 0;
		right: 0;
		z-index: 3001;
	}
}
/* sc-component-id: sc-6cdbaf43-0 */
.kTEMLB {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	padding-bottom: 32px;
	border-bottom: 1px solid #e5e8eb;
}
/* sc-component-id: sc-cc0f1f42-0 */
.gVjVQf {
	display: grid;
}

/* sc-component-id: sc-6cdbaf43-6 */
.jgghsP {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	margin-top: 18px;
	font-weight: 600;
	font-size: 18px;
	color: #343A3F;
}
/* sc-component-id: sc-91b5901f-0 */
.cotrnF {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
	margin-top: 14px;
}

/* sc-component-id: sc-5b52d054-1 */
.kkQHfB {
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
	-webkit-box-pack: justify;
	-webkit-justify-content: space-between;
	-ms-flex-pack: justify;
	justify-content: space-between;
	-webkit-align-items: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	align-items: center;
}
/* sc-component-id: sc-4fcdc020-0 */
.jITbLL {
	position: relative;
	display: -webkit-box;
	display: -webkit-flex;
	display: -ms-flexbox;
	display: flex;
}

table, th, tr {
	border: 1px solid #bcbcbc;
	border-collapse: collapse;
	text-align: center;
}

.page {
	text-align: center;
}
</style>
	<div class="sc-c965cce8-0 cCHXXw">		
<div class="sc-c965cce8-2 ufBpS">
<form action="memberListAd">
	<select name="select">
		<c:choose>
			<c:when test="${select == 'userId' }">
				<option value="">전체</option>
				<option value="userId" selected="selected">아이디</option>
				<option value="mobile">전화번호</option>
			</c:when>
					
			<c:when test="${select == 'mobile' }">
				<option value="">전체</option>
				<option value="userId">아이디</option>
				<option value="mobile" selected="selected">전화번호</option>
			</c:when>
								
			<c:otherwise>
				<option value="" selected="selected">전체</option>
				<option value="userId">아이디</option>
				<option value="mobile">전화번호</option>
			</c:otherwise>
		</c:choose>
	</select>
	
	
		<c:choose>
			<c:when test="${empty search or search == 'null'}">
				<input type="text" name="search" />
			</c:when>
			
			<c:otherwise>
				<input type="text" name="search" value="${search }" />
			</c:otherwise>
		</c:choose>
			&nbsp;
			<a type="submit">
				<img src="/icon/searchMember.png" alt="검색" class="sc-c965cce8-3 cloNtw">
			</a>
</form>





						</div>
					</div>
				</div>
				<div class="sc-453f21de-2 bkOisR"></div>
			</div>
		</div>	
<div class="sc-50d6daba-2 cDorvW">
	<section class="content">
		<h1>세컨웨어 - 현명한 사람들의 패션 중고거래, 구 헬로마켓</h1>
		<h2>회원 관리 페이지</h2>
		<div class="regist_main_area">
			<div class="regist_top">
				<div class="regist_box_top">
					<div>회원관리</div>
				</div>
			</div>
			<div class="regist_box">
				<div class="description">
					<dl id="member" class="sc-6cdbaf43-0 kTEMLB">
						
						<dd>
						
							<div class="sc-6cdbaf43-6 jgghsP"></div>

							<c:choose>
								<c:when test="${empty members}">
									<h3>등록 후 이용하세요.</h3>
								</c:when>
								<c:otherwise>
									<table
										style='width: 800px; table-layout: fixed; word-break: break-all; height: auto'>
										<tr bgcolor="#A8BDCF">
											<th width="150">아이디</th>
											<th width="150">이름</th>
											<th width="200">생년월일</th>
											<th width="300">E-Mail</th>
											<th width="180">전화번호</th>
										</tr>
										<c:forEach var="member" items="${members}">
											<tr>
												<td onclick="location.href='userInfo?userId=${member.userId }'">
													${member.userId}</td>
												<td>${member.userName}</td>
												<td>${member.birth}</td>
												<td>${member.email}</td>
												<td>${member.mobile}</td>
											</tr>
										</c:forEach>
									</table>
									<div class="sc-6cdbaf43-6 jgghsP"></div>

									
								</c:otherwise>
							</c:choose>
						</dd>
					</dl>
				</div>
			</div>
		</div>
	</section>
	<div class="page" align="center">${result}</div>
</div>

