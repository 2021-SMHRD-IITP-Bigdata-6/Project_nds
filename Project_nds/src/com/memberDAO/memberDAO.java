package com.memberDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.xml.ws.Response;

import com.commentDTO.commentDTO;
import com.memberDTO.memberDTO;

public class memberDAO {
	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;
	memberDTO dto = null;
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

			String sql = "insert into tbl_member values (?,?,?,?,default,default,default)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, dto.getId());
			psmt.setString(2, dto.getPw());
			psmt.setString(3, dto.getTel());
			psmt.setString(4, dto.getPart());

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
	public int update(String pw, String tel, String id) {

		try {
			getConn();

			String sql = "update tbl_member set mb_pw =?, mb_tel = ? where mb_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, pw);
			psmt.setString(2, tel);
			psmt.setString(3, id);

			cnt = psmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			getclose();
		}
		return cnt;
	}

	// ---------------------------------------------------------------
	public memberDTO login(memberDTO dto1) {

		try {
			getConn();

			if (conn != null) {
				System.out.println("연결성공");
			} else {
				System.out.println("연결실패");
			}

			String id = dto1.getId();
			String sql = "select * from tbl_member where mb_id = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);

			rs = psmt.executeQuery();

			if (rs.next()) {

				String getid = rs.getString(1);
				String getpw = rs.getString(2);
				String gettel = rs.getString(3);
				String getpart = rs.getString(4);
				String dbr = rs.getString(5);
				String clf = rs.getString(6);
				String vkf = rs.getString(7);

				if (dto1.getPw().equals(getpw)) {
					dto = new memberDTO(getid, getpw, gettel, getpart, dbr, clf, vkf);

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

	public boolean IdCheck(String id) {

		try {

			getConn();
			String sql = "select * from tbl_member where mb_id =?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, id);
			rs = psmt.executeQuery();

			check = rs.next();

		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		} finally {
			getclose();
		}

		return check;

	}

	public void inputComment(String mb_id, String cm_ct, String cm_sns_seq) {
		try {
			String id = mb_id;
			String comment = cm_ct;
			int seq = Integer.parseInt(cm_sns_seq);

			getConn();

			String sql = "insert into tbl_comment values(default, ?, ?, default, ?)";

			psmt = conn.prepareStatement(sql);
			psmt.setInt(1, seq);
			psmt.setString(2, comment);
			psmt.setString(3, id);

			cnt = psmt.executeUpdate();

			System.out.println("cnt :" + cnt);

		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		} finally {
			getclose();
		}
	}

	public ArrayList<commentDTO> loadComment(String lcm_sns_seq) {
		ArrayList<commentDTO> arr = new ArrayList<commentDTO>();
		try {

			getConn();
			String sql = "select * from tbl_comment where sns_seq = ?";
			psmt = conn.prepareStatement(sql);
			psmt.setString(1, lcm_sns_seq);

			rs = psmt.executeQuery();

			while (rs.next() == true) {
				String cm_sns_seq = rs.getString(1);
				String lcm_ct = rs.getString(3);
				String lmb_id = rs.getString(5);
				commentDTO cdto = new commentDTO(lcm_ct, lmb_id);
				cdto.setCm_sns_seq(cm_sns_seq);
				arr.add(cdto);
			}

		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		} finally {
			getclose();
		}
		return arr;

	}

	public int delete(int dcs) {
	      try {
	          getConn();
	          
	          String sql = "delete from tbl_comment where comment_seq = ?";
	          System.out.println( "delete에서의 값:" +dcs);
	          psmt = conn.prepareStatement(sql);
	          psmt.setInt(1, dcs);

	          cnt = psmt.executeUpdate();
	          System.out.println(cnt);
	       } catch (Exception e) {
	          e.printStackTrace();
	       } finally {
	          getclose();
	       }
	       return cnt;
	}
}
