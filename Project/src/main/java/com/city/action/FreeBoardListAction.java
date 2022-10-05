package com.city.action;

import java.io.IOException;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.city.control.ActionForward;
import com.city.model.FreeBoardDAO;
import com.city.model.FreeBoardVO;

public class FreeBoardListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		HttpSession session = request.getSession();
		String id =(String)session.getAttribute("loginID");
		
		int num = 0;
		try{
			if(request.getParameter("num")!=null){
				num = Integer.parseInt(request.getParameter("num"));
				}
			}catch(Exception e){}
				// �ش� �信�� ����� �Ӽ�
				 	request.setAttribute("num",new Integer(num));
				 	
		
		
		
		
		 int pageSize = 10;
		 
		 

		    //������ num�� �����´�
		    String pageNum = request.getParameter("pageNum");
		    
		    if(pageNum == null) {
		    	pageNum = "1";
		    }

		    //���� ������ 
		    int currentPage =Integer.parseInt(pageNum);
		    
		    int startRow = (currentPage-1) * pageSize + 1; 
		    int endRow = currentPage * pageSize;    
		    int count = 0;
		      int number =0;
		      List<FreeBoardVO> articleList = null;
		      FreeBoardDAO dbPro = FreeBoardDAO.getInstance(); // db����
		      count = dbPro.getArticleCount();
		   
		       if(count > 0){  // ���� �������� �ش��ϴ� �۸��
		       //�ϳ��� ���� �ϸ� ����Ʈ�� ����ض�
		       articleList = dbPro.getArticles(startRow, endRow);
		    }	       
		 else { // �˻� �� ���		 
		      //�ϳ��� ���� �ϸ� ����Ʈ�� ����ض�
		      articleList = Collections.emptyList();  
		}	   
		  // �� ��Ͽ� ǥ���� �� ��ȣ
		    number = count - (currentPage - 1) * pageSize;
		
		    // �ش� �信�� ����� �Ӽ� ����
		    request.setAttribute("currentPage",currentPage);
		    request.setAttribute("startRow", startRow);
		    request.setAttribute("endRow", endRow);
		    request.setAttribute("count", count);
		    request.setAttribute("pageSize", pageSize);
		    request.setAttribute("number", number);
		    request.setAttribute("articleList", articleList);
		    
		    // �ش� ��� ��ȯ����
		
		return new ActionForward("/project/freeBoardList.jsp", false);
	}

}
