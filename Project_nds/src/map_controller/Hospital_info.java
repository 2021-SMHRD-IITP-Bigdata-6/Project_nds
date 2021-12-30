package map_controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;


import map_model.map_DAO;
import map_model.map_DTO;

@WebServlet("/Hospital_info")
public class Hospital_info extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	System.out.println("map_controller : Hospital_info");
		
		//DAO를 통해서 DB에서 음식점 정보 list 가지고 오기
		System.out.println("Hospital_info");
		map_DAO dao = new map_DAO();
		ArrayList<map_DTO> hospital_list = dao.showInfo();
		
		//GSON을 사용해서 ArrayList - > JSON으로 변환
		//GSON : Java에서 Json파일을 파싱하고 생성하기 위해 구글에 만든 오픈소스
		//WebContent - WEB-INF- lib 에 넣어주기
		
		//new Gson : null값을 포함하지 않는다.
		//GsonBuilder().serializeNulls().create(); :  null값 포함
	Gson gson = new GsonBuilder().serializeNulls().create();
	String hospital_json = gson.toJson(hospital_list);
		
		//응답하기 전에 인코딩 진행!
	response.setCharacterEncoding("utf-8");
		
		
		// 출력스트림을 이용해서 kakaoMap.jsp로 json 파일 보내주기!
	PrintWriter out = response.getWriter();
	out.print(hospital_json);
		
		}
		
		

}
	
