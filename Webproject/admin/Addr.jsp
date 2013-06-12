<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR" import ="java.sql.*"%>
    <% request.setCharacterEncoding("euc-kr"); %>
    <jsp:useBean id="use" class="project.SomaeDate"/>
      <jsp:setProperty property="*" name="use"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>주소검색</title>
</head>
<body>
<script type="text/javascript">
function hrefff(zip,addresss){
	opener.document.newid.zip.value=zip;
	opener.document.newid.sangsae.value=addresss;
	self.close();
}
</script>
<h2>~ [동]을 입력하세요</h2>
<form action="Addr.jsp" method ="post">
<input type="text" name="sangsae" > 
<input type ="submit" name="bt1" value ="검색" >
</form>
<table width="100%" border="1">


<%
	
	Class.forName("com.mysql.jdbc.Driver");

	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String query="SELECT * from Address where DONG like '%"+use.getsangsae()+"%'";
	try{
		String jdbcDriver = "jdbc:mysql://localhost/ii_nbrick?" +"useUnicode=true&characterEncoding=euckr";
		String dbUser = "ii_nbrick";
		String dbPass = "java1440";
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		stmt =conn.createStatement(); 
		
				
		//4. 쿼리실행
		rs = stmt.executeQuery(query);
		while(rs.next())
		{
			%>
			<%=rs.getString("ZIPCODE") %><input type ="button" name="<%=rs.getString("ZIPCODE") %>" value='<%=rs.getString("SIDO")%> <%=rs.getString("GUGUN") %> <%=rs.getString("DONG") %>	<%=rs.getString("BUNJI") %>' onclick="hrefff(this.name, this.value)" style='width:500px;'>		

			<br>
			<%
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		if(rs!=null)try{rs.close();}catch(SQLException ex){}
		if(stmt!=null)try{stmt.close();}catch(SQLException ex){}
		if(conn!=null)try{conn.close();}catch(SQLException ex){}
		
	}
		%>
</table>
</body>
</html>