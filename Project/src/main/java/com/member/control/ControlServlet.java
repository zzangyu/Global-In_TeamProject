package com.member.control;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.member.action.*;

public class ControlServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String cmd = request.getParameter("cmd");
		
		if(cmd !=null) {
			ActionFactory factory = ActionFactory.getInstance();
			
			Action action = factory.getAction(cmd);
			
			//요청과 응답을 같이 넘겨준다.
			ActionForward af = action.execute(request, response);
			if(af.isRedirect()) {
				response.sendRedirect(af.getUrl());//url가져온다
			}else {
				RequestDispatcher rd = request.getRequestDispatcher(af.getUrl());
				rd.forward(request, response);
			}
			
		}else {
			PrintWriter out = response.getWriter();
			out.println("<html>");
			out.println("<head><title>Error</title></head>");
			out.println("<body>");
			
			out.println("<h4>올바른 요청이 아닙니다!!!!</h4>");              
			out.println("<h4>http://localhost:9090/ProjectMVC2/member/cityPlan.mb?cmd=요청키워드</h4>"); //형식을 잡아줌
			
			
			out.println("</body>");
			out.println("</html>");
		}
		
	}

}
