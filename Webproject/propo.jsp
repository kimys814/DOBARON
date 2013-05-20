<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>폰안에쿠폰::폰쿠</title>
<link href="/inc/text_style.css" rel="stylesheet">
<style type="text/css">
<!--
body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-image:url("/img/bimg.jpg");
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
	width: 80%;
	max-width: 1000px;/* 대형 모니터에서 이 레이아웃이 지나치게 넓어지는 것을 방지하기 위해 max-width를 사용할 수 있습니다. 이 속성을 사용하면 선 길이를 더욱 쉽게 읽을 수 있습니다. IE6에서는 이 선언이 적용되지 않습니다. */
	min-width: 1000px;/* 이 레이아웃이 지나치게 좁아지는 것을 방지하기 위해 min-width를 사용할 수 있습니다. 이 속성을 사용하면 사이드 열에서 선 길이를 더욱 쉽게 읽을 수 있습니다. IE6에서는 이 선언이 적용되지 않습니다. */
	
	margin: 0 auto; /* 측면 자동 값, 폭으로 연결, 레이아웃 가운데 정렬. .container의 폭을 100%로 설정하는 경우에는 필요하지 않습니다. */
}

/* ~~머리글에는 폭이 지정되지 않습니다. 레이아웃의 전체 폭이 확장됩니다. 연결된 자체 로고로 대체되어야 하는 이미지 자리 표시자를 포함합니다.~~ */
.header {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background-image:url("/img/bImgTop2.gif");
	background-repeat:repeat-x;
	padding: 0;
	color: #000;
	vertical-align:bottom; /* */ 
    bottom: 100; /*탑메뉴 위치를 결정하는 값 */
    position:fixed; /*어떤 방식으로 할껀지 결정하는 값 fixed는 스크롤과 상관없이 고정 */
	height:200px;
	width:100%;
	min-width:1100px;


}
.headerin {
	
	max-width: 1000px;/* 대형 모니터에서 이 레이아웃이 지나치게 넓어지는 것을 방지하기 위해 max-width를 사용할 수 있습니다. 이 속성을 사용하면 선 길이를 더욱 쉽게 읽을 수 있습니다. IE6에서는 이 선언이 적용되지 않습니다. */
	min-width: 1000px;/* 이 레이아웃이 지나치게 좁아지는 것을 방지하기 위해 min-width를 사용할 수 있습니다. 이 속성을 사용하면 사이드 열에서 선 길이를 더욱 쉽게 읽을 수 있습니다. IE6에서는 이 선언이 적용되지 않습니다. */
	height:800px;
	width:1000px;
	padding: 10px 0;
	margin: 0 auto;
	
	
}
.topmenu {
	
	
	padding: 0px 0;
}
.toplogo {
	float:left;
	width:220px;	
}
.topmenu1 {
	height:40px;
	width:100%;	
}
.topmenu2 {
	height:50px;
	width:100%;	
}
.topmenu3 {
	width:100%;	
}

/* ~~ 레이아웃 정보입니다. ~~ 

1) 패딩은 div의 위쪽 및/또는 아래쪽에만 배치됩니다. 이 div에 포함된 요소의 경우 측면에 패딩이 있습니다. 이를 통해 "상자 모델 수학"에서 제외됩니다. div 자체에 측면 패딩 또는 테두리를 추가하면 *전체* 폭을 만들기 위해 정의한 폭에 추가됩니다. div 내의 요소에서 패딩을 제거하고, 디자인에 필요한 패딩과 폭이 없는 상태로 내부에 두 번째 div를 배치할 수도 있습니다.

*/
.content {
	
	height:800px;
	width:1000px;
	padding: 10px 0;
	background-image:url("/img/main.png");


}

/* ~~ 그룹화된 이 선택기는 .content 영역 공간에 목록을 제공합니다. ~~ */
.content ul, .content ol { 
	padding: 0 15px 15px 40px; /* 이 패딩은 머리글의 오른쪽 패딩과 위의 단락 규칙을 미러링합니다. 패딩은 목록에서 다른 요소들 사이의 공간 아래쪽과 들여쓰기 생성을 위한 왼쪽에 배치되었습니다. 패딩은 원하는 대로 조정할 수 있습니다. */
}

