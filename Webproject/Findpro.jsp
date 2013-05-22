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
<title>:::::스탬프:::::</title>
</head>
<body>
<%
	
	if(client.gum())//테이블에 검사하는 로직 리턴타입은 //  boolean
	{	//빈즈 자체는 넘길때 한페이지에서만 사용 가능할뿐 나머지는 NULL이다 그러나 포워드를 이용하면 그다음페이지에서도 이용가능
		
		%>
		<jsp:forward page="Printstamp.jsp"></jsp:forward>
		<%
		
		//스탬프 출력		
	}else{
		 %>
		 <script type="text/javascript">
		 if(confirm("회원가입하시겠습니까?")){
			 <%	//기억해 이미 나는 소매 아이디로 로그인한 상태야 따로 테이블 찾을필요는 없어!!!!!!!!!!!!!!!!!
				//InPut 안에 세션으로 아이디 입력받아서 테이블명 바로 넘기기
				
				//회원가입 시키는 메서드 총하고 소매 하에 테이블 둘다 들어가겠금 로직해노음
				//다시 번호입력으로 돌아가는 메서드
			 %>
			 location.replace("NewClient.jsp");
		 }else{
			 history.back();
		 }
		 </script>
		<%
	}
%>
</body>
</html>