package com.NDS.Front;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.NDS.member.JoinService;
import com.NDS.member.LoginService;
import com.NDS.member.LogoutService;
import com.NDS.member.UpdateService;
import com.inter.command;

@WebServlet("*.do")
public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		System.out.println("호출성공");

		String uri = request.getRequestURI();
		System.out.println(uri);
		String path = request.getContextPath();
		System.out.println(path);
		String command = uri.substring(path.length() + 1);
		System.out.println("요청기능 : " + command);

		command com = null;
		String nextpage = null;

		if (command.equals("LoginCon.do")) {

			com = new LoginService();
			nextpage = com.execute(request, response);

		} else if (command.equals("JoinCon.do")) {

			com = new JoinService();
			nextpage = com.execute(request, response);

		} else if (command.equals("LogoutCon.do")) {

			com = new LogoutService();
			nextpage = com.execute(request, response);

		} else if (command.equals("UpdateCon.do")) {

			com = new UpdateService();
			nextpage = com.execute(request, response);

		} 
		
		if(nextpage !=null) {
		response.sendRedirect(nextpage);
		}
	}
}
