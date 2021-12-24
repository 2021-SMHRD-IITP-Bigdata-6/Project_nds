package com.memberDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.xml.ws.Response;

import com.memberDTO.memberDTO;


public class memberDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	memberDTO dto =null; 
	int cnt = 0;
	private boolean check;

	// ---------------------------------------------------------------
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

	// ---------------------------------------------------------------
	public void getclose() {

		System.out.println("무조건 실행");
		try {
			if (rs != null) {
				rs.close();
			}
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

//---------------------------------------------------------------
	public int join(memberDTO dto) {

		try {
			getConn();

			String sql = "insert into tbl_member values (?,?,?,?,?,default,default)";
			System.out.println(dto.getId());
			System.out.println(dto.getPw());
			System.out.println(dto.getNickname());
			System.out.println(dto.getTel());
			System.out.println(dto.getPart());
			
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getNickname());
			psmt.setString(4, dto.getTel());
			psmt.setString(5, dto.getPart());

			cnt = psmt.executeUpdate();
			
			
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		} finally {
			getclose();
		}
		return cnt;
	}

	// ---------------------------------------------------------------
	
	// ---------------------------------------------------------------
	public int update(String pw, String nick, String tel,  String id) {

		try {
			getConn();

			String sql = "update tbl_member set mb_pw =?, mb_nick =?, mb_tel = ? where mb_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pw);
			psmt.setString(2, nick);
			psmt.setString(3, tel);
			psmt.setString(4, id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getclose();
		}
		return cnt;
	}

	// ---------------------------------------------------------------
	public memberDTO login(memberDTO dto) {

		try {
			getConn();

			if (conn != null) {
				System.out.println("연결성공");
			} else {
				System.out.println("연결실패");
			}
			
			String id = dto.getId();
			
			System.out.println(id);
			
			String sql = "select * from tbl_member where mb_id = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();

			if (rs.next()) {
				String getid = rs.getString(1);
				String getpw = rs.getString(2);
				String getnick = rs.getString(3);
				String gettel = rs.getString(4);
				String getpart = rs.getString(5);

				if (dto.getPw().equals(getpw)) {
					dto = new memberDTO(getid, getnick, gettel, getpart);
				}
			}

		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		} finally {
			getclose();
		}
		return dto;
	}

	// ---------------------------------------------------------------
	
	

	
	
}


