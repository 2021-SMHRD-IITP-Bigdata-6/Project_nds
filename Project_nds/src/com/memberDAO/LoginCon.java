package com.memberDAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.memberDTO.memberDTO;


@WebServlet("/LoginCon")
public class LoginCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");
		
		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
	
		Connection conn = null;
		PreparedStatement psmt = null;
		ResultSet rs = null;

		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("성공");

			String url = "jdbc:oracle:thin:@127.0.0.1:1521";
			String dbid = "hr";
			String dbpw = "hr";

			conn = DriverManager.getConnection(url, dbid, dbpw);
			if (conn != null) {
				System.out.println("연결성공");
			} else {
				System.out.println("연결실패");
			}
				
			if (conn != null) {
				System.out.println("연결성공");
			} else {
				System.out.println("연결실패");
			}
			
			String sql = "select * from member_test where email = ?";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);

			rs = psmt.executeQuery();
			memberDTO dto = null;
			if (rs.next()) {
				
				String getemail = rs.getString(1);
				String getpw = rs.getString(2);
				String getnickname = rs.getString(3);
				String getsort = rs.getString(4);
				
				 dto = new memberDTO(getemail, getpw, getnickname, getsort);
				 
				if (pw.equals(getpw)) {
					HttpSession session = request.getSession();
					session.setAttribute("dto", dto);
					response.sendRedirect("index.jsp");
				}
			}else {
				System.out.println("로그인 실패");
				response.sendRedirect("login.jsp");
			}

		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		} finally {
			try {
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
	}

}
