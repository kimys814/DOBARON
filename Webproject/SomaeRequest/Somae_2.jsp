
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"  import = "java.sql.*" import="java.util.Date"%>
    <%   request.setCharacterEncoding("euc-kr");    %>
    <%@page import="somaerequest.SomaeDAO"%>
   <jsp:useBean id="Somae" class="somaerequest.SomaeDTO"></jsp:useBean>
	<jsp:setProperty property="*" name="Somae"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입폼</title>
</head>
<body>

	<script type="text/javascript">
	<%
	if(Somae.getId() == null){
		%>
		alert("ID를 입력하세요.");
		history.back();
		<%
	}else if(Somae.getName()==null){	// name 값 비교 if문
		%>
		alert("대표자명을 입력해 주세요");
		history.back();
		<%
	}else if(Somae.getPasswd1()==null){
		%>
		alert("비밀번호를 입력해 주세요.");
		history.back();
		<%
	}else if(!Somae.getPasswd1().equals(Somae.getPasswd2())){
		%>
		alert("비밀번호와 확인창의 입력내용이 다릅니다.");
		history.back();
		<%
	}else if(Somae.getPasswd1().length() <4 || Somae.getPasswd1().length() > 12){		// 패스워드 확인 창
		%>
		alert("PW의 형태는 4~12자 입니다.");
		history.back();
		<%
	}else if(Somae.getJob_name()==null){
		%>
		alert("상호를 입력하세요.");
		history.back();
		<%
	}else if(Somae.getJob_value()==null){
		%>
		alert("사업자 번호를 입력하세요.");
		history.back();
		<%
	}else if(Somae.getAcademy()==null){
		%>
		alert("관련업종을 선택해 주세요.");
		history.back();
		<%
	}else if(Somae.getTel1()==null|| Somae.getTel2()==null || Somae.getTel3()==null){
		%>
		alert("전화번호를 입력하세요.");
		history.back();
		<%
	}else if(Somae.getWhat()==null){
		%>
		alert("핸드폰 업체를 선택하세요.");
		history.back();
		<%
	}else if(Somae.getPhone1()==null||Somae.getPhone2()==null||Somae.getPhone3()==null){
		%>
		alert("핸드폰 번호를 입력하세요.");
		history.back();
		<%
	}else if(Somae.getEmail()==null){
		%>
		alert("이메일 ID를 입력하세요.");
		history.back();
		<%
	}else if(Somae.getSite()==null||Somae.getEmail2()==null){
		%>
		alert("주소를 선택해 주세요.");
		history.back();
		<%
	}else if(Somae.getZip()==null){
		%>
		alert("버튼을 누르셔서 주소를 찾아주세요.");
		history.back();
		<%
	}else if(Somae.getAddress()==null){
		%>
		alert("상세주소를 입력해 주세요.");
		history.back();
		<%
	}else{
		
		SomaeDAO dao = SomaeDAO.getSomaeDAO();
		
		int imsi = dao.setMEMBER_IMSI(Somae);
		
		if(imsi > 0){
			%>
			alert("회원가입 신청 정상적으로 되었습니다.");
			parent.location.href='../index.jsp'; 
			<%
		}else{
			%>
			alert("입력실패");
			history.back();
			<%
		}
	}
		
	%>
	</script>
</body>
</html>