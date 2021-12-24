package com.NDS.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.inter.command;
import com.memberDAO.memberDAO;
import com.memberDTO.memberDTO;

public class UpdateService implements command{
		public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			HttpSession session = request.getSession();
			memberDTO dto = (memberDTO) session.getAttribute("dto");
			request.setCharacterEncoding("UTF-8");

			String pw = request.getParameter("mb_pw");
			String nick = request.getParameter("mb_nick");
			String tel = request.getParameter("mb_tel");
			String id = dto.getId();
			memberDAO dao = new memberDAO();
			
			int cnt = dao.update(pw, nick, tel, id);

			if (cnt > 0) {
				dto.setNickname(nick);
				dto.setTel(tel);
			} else {
				
			}
			return "profile.jsp";
			
		}
}
