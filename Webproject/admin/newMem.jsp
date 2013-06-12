
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
<title>폰안에쿠폰::폰쿠</title>
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

/* ~~ 요소/태그 선택기 ~~ */
ul, ol, dl { /* 브라우저마다 다르므로 목록의 패딩과 여백을 0으로 지정하는 것이 가장 좋습니다. 일관성을 위해, 여기에서 또는 포함하고 있는 목록 항목(LI, DT, DD)에서 원하는 크기를 지정할 수 있습니다. 보다 구체적인 선택기를 쓰지 않는 한 여기에서 수행한 작업은 .nav 목록에 계단식으로 표시됩니다. */
	padding: 0;
	margin: 0;
}
h1, h2, h3, h4, h5, h6, p {
	margin-top: 0;	 /* 위쪽 여백을 제거하면 포함된 div에서 여백이 이스케이프되는 문제를 방지할 수 있습니다. 나머지 아래쪽 여백은 이어지는 요소에서 이 문제를 보류합니다. */
	padding-right: 15px;
	padding-left: 15px; /* div에 직접 추가하는 대신 div 내에 있는 요소의 측면에 패딩을 추가하면 상자 모델 수학이 제거됩니다. 측면 패딩이 있는 중첩된 div를 대체 메서드로 사용할 수도 있습니다. */
}
a img { /* 이 선택기는 링크로 둘러싸인 이미지 주변에 있는 일부 브라우저에 표시된 파란색 기본 테두리를 제거합니다. */
	border: none;
}

/* ~~ 사이트 링크의 스타일링은 커서 놓기 효과를 생성하는 선택기 그룹을 포함하여 이 순서대로 남아 있어야 합니다. ~~ */
a:link {
	color:#414958;
	text-decoration: underline; /* 매우 독특하게 보이도록 링크에 스타일을 지정하는 경우를 제외하고는 시각적으로 빠르게 식별되도록 밑줄을 적용하는 것이 가장 좋습니다. */
}
a:visited {
	color: #4E5869;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* 이 선택기 그룹은 마우스를 사용하는 사람과 동일한 커서 놓기 환경을 키보드 탐색기에 제공합니다. */
	text-decoration: none;
}

/* ~~ 이 컨테이너는 백분율 기준의 폭을 제공하는 다른 모든 div를 둘러쌉니다. ~~ */
.container {
	width: 100%;
	max-width: 1260px;/* 대형 모니터에서 이 레이아웃이 지나치게 넓어지는 것을 방지하기 위해 max-width를 사용할 수 있습니다. 이 속성을 사용하면 선 길이를 더욱 쉽게 읽을 수 있습니다. IE6에서는 이 선언이 적용되지 않습니다. */
	min-width: 1260px;/* 이 레이아웃이 지나치게 좁아지는 것을 방지하기 위해 min-width를 사용할 수 있습니다. 이 속성을 사용하면 사이드 열에서 선 길이를 더욱 쉽게 읽을 수 있습니다. IE6에서는 이 선언이 적용되지 않습니다. */
	
	margin: 0 auto; /* 측면 자동 값, 폭으로 연결, 레이아웃 가운데 정렬. .container의 폭을 100%로 설정하는 경우에는 필요하지 않습니다. */
}

/* ~~머리글에는 폭이 지정되지 않습니다. 레이아웃의 전체 폭이 확장됩니다. 연결된 자체 로고로 대체되어야 하는 이미지 자리 표시자를 포함합니다.~~ */
.header {

}

/* ~~ 레이아웃 정보입니다. ~~ 

1) 패딩은 div의 위쪽 및/또는 아래쪽에만 배치됩니다. 이 div에 포함된 요소의 경우 측면에 패딩이 있습니다. 이를 통해 "상자 모델 수학"에서 제외됩니다. div 자체에 측면 패딩 또는 테두리를 추가하면 *전체* 폭을 만들기 위해 정의한 폭에 추가됩니다. div 내의 요소에서 패딩을 제거하고, 디자인에 필요한 패딩과 폭이 없는 상태로 내부에 두 번째 div를 배치할 수도 있습니다.

*/
.content {
	padding: 10px 0;
}

/* ~~ 그룹화된 이 선택기는 .content 영역 공간에 목록을 제공합니다. ~~ */
.content ul, .content ol { 
	padding: 0 15px 15px 40px; /* 이 패딩은 머리글의 오른쪽 패딩과 위의 단락 규칙을 미러링합니다. 패딩은 목록에서 다른 요소들 사이의 공간 아래쪽과 들여쓰기 생성을 위한 왼쪽에 배치되었습니다. 패딩은 원하는 대로 조정할 수 있습니다. */
}

/* ~~ 바닥글 ~~ */
.footer {
	padding: 10px 0;
	background-color: #6F7D94;
}

