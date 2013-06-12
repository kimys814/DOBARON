
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%
    	if(session.getAttribute("kind") == null){
    		 response.sendRedirect("../index.jsp");
    	}else if(!session.getAttribute("kind").equals("admin")){
    		 response.sendRedirect("/admin/admin.jsp");
    	}

    request.setCharacterEncoding("euc-kr");
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>���ȿ�����::����</title>
<link href="/inc/text_style.css" rel="stylesheet">
<style type="text/css">
<!--
body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-image:url("/img/bImgTop.jpg");
	background-repeat:repeat-x;
	margin: 0;
	padding: 0;
	color: #000;
}

/* ~~ ���/�±� ���ñ� ~~ */
ul, ol, dl { /* ���������� �ٸ��Ƿ� ����� �е��� ������ 0���� �����ϴ� ���� ���� �����ϴ�. �ϰ����� ����, ���⿡�� �Ǵ� �����ϰ� �ִ� ��� �׸�(LI, DT, DD)���� ���ϴ� ũ�⸦ ������ �� �ֽ��ϴ�. ���� ��ü���� ���ñ⸦ ���� �ʴ� �� ���⿡�� ������ �۾��� .nav ��Ͽ� ��ܽ����� ǥ�õ˴ϴ�. */
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 /* ���� ������ �����ϸ� ���Ե� div���� ������ �̽��������Ǵ� ������ ������ �� �ֽ��ϴ�. ������ �Ʒ��� ������ �̾����� ��ҿ��� �� ������ �����մϴ�. */
	padding-right: 15px;
	padding-left: 15px; /* div�� ���� �߰��ϴ� ��� div ���� �ִ� ����� ���鿡 �е��� �߰��ϸ� ���� �� ������ ���ŵ˴ϴ�. ���� �е��� �ִ� ��ø�� div�� ��ü �޼���� ����� ���� �ֽ��ϴ�. */
}
a img { /* �� ���ñ�� ��ũ�� �ѷ����� �̹��� �ֺ��� �ִ� �Ϻ� �������� ǥ�õ� �Ķ��� �⺻ �׵θ��� �����մϴ�. */
	border: none;
}

/* ~~ ����Ʈ ��ũ�� ��Ÿ�ϸ��� Ŀ�� ���� ȿ���� �����ϴ� ���ñ� �׷��� �����Ͽ� �� ������� ���� �־�� �մϴ�. ~~ */
a:link {
	color:#414958;
	text-decoration: underline; /* �ſ� ��Ư�ϰ� ���̵��� ��ũ�� ��Ÿ���� �����ϴ� ��츦 �����ϰ�� �ð������� ������ �ĺ��ǵ��� ������ �����ϴ� ���� ���� �����ϴ�. */
}
a:visited {
	color: #4E5869;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* �� ���ñ� �׷��� ���콺�� ����ϴ� ����� ������ Ŀ�� ���� ȯ���� Ű���� Ž���⿡ �����մϴ�. */
	text-decoration: none;
}

/* ~~ �� �����̳ʴ� ����� ������ ���� �����ϴ� �ٸ� ��� div�� �ѷ��Դϴ�. ~~ */
.container {
	width: 100%;
	max-width: 1260px;/* ���� ����Ϳ��� �� ���̾ƿ��� ����ġ�� �о����� ���� �����ϱ� ���� max-width�� ����� �� �ֽ��ϴ�. �� �Ӽ��� ����ϸ� �� ���̸� ���� ���� ���� �� �ֽ��ϴ�. IE6������ �� ������ ������� �ʽ��ϴ�. */
	min-width: 1260px;/* �� ���̾ƿ��� ����ġ�� �������� ���� �����ϱ� ���� min-width�� ����� �� �ֽ��ϴ�. �� �Ӽ��� ����ϸ� ���̵� ������ �� ���̸� ���� ���� ���� �� �ֽ��ϴ�. IE6������ �� ������ ������� �ʽ��ϴ�. */
	
	margin: 0 auto; /* ���� �ڵ� ��, ������ ����, ���̾ƿ� ��� ����. .container�� ���� 100%�� �����ϴ� ��쿡�� �ʿ����� �ʽ��ϴ�. */
}

/* ~~�Ӹ��ۿ��� ���� �������� �ʽ��ϴ�. ���̾ƿ��� ��ü ���� Ȯ��˴ϴ�. ����� ��ü �ΰ�� ��ü�Ǿ�� �ϴ� �̹��� �ڸ� ǥ���ڸ� �����մϴ�.~~ */
.header {

}

/* ~~ ���̾ƿ� �����Դϴ�. ~~ 

1) �е��� div�� ���� ��/�Ǵ� �Ʒ��ʿ��� ��ġ�˴ϴ�. �� div�� ���Ե� ����� ��� ���鿡 �е��� �ֽ��ϴ�. �̸� ���� "���� �� ����"���� ���ܵ˴ϴ�. div ��ü�� ���� �е� �Ǵ� �׵θ��� �߰��ϸ� *��ü* ���� ����� ���� ������ ���� �߰��˴ϴ�. div ���� ��ҿ��� �е��� �����ϰ�, �����ο� �ʿ��� �е��� ���� ���� ���·� ���ο� �� ��° div�� ��ġ�� ���� �ֽ��ϴ�.

*/
.content {
	padding: 10px 0;
}

