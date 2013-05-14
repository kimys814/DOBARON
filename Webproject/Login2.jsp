<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="java.sql.*" %>
    <%
    request.setCharacterEncoding("euc-kr");
    %>
    <jsp:useBean id="check" class="project.CheckID" scope="page"/>
    <jsp:setProperty property="*" name="check"/>
    <%

    Class.forName("com.mysql.jdbc.Driver");
    
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
    
	try{
		String jdbcDriver = "jdbc:mysql://localhost/ii_javakings?"+"useUnicode=true&characterEncoding=euckr";
		String dbUser = "ii_javakings";
		String dbPass = "jang8410";
		String query= "SELECT * from Divclient where id = '"+check.getId()+"'";
		//"SELECT * from MEMBER order by id";//
		
		//2. 데이터베이스 커넥션 생성
		conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
		//3. statement 생성
		stmt = conn.createStatement();
		//4. 쿼리실행
		rs = stmt.executeQuery(query);
		
		if(rs.next()){
				if(rs.getString("pwd")==null){
					%><script type="text/javascript">alert("『<%=check.getId()%>』님 비밀번호가 필요합니다\n 비밀번호는 어플을 받으셔서 설정해주세요");
					history.back();</script>
					<%
				}
			if(rs.getString("pwd").equals(check.getPw())){
		    	session.setAttribute("id", check.getId());   
		    	session.setAttribute("kind", rs.getString("Kind"));
				%><script type="text/javascript">alert("『<%=check.getId()%>』로 로그인 합니다");</script>
				<%
				response.sendRedirect("index.jsp");
			}else{
				%><script type="text/javascript">alert("비밀번호가 올바르지 않습니다");
				history.back();</script>
				<%
			}
		}else{
			%><script type="text/javascript">alert("존재하지 않는 ID입니다.");
			history.back();</script>
			<%
		}
		
	}catch(Exception e){
	}finally{
		if(rs != null)try{rs.close();}catch(SQLException ex){}
		if(stmt != null)try{stmt.close();}catch(SQLException ex){}
		if(conn != null)try{conn.close();}catch(SQLException ex){}
	}
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>로그인</title>
</head>
<script type="text/javascript"></script>
<body>

</body>
</html>