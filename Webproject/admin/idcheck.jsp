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
����Ͻ� ID�� �Է��ϼ���<br>
<input type="text" name="id"><br>
<input type="submit" value="Ȯ��">
<input type="hidden" name="hiden">
</form>

</body>
</html>