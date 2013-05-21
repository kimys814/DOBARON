package App;

import java.sql.*;

import javax.naming.InitialContext;
import javax.sql.DataSource;


public class AppDAO {
	
	private String userPhone;
	
	private static AppDAO dao = new AppDAO();
	//자기자신을 호출한다 (static이므로 시작시 한번만 실행)
	
	// 인스턴스를 하나만 만들기위해서 생성자 private
	private AppDAO(){
		
	}
	
	public static AppDAO getAppDAO(){
		return dao;
	}
	
	private Connection gConnection(){
		Connection conn =null;

		try{
			InitialContext initCtx=new InitialContext();
			DataSource ds=(DataSource)initCtx.lookup("java:comp/env/jdbc/ii_javakings");
			conn= ds.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public int HpchecktoDB(String hp){		// DB에서 Hp 번호의 데이터가 Divclient 내에 있는지 확인
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select Id, Pwd from Divclient where Id = ?";
		int check = 0;
		
		try {
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hp);
			rs = pstmt.executeQuery();
			
			if(rs.next()){	// 받아온 hp가 Divclient에 있다는 소리
				if(rs.getString("Pwd") == null){		// 패스워드가 설정되지 않았다 = 처음접속
					check = 1;
				}else{
					check = 2;
				}
			}
			System.out.println("널은상관없어요");
		} catch (Exception e) {
			return -1;		// 에러일 경우 -1 리턴
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		
		return check;		// Handphone번호 
										// (0의 값 = DB에 없다 | 1의 값 = DB에 있으며 첫접속 | 2의 값 = DB에 있으며 패스워드도 있음)
	}
	
	public String getSomaelist(String hp){ 	// Allclient내에서 Hp 번호가 간 Somae리스트를 받아온다
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT Somae FROM Allclient WHERE Hp = ?  group by Somae";
		String imsi = "";
		
			try {
				conn = gConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, hp);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					imsi += rs.getString("Somae")+"|";
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally{
				if(rs != null)try{rs.close();}catch(SQLException ex){}
				if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
				if(conn != null)try{conn.close();}catch(SQLException ex){}
			}
			
			return imsi;
	}

	public void setDivclient(String hp,String pw){		// 새로 들어온 Hp 번호를  Divclient에 등록(Pw는 null임)
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "Insert into Divclient values(?,?,?)";
		
		try {
			
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, hp);
			pstmt.setString(2, pw);
			pstmt.setString(3, "client");
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		
	}
	
	public void setDivclient_pwd(String hp,String pw){		// 새로 들어온 Hp 번호를  Divclient에 등록(Pw는 null임)
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update Divclient set Pwd = ? where Id = ?";
		
		try {
			
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, hp);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		
	}

	public String getSomaeUser(String hp,String somae){		// 받은 somae에서 hp의 값을 받아옴
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select Cnt,Hanjan from "+somae+" where Phone = '"+hp+"'";
		String imsi = "";
		try {
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				imsi =  Integer.toString(rs.getInt("Cnt")+(rs.getInt("Hanjan")*10));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		
		return imsi;
		
		
	}
}
