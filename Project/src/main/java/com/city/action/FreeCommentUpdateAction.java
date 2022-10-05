package com.city.action;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.city.control.ActionForward;
import com.city.model.FreeCommentDAO;
import com.city.model.FreeCommentVO;

public class FreeCommentUpdateAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int num = 0;
		if (request.getParameter("num") != null){
			num = Integer.parseInt(request.getParameter("num"));
		}
		int commentID = 0;
		if (request.getParameter("commentID") != null){
			commentID = Integer.parseInt(request.getParameter("commentID"));
		}
		FreeCommentDAO commentDAO = new FreeCommentDAO();
		FreeCommentVO commentVO = commentDAO.getComment(commentID);//
		String commentText = commentDAO.getUpdateComment(commentID);
		
		String imageUID = commentVO.getImageUID();//
		
		request.setAttribute("num", num);
		request.setAttribute("commentID", commentID);
		request.setAttribute("commentText", commentText);
		
		request.setAttribute("imageUID", imageUID);//
		
		return new ActionForward("/project/freeCommentUpdate.jsp", false);
	}

}
