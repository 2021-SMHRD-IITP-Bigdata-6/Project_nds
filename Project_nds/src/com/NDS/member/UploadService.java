package com.NDS.member;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.snsDAO.snsDAO;

@WebServlet("/UploadService")
public class UploadService extends HttpServlet {
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String fileName = request.getParameter("file");
		ServletContext context = getServletContext(); // 어플리케이션에 대한 정보를 ServletContext 객체가 갖게 됨.
		String saveDir = context.getRealPath("Upload"); // 절대경로를 가져옴
		int maxSize = 3 * 1024 * 1024; // 3MB
		String encoding = "utf-8";
		boolean isMulti = ServletFileUpload.isMultipartContent(request);// boolean타입. ??????
        if (isMulti) {
              MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, encoding,
                          new DefaultFileRenamePolicy());
              snsDAO dao = new snsDAO();
              String mb_id = multi.getParameter("mb_id");
              String sns_content = multi.getParameter("sns_content");
              String file = multi.getFilesystemName("file");
              System.out.println(mb_id);
              System.out.println(sns_content);
              System.out.println(file);
              try {
                    int result = dao.uploadFile(sns_content, mb_id, file);
                    String moveUrl = "";
                    System.out.println("들어옴"); 
                    if (result > 0) {
                          System.out.println("저장완료");
                          moveUrl = "SnsService";
                    } else {
                          System.out.println("저장실패");
                          moveUrl = "newpost.jsp";
                    }
                    response.sendRedirect(moveUrl);
              } catch (Exception e) {
                    e.printStackTrace();
              }
        } else {
              System.out.println("일반 전송 form 입니다.");
        }
		

	}
}
