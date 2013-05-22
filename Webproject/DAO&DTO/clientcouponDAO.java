package project;

import java.sql.*;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class clientcouponDAO {
	

	private static clientcouponDAO dao = new clientcouponDAO();
	//자기자신을 호출한다 (static이므로 시작시 한번만 실행)
	
	// 인스턴스를 하나만 만들기위해서 생성자 private
	private clientcouponDAO(){
		
	}
	public static clientcouponDAO getclientcoupon(){
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
	
	public String getSomaename(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select Somae from Allclient where Hp = '"+id+"' group by Somae";
		String imsi = "";
		try {
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
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
	
	public int getClientcoupon(String somae,String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs  = null;
		String sql = "select Cnt,Hanjan from "+somae+" where Phone = '"+id+"'";
		int imsi = 0;
		try {
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				imsi = rs.getInt("Cnt")+(rs.getInt("Hanjan")*10);
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
