package com.NDS.Front;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.NDS.member.JoinService;
import com.NDS.member.LoginService;
import com.NDS.member.LogoutService;
import com.NDS.member.UpdateService;
import com.commentDTO.commentDTO;
import com.google.gson.Gson;
import com.inter.command;
import com.memberDAO.memberDAO;
import com.memberDTO.memberDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
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


		} else if (command.equals("JoinCon.do")) {

			com = new JoinService();
			nextpage = com.execute(request, response);

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
			
		} else if ( command.equals("newpost.do")){
			snsDAO dao = new snsDAO();
			String comment = request.getParameter("comment");
			String mbid = request.getParameter("mbid");
			String file = request.getParameter("file");
			ServletContext context = getServletContext(); // 어플리케이션에 대한 정보를 ServletContext 객체가 갖게 됨.
			String saveDir = context.getRealPath("Upload"); // 절대경로를 가져옴
			int maxSize = 3 * 1024 * 1024; // 3MB
			String encoding = "utf-8";
			boolean isMulti = ServletFileUpload.isMultipartContent(request);// boolean타입. ??????
			if (isMulti) {
	              MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding,
	                          new DefaultFileRenamePolicy());
	              String mb_id = multi.getParameter("mb_id");
	              String sns_content = multi.getParameter("actor_comment");
	              file = multi.getFilesystemName("file");
	              System.out.println(mb_id);
	              System.out.println(sns_content);
	              System.out.println(file);
	              try {
	                    int result = dao.uploadFile(sns_content, mb_id, file);
	                    String moveUrl = "";
	                    System.out.println("들어옴"); 
	                    if (result > 0) {
	                          System.out.println("저장완료");
	                          moveUrl = "SelectService";
	                    } else {
	                          System.out.println("저장실패");
	                          moveUrl = "Upload.html";
	                    }
	                    response.sendRedirect(moveUrl);
	              } catch (Exception e) {
	                    e.printStackTrace();
	              }
	        } else {
	              System.out.println("일반 전송 form 입니다.");
	        }
			dao.feed(mbid, comment, file);
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
