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
<title>Insert title here</title>
</head>
<body>

<h3 style="color:#F00;">
<%
int a = lookat.Somaecheck((String)session.getAttribute("id"));
StringTokenizer st = null;
out.println(" 총 데이터 개수 : " +a);
	%>
</h3>

<center>
<table>
<tr>
	<td align="center" width="400px" bgcolor="#D6D6D6">
		<h3 p align="center" style="color:#585858;">사용자</h3>
	</td>
	<td align="center" width="250px" bgcolor="#D6D6D6">
		<h3 p align="center" style="color:#585858;">쿠폰개수</h3>
	</td>
	<td align="center" width="300px" bgcolor="#D6D6D6">
		<h3 p align="center" style="color:#585858;">한잔(10개)</h3>
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
	<td align="center">
		<h3 p align="center" style="color:#FFF;"><%=phone%></h3>
	</td>
	<td align="center">
		<h3 p align="center" style="color:#FFF;"><%=st.nextToken() %>개</h3>
	</td>
	<td align="center">
		<h3 p align="center" style="color:#FFF;"><%=st.nextToken() %>잔</h3>
	</td>
</tr>
<%} %>
</table>
<input type="button" style="font-size:36px;" onclick="location.href='selectSomae_1.jsp'" value="다른검색">

</center>
</body>
</html>