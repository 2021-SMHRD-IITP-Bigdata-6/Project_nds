package com.snsDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.snsDTO.snsDTO;

public class snsDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	snsDTO dto =null; 
	int cnt = 0;
	
	public void getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("성공");

			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524";
			String dbid = "cgi_8_6_1216";
			String dbpw = "smhrd6";

			conn = DriverManager.getConnection(url, dbid, dbpw);
			if (conn != null) {
				System.out.println("연결성공");
			} else {
				System.out.println("연결실패");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<snsDTO> sns() {
		ArrayList<snsDTO> post = new ArrayList<snsDTO>(); 
		try {
			getConn();
			
			String sql = "select * from tbl_sns order by sns_seq desc";

			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();

			while (rs.next()) {
				String get_seq = rs.getString(1);
				String get_content = rs.getString(2);
				int get_likes = rs.getInt(4);
				String get_mbid = rs.getString(5);
				String get_hash = rs.getString(6);
				dto = new snsDTO(get_seq,get_content,get_likes,get_mbid,get_hash);
				post.add(dto);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post;
	}
	
	
	public void feed(String mbid, String comment) {
		try {
			getConn();
			
			String sql = "INSERT INTO tbl_sns values (default, ?, default, default, ?, '#19')";

			psmt = conn.prepareStatement(sql);
			
			psmt.setString(1, comment);
			psmt.setString(2, mbid);
			
			cnt = psmt.executeUpdate();

			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<snsDTO> search(String search_post) {
		ArrayList<snsDTO> post = new ArrayList<snsDTO>(); 
		try {
			getConn();
			String sql = "select * from tbl_sns where sns_content like ? order by sns_seq desc";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, "%" +search_post+ "%");
			rs = psmt.executeQuery();
			while (rs.next()) {
				String get_seq = rs.getString(1);
				String get_content = rs.getString(2);
				int get_likes = rs.getInt(4);
				String get_mbid = rs.getString(5);
				String get_hash = rs.getString(6);
				dto = new snsDTO(get_seq,get_content,get_likes,get_mbid,get_hash);
				post.add(dto);
			}			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return post;
	}
	
	public int love(String love_cnt, String sns_seq, String mb) {
		int love = Integer.parseInt(love_cnt);
		String member_likes = "";
		try {
			PreparedStatement psmt2 = null;
			getConn();
			String sql = "select member_likes from tbl_member where mb_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, mb);
			rs = psmt.executeQuery();
			while (rs.next()) {
				member_likes = rs.getString(1);
			}
			
			sql = "update tbl_sns set sns_likes = ? where sns_seq = ?";
			String sql2 = "update tbl_member set member_likes = ? where mb_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt2 = conn.prepareStatement(sql2);
			psmt.setString(1, love_cnt);
			psmt.setString(2, sns_seq);
			psmt2.setString(1, member_likes+sns_seq+ ",");
			psmt2.setString(2, mb);
			cnt = psmt.executeUpdate();
			int cnt2 = psmt2.executeUpdate();
			
			System.out.println(cnt2);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return love;
	}
}
