package co.micol.prj.member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.common.Command;
import co.micol.prj.member.service.MemberService;
import co.micol.prj.member.serviceImpl.MemberServiceImpl;

public class AjaxMemberIdCheck implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
//		Ajax로 아이디 중복 체크를 하는 곳
//		리턴값이 true면 사용가능한 아이디, false는 중복된/사용 불가능한 아이디
		MemberService dao = new MemberServiceImpl();
		String id = request.getParameter("id");
		boolean b = dao.isMemberId(id);
		String str = "ajax:0"; // 페이지로 돌려줄 값을 담을 변수
		if (b == true) {
			str = "ajax:1";
		}
		return str; // view Resolve에 Ajax호출이라는 것을 알려주기 위해서
	}
}
