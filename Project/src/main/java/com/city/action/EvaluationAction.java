package com.city.action;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.city.control.ActionForward;
import com.city.model.EvaluationDAO;
import com.city.model.EvaluationVO;
import com.city.model.MembershipDAO;

public class EvaluationAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		MembershipDAO dao  = MembershipDAO.getInstance();
		
		int num = 0; int gechu = 0; int bichu = 0; int result = 0;
		String userID = null;
		
	 	if(request.getSession().getAttribute("loginID") != null){
	 		userID = (String) request.getSession().getAttribute("loginID");
	 	}		
	 	if (request.getParameter("num") != null){
	 		num = Integer.parseInt(request.getParameter("num"));
	 	}
		if (request.getParameter("gechu") != null){
			gechu = Integer.parseInt(request.getParameter("gechu"));
		}
		if (request.getParameter("bichu") != null){
			bichu = Integer.parseInt(request.getParameter("bichu"));
		}
		
		EvaluationDAO evaluationDAO = new EvaluationDAO();
		
		if(userID != null) {
			
			ArrayList<EvaluationVO> list = evaluationDAO.whereList(num, userID);
			if (list.isEmpty()){
				result = evaluationDAO.write(num, userID, gechu, bichu);
			}
			else if (gechu == list.get(0).getGechu() && bichu == list.get(0).getBichu()){
				result = evaluationDAO.delete(num, userID);
			}
			else{
				result = evaluationDAO.update(num, userID, gechu, bichu);
			}
		
		}
		
		request.setAttribute("dao", dao);
		request.setAttribute("result", result);
		request.setAttribute("gechu", gechu);
		request.setAttribute("bichu", bichu);
		request.setAttribute("num", num);
		
		return new ActionForward("/project/evaluationAction.jsp", false);
	}

}
