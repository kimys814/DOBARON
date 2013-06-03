<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%request.setCharacterEncoding("EUC-KR"); 
   	  String writer=(String)session.getAttribute("id");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="Jquery.js"></script>
<style type="text/css">
.contener{
	width:800px;
	
	
}
.ex{
	text-align:center;
	float: left;
}
.void{
}

</style>
<script type="text/javascript">
$(document).ready(function(){
		$('.answer').hide();
		$('.main').toggle(
			function(){
				$(this).next('.answer').fadeIn();
				$(this).addClass('close');
			},
			function(){
				$(this).next('.answer').fadeOut("fast");
				$(this).removeClass('close');
			}
		);//토글함수 끝
});  //ready함수끝
</script>
<title>		Poncoo 게시판	 </title>
<script type="text/javascript">
function makingtitle(a){
	if(a.length < 25){
		document.f.title.value=a;
		f.submit();
	}else{
		document.f.title.value = a.substring(0,25)+"...";
		f.submit();
	}
}


</script>
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
</head>
<body>


<h2 align="center">게시판</h2>

<form action="/couboard/board_2.jsp" method="post" name="f">
<table align="center">
		<tr>
			<td>내용<br>입력</td>
			<td><textarea cols="88" rows="5" style="resize:none;" name="content"></textarea></td>
			<td>공지<input type="radio" name="choice" value="공지" checked="checked"><br>이벤트<input type="radio" name="choice" value="이벤트"></td>
			<td><input type="button" onclick="makingtitle(f.content.value)" style="font-size:36px" value="입력"></td>
		</tr>
</table>

	<input type="hidden" name="title">
</form>

	<%
	 
	SimpleDateFormat sdf = new SimpleDateFormat("MM월 dd일");
	Board_DAO dao = Board_DAO.getBoard_DAO();
	ArrayList<Board_DTO> arr = new ArrayList<Board_DTO>(dao.getBoard((String)session.getAttribute("id")));
	
	if(arr.size()>0){

	%>
<form action="/couboard/board_3.jsp" method="post">

    
    <p align="right"><input type="submit" style="font-size:36px" value="삭제" align="right"></p>


<table border="0">
		<tr>
				<td width="100" bgcolor="#6699FF">날짜</td>
				<td width="70" bgcolor="#6699FF">글성격</td>
				<td width="600" bgcolor="#6699FF">글내용</td>
				<td width="60" bgcolor="#6699FF">선택</td>
		</tr>
</table>
</div>

			<%
				for(Board_DTO dto : arr){
			 %>
	<div class="ex" align="center">
		<div class="main" align="center">
                <center>
                	<table border="0">
						<tr>
							<td width="100" bgcolor="#CCCCCC"><%=sdf.format(dto.getReg_date())%></td>
							<td width="70" bgcolor="#CCCCCC"><%=dto.getChoice() %></td>
							<td width="600" bgcolor="#CCCCCC"><%=dto.getTitle() %></td>
						</tr>
					</table>
                </center>
        	</div>
			<div class="answer" align="center">
                <center>
        			<table border="0">
						<tr>
        					<td width="782"><%=dto.getContent() %></td>
        				</tr>
					</table>
        		</center>
		</div>
	</div>
	<div class="ex" align="center">
    <center>
    <table border="0">
    	<tr>
    		<td width="56" bgcolor="#CCCCCC">
    			<input type="checkbox" name="type" value="<%=dto.getNum()%>">
    		</td>
    	</tr>
    </table>
    </center>
    </div>
	<%
		}
	%>

<%
	}else{
		out.println("현재 입력된 데이터가 없습니다");
	}
%>

</form>

</body>

</html>