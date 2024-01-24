<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>알림</title>
<script type="text/javascript">
    var msg = "${msg}";
    if (msg && msg.trim() !== "") {
        //alert("${sessionScope.id}님 어서오세요.");
        location.href = "index";
    }
</script>
</head>
<body>
</body>
</html>



