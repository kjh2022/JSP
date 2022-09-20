package co.micol.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.common.Command;

public class About implements Command {

	@Override
	public String esec(HttpServletRequest request, HttpServletResponse response) {
		//about과 관련된
		return "main/about";
	}

}