/* ~~ �׷�ȭ�� �� ���ñ�� .content ���� ������ ����� �����մϴ�. ~~ */
.content ul, .content ol { 
	padding: 0 15px 15px 40px; /* �� �е��� �Ӹ����� ������ �е��� ���� �ܶ� ��Ģ�� �̷����մϴ�. �е��� ��Ͽ��� �ٸ� ��ҵ� ������ ���� �Ʒ��ʰ� �鿩���� ������ ���� ���ʿ� ��ġ�Ǿ����ϴ�. �е��� ���ϴ� ��� ������ �� �ֽ��ϴ�. */
}

/* ~~ �ٴڱ� ~~ */
.footer {
	padding: 10px 0;
	background-color: #6F7D94;
}

/* ~~ ��Ÿ �ε�/Ŭ���� ����� ~~ */
.fltrt {  /* �� Ŭ������ ���������� ������ ��Ҹ� �ε�ȭ�ϴ� �� ���� �� �ֽ��ϴ�. �ε�ȭ�� ��Ҵ� ���������� ���� �ִ� �ٸ� ����� ���ʿ� ��ġ�Ǿ�� �մϴ�. */
	float: right;
	margin-left: 8px;
}
.fltlft { /* �� Ŭ������ ���������� ���� ��Ҹ� �ε�ȭ�ϴ� �� ���� �� �ֽ��ϴ�. �ε�ȭ�� ��Ҵ� ���������� ���� �ִ� �ٸ� ����� ���ʿ� ��ġ�Ǿ�� �մϴ�. */
	float: left;
	margin-right: 8px;
}
.clearfloat { /* #container���� #footer�� ���ŵǰų� ������ ��� <br /> �� Ŭ������ ������ �ε� div(#container ��) �ڿ� ���� ���� ��ҷ� �� div�� ��ġ�� �� �ֽ��ϴ�. */
	clear:both;
	height:0;
	font-size: 1px;
	line-height: 0px;
}
-->
A:link {text-decoration:none}
A:visited {text-decoration:none}
A:hover {text-decoration:none}
</style>
<script type="text/javascript">
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}
</script>
</head>

<body>

<div class="container" style="filter:alpha(opacity=10)">
  <div class="header" style="filter: alpha(opacity=10); font-family: Tahoma, Geneva, sans-serif; font-size: small; color: #FFF;">
    <table width="100%" border="0">
      <tr>
        
        <td height="33"><div align="right">�������~ �����ڴ�</div></td>
        <td width="3%"></td>
      </tr>
      <tr>
        <td rowspan="2" >
          
          <h3 align="right">
           <a href="/admin/admin.jsp"><font color="#FFFF66">����ȭ��</font></a>&nbsp;&nbsp;&nbsp;
            <!--a href="/admin/domaePro.html"--><font color="#FFFFFF">��������Ͽ�û</font><!--/a-->&nbsp;&nbsp;&nbsp;
            
            <a href="/admin/somaePro.jsp"--><font color="#FFFF66">Ŀ������Ͽ�û</font></a>&nbsp;&nbsp;&nbsp;
            <a href="/admin/newMem.jsp"><font color="#FFFF66">���Ҹ�ȸ������</font></a>&nbsp;&nbsp;&nbsp;
            <a href="/admin/somaeMem.jsp"><font color="#FFFF66">�Ҹ�ȸ������Ʈ</font></a>&nbsp;&nbsp;&nbsp;
            <!--a href="/admin/domaeMem.html"--><font color="#FFFFFF">����ȸ������Ʈ</font><!--/a-->&nbsp;&nbsp;&nbsp;
            <!--a href="/admin/lastMem.html"--><font color="#FFFFFF">�Һ�ȸ������Ʈ</font><!--/a-->&nbsp;&nbsp;&nbsp;
            <!--a href="/admin/notice.html"--><font color="#FFFF66">��������</font><!--/a-->&nbsp;&nbsp;&nbsp;
            <!--a href="/admin/domaeSell.html"--><font color="#FFFFFF">�Խ��Ǳ��Ѽ���</font><!--/a-->&nbsp;&nbsp;&nbsp;
            <!--a href="/admin/recomShop.html"--><font color="#FFFFFF">������õ</font><!--/a-->&nbsp;&nbsp;&nbsp;
            </h3>        </td>
        <td>
        </td>
      </tr>
      <tr>
        <td height="51"></td>
      </tr>
      <tr>
        <td height="35"></td>
        <td>&nbsp;</td>
      </tr>
    </table>
 
  </div>
  <div class="content" align="center">
  
  <!--������ ǥ�õ� �Ҹ�ȸ�� ������ -->
  
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
  <font size=4 face='����ü'><input type=button name="bt1" value="�˻�" style="width:60px" onclick="location.href='javascript:popaddress()'"></font></a>

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
  <!-- end .content --></div>
  <div class="footer">
     <p align="center"><font color="#ffffff" size="2"> WebProgramer Grup (��)PonCoo 2013<br />
      E-mail : javakings@naver.com *��ǥ�̻�: �迵�� *��������å����: �� ȯ<br />
    ����� ���ϱ� �Ｑ�� �Ѽ����б� ���а� 115ȣ </font></p>
<!-- end .container --></div>
<!-- end .footer --></div>
</body>
</html>
