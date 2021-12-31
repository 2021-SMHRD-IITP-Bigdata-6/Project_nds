package com.NDS.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.inter.command;
import com.memberDAO.memberDAO;
import com.memberDTO.memberDTO;

public class LoginService implements command{
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String id = "";
		id = request.getParameter("mb_id");
		String pw = "";
		pw = request.getParameter("mb_pw");
		System.out.println("id : " +id);
		System.out.println("pw : " +pw);
		memberDAO dao = new memberDAO();
		
		memberDTO dto = new memberDTO(id, pw);
		
		memberDTO dto1 = dao.login(dto);

		String nextpage = " ";
		
		if (dto1 != null) {
			HttpSession session = request.getSession();
			session.setAttribute("dto", dto1);
			nextpage ="SnsService";
		} else {
			nextpage = "LoginFalse.jsp";
		}
		
		return nextpage;
	}
}
