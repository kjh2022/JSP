package co.micol.prj;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.common.Command;
import co.micol.prj.member.command.MemberInsert;
import co.micol.prj.member.command.MemberJoinForm;
import co.micol.prj.member.command.MemberSelect;
import co.micol.prj.member.command.MemberSelectList;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();
	// 요청한 값을 저장하기 위해서

	public FrontController() {
		super();
	}

	public void init(ServletConfig config) throws ServletException {
		// 모든 요청을 등록하는 곳
		map.put("/main.do", new MainCommand()); //처음 시작하는 페이지
		map.put("/memberSelectList.do", new MemberSelectList()); //멤버 목록 보기(출력
		map.put("/MemberSelect.do", new MemberSelect()); //멤버 상세 정보
		map.put("/memberJoinForm.do", new MemberJoinForm());
		map.put("/memberInsert.do", new MemberInsert());
	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//		요청을 분석하고 처리하고 결과를 돌려주는 곳
		request.setCharacterEncoding("utf-8"); // 전달받는 자료의 한글 깨짐을 방지하기 위해
		String uri = request.getRequestURI();// 도메인을 제외한 실제 요청 정보
		String contextPath = request.getContextPath();// ContextPath구성
		String page = uri.substring(contextPath.length());// 처리할 요청명 구함
		System.out.println(request.getRequestURL());
		System.out.println(uri);
		System.out.println(contextPath);
		System.out.println(page);
		System.out.println(request.getRemoteUser());
		Command command = map.get(page); // 처리할 command를 찾음
		String viewPage = command.exec(request, response);// command를 실행하고 돌려줄 페이지 받음
		if (!viewPage.endsWith(".do")) {
			viewPage = "/WEB-INF/views/" + viewPage + ".jsp";
			RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
			dispatcher.forward(request, response);
		} else {
			response.sendRedirect(viewPage);
		}
	}

}
