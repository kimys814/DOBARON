<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
            <%
    request.setCharacterEncoding("euc-kr");
    %>
	<jsp:useBean id="Somae" class="project.SomaeDate" scope="request"/>
    <jsp:setProperty property="*" name="Somae"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>일단확인</title>
</head>
<body>
<script type="text/javascript">
var aa = "<%=Somae.getId()%>";
</script>

<%
int a= Somae.dbidcheck(); 

if(a==1){%><script type="text/javascript">	
		alert("아이디를 입력해 주세요.");
		history.back();	</script><%
}else if(a==2){%><script type="text/javascript">	
		alert("ID는 4~12자 로 사용하셔야 됩니다.\n입력된 ID : 『"+aa+"』");
		history.back();	</script><%	
}else if(a==3){%><script type="text/javascript">	
		alert("이미 존재하는 ID입니다.\n입력된 ID : 『"+aa+"』");
		history.back();	</script><%
}else {%>
		<script type="text/javascript">
		if(confirm("<%=Somae.getId()%>를 사용하시겠습니까?")){
			opener.document.newid.id.value = aa;
			self.close();
		}else{
			history.back();
		}
		</script>
<%} %>

</body>
</html>