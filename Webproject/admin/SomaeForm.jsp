<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
        <%
    request.setCharacterEncoding("euc-kr");
    	if(session.getAttribute("kind") == null){
   		 response.sendRedirect("../index.jsp");
   	}else if(!session.getAttribute("kind").equals("admin")){
   		 response.sendRedirect("/admin/admin.jsp");
   	}
    %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>ȸ������</title>
</head>
<body>
<script type="text/javascript">

function popaddress(option) {
 if ( option == "c" ) { // �˻��� �����ȣ�� �ּ� ��������
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
		document.newid.email2.value = "�����Է�";
		document.newid.email2.readOnly = false;
		break;
	}
	}
}
function number(num){
	if(isNaN(num.value)){
		alert("���ڸ� �Է��ϼ���!");
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
  <form action="SomaeInsert.jsp" method="post" name="newid">
 
 <table border="0" cellpadding="0" cellspacing="0" width="600">
<tr>
<td align="center" width=600 colspan=4>
 <font face='����' size=5>�Ҹž�ü ȸ�� ���</font><br><BR></td></tr>
<tr>
<td width=120 bgcolor=#75bbd4 height=2></td>
<td bgcolor=#a5c9d9 colspan=3></td>
</tr>
<tr>
<td width='120' nowrap style="padding-left:15px" bgcolor=#eef0f4 height=30>��ȣ</td>
 <td bgcolor=#fcfcfc style="padding-left:10px">
 <font size=3 face='����ü'>
 <input type=text name="job_name" value="" maxlength=16 style="width:122px"></font><br>
 </td>
 <td width='120' nowrap style="padding-left:15px" bgcolor=#eef0f4 height=30>�����<br> ��� ��ȣ</td>
 <td bgcolor=#fcfcfc style="padding-left:10px">
 <font size=3 face='����ü'>
  <input type=text name="job_value" value="" maxlength=16 style="width:122px" " onblur="number(this)" onkeypress="nextFocus(this.value, 10, 2)">
 </font><br>
 </td>
 </tr>
 <tr>
  <td colspan=4 height=1 bgcolor=#dcdcdc></td>
 </tr>
 <tr>
  <td width=120 nowrap style="padding-left:15px" bgcolor=#eef0f4 height=30>���̵�</td>
 <td colspan=3 bgcolor=#fcfcfc style="padding-left:10px">
 <font size=3 face='����ü'>
 <input type=text name="id" value="" maxlength=16 style="width:122px" onfocus="window.open('idcheck.jsp','zip','left=100,top=100,width=150,height=100,scrollbars');document.newid.passwd1.focus();" readonly></font><br>
 </td>
 
 </tr>
 <tr>
  <td colspan=4 height=1 bgcolor=#dcdcdc></td>
 </tr>
 <tr> 
  <td width='120' nowrap style="padding-left:15px" bgcolor=#eef0f4 height=30>�н�����</td>
 <td bgcolor=#fcfcfc style="padding-left:10px">
 <font size=3 face='����ü'>
 <input type=password name="passwd1" value="" maxlength=16 style="width:122px"></font><br>
 </td>
 <td width='120' nowrap style="padding-left:15px" bgcolor=#eef0f4 height=30>�н����� Ȯ��</td>
 <td bgcolor=#fcfcfc style="padding-left:10px">
 <font size=3 face='����ü'>
  <input type=password name="passwd2" value="" maxlength=16 style="width:122px">
 </font><br>
 </td>
 </tr>
   <tr>
  <td colspan=4 height=1 bgcolor=#dcdcdc></td>
 </tr>
 <tr>
  <td style="padding-left:15px" bgcolor=#eef0f4 height=30>���þ���</td> 
  <td width='40%' bgcolor=#fcfcfc style="padding-left:10px">
   <select name="academy" style='width:122px'>
   <option selected value="">�����ϼ���.</option>
   <option value='Ŀ��'>Ŀ��</option>
   <option value='����'>����</option>
   <option value='ġŲ'>ġŲ</option>
   <option value='�̿��'>�̿��</option>
   <option value='�ܽľ�'>�ܽľ�</option>
   <option value='��Ÿ'>��Ÿ</option>
  </select>
  </td>
  <td width=140 nowrap style='padding-left:15px' bgcolor=#eef0f4>��ǥ��</td>
  <td width='40%' bgcolor=#fcfcfc style='padding-left:10px'>
   <input type=text name="name" maxlength=20 value='' style='width:122px'>
  </td>
  </tr>

    <tr>
  <td colspan=4 height=1 bgcolor=#dcdcdc></td>
 </tr>
 <tr>
  <td  width=140 style='padding-left:15px' bgcolor=#eef0f4>�ּ�</td>
  <td colspan=3 bgcolor=#fcfcfc style="padding-left:10px">
    <table width=100%>
   <tr height=24 bgcolor=white>
  
  <td> &nbsp; 
  <input type=text name="zip" value='' size=7 maxlength=7 readonly onfocus="location.href='javascript:popaddress()';document.newid.address.focus()">
  <a href="javascript:popaddress()"><img src='/imgs/tae2.JPG' border=0 align=absmiddle></a>

 </td>
 </tr>
 <tr height=48 bgcolor=white>
  
  <td height=24 > &nbsp; <input type=text name="sangsae" value='' size=60 maxlength=60  readonly>
  </td>
 </tr>
   <tr height=24 bgcolor=white>
  <td height=24> &nbsp;���ּ� <input type=text name="address" value='' size=51 maxlength=60>
  </td>
 </tr>
  </table>
  </td>
  </tr>
  <tr>
       <td colspan=4 height=1 bgcolor=#dcdcdc></td>
     </tr>
  <tr>
   <td style='padding-left:15px' bgcolor=#eef0f4 rowspan=3>����ó</td>
   <td bgcolor=#fcfcfc style='padding-left:10px' colspan=3 height=30>��ȭ��ȣ:
   <font size=3 face='����ü'><input type=text style='width:40px'
   maxlength=4 name='tel1' value="" onblur="number(this)" onkeypress="nextFocus(this.value, 3, 11)"></font>)
   <font size=3 face='����ü'><input type text style='width:40px'
   maxlength=4 name='tel2' value="" onblur="number(this)" onkeypress="nextFocus(this.value, 4, 12)"></font>-
   <font size=3 face='����ü'><input type text style='width:40px'
   maxlength=4 name='tel3' value="" onblur="number(this)" onkeypress="nextFocus(this.value, 4, 13)"></font> 
  </td>
  </tr>
 <tr>
       <td colspan=4 height=1 bgcolor=#dcdcdc></td>
     </tr>
 <tr>
   <td bgcolor=#fcfcfc style='padding-left:10px' colspan=3 height=30>��&nbsp;��&nbsp;��&nbsp;:
   <select name='what' style='width: 100px'>
   <option selceted value=''>�����ϼ���.</option>
   <option>SKT</option>
   <option>KTF</option>
   <option>LG</option>
   </select>
   <font size=3 face='����ü'><input type=text style='width:40px'
   maxlength=4 name='phone1' value="" onblur="number(this)" onkeypress="nextFocus(this.value, 3, 15)"></font>)
   <font size=3 face='����ü'><input type text style='width:40px'
   maxlength=4 name='phone2' value="" onblur="number(this)" onkeypress="nextFocus(this.value, 4, 16)"></font>-
   <font size=3 face='����ü'><input type text style='width:40px'
   maxlength=4 name='phone3' value="" onblur="number(this)" onkeypress="nextFocus(this.value, 4, 17)">
   </font>&nbsp;&nbsp;&nbsp;<br>
   E-mail<input type=text name="email" value=""  style='width:100px;'> @
   <input type="text" name="email2" style='width:130px;' readonly>
         <select name='site' style='width:122px' onchange="selectOption(this);">
   <option selected value="">�����ϼ���.</option>
   <option value='4'>����</option>
   <option value='3'>����</option>
   <option value='2'>����</option>
   <option value='1'>���̹�</option>
   <option value='0'>�����Է�</option>
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
 
  <font size=4 face='����ü'><input type=submit name="bt1" value="�Է�" style="width:60px"></font>
  <font size=4 face='����ü'><input type=reset name="bt2" value="���" style="width:60px"></font>
 </td>
 </tr>
</table>
</form>
 
</body>
</html>








