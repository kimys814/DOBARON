package project;

import java.sql.*;
import java.util.*;

public class SomaeDBLook {
	
	private String longday;			// 기간 설정
	private String cupmuch;			// 컵 숫자 입력
	private String cupmuch2;		// 이상 or 이하
	//private String choice;				// 쿠폰볼지 한잔 볼지
	//private String updown;			// 오름차순 or 내림차순
	private String updown2;
	private ArrayList<String> imsi = new ArrayList<String>();
	
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost/ii_javakings?" +"useUnicode=true&characterEncoding=euckr";
	private final String USER = "ii_javakings";
	private final String PASS = "jang8410";
	
	
	
	public String getCupmuch() {
		return cupmuch;
	}
	public void setCupmuch(String cupmuch) {
		this.cupmuch = cupmuch;
	}
	public String getCupmuch2() {
		return cupmuch2;
	}
	public void setCupmuch2(String cupmuch2) {
		this.cupmuch2 = cupmuch2;
	}
	public String getUpdown2() {
		return updown2;
	}
	public void setUpdown2(String updown2) {
		this.updown2 = updown2;
	}
	public ArrayList<String> getImsi() {
		return imsi;
	}
	public String getLongday() {
		return longday;
	}
	public void setLongday(String longday) {
		this.longday = longday;
	}
	
	public int dbcheck(String id){		// Allclient에서의 DB 검색

		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int i = 0;
		String a;
		String query="SELECT * FROM Allclient Where Somae = '"+id+"'"; // order by id";	
		Calendar now = Calendar.getInstance();
		
		if(longday.equals("oneday")){
			now.add(Calendar.DATE, -1);
		}else if(longday.equals("weekday")){
			now.add(Calendar.DATE, -7);
		}else if(longday.equals("monthday")){
			now.add(Calendar.DATE, -30);
		}
		
		if((now.getTime().getMonth()+1)<10){
			if(now.getTime().getDate()<10){
				query += " AND Time > '"+(now.getTime().getYear()+1900)+"0"+(now.getTime().getMonth()+1)+"0"+now.getTime().getDate()+"000000"+"'";
			}else{
				query += " AND Time > '"+(now.getTime().getYear()+1900)+"0"+(now.getTime().getMonth()+1)+now.getTime().getDate()+"000000"+"'";
			}
		}else{
			if(now.getTime().getDate()<10){
				query += " AND Time > '"+(now.getTime().getYear()+1900)+(now.getTime().getMonth()+1)+"0"+now.getTime().getDate()+"000000"+"'";
			}else{
				query += " AND Time > '"+(now.getTime().getYear()+1900)+(now.getTime().getMonth()+1)+now.getTime().getDate()+"000000"+"'";
			}
		}
		
		query += " Order by Time DESC";
		
		// SELECT * FROM Allclient Where HP = 1 AND Time > 20120603 Order by Time `DESC
		// 어렵다.. SELECT * FROM `Allclient` WHERE Plus =  (SELECT Plus FROM `Allclient` WHERE Somae = 'jkjkjkjk')

		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				a = rs.getString("Hp")+"|"+Integer.toString(rs.getInt("Plus"))+"|"+Integer.toString(rs.getInt("Use"))+"|"+Integer.toString(rs.getInt("Change"))+"|"+rs.getString("Time");
				imsi.add(i,a);
				++i;
			}

		}catch(Exception ex){
			
		}finally{
			if(rs != null) try{rs.close();}catch(SQLException ex){}
			if(stmt != null) try{stmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close(); }catch(SQLException ex){}
		}
		return i;

	}
	
	public int Somaecheck(String id){	// Somae 업체 테이블에서 DB 검색
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String query = "Select * from "+id;
		String a;
		int i = 0;
		//SELECT * FROM jkjkjkjk order by Cnt DESC, Phone DESC
		
		if(cupmuch2.equals("up")){
			query += " WHERE (Cnt+Hanjan*10) > "+cupmuch;
		}else if(cupmuch2.equals("down")){
			query += " WHERE (Cnt+Hanjan*10) < "+cupmuch;
		}
		
		if(updown2.equals("asc")){
			query += " Order by Hanjan ASC, Cnt ASC";
		}else if(updown2.equals("desc")){
			query += " Order by Hanjan DESC, Cnt DESC";
		}
		
		try{
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, USER, PASS);
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query);
			
			while(rs.next()){
				a = rs.getString("Phone")+"|"+Integer.toString(rs.getInt("Cnt"))+"|"+Integer.toString(rs.getInt("Hanjan"));
				imsi.add(i,a);			
				++i;
			}
			
			
		}catch(Exception ex){
			
		}finally{
			if(rs != null) try{rs.close();}catch(SQLException ex){}
			if(stmt != null) try{stmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close(); }catch(SQLException ex){}
		}
		return i;
	}
}
