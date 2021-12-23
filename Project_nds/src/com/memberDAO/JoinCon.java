package com.memberDAO;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/JoinCon")
public class JoinCon extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("utf-8");

		String email = request.getParameter("email");
		String pw = request.getParameter("pw");
		String nickname = request.getParameter("nickname");
		String sort = request.getParameter("sort");

		Connection conn = null;
		PreparedStatement psmt = null;

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
			String sql = "insert into member_test values (?,?,?,?)";

			psmt = conn.prepareStatement(sql);
			psmt.setString(1, email);
			psmt.setString(2, pw);
			psmt.setString(3, nickname);
			psmt.setString(4, sort);

			int cnt = psmt.executeUpdate();
			
			if (cnt > 0) {
				response.sendRedirect("login.jsp");
			} else {
			}
		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		} finally {
			System.out.println("무조건 실행");

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
