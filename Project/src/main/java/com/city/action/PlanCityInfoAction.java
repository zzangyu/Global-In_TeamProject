package com.city.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.city.control.ActionForward;
import com.city.model.CityDAO;
import com.city.model.PlanCityInfoVO;

public class PlanCityInfoAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		request.setCharacterEncoding("utf-8");
		CityDAO dao = CityDAO.getInstance();
		List<PlanCityInfoVO> arry = dao.getPlanInfo();
		
		String name = request.getParameter("name");
		
		request.setAttribute("name", name);
		request.setAttribute("arry", arry);
		return new ActionForward("/project/planCityInfo.jsp");
	}

}
