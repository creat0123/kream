<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카테고리2 목록</title>
</head>
<body>
	<h3>카테고리2 목록</h3>
	<c:choose>
		<c:when test="${empty cate2}">
			<h3>등록된 데이터가 없습니다</h3>
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>이름1</th>
					<th>이름2</th>
				</tr>
				<c:forEach var="cate2" items="${cate2}">
					<tr>
						<td>${cate2.cate2No }</td>
						<td>${cate2.cate1Name }</td>
						<td>${cate2.cate2Name }</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>