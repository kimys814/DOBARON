package project;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class Clientgum{
	private String phone;
	private final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private final String JDBC_URL = "jdbc:mysql://localhost/ii_javakings?" +"useUnicode=true&characterEncoding=euckr";
	private final String USER = "ii_nbrick";
	private final String PASS = "java1440";
	private int Cnt;
	private int Hanjan;
	private int Allcnt;//
	private int Hcnt=0;//임시값
	private String lastjoin = "처음 오신 손님이시네요.^^*";
	private int joincount = 1;

	
	public void setJoincount(int joincount) {
		this.joincount = joincount;
	}
	public void setLastjoin(String lastjoin) {
		this.lastjoin = lastjoin;
	}
	public int getJoincount(){
		return joincount;
	}
	public void setHcnt() {
		++Hcnt;
	}
	public String getLastjoin(){
		return lastjoin;
	}
	public int getCnt() {
		return Cnt;
	}

	public void setCnt(int cnt) {
		Cnt = cnt;
	}

	public int getHanjan() {
		return Hanjan;
	}

	public void setHanjan(int hanjan) {
	
		Hanjan = hanjan;
	}


	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone){
		if(phone.substring(0, 2).equals("00"))
			this.phone = phone.substring(1,phone.length());
		else
			this.phone=phone;
	}	


	public void Input(String tablename){ 		
		Connection conn = null;
	     PreparedStatement pstmt = null;
	     PreparedStatement pstmt2 = null;
	     
	         
	     try{
	      Class.forName(JDBC_DRIVER);
	      conn = DriverManager.getConnection(JDBC_URL,USER,PASS);
	      pstmt =conn.prepareStatement("INSERT into Divclient(`Id`,`Kind`) values(?,?)");
	      pstmt.setString(1, phone);
	      pstmt.setString(2, "client");
	      
	      pstmt2 =conn.prepareStatement("INSERT into " + tablename + " (Phone) values ('"+phone+"')");

	      
	      pstmt.executeUpdate();
	      pstmt2.executeUpdate();
			
		}catch(Exception e){
			
		}finally{
			
			if(pstmt2!=null)try{pstmt2.close();}catch(SQLException ex){}
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
	     
	}
	public boolean gum() {
		 Connection conn = null;
	     Statement stmt = null;
	     ResultSet rs =null;
		
	     try{
	      Class.forName(JDBC_DRIVER);
	      String query="SELECT ID from Divclient where ID='"+phone+"'";
	      conn = DriverManager.getConnection(JDBC_URL,USER,PASS);
	      stmt = conn.createStatement(); 
	      
	      rs=stmt.executeQuery(query);
	      
	      return rs.next();
		}catch(Exception e){
			
				
		}finally{
			
			if(rs != null) try{rs.close();}catch(SQLException ex){}
			if(stmt!=null)try{stmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
			
		}
	     return false;  
	}
	
	public int prin(String tablename){
		 Connection conn = null;
	     Statement stmt = null;
	     ResultSet rs =null;    
	     
	     try{
	      Class.forName(JDBC_DRIVER);
	      String query= "SELECT * from "+tablename+" where Phone = '"+phone+"'";
	      conn = DriverManager.getConnection(JDBC_URL,USER,PASS);
	      stmt =conn.createStatement(); 

	      
	      rs=stmt.executeQuery(query);
	      if(rs.next()){
	    	  Cnt=rs.getInt("Cnt");
	    	  Hanjan=rs.getInt("Hanjan");
	          Allcnt =Cnt+(Hanjan*10);
	    	  return Allcnt;
	      }else{
	    	 
	    	  stmt.executeUpdate("Insert into "+tablename+"(Phone) values('"+phone+"')");
	    	  Cnt=0;
	    	  Hanjan=0;
	    	  Allcnt=0;
	    	  return 0;
	      }
		}catch(Exception e){
					e.printStackTrace();
			}finally{
			if(rs != null) try{rs.close();}catch(SQLException ex){}
			if(stmt!=null)try{stmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
	     return -1;
		
	}	
	public int cal(String tablename){
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	     if(Cnt<0){//
	    	 return -1;//
	     }else if(Cnt==10){
	    	 Hanjan+=1;
	    	 Cnt=0;
	     }
	     
	     
	     //Printstamp.jsp 
	     try{
	      Class.forName(JDBC_DRIVER);
	      conn = DriverManager.getConnection(JDBC_URL,USER,PASS);
	      pstmt =conn.prepareStatement("UPDATE "+tablename+" set Cnt=?, Hanjan=? where Phone='"+phone+"'");
	      pstmt.setInt(1, Cnt);
	      pstmt.setInt(2, Hanjan);
	      pstmt.executeUpdate();
	      return 1;
		}catch(Exception e){
			return -1; //
		}finally{
			
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
	
	}
	public void update(String tablename) {
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	    
	     try{
	    	 int tmp=((Cnt+10*Hanjan)-Allcnt)+(Hcnt*10);
	    	 Class.forName(JDBC_DRIVER);
		     conn = DriverManager.getConnection(JDBC_URL,USER,PASS);
	      pstmt =conn.prepareStatement("INSERT into Allclient(`Somae`,`Hp`,`Plus`,`Use`) values(?,?,?,?)");
	      pstmt.setString(1, tablename);
	      pstmt.setString(2, phone);
	      pstmt.setInt(3,tmp);//  
	      pstmt.setInt(4, Hcnt);//사용한 쿠폰의 갯수	      
	    
	      pstmt.executeUpdate();//
	      
		}catch(Exception e){
			e.printStackTrace(); 
		}finally{
			Hcnt=0;
			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
	     
	    	
	     }
	    
		public void changecou(String tablename){
			Connection conn = null;
		     PreparedStatement pstmt = null;
		     
			try{
				Class.forName(JDBC_DRIVER);
			     conn = DriverManager.getConnection(JDBC_URL,USER,PASS); 
		          pstmt =conn.prepareStatement("INSERT into Allclient (`Somae`,`Hp`,`Change`) values(?,?,?)");
		   	      pstmt.setString(1, tablename);
		   	      pstmt.setString(2, phone);
		   	      pstmt.setInt(3, (Cnt+Hanjan*10)-Allcnt);
		   	      pstmt.executeUpdate();
		   		}catch(Exception e){
		   			e.printStackTrace(); 
		   		}finally{
		   			
		   			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
		   			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		   		}
		    	 
		}
		
		public void jointime(String tablename){
			Connection conn = null;
		     Statement stmt = null;
		     ResultSet rs =null;    
		     
		     try{
		      Class.forName(JDBC_DRIVER);
		      String query= "SELECT max(Time),count(*) from Allclient where Hp = '"+phone+"' AND Somae = '"+tablename+"'";
		      conn = DriverManager.getConnection(JDBC_URL,USER,PASS);
		      stmt =conn.createStatement(); 

		      
		      rs=stmt.executeQuery(query);
		      if(rs.next()){
		    	if(!rs.getString("max(Time)").equals(null)){
		    		lastjoin = rs.getString("max(Time)").substring(0, 19);
		    	}
		    	joincount = rs.getInt("count(*)")+1;
		      }
		      }catch (Exception e) {

			}finally{
	   			
	   			if(rs!=null)try{rs.close();}catch(SQLException ex){}
	   			if(stmt!=null)try{stmt.close();}catch(SQLException ex){}
	   			if(conn!=null)try{conn.close();}catch(SQLException ex){}
	   		}
	}
	
}

