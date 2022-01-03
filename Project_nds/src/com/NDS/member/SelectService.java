package com.NDS.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.snsDAO.snsDAO;
import com.snsDTO.snsDTO;

@WebServlet("/SelectService")
public class SelectService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// DB에 저장된 file정보를 모두 검색해서 jsp로 전송
		snsDAO dao = new snsDAO();

		try {
			ArrayList<snsDTO> list = dao.selectAll();

			if (list != null) {
				request.setAttribute("list", list);

			} else {
				System.out.println("비었습니다");
			}

			RequestDispatcher dis = request.getRequestDispatcher("Board.jsp");
			dis.forward(request, response);

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
