package somaerequest;

import java.sql.*;
import java.util.*;
import java.util.Date;


import javax.naming.InitialContext;
import javax.sql.DataSource;
import somaerequest.*;

public class SomaeDAO {
	
	private static SomaeDAO dao = new SomaeDAO();
	//자기자신을 호출한다 (static이므로 시작시 한번만 실행)
	
	// 인스턴스를 하나만 만들기위해서 생성자 private
	private SomaeDAO(){
		
	}
	public static SomaeDAO getSomaeDAO(){
		return dao;
	}
	
	private Connection gConnection(){
		Connection conn =null;

		try{
			InitialContext initCtx=new InitialContext();
			DataSource ds=(DataSource)initCtx.lookup("java:comp/env/jdbc/ii_nbrick");
			conn= ds.getConnection();
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public int setMEMBER_IMSI(SomaeDTO dto){		// MEMBER_IMSI 에 세팅
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "INSERT into MEMBER_IMSI values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int imsi = 0;
		try {
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "seoul");
			pstmt.setTimestamp(2, new Timestamp(new java.util.Date().getTime()));
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getJob_name());
			pstmt.setString(5, dto.getPasswd1());
			pstmt.setString(6, dto.getJob_value());
			pstmt.setString(7, dto.getZip());
			pstmt.setString(8, dto.getSangsae());
			pstmt.setString(9, dto.getAddress());
			pstmt.setString(10, dto.getAcademy());
			pstmt.setString(11, dto.getTel1());
			pstmt.setString(12, dto.getTel2());
			pstmt.setString(13, dto.getTel3());
			pstmt.setString(14, dto.getEmail());
			pstmt.setString(15, dto.getEmail2());
			pstmt.setString(16, dto.getWhat());
			pstmt.setString(17, dto.getPhone1());
			pstmt.setString(18, dto.getPhone2());
			pstmt.setString(19, dto.getPhone3());
			pstmt.setString(20, dto.getName());
			imsi = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return imsi;
		
	}
	
	public ArrayList<SomaeDTO> getMEMBER_IMSI(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select * from MEMBER_IMSI where id = '"+id+"'";
		ArrayList<SomaeDTO> arr = null;
		
		try {
			
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			arr = new ArrayList<SomaeDTO>();

			if(rs.next()){
				SomaeDTO dto = new SomaeDTO();
				
				dto.setId(rs.getString("id"));
				dto.setJob_name(rs.getString("CoffeBrand"));
				dto.setPasswd1(rs.getString("pwd"));
				dto.setJob_value(rs.getString("RegisterNum"));
				dto.setZip(rs.getString("zip"));
				dto.setSangsae(rs.getString("Sangsae"));
				dto.setAddress(rs.getString("Address"));
				dto.setAcademy(rs.getString("Menu"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
				dto.setEmail(rs.getString("Email"));
				dto.setEmail2(rs.getString("Email2"));
				dto.setWhat(rs.getString("Tongsinsa"));
				dto.setPhone1(rs.getString("phone1"));
				dto.setPhone2(rs.getString("phone2"));
				dto.setPhone3(rs.getString("phone3"));
				dto.setName(rs.getString("Boss"));
				arr.add(dto);
			}

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return arr;
	}
	
	public ArrayList<SomaeDTO> getAllMEMBER_IMSI(){
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "Select * from MEMBER_IMSI order by LoginDate asc";
		ArrayList<SomaeDTO> arr = null;
		try {
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			arr = new ArrayList<SomaeDTO>();

			while(rs.next()){
				SomaeDTO dto = new SomaeDTO();
				
				dto.setTime(rs.getTimestamp("LoginDate"));
				dto.setId(rs.getString("id"));
				dto.setJob_name(rs.getString("CoffeBrand"));
				dto.setPasswd1(rs.getString("pwd"));
				dto.setJob_value(rs.getString("RegisterNum"));
				dto.setZip(rs.getString("zip"));
				dto.setSangsae(rs.getString("Sangsae"));
				dto.setAddress(rs.getString("Address"));
				dto.setAcademy(rs.getString("Menu"));
				dto.setTel1(rs.getString("tel1"));
				dto.setTel2(rs.getString("tel2"));
				dto.setTel3(rs.getString("tel3"));
				dto.setEmail(rs.getString("Email"));
				dto.setEmail2(rs.getString("Email2"));
				dto.setWhat(rs.getString("Tongsinsa"));
				dto.setPhone1(rs.getString("phone1"));
				dto.setPhone2(rs.getString("phone2"));
				dto.setPhone3(rs.getString("phone3"));
				dto.setName(rs.getString("Boss"));
				arr.add(dto);
			}

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return arr;
	}
	
	public int setMEMBER(SomaeDTO dto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "Insert into MEMBER values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		int imsi = 0;

		try {
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "seoul");
			pstmt.setTimestamp(2, dto.getTime());
			pstmt.setString(3, dto.getId());
			pstmt.setString(4, dto.getJob_name());
			pstmt.setString(5, dto.getPasswd1());
			pstmt.setString(6, dto.getJob_value());
			pstmt.setString(7, dto.getZip());
			pstmt.setString(8, dto.getAddress());
			pstmt.setString(9, dto.getSangsae());
			pstmt.setString(10, dto.getAcademy());
			pstmt.setString(11, dto.getTel());
			pstmt.setString(12, dto.getFullemail());
			pstmt.setString(13, dto.getWhat());
			pstmt.setString(14, dto.getPhone());
			pstmt.setString(15, dto.getName());
			imsi = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return imsi;
	}
	
	public void delMEMBER_IMSI(String id){
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "Delete from MEMBER_IMSI where id = '"+id+"'";
		
		try {
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		
	}
	
	public void create(String id){//만들어진 소매 아이디에 대한 테이블 생성
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	     String sql = "create table "+id+"(Phone varchar(13) not null references Divclient(Id), Cnt int(4) not null default 0, Hanjan int(4) not null Default 0)";
	    		 
	         
	     try{
	      conn = gConnection();
	      //id값의 이름인 테이블 생성
	      pstmt =conn.prepareStatement(sql);
	      pstmt.executeUpdate();


		}catch(Exception e){
			e.printStackTrace();
			
		}finally{

			if(pstmt!=null)try{pstmt.close();}catch(SQLException ex){}
			if(conn!=null)try{conn.close();}catch(SQLException ex){}
		}
		
	}
	public void Inputall(String id, String passwd1){//모든 도매와 소매와 클라이언트의 아이디가 모두 통합되어있는 테이블에 넣는 메서드
		 Connection conn = null;
	     PreparedStatement pstmt = null;
	     
	         
	     try{
	      conn = gConnection();
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

	
}
