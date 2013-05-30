package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class Board_DAO {

	private String userPhone;
	
	private static Board_DAO dao = new Board_DAO();
	//자기자신을 호출한다 (static이므로 시작시 한번만 실행)
	
	// 인스턴스를 하나만 만들기위해서 생성자 private
	private Board_DAO(){
		
	}
	
	public static Board_DAO getBoard_DAO(){
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
	
	public ArrayList<Board_DTO> getBoard(String writer){		// DB에서 받아옴..
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where writer = ? order by num desc";
		ArrayList<Board_DTO> articleList = null;
		try {
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();
			
			articleList = new ArrayList<Board_DTO>();
				
			while(rs.next()){
				Board_DTO dto = new Board_DTO();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setIp(rs.getString("ip"));
				dto.setChoice(rs.getString("choice"));
				
				articleList.add(dto);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return articleList;
	}

	public int setBoard(Board_DTO dto){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int imsi = 0;
		String sql = "Insert into board(writer, title, reg_date, content, ip ,choice) values(?,?,?,?,?,?)";
		try {
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setTimestamp(3, dto.getReg_date());
			pstmt.setString(4, dto.getContent());
			pstmt.setString(5, dto.getIp());
			pstmt.setString(6, dto.getChoice());
			imsi = pstmt.executeUpdate();
			
		}catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return imsi;
	}
	
	public int delBoard(ArrayList<Integer> arr){
		Connection conn = null;
		PreparedStatement pstmt = null;
		int imsi = 0;
		String sql = "delete from board where num = ?";
		
		try {
			conn = gConnection();
			for(int i = 0; i<arr.size(); i++){
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, arr.get(i));
				imsi = pstmt.executeUpdate();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		
		return imsi;
	}
	
	public ArrayList<Board_DTO> getAppBoard(String writer){		// DB에서 받아옴..
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where writer = ? order by num desc";
		ArrayList<Board_DTO> articleList = null;
		try {
			conn = gConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			rs = pstmt.executeQuery();
			
			articleList = new ArrayList<Board_DTO>();
				
			while(rs.next()){
				Board_DTO dto = new Board_DTO();
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setReg_date(rs.getTimestamp("reg_date"));
				dto.setChoice(rs.getString("choice"));
				
				articleList.add(dto);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(rs != null)try{rs.close();}catch(SQLException ex){}
			if(pstmt != null)try{pstmt.close();}catch(SQLException ex){}
			if(conn != null)try{conn.close();}catch(SQLException ex){}
		}
		return articleList;
	}
}
