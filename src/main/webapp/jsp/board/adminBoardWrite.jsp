<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<%@ include file="../default/header.jsp"%>
<link rel="icon" href="/img/A.png">
<style>
.card {
	width: 800px;
	margin: 0 auto;
}

.selectBox {
	position: relative;
	text-align: center;
	width: 100px;
	height: 35px;
	border-radius: 10px;
	border: 1px solid #999;
}

.card-header1 h1 {
	font-size: 30px;
	font-weight: 600;
}

.card-write {
	padding: 20px;
}

.card-write input, texarea {
	margin-left: 10px;
	padding: 10px;
	border: 1px solid #999;
	border-radius: 10px;
	box-shadow: 3px 3px 10px #e6e6e6;
}

.card-write .subject_title {
	font-size: 13px;
	font-family: 600;
	margin-right: 10px;
}

.card-write .myinfo input[type="text"] {
	width: 25%;
}

.card-write .title-w input[type="text"] {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 85.5%
}

.card-write .area {
	margin-top: 20px;
	margin-bottom: 20px;
}

.card-write .animalinfo {
	margin-top: 20px;
	margin-bottom: 20px;
}

.card-write .day {
	margin-top: 20px;
	margin-bottom: 20px;
}

.card-write .msg {
	margin-top: 20px;
}

.card-write .msg textarea {
	min-width: 90.5%;
	max-width: 90.5%;
	min-height: 200px;
	max-height: 200px;
	box-shadow: inset 3px 3px 10px #e6e6e6;
	vertical-align: top;
}

.card-write input[type="file"] {
	border: none;
	box-shadow: none;
	padding: 10px;
}

.btn-w {
	text-align: center;
	margin: 0 auto;
	padding: 10px;
}

.btn-w input {
	border: none;
	padding: 10px;
	border-radius: 10px;
}
</style>
<div align="center" style="margin-top: 150px;">

	<form action="adminBoardWriteProc" method='post'
		enctype="multipart/form-data">
		<div class="card">
			<div class="card-write">
				<table>

					<tr>
						<th width="100px">제목</th>
						<td><input style="width: 100%;" type="text" name="title"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea style="width: 150%; margin-left: 10px;"
								rows="10" cols="30" name="content"></textarea></td>
					</tr>
					<tr>
						<th>이미지첨부</th>
						<td><input type="file" name="image"></td>
					</tr>
					</div>
					<tr>
						<div class="card-write">
							<div class="btn-w">
								<td colspan="2" align="center"><input type="submit"
									style="cursor: pointer;" value="글쓰기"> <input
									type="button" style="cursor: pointer;" value="목록"
									onclick="location.href='notice'"></td>
							</div>
						</div>
					</tr>
				</table>
			</div>
	</form>
</div>

<%@ include file="../default/footer.jsp"%>