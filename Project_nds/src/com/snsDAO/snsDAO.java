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
			
			String sql = "select * from tbl_sns";

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
}