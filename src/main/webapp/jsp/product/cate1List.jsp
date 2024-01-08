<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>카테고리1 목록</h3>
	<c:choose>
		<c:when test="${empty cate1}">
			<h3>등록된 데이터가 없습니다</h3>
		</c:when>
		<c:otherwise>
			<table border="1">
				<tr>
					<th>번호</th>
					<th>이름</th>
				</tr>
				<c:forEach var="cate1" items="${cate1}">
					<tr>
						<td>${cate1.cate1No }</td>
						<td>${cate1.cate1Name }</td>
					</tr>
				</c:forEach>
			</table>
		</c:otherwise>
	</c:choose>
</body>
</html>