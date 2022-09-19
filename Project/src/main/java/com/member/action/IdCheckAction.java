package com.member.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.control.ActionForward;
import com.member.model.MembershipDAO;

public class IdCheckAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		MembershipDAO dao = MembershipDAO.getInstance();
		
		//db에서 아이디 있는지 없는지 체크
		String id = request.getParameter("id");
		boolean check = dao.idCheck(id);
		
		request.setAttribute("id", id);
		request.setAttribute("check", check);
		System.out.println(check);
		System.out.println(id);
		return new ActionForward("/member/idCheck.jsp", false);
	}

}
