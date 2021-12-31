package com.NDS.member;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.inter.command;
import com.memberDAO.memberDAO;
import com.memberDTO.memberDTO;

public class JoinService implements command{
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException  {
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("mb_id");
		String pw = request.getParameter("mb_pw");
		String nickname = request.getParameter("mb_nick");
		String tel = request.getParameter("mb_tel");
		String part = request.getParameter("mb_part");
		// 1.memberDAO에 해당하는 기능 메소드로 값 보내주기(매게변수)
		memberDTO dto = new memberDTO(id, pw, nickname,tel, part);
		memberDAO dao = new memberDAO();
		int cnt = dao.join(dto);
		System.out.println("회원가입하려는 id:" +id);
		System.out.println("회원가입하려는 pw:" +pw);
		
		return null;
	} 
}
