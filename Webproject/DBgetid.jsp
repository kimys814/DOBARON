<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%@page import="java.sql.*" %>
            <%
    request.setCharacterEncoding("euc-kr");
    %>
        <%
    	if(session.getAttribute("kind") == null){
    		 response.sendRedirect("appl.jsp");
    	}
    %>
    <jsp:useBean id="change" class="project.SomaeDate"/>
    <jsp:setProperty property="*" name="change"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
	<%
	change.dbgetdata((String)session.getAttribute("id"));
	%>
</head>
<body>

<script type="text/javascript">

function popaddress(option) {
 if ( option == "c" ) { // 검색된 우편번호와 주소 가져오기
  theURL = "Addr.jsp?option=" + option ;
  window.open(theURL,"zip","left=100,top=100,width=450,height=300,scrollbars");
 } else {
  theURL = "Addr.jsp" ;
  window.open(theURL,"zip","left=100,top=100,width=450,height=300,scrollbars");
 }
}

function selectOption(sel){
	
	var c = sel.options[sel.selectedIndex].value
	
	switch(c){
	case "1" : {
		document.newid.email2.value = "naver.com";
		document.newid.email2.readOnly = true;
		break;
	}
	case "2" : {
		document.newid.email2.value = "google.co.kr";
		document.newid.email2.readOnly = true;
		break;
	}
	case "3" : {
		document.newid.email2.value = "yahoo.co.kr";
		document.newid.email2.readOnly = true;
		break;
	}
	case "4" : {
		document.newid.email2.value = "daum.net";
		document.newid.email2.readOnly = true;
		break;
	}
	case "0" : {
		document.newid.email2.value = "직접입력";
		document.newid.email2.readOnly = false;
		break;
	}
	}
	
}

function number(num){
	if(isNaN(num.value)){
		alert("숫자를 입력하세요!");
		num.focus();
		num.value = "";
	}
}
function nextFocus(val, valSize, nextIndex){
	if(val.length >= valSize){
		document.newid.elements[nextIndex].focus();
	}
}

</script>
  <form action="SomaeInsert2.jsp" method="post" name="newid">
 
 <table border="0" cellpadding="0" cellspacing="0" width="600">
<tr>
<td align="center" width=600 colspan=4>
 <font face='굴림' size=5>소매업체 회원 정보수정</font><br><BR></td></tr>
