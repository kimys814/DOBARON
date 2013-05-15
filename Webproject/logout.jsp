<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    session.invalidate();
    %>

    <%
    response.sendRedirect("index.jsp");
    // 버퍼가 비워지는데 스크립트가 반영이 안되기 때문에 리다이렉트를 쓰는거보다
    // 스크립트 타입으로 정의해야한다.
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

</body>
</html>