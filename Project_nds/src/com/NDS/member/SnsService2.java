package com.NDS.member;

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

import com.google.gson.Gson;
import com.snsDAO.snsDAO;
import com.snsDTO.snsDTO;

@WebServlet("/SnsService2")
public class SnsService2 extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		snsDTO dto = null;
		snsDAO dao = new snsDAO();
		ArrayList<snsDTO> list = dao.sns();
		
		System.out.println(list.get(0).getMb_id());
		System.out.println(list.size());
		
		Gson gson = new Gson();
		String list_json = gson.toJson(list);
		
		PrintWriter out = response.getWriter();
		out.print(list_json);
		
//		request.setAttribute("post_info", list);
//		// 여기있는 getMb_id값이 고정되어있어서 8밑으로는 안내려가는거같네요
//		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
//		dis.forward(request, response);
	}

}