<tr>
<td width=120 bgcolor=#75bbd4 height=2></td>
<td bgcolor=#a5c9d9 colspan=3></td>
</tr>
<tr>
<td width='120' nowrap style="padding-left:15px" bgcolor=#eef0f4 height=30>상호</td>
 <td bgcolor=#fcfcfc style="padding-left:10px">
 <font size=3 face='굴림체'>
 <input type=text name="job_name" maxlength=16 style="width:122px" value="<%=change.getJob_name()%>"></font><br>
 </td>
 <td width='120' nowrap style="padding-left:15px" bgcolor=#eef0f4 height=30>사업자<br> 등록 번호</td>
 <td bgcolor=#fcfcfc style="padding-left:10px">
 <font size=3 face='굴림체'>
  <input type=text name="job_value"  maxlength=16  style="width:122px"  value="<%=change.getJob_value()%>" onblur="number(this)" onkeypress="nextFocus(this.value, 10, 2)">
 </font><br>
 </td>
 </tr>
 <tr>
  <td colspan=4 height=1 bgcolor=#dcdcdc></td>
 </tr>
 <tr>
  <td width=120 nowrap style="padding-left:15px" bgcolor=#eef0f4 height=30>아이디</td>
 <td colspan=3 bgcolor=#fcfcfc style="padding-left:10px">
 <font size=3 face='굴림체'>
 <input type=text name="id" value="<%=session.getAttribute("id") %>" maxlength=16 style="width:122px" readonly></font><br>
 </td>
 
 </tr>
 <tr>
  <td colspan=4 height=1 bgcolor=#dcdcdc></td>
 </tr>
 <tr> 
  <td width='120' nowrap style="padding-left:15px" bgcolor=#eef0f4 height=30>패스워드</td>
 <td bgcolor=#fcfcfc style="padding-left:10px">
 <font size=3 face='굴림체'>
 <input type=password name="passwd1" value="" maxlength=16 style="width:122px"></font><br>
 </td>
 <td width='120' nowrap style="padding-left:15px" bgcolor=#eef0f4 height=30>패스워드 확인</td>
 <td bgcolor=#fcfcfc style="padding-left:10px">
 <font size=3 face='굴림체'>
  <input type=password name="passwd2" value="" maxlength=16 style="width:122px">
 </font><br>
 </td>
 </tr>
   <tr>
  <td colspan=4 height=1 bgcolor=#dcdcdc></td>
 </tr>
 <tr>
  <td style="padding-left:15px" bgcolor=#eef0f4 height=30>관련업종</td> 
  <td width='40%' bgcolor=#fcfcfc style="padding-left:10px">
   <select name="academy" style='width:122px'>
   <option selected value="">선택하세요.</option>
   <option value='커피'>커피</option>
   <option value='피자'>피자</option>
   <option value='치킨'>치킨</option>
   <option value='미용실'>미용실</option>
   <option value='외식업'>외식업</option>
   <option value='기타'>기타</option>
  </select>
  </td>
  <td width=140 nowrap style='padding-left:15px' bgcolor=#eef0f4>대표자</td>
  <td width='40%' bgcolor=#fcfcfc style='padding-left:10px'>
   <input type=text name="name" maxlength=20 value='<%=change.getName() %>' style='width:122px'>
  </td>
  </tr>

    <tr>
  <td colspan=4 height=1 bgcolor=#dcdcdc></td>
 </tr>
 <tr>
  <td  width=140 style='padding-left:15px' bgcolor=#eef0f4>주소</td>
  <td colspan=3 bgcolor=#fcfcfc style="padding-left:10px">
    <table width=100%>
   <tr height=24 bgcolor=white>
  
  <td> &nbsp; 
  <input type=text name="zip" value='<%=change.getzip() %>' size=7 maxlength=7 readonly>
  <a href="javascript:popaddress()"><img src='/imgs/tae2.JPG' border=0 align=absmiddle></a>

 </td>
 </tr>
 <tr height=48 bgcolor=white>
  
  <td height=24 > &nbsp; <input type=text name="sangsae" value='<%=change.getsangsae() %>' size=60 maxlength=60  readonly>
  </td>
 </tr>
   <tr height=24 bgcolor=white>
  <td height=24> &nbsp;상세주소 <input type=text name="address" value='<%=change.getaddress() %>' size=51 maxlength=60>
  </td>
 </tr>
  </table>
  </td>
  </tr>
  <tr>
       <td colspan=4 height=1 bgcolor=#dcdcdc></td>
     </tr>
  <tr>
   <td style='padding-left:15px' bgcolor=#eef0f4 rowspan=3>연락처</td>
   <td bgcolor=#fcfcfc style='padding-left:10px' colspan=3 height=30>전화번호:
   <font size=3 face='굴림체'><input type=text style='width:40px'
   maxlength=4 name='tel1' value="<%=change.getTel1() %>" onblur="number(this)" onkeypress="nextFocus(this.value, 3, 11)"></font>)
   <font size=3 face='굴림체'><input type text style='width:40px'
   maxlength=4 name='tel2' value="<%=change.getTel2() %>" onblur="number(this)" onkeypress="nextFocus(this.value, 4, 12)"></font>-
   <font size=3 face='굴림체'><input type text style='width:40px'
   maxlength=4 name='tel3' value="<%=change.getTel3() %>" onblur="number(this)" onkeypress="nextFocus(this.value, 4, 13)"></font> 
  </td>
  </tr>
 <tr>
       <td colspan=4 height=1 bgcolor=#dcdcdc></td>
     </tr>
 <tr>
   <td bgcolor=#fcfcfc style='padding-left:10px' colspan=3 height=30>휴&nbsp;대&nbsp;폰&nbsp;:
   <select name='what' style='width: 100px'>
   <option selceted value=''>선택하세요.</option>
   <option>SKT</option>
   <option>KTF</option>
   <option>LG</option>
   </select>
   <font size=3 face='굴림체'><input type=text style='width:40px'
   maxlength=4 name='phone1' value="<%=change.getPhone1() %>" onblur="number(this)" onkeypress="nextFocus(this.value, 3, 15)"></font>)
   <font size=3 face='굴림체'><input type text style='width:40px'
   maxlength=4 name='phone2' value="<%=change.getPhone2() %>"" onblur="number(this)" onkeypress="nextFocus(this.value, 4, 16)"></font>-
   <font size=3 face='굴림체'><input type text style='width:40px'
   maxlength=4 name='phone3' value="<%=change.getPhone3() %>"" onblur="number(this)" onkeypress="nextFocus(this.value, 4, 17)">
   </font>&nbsp;&nbsp;&nbsp;<br>
   E-mail<input type=text name="email" value=""  style='width:100px;'> @
   <input type="text" name="email2" style='width:130px;' readonly>
         <select name='site' style='width:122px' onchange="selectOption(this);">
   <option selected value="">선택하세요.</option>
   <option value='4'>다음</option>
   <option value='3'>야후</option>
   <option value='2'>구글</option>
   <option value='1'>네이버</option>
   <option value='0'>직접입력</option>
   </select>
   </td>
  </tr>
 <tr>
       <td width=120 bgcolor=#75bbd4 height=2></td>
    <td bgcolor=#a5c9d9 colspan=3></td>
     </tr>
     
</table><br>
<table>
<tr>
<td align="center" width=600 colspan=4>
 
  <font size=4 face='굴림체'><input type=submit name="bt1" value="입력" style="width:60px"></font>
  <font size=4 face='굴림체'><input type=button name="bt2" value="취소" style="width:60px" onclick="history.back();"></font>
 </td>
 </tr>
</table>
</form>
</body>
</html>



