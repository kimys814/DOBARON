<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%request.setCharacterEncoding("euc-kr");%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>히든 페이지지롱~</title>
</head>
<script type="text/javascript">
function num(a){
	if(isNaN(a.value)){
		alert("핸드폰 번호를 입력하세요");
		a.value = "";
		a.focus();
	}
}
</script> 	
<body>
<form action="Hiddenuserselect.jsp" method="post">
<input type="text" name="hp" onblur="num(this)">
<input type="submit" value="입력">
</form>
</body>
</html>