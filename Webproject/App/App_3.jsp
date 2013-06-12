<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="App.*" %>
    <%	response.setCharacterEncoding("EUC-KR");
    		String hp = request.getParameter("userPhone");
    		String somae = request.getParameter("Somae");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%
AppDAO dao = AppDAO.getAppDAO();

String imsi = dao.getSomaeUser(hp,somae);

request.setAttribute("imsi", imsi);
%>
<jsp:forward page="somae_list.jsp"/>
</form>
</body>
</html>