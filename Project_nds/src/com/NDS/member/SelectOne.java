package com.NDS.member;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.snsDAO.snsDAO;
import com.snsDTO.snsDTO;

@WebServlet("/SelectOne")
public class SelectOne extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = Integer.parseInt(request.getParameter("num"));
		snsDAO dao = new snsDAO();
		
        snsDTO dto = dao.SelectOne(num);
		if (dto != null) {
		      request.setAttribute("dto", dto);
		} else {
		      System.out.println("조회실패..");
		}
		RequestDispatcher dis = request.getRequestDispatcher("view.jsp");
		dis.forward(request, response);
	}

}
