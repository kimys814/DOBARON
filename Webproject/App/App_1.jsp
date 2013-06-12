<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="App.*" %>
    <%	response.setCharacterEncoding("EUC-KR");
    		String hp = request.getParameter("userPhone");
    		String pwd = request.getParameter("Pwd");%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>받아온 핸드폰 번호를 체크하는 폼...</title>
</head>
<body>
<input type="hidden" value="<%=hp%>" name="handphone">

	<%
	AppDAO dao = AppDAO.getAppDAO();

	if(pwd != null){
		dao.setDivclient_pwd(hp, pwd);
	}
	if(hp != null){
	int check = dao.HpchecktoDB(hp);
	
		if(check == 0){		// 핸드폰 번호가 DB에 없는 경우
			dao.setDivclient(hp,pwd);		// 비밀번호가 당연히 null임
			request.setAttribute("imsi", "0");
			%>
			<jsp:forward page="somae_list.jsp"/>
			<%
		}else if(check == 1){	// 핸드폰 번호가 DB에 있는데 첫접속(Pwd의 값이 null인 경우)
			request.setAttribute("imsi", "0");
			%>
			<jsp:forward page="somae_list.jsp"/>
			<%
		}else if(check == 2){	// 핸드폰 번호가 DB에 있으면서 Pwd도 null이 아닌 경우 (리스트 뿌리는 페이지로 이동)
			request.setAttribute("imsi", "1");
			%>
			<jsp:forward page="somae_list.jsp"/>
			<%
		}else{		// -1 = 오류발생
			
		}
	}

	%>


</body>
</html>