/* ~~ 기타 부동/클래스 지우기 ~~ */
.fltrt {  /* 이 클래스는 페이지에서 오른쪽 요소를 부동화하는 데 사용될 수 있습니다. 부동화된 요소는 페이지에서 옆에 있는 다른 요소의 앞쪽에 배치되어야 합니다. */
	float: right;
	margin-left: 8px;
}
.fltlft { /* 이 클래스는 페이지에서 왼쪽 요소를 부동화하는 데 사용될 수 있습니다. 부동화된 요소는 페이지에서 옆에 있는 다른 요소의 앞쪽에 배치되어야 합니다. */
	float: left;
	margin-right: 8px;
}
.clearfloat { /* #container에서 #footer가 제거되거나 없어진 경우 <br /> 이 클래스는 마지막 부동 div(#container 내) 뒤에 오는 최종 요소로 빈 div에 배치될 수 있습니다. */
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
        
        <td height="33"><div align="right">어서오세요~ 관리자님</div></td>
        <td width="3%"></td>
      </tr>
      <tr>
        <td rowspan="2" >
          
          <h3 align="right">
           <a href="/admin/admin.jsp"><font color="#FFFF66">메인화면</font></a>&nbsp;&nbsp;&nbsp;
            <!--a href="/admin/domaePro.html"--><font color="#FFFFFF">도매점등록요청</font><!--/a-->&nbsp;&nbsp;&nbsp;
            
            <a href="/admin/somaePro.jsp"--><font color="#FFFF66">커피점등록요청</font></a>&nbsp;&nbsp;&nbsp;
            <a href="/admin/newMem.jsp"><font color="#FFFF66">도소매회원생성</font></a>&nbsp;&nbsp;&nbsp;
            <a href="/admin/somaeMem.jsp"><font color="#FFFF66">소매회원리스트</font></a>&nbsp;&nbsp;&nbsp;
            <!--a href="/admin/domaeMem.html"--><font color="#FFFFFF">도매회원리스트</font><!--/a-->&nbsp;&nbsp;&nbsp;
            <!--a href="/admin/lastMem.html"--><font color="#FFFFFF">소비회원리스트</font><!--/a-->&nbsp;&nbsp;&nbsp;
            <!--a href="/admin/notice.html"--><font color="#FFFF66">공지사항</font><!--/a-->&nbsp;&nbsp;&nbsp;
            <!--a href="/admin/domaeSell.html"--><font color="#FFFFFF">게시판권한설정</font><!--/a-->&nbsp;&nbsp;&nbsp;
            <!--a href="/admin/recomShop.html"--><font color="#FFFFFF">매장추천</font><!--/a-->&nbsp;&nbsp;&nbsp;
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
  
  <!--본문에 표시될 소매회원 가입폼 -->
  
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
  <form action="SomaeInsert.jsp" method="post" name="newid">
 
 <table border="0" cellpadding="0" cellspacing="0" width="600">
<tr>
<td align="center" width=600 colspan=4>
 <font face='굴림' size=5>소매업체 회원 등록</font><br><BR></td></tr>
<tr>
<td width=120 bgcolor=#75bbd4 height=2></td>
<td bgcolor=#a5c9d9 colspan=3></td>
</tr>
<tr>
<td width='120' nowrap style="padding-left:15px" bgcolor=#eef0f4 height=30>상호</td>
 <td bgcolor=#fcfcfc style="padding-left:10px">
 <font size=3 face='굴림체'>
 <input type=text name="job_name" value="" maxlength=16 style="width:122px"></font><br>
 </td>
 <td width='120' nowrap style="padding-left:15px" bgcolor=#eef0f4 height=30>사업자<br> 등록 번호</td>
 <td bgcolor=#fcfcfc style="padding-left:10px">
 <font size=3 face='굴림체'>
  <input type=text name="job_value" value="" maxlength=16 style="width:122px" " onblur="number(this)" onkeypress="nextFocus(this.value, 10, 2)">
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
 <input type=text name="id" value="" maxlength=16 style="width:122px" onfocus="window.open('idcheck.jsp','zip','left=100,top=100,width=150,height=100,scrollbars');document.newid.passwd1.focus();" readonly></font><br>
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
   <input type=text name="name" maxlength=20 value='' style='width:122px'>
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
  <input type=text name="zip" value='' size=7 maxlength=7 readonly onfocus="location.href='javascript:popaddress()';document.newid.address.focus()">
  <font size=4 face='굴림체'><input type=button name="bt1" value="검색" style="width:60px" onclick="location.href='javascript:popaddress()'"></font></a>

 </td>
 </tr>
 <tr height=48 bgcolor=white>
  
  <td height=24 > &nbsp; <input type=text name="sangsae" value='' size=60 maxlength=60  readonly>
  </td>
 </tr>
   <tr height=24 bgcolor=white>
  <td height=24> &nbsp;상세주소 <input type=text name="address" value='' size=51 maxlength=60>
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
   maxlength=4 name='tel1' value="" onblur="number(this)" onkeypress="nextFocus(this.value, 3, 11)"></font>)
   <font size=3 face='굴림체'><input type text style='width:40px'
   maxlength=4 name='tel2' value="" onblur="number(this)" onkeypress="nextFocus(this.value, 4, 12)"></font>-
   <font size=3 face='굴림체'><input type text style='width:40px'
   maxlength=4 name='tel3' value="" onblur="number(this)" onkeypress="nextFocus(this.value, 4, 13)"></font> 
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
   maxlength=4 name='phone1' value="" onblur="number(this)" onkeypress="nextFocus(this.value, 3, 15)"></font>)
   <font size=3 face='굴림체'><input type text style='width:40px'
   maxlength=4 name='phone2' value="" onblur="number(this)" onkeypress="nextFocus(this.value, 4, 16)"></font>-
   <font size=3 face='굴림체'><input type text style='width:40px'
   maxlength=4 name='phone3' value="" onblur="number(this)" onkeypress="nextFocus(this.value, 4, 17)">
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
  <font size=4 face='굴림체'><input type=reset name="bt2" value="취소" style="width:60px"></font>
 </td>
 </tr>
</table>
</form>
  <!-- end .content --></div>
  <div class="footer">
     <p align="center"><font color="#ffffff" size="2"> WebProgramer Grup (주)PonCoo 2013<br />
      E-mail : javakings@naver.com *대표이사: 김영수 *개인정보책임자: 장 환<br />
    서울시 성북구 삼선동 한성대학교 공학관 115호 </font></p>
<!-- end .container --></div>
<!-- end .footer --></div>
</body>
</html>
