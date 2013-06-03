
<%@page import="java.sql.Timestamp"%>
<%@page import="board.Board_DAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" %>
    <%request.setCharacterEncoding("euc-kr"); 
      String ip = request.getRemoteAddr();
      Timestamp reg_date = new Timestamp(System.currentTimeMillis());
      String kind = (String)session.getAttribute("kind");
      if(kind == null){
      	response.sendRedirect("../index.jsp");
      }
      if(!kind.equals("somae")){  
      	response.sendRedirect("../index.jsp");
      }
      String writer=(String)session.getAttribute("id");
    %>
	<jsp:useBean id="board" class="board.Board_DTO"/>
	<jsp:setProperty property="*" name="board"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
 <%
 if(writer==null){
   		  %>
   	<script type="text/javascript">
		alert("로그인을 해주시기 바랍니다.");
		location.replace("http://poncoo.com");
	</script>
   		  <%
   	  }
 %>
<title>Insert title here</title>
</head>
<body>
	<%
	Board_DAO dao =  Board_DAO.getBoard_DAO();
	board.setReg_date(reg_date);
	board.setIp(ip);
	board.setWriter(writer);
	int imsi = dao.setBoard(board);
	
	if(imsi > 0){
		// 된거
		%>
		<script type="text/javascript">
		alert("잘 입력되었습니다")
		location.replace("/couboard/board_1.jsp");
		</script>
		
		<%
	}else{
		%>
		<script type="text/javascript">
		alert("입력실패....")
		history.back();
		</script>
		<%
	}
	%>
	
</body>
</html>