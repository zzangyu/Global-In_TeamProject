package com.city.action;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.city.control.ActionForward;
import com.city.model.CommentDAO;
import com.city.model.CommentVO;

public class CommentDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {

		request.setCharacterEncoding("utf-8");
		
		String userID = null;
		if (request.getSession().getAttribute("loginID") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
			userID = (String) request.getSession().getAttribute("loginID");//�������̵� �ش� ���ǰ��� �־��ش�.
		}
		
		int num = 0;
		if (request.getParameter("num") != null){
			num = Integer.parseInt(request.getParameter("num"));
		}
		
		//����� ��ȿ���� �Ǻ�
				int commentID = 0;
				if (request.getParameter("commentID") != null) {
					commentID = Integer.parseInt(request.getParameter("commentID"));
				}
		
				CommentVO comment = new CommentDAO().getComment(commentID);
				CommentDAO commentDAO = new CommentDAO();
				int result = commentDAO.delete(commentID);
				
				String real = "C:\\teamproject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project\\project\\imageSave";
				/* String commentReal = "C:\\Users\\SUCCU\\Desktop\\JSP_STUDY\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\TeamProject\\boardone\\img\\uploadImg"; */
				if(result != -1) {
					File delFile = new File(real+"\\"+comment.getImageUID()+".jpg");
					if(delFile.exists()){
						delFile.delete();
					}
				}
				
				request.setAttribute("result", result);
				request.setAttribute("num", num);
				request.setAttribute("commentID", commentID);
				request.setAttribute("comment", comment);
		
		return new ActionForward("/project/commentDelete.jsp", false);
	}

}
