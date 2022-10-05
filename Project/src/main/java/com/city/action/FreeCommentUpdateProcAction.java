package com.city.action;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.city.control.ActionForward;
import com.city.model.FreeCommentDAO;
import com.city.model.FreeCommentVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class FreeCommentUpdateProcAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
request.setCharacterEncoding("utf-8");
		
		String loginID = null;
		if (request.getSession().getAttribute("loginID") != null) {//�������̵��̸����� ������ �����ϴ� ȸ������ 
			loginID = (String) request.getSession().getAttribute("loginID");//�������̵� �ش� ���ǰ��� �־��ش�.
		}
		
		String realFolder="";
		String saveFolder = "project/imageSave";		//������ ������ ���
		String encType = "utf-8";				//��ȯ����
		int maxSize=20*1024*1024;				//������ size 20�ް�
				
		ServletContext context = request.getSession().getServletContext();;		//�����θ� ��´�
		realFolder = context.getRealPath(saveFolder);			//saveFolder�� �����θ� ����
				
		MultipartRequest multi = null;

		//���Ͼ��ε带 ���������� ���		
		multi = new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());

		 //form���� ���޹����� �����´�(�̸�,����,����,����,��й�ȣ,����? ��)
		 
		String pageNum = ("1");
		String fileName = multi.getFilesystemName("updatePicture");
		int commentID = Integer.parseInt(multi.getParameter("commentID"));
		String commentText = multi.getParameter("update");
		int num = Integer.parseInt(multi.getParameter("num"));
		String imageUID = multi.getParameter("imageUID");
		UUID uid = null;
		String uidName = null;
		if(fileName != null){
			uidName = UUID.randomUUID().toString();
		}
		//������ �� ó��
		
		FreeCommentVO comment = new FreeCommentDAO().getComment(commentID);
		FreeCommentDAO commentDAO = new FreeCommentDAO();
		
				int result = -1;
				
				if(loginID != null && commentText != null){
					result = commentDAO.update(commentID, commentText, uidName);
				}
				
				if(result == 1) {
					
					if(fileName != null){
						String real = "C:\\teamproject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project\\project\\imageSave";
						File delFile = new File(real+"\\"+imageUID+".jpg");
						if(delFile.exists()){
							delFile.delete();
						}
						File oldFile = new File(realFolder+"\\"+fileName);
						File newFile = new File(realFolder+"\\"+uidName+".jpg");
						oldFile.renameTo(newFile);
					}else{
						String real = "C:\\teamproject\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\Project\\project\\imageSave";
						File delFile = new File(real+"\\"+imageUID+".jpg");
						if(delFile.exists()){
							delFile.delete();
						}
					}
				
				}
				
				request.setAttribute("num", num);
				request.setAttribute("pageNum", pageNum);
				request.setAttribute("commentID", commentID);
				request.setAttribute("commentText", commentText);
				request.setAttribute("result", result);
		
		return new ActionForward("/project/freeCommentUpdateProc.jsp", false);
	}

}
