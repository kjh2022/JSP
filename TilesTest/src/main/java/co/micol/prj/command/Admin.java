package co.micol.prj.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.micol.prj.common.Command;

public class Admin implements Command {

	@Override
	public String esec(HttpServletRequest request, HttpServletResponse response) {
		
		return "admin/admin/main";
	}

}