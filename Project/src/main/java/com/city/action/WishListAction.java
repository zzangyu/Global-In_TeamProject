package com.city.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.city.control.ActionForward;
import com.city.model.CityDAO;
import com.city.model.SaveCityVO;

public class WishListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		String id = "han";
		CityDAO dao = CityDAO.getInstance();
		
		// id로 idCheck값 리스트로 받아옴(중복x)
		List<String> arry = dao.getCity(id);
		TreeSet<String> set = new TreeSet<String>(arry);
		List<String> resultArry = new ArrayList<>();
		resultArry = new ArrayList<String>(set);
		
		List<SaveCityVO> planList = new ArrayList<>();
		for(int i = 0; i < resultArry.size(); i++) {
			planList.addAll(dao.getCity(resultArry.get(i), id));
		}
		for (int i = 0; i < resultArry.size(); i++) {
			System.out.print(resultArry.get(i)+" ");
		}
		request.setAttribute("planList", planList);		
		request.setAttribute("arry", arry);
		return new ActionForward("/project/wishList.jsp", false);
	}

}
