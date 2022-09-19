package com.member.action;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.member.control.ActionForward;

//Action(interface) :  모든 XXXAction 클래스가 implements할 인터페이스
//비즈니스 로직을 재정의 할 메소드를 선언함
public interface Action {
	
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response)throws IOException;

}
