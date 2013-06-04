<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
                    <%
    request.setCharacterEncoding("euc-kr");
                    if(session.getAttribute("kind") == null){
                        response.sendRedirect("../index.jsp");
                   }else if(!session.getAttribute("kind").equals("somae")){
                            response.sendRedirect("/admin/admin.jsp");
                     }
    %>
    <jsp:useBean id="lookat" class="project.SomaeDBLook"/>
    <jsp:setProperty property="*" name="lookat"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>입력확인</title>
</head>
	<%
	int a =lookat.dbcheck((String)session.getAttribute("id"));
	StringTokenizer st = null;
	out.println("총 데이터 숫자 : "+a);
	%>
<body>
<center>
<table>
<tr>
	<td>
	사용자
	</td>
	<td>
	쿠폰 변화
	</td>
	<td>
	쿠폰 사용(10개)
	</td>
	<td>
	수정
	</td>
	<td>
	시간
	</td>
</tr>
<%
for(int i=0; i<a; i++){
	st = new StringTokenizer(lookat.getImsi().get(i),"|");
	String phone = st.nextToken();
	if(phone.length()>7){
		phone = phone.substring(0,3)+"****"+phone.substring(7);
	}
	%>
<tr>
	<td><%=phone %>
	</td>
	<td><%=st.nextToken() %>개
	</td>
	<td><%=st.nextToken() %>잔 사용
	</td>
	<td><%=st.nextToken() %>개
	</td>
	<td><%=st.nextToken() %>
	</td>
</tr>
<%} %>
</table>
<input type="button" onclick="location.href='selectSomae_1.jsp'" value="다른검색">
<input type="button" onclick="location.href='../index.jsp'" value="초기화면으로">
</center>
</body>
</html>