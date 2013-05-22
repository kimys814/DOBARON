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
    <jsp:useBean id="client" class="project.Clientgum" scope="session" />
    <jsp:setProperty property="*" name="client"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Stamp 를 찍어봅시다.</title>
</head>

<script>if(top!=self) top.location=this.location;</script>

<body>

<div align="center">

<%

int tmp,hanjan,cnt;
	tmp=client.prin((String)session.getAttribute("id"));//현재의 쿠폰 총 갯수를 받아준다
	hanjan=tmp/10;//나눠지는 값이 한잔이고
	cnt=tmp%10;//나머지 값을 낱 개로 받아주고
	client.jointime((String)session.getAttribute("id"));
	if(tmp!= -1){
		 client.setCnt(cnt);//화면에서 쿠폰 갯수를 찍어주면 같은 페이지로 재호출하지만
		 client.setHanjan(hanjan);//값 자체가 날라가기 때문에 scope를 session으로 잡아주고
		 							//다음페이지에서도 쓰기위해 한잔과 낱개쿠폰 삽입
		%>
		<script type="text/javascript">
		location.replace("../pon/mponcoo<%=cnt%>.jsp");//쿠폰 현재 갯수가 담긴 페이지 호출
		</script>
		
		<%
		
	}else{//예외로 넘어오는 값은-->처리
		%>
		<script type="text/javascript">
		alert("잘못된 정보입니다.");
		location.replace("FindClientStamp.jsp");//쿠폰 찍는 화면으로 보내기
		</script>
		<%
	}
		%>
	</div>
</body>
</html>