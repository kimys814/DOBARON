package project;
import java.sql.*;
import java.util.StringTokenizer;

import javax.swing.JApplet;
import javax.swing.JOptionPane;

public class SomaeDate /*extends JApplet*/{
	
	private String id;							// id
	private String name;					//	대표자명
	private String passwd1;				// 비밀번호
	private String passwd2;				// 비밀번호 확인창
	private String job_name;				// 상호명
	private String job_value;			// 사업자등록번호
	private String academy;				// 업종
	private String tel1;						// 전화번호 제일앞자리
	private String tel2;						// 전화번호 가운데자리
	private String tel3;						// 전화번호 제일끝자리
	private String what;						// 핸드폰 회사(SKT?KTF?LG?)
	private String phone1;				// 핸드폰 제일앞자리
	private String phone2;				// 핸드폰 가운데자리
	private String phone3;				// 핸드폰 제일끝자리
	private String email;					// 이메일주소 아이디
	private String site;						// 이메일주소 사이트 선택
	private String email2;					// 이메일주소 URL 입력되는곳
	private String sangsae;				// 주소 DB에서 입력되는 곳
	private String address;				// 주소 상세주소
	private String zip;						// 주소 우편번호 
	
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost/ii_javakings?" +"useUnicode=true&characterEncoding=euckr";
	private final String USER = "ii_javakings";
	private final String PASS = "jang8410";
	
	
	public String getzip() {
		return zip;
	}
	public void setzip(String zip) {
		this.zip = zip;
	}

	public String getsangsae() {
		return sangsae;
	}
	public void setsangsae(String sangsae) {
		this.sangsae = sangsae;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPasswd1() {
		return passwd1;
	}
	public void setPasswd1(String passwd1) {
		this.passwd1 = passwd1;
	}
	public String getPasswd2() {
		return passwd2;
	}
	public void setPasswd2(String passwd2) {
		this.passwd2 = passwd2;
	}
	public String getJob_name() {
		return job_name;
	}
	public void setJob_name(String job_name) {
		this.job_name = job_name;
	}
	public String getJob_value() {
		return job_value;
	}
	public void setJob_value(String job_value) {
		this.job_value = job_value;
	}
	public String getAcademy() {
		return academy;
	}
	public void setAcademy(String academy) {
		this.academy = academy;
	}
	public String getTel1() {
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}
	public String getWhat() {
		return what;
	}
	public void setWhat(String what) {
		this.what = what;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSite() {
		return site;
	}
	public void setSite(String site) {
		this.site = site;
	}
	public String getEmail2() {
		return email2;
	}
	public void setEmail2(String email2) {
		this.email2 = email2;
	}
	public String getaddress() {
		return address;
	}
	public void setaddress(String address) {
		this.address = address;
	}
	
	public int dbidcheck(){	// 아이디 검사 폼에서 처리하는거..
		 Connection conn = null;
		Statement stmt = null;
	     ResultSet rs = null;
	     
	     if(id == null){
	    	 return 1;
	     }
	     
	     if(id.length() < 4 || id.length() > 12){
				return 2;
	     }
	     
	     try {
		     conn = DriverManager.getConnection(JDBC_URL,USER,PASS);
		     
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * from Divclient where Id = '"+id+"'");
			
			if(rs.next()){
				return 3; // DB에 입력한 id가 있으면 true 반환
			}
			
			

	     	} catch (Exception e) {
		}
	 	return 4;	// DB에 입력한 id가 없으면 false 반환
	}
	public void create(){//만들어진 소매 아이디에 대한 테이블 생성
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	     
	         
	     try{
	      conn = DriverManager.getConnection(JDBC_URL,USER,PASS);
	      //id값의 이름인 테이블 생성
	      pstmt =conn.prepareStatement("CREATE table "+id+"(Phone varchar(13) not null references Divclient(Id),Cnt int(4) not null default 0,Hanjan int(4) not null default 0");
	      pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			
			
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
		
	}
	public void Inputall(){//모든 도매와 소매와 클라이언트의 아이디가 모두 통합되어있는 테이블에 넣는 메서드
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	     
	         
	     try{
	      conn = DriverManager.getConnection(JDBC_URL,USER,PASS);
	      pstmt =conn.prepareStatement("INSERT into Divclient values(?,?,?)");
	      pstmt.setString(1, id);
	      pstmt.setString(2, passwd1);
	      pstmt.setString(3, "somae");
	      pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			
			
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
		
	}
	public void changeall(){//모든 도매와 소매와 클라이언트의 아이디가 모두 통합되어있는 테이블에 PW 수정
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	     
	         
	     try{
	      conn = DriverManager.getConnection(JDBC_URL,USER,PASS);
	      pstmt =conn.prepareStatement("UPDATE Divclient set Pwd = ? where id = '"+id+"'");
	      pstmt.setString(1, passwd1);

	      pstmt.executeUpdate();
			
		}catch(Exception e){
			e.printStackTrace();
			
		}finally{
			
			
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
		
	}
	public void dbgetdata(String sessionID){//DB에서 데이터를 받아냄

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String Allphone="";
		String Allhandphone="";
		String Allemail="";
		
		try{
			String jdbcDriver = "jdbc:mysql://localhost/ii_javakings?"+"useUnicode=true&characterEncoding=euckr";
			String dbUser = "ii_javakings";
			String dbPass = "jang8410";
			String query= "SELECT * from MEMBER where id = '"+sessionID+"'";

			conn = DriverManager.getConnection(jdbcDriver, dbUser, dbPass);
			//3. statement 생성
			stmt = conn.createStatement();
			//4. 쿼리실행
			rs = stmt.executeQuery(query);
			
			if(rs.next()){
			//date[0] = rs.getString("Local");
			academy = rs.getString("Menu");
			name = rs.getString("Boss");
			zip = rs.getString("zip");
			sangsae = rs.getString("Sangsae");
			address = rs.getString("Address");
			Allphone = rs.getString("phone");
			what = rs.getString("Tongsinsa");
			Allhandphone = rs.getString("handPhone");
			Allemail = rs.getString("Email");
			job_name = rs.getString("CoffeBrand");
			job_value = rs.getString("RegisterNum");
			// response.sendRedirect("ChangeSomaeForm.jsp");
			}
		}catch(Exception e){
			
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(stmt != null)try{stmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		
		if(Allphone.length() >= 6){
			if(Allphone.substring(0,2).equals("02")){
				tel1 = Allphone.substring(0,2);
				tel2 = Allphone.substring(2, 6);
				tel3 = Allphone.substring(6);
			}else{
			tel1 = Allphone.substring(0,3);
			tel2 = Allphone.substring(3, 7);
			tel3 = Allphone.substring(7);
			}
		}else{
			tel1 = tel2 = tel3 = "000";
		}
		
		if(Allhandphone.length()>9){
			if(Allhandphone.length() == 10){
				phone1 = Allhandphone.substring(0, 3);
				phone2 = Allhandphone.substring(3, 6);
				phone3 = Allhandphone.substring(6);
			}else if(Allhandphone.length() == 11){
				phone1 = Allhandphone.substring(0, 3);
				phone2 = Allhandphone.substring(3, 7);
				phone3 = Allhandphone.substring(7);				
			}else{
				phone1 = phone2 = phone3 = "000";
			}
		}else{
			phone1 = phone2 = phone3 = "000";
		}
		
	}
}