/* ~~ 바닥글 ~~ */
.alim {
    padding: 6px 0;
	background-color:#EAEAEA;
}
.foothead {
	padding: 10px 0;
}
	
.footer {
	padding: 10px 0;
	
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



	
    
   
    
	<div class="header" style="filter: alpha(opacity=100); width: 100%; font-family: Tahoma, Geneva, sans-serif; font-size: larger; color: #000;">
    		
            <div class="headerin" style="filter:alpha(opacity=100)" style="margin:auto">
				
                   <div class="toplogo" align="left">
                     <div align="left"><a href="/index.jsp"><img src="img/logo.gif" width="220" height="90" /></a></div>
                   </div>
                   
                   <div class="topmenu">
                   
        
        					<%if(session.getAttribute("id")==null){        %>
        					<div class="topmenu1" align="right">
			  				  <font color="#979797" size="3">폰안에 쿠폰::폰쿠</font>				  
		  					  </div>
      	  	 
      						<%
					        }else if(session.getAttribute("id")!=null){
					       
					        if(session.getAttribute("kind").equals("somae") || session.getAttribute("kind").equals("client") ||session.getAttribute("kind").equals("domae")){
					        %>
					        <div class="topmenu1" align="right"><font size="2">
					        	『<%=session.getAttribute("id")%>』님 환영합니다
      
      						<input type="button" name="delete"  value="로그아웃"  onclick="location.href='logout.jsp'"/>
     
 	   						</font></div>
         					<%
        					}else if(session.getAttribute("kind").equals("admin")){
        				        %>
        				        <div class="topmenu1" align="right"><font size="2">
        			        	『관 리 자』님 환영합니다
        			      
        			      		<input type="button" name="delete"  value="로그아웃"  onclick="location.href='logout.jsp'"/>
        			     		</font></div>
        			         	<%
        			        	}
        			        }
        			            %>
                   
          					</div>
                            <div class="topmenu2">
          						<h5 align="right">
            						<a href="/infor.jsp"><font color="#626262">poncoo.com</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            						<a href="/search.jsp"><font color="#626262">커피점검색</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            						<a href="/propo.jsp"><font color="#A4042D">커피점추천</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            						<a href="/memberIn.jsp"><font color="#626262">가입신청</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            						<a href="/appl.jsp"><font color="#626262">어플받기</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            						<a href="/service.jsp"><font color="#626262">고객지원</font></a>
            					</h5>
        					</div>
        						<%
								if(session.getAttribute("id")==null){
        						%>
                                <div class="topmenu3">
        							<form action="Login2.jsp" method="post">
							<div align="left">
				  				<input type="text" name="id" size="10" value="아이디" onfocus="this.value='';">
				  				<input type="password" name="pw" size="10" value="비밀번호" onfocus="this.value='';">				  
				  				<input type="submit" value="로그인">				  
			  				</div>
      	  							</form>  
                                    </div>
      							<%
								}else if(session.getAttribute("id")!=null){
							        %>
							        <%
							        if(session.getAttribute("kind").equals("somae")){
							        %>
							        	<div align="left">
							        	<input type="button" name="edit" value="쿠폰관리" onclick="location.href='coupon/FindClientStamp.jsp';"/>
							         	<input type="button" name="edit" value="정보수정" onclick="location.href='DBgetid.jsp';"/>
										</div>							        
							        <%
							        
							        %>
							        <%}else if(session.getAttribute("kind").equals("admin")){%>
							            <div align="left">
							            <input type="button" name = ""  value="관리자페이지" onclick="location.href='/admin/admin.jsp'"/>
							      		</div>
							            
											<%
							     			}
							        }
							     			%>  
            
      <!--topmenu end-->
                      </div>
                   <!--headin end-->
                   </div>
             
             
             
             
             
             
            	
                
                
            
		
      
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
          <!--header end-->
    
    </div>		

        
        
    	<div class="container" style="filter:alpha(opacity=100)"> 
    
               
            	
                
             
             
             
             
                

     	
        	<div class="content">
       	  </div>
        
        
        	<div class="foothead" align="center">
        		<img src="/img/foothead.png">
        	</div>
        
        
        
        
        
        	<div class="footer">
        
        		<iframe src="/footer.jsp" width="1000" height="100" frameborder="0" scrolling="no"></iframe>
        
        	</div>
        
</div>
			
</body>
</html>
