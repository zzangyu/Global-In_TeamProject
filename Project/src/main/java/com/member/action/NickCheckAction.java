package com.member.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.control.ActionForward;
import com.member.model.MembershipDAO;

public class NickCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		MembershipDAO dao = MembershipDAO.getInstance();
		
		String nick = request.getParameter("nick");
	    boolean check = dao.nickCheck(nick);
	     
	    request.setAttribute("nick", nick);
	    request.setAttribute("check", check);
	     
	    return new ActionForward("/member/nickCheck.jsp", false);
	}

}
