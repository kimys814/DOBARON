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
<title>�ϴ�Ȯ��</title>
</head>
<body>
<script type="text/javascript">
var aa = "<%=Somae.getId()%>";
</script>

<%
int a= Somae.dbidcheck(); 

if(a==1){%><script type="text/javascript">	
		alert("���̵� �Է��� �ּ���.");
		history.back();	</script><%
}else if(a==2){%><script type="text/javascript">	
		alert("ID�� 4~12�� �� ����ϼž� �˴ϴ�.\n�Էµ� ID : ��"+aa+"��");
		history.back();	</script><%	
}else if(a==3){%><script type="text/javascript">	
		alert("�̹� �����ϴ� ID�Դϴ�.\n�Էµ� ID : ��"+aa+"��");
		history.back();	</script><%
}else {%>
		<script type="text/javascript">
		if(confirm("<%=Somae.getId()%>�� ����Ͻðڽ��ϱ�?")){
			opener.document.newid.id.value = aa;
			self.close();
		}else{
			history.back();
		}
		</script>
<%} %>

</body>
</html>