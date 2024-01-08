<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드 목록</title>
</head>
<body>
	<h3>브랜드 목록</h3>
	<c:choose>
		<c:when test="${empty brand}">
			<h3>등록된 브랜드가 없습니다</h3>
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>이름</th>
				</tr>
				<c:forEach var="brand" items="${brand}">
					<tr>
						<td>${brand.brandNo }</td>
						<td>${brand.brandName }</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>