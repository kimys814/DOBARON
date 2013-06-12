<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%
    request.setCharacterEncoding("euc-kr");
    %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ID Check Form</title>
</head>
<body>
<form action="idcheck2.jsp" name="checkid">
사용하실 ID를 입력하세요<br>
<input type="text" name="id"><br>
<input type="submit" value="확인">
<input type="hidden" name="hiden">
</form>

</body>
</html>