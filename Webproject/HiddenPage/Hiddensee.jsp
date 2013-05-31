<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
   <%request.setCharacterEncoding("euc-kr"); %>
   <%@page import="project.HiddenbeanDAO"%>
   <jsp:useBean id="hidden" class="project.HiddenbeanDTO"  scope="session"/>
   <jsp:setProperty property="*" name="hidden"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>사용자 쿠폰 보기</title>
</head>
<body>
<%
	int result = HiddenbeanDAO.getHiddenbeanDAO().selectSomaeUser(hidden);
	
	int cnt = result % 10;
	int hanjan = result / 10;
	
	out.println(hanjan+"잔\n"+cnt+"개 있습니다.");

%>

<form action="Hiddenindex.jsp">
<input type="submit" value="메인화면으로">
<input type="button" value="다른업소확인" onclick="location.href='Hiddenuserselect.jsp'">
</form>
</body>
</html>