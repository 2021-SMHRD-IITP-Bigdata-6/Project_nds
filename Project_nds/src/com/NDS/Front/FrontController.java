package com.NDS.Front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.NDS.member.JoinService;
import com.NDS.member.LoginService;
import com.NDS.member.LogoutService;
import com.NDS.member.UpdateService;
import com.commentDTO.commentDTO;
import com.google.gson.Gson;
import com.inter.command;
import com.memberDAO.memberDAO;
import com.memberDTO.memberDTO;
import com.snsDAO.snsDAO;
import com.snsDTO.snsDTO;

@WebServlet("*.do")
public class FrontController extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
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
			com.execute(request, response);
//			request.setCharacterEncoding("utf-8");
//			String id = "";
//			id = request.getParameter("mb_id");
//			String pw = "";
//			pw = request.getParameter("mb_pw");
//			System.out.println("id : " +id);
//			System.out.println("pw : " +pw);
//			memberDAO dao = new memberDAO();
//			
//			memberDTO dto = new memberDTO(id, pw);
//			
//			memberDTO dto1 = dao.login(dto);
//
//			
//			if (dto1 != null) {
//				HttpSession session = request.getSession();
//				session.setAttribute("dto", dto1);
//				nextpage ="SnsService";
//			} else {
//				nextpage = "LoginFalse.jsp";
//			}

		} else if (command.equals("JoinCon.do")) {

			com = new JoinService();
			nextpage = com.execute(request, response);
//			request.setCharacterEncoding("utf-8");
//			
//			String id = request.getParameter("mb_id");
//			String pw = request.getParameter("mb_pw");
//			String nickname = request.getParameter("mb_nick");
//			String tel = request.getParameter("mb_tel");
//			String part = request.getParameter("mb_part");
//			// 1.memberDAO에 해당하는 기능 메소드로 값 보내주기(매게변수)
//			memberDTO dto = new memberDTO(id, pw, nickname,tel, part);
//			memberDAO dao = new memberDAO();
//			int cnt = dao.join(dto);
//			System.out.println("회원가입하려는 id:" +id);
//			System.out.println("회원가입하려는 pw:" +pw);
			// 2. cnt값 리턴해주기
//			if (cnt > 0) {
//				// JoinCon 에서 joinSuccess.jsp로 값을 보낼 수 있는 두가지 방법
//				// 1.세션 활용
//				// 2.QueryString활용
//				request.setAttribute("dto", dto);
//				nextpage = "login.jsp";
//				RequestDispatcher dis = request.getRequestDispatcher(nextpage);
//				dis.forward(request, response);
//			} else {
//
//			}

		} else if (command.equals("LogoutCon.do")) {

			com = new LogoutService();
			nextpage = com.execute(request, response);

		} else if (command.equals("UpdateCon.do")) {

			com = new UpdateService();
			nextpage = com.execute(request, response);

		} else if (command.equals("check.do")) {

			String id = request.getParameter("id");
			
			
			memberDAO dao = new memberDAO();
			boolean check = dao.IdCheck(id);
			
			PrintWriter out = response.getWriter();
			out.print(check);
			
		} else if ( command.equals("actor_comment.do")){
			
			String comment = request.getParameter("comment");
			String mbid = request.getParameter("mbid");
			snsDAO dao = new snsDAO();
			dao.feed(mbid, comment);
			PrintWriter out = response.getWriter();
			out.print(mbid);
			
		}else if ( command.equals("comment.do")){

			
			String mb_id = request.getParameter("mb_id");
			String cm_ct = request.getParameter("cm_ct");
			String cm_sns_seq = request.getParameter("cm_snsseq");
			
			memberDAO dao = new memberDAO();
			dao.inputComment(mb_id,cm_ct,cm_sns_seq);
			
			PrintWriter out = response.getWriter();
			out.print(cm_ct);
			
			
		}else if(command.equals("loadcomment.do")) {
			String lcm_sns_seq = request.getParameter("lcm_sns_seq");
			
			memberDAO dao = new memberDAO();
			ArrayList<commentDTO> arr = dao.loadComment(lcm_sns_seq);
			
			 Gson gson = new Gson();
			 String json = gson.toJson(arr);
			 
				response.setCharacterEncoding("utf-8");
				PrintWriter out = response.getWriter();
				out.print(json);
		}else if (command.equals("search_post.do")) {
			
			String search_post = request.getParameter("search_post");
			
			snsDAO dao = new snsDAO();
			ArrayList<snsDTO> list = dao.search(search_post);
			Gson gson = new Gson();
			String list_json = gson.toJson(list);
			
			response.setCharacterEncoding("utf-8");
			PrintWriter out = response.getWriter();
//			out.print(search_post);
			out.print(list_json);
		} else if (command.equals("love.do")) {

			String love_cnt = request.getParameter("love_cnt");
			String sns_seq = request.getParameter("sns_seq");
			String mb = request.getParameter("mb");
			System.out.println(love_cnt);
			System.out.println(sns_seq);
			System.out.println(mb);
			snsDAO dao = new snsDAO();
			int g = dao.love(love_cnt,sns_seq,mb);
		
			
			PrintWriter out = response.getWriter();
			out.print(mb);
		}
		
		if(nextpage !=null) {
		response.sendRedirect(nextpage);
		}
	}
}
