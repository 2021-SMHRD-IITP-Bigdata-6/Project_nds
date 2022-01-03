package com.NDS.member;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inter.command;
import com.memberDAO.memberDAO;
import com.snsDAO.snsDAO;
import com.snsDTO.snsDTO;

@WebServlet("/DeleteCmCon")
public class DeleteCmCon implements command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

		int dcs = Integer.parseInt(request.getParameter("delete_CmCt_seq"));
		System.out.println(" DeleteCmCon¿¡¼­ seq°ª" + dcs);
		memberDAO dao = new memberDAO();
		int cnt = dao.delete(dcs);

		snsDAO daoSns = new snsDAO();
		ArrayList<snsDTO> list = daoSns.sns();
		request.setAttribute("post_info", list);

		String nextpage = " ";
		RequestDispatcher dis = request.getRequestDispatcher("index.jsp");
		dis.forward(request, response);

//            if (cnt > 0) {
//               nextpage ="index.jsp";
//            } else {
//               
//            }
//            
		return null;

	}
}