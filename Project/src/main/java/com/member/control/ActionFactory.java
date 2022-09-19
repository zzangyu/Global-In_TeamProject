package com.member.control;

import com.member.action.Action;
import com.member.action.DeleteFormAction;
import com.member.action.DeleteProcAction;
import com.member.action.FindPassWordAction;
import com.member.action.IdCheckAction;
import com.member.action.ImsiMainPage;
import com.member.action.LoginFormAction;
import com.member.action.LoginProcAction;
import com.member.action.LogoutAction;
import com.member.action.NickCheckAction;
import com.member.action.RegFormAction;
import com.member.action.RegProcAction;
import com.member.action.ModifyFormAction;
import com.member.action.ModifyProcAction;
import com.member.action.MyPage;

//ActionFactory : 사용자의 요청을 처리할 비즈니스 로직이 구현된 XXXAction 객체의 생성을 담당함
public class ActionFactory {
	
	//싱글톤 객체 생성
	private static ActionFactory factory; 
	
	private ActionFactory() {
		
	}
	
	public static synchronized ActionFactory getInstance() {
		if(factory == null) {
			factory = new ActionFactory();
		}
		return factory;
	}
	//매개변수로 명령이 들어오면 
	public Action getAction(String cmd) {
		Action action = null;
		
		switch(cmd) {
		//여기를 메인페이지로 이어야됨
		case"imsimainpage":
			action = new ImsiMainPage();
			break;
			
		case"login":
			action = new LoginFormAction();
			break;
			
		case"loginProc":
			action = new LoginProcAction();
			break;
	    
		case"findpassword":
			action = new FindPassWordAction();
			break;
			
		 case"logout": 
			 action = new LogoutAction(); 
			 break;
		 
		case"regForm":
			action = new RegFormAction();
			break;
			
		case"regProc":
			action = new RegProcAction();
			break;	
			
		case"idCheck":
			action = new IdCheckAction();
			break;	
			
		case"nickCheck":
			action = new NickCheckAction();
			break;	
			
		case"mypage":
			action = new MyPage();
			break;
			
		case"modifyForm":
			action = new ModifyFormAction();
			break;
			
		case"modifyProc":
			action = new ModifyProcAction();
			break;	
			
		case"deleteForm":
			action = new DeleteFormAction();
			break;	
			
		case"deleteProc":
			action = new DeleteProcAction();
			break;	

		default :
			action = new ImsiMainPage();
			break;
		}
		
		
		return action;
		
	}
}
