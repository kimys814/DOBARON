<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <% request.setCharacterEncoding("euc-kr"); 
    String kind = (String)session.getAttribute("kind");
    if(kind == null){
    	response.sendRedirect("../index.jsp");
    }
    if(kind.equals("somae")){  
    }else if(kind.equals("admin")){
    }else{
    	response.sendRedirect("../index.jsp");
    }
    %>
    <jsp:useBean id="client" class="project.Clientgum" scope="session"/>
    <jsp:setProperty property="*" name="client"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>한잔 사용</title>
</head>
<body>
<%
if(client.getHanjan()==0){
	%>
	<script type="text/javascript">
	alert("사용하실 수 있는 쿠폰이 없습니다.")
	history.back();
	</script>
	<%
}else{
client.setHanjan(client.getHanjan()-1);
client.setHcnt();
}
%>
<script type="text/javascript">
location.replace("../pon/mponcoo<%=client.getCnt()%>.jsp");
</script>

</body>
</html>