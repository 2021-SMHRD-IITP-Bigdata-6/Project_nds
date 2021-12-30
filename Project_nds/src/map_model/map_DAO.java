package map_model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class map_DAO {

	Connection conn = null;
	PreparedStatement psmt = null;
	ResultSet rs = null;

	public void conn() {

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

			String db_url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String db_id = "cgi_8_6_1216";
			String db_pw = "smhrd6";
			conn = DriverManager.getConnection(db_url, db_id, db_pw);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public void close() {

		try {
			if (psmt != null) {
				psmt.close();
			}
			if (conn != null) {
				conn.close();
			}
			if (rs != null) {
				rs.close();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public ArrayList<map_DTO> showInfo() {
		ArrayList<map_DTO> hospital_info = new ArrayList<map_DTO>();
		conn();

		try {
			String sql = "select * from mind_hospital";
			psmt = conn.prepareStatement(sql);
			rs = psmt.executeQuery();
			
			while(rs.next()) {
			
			String gu = rs.getString("gu");
			String name = rs.getString("name");
			String address = rs.getString("address");
			String tel = rs.getString("tel");
			
			map_DTO dto = new map_DTO(gu, name, address, tel);
			hospital_info.add(dto);
		} 
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}return hospital_info;
	}

}
