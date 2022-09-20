package com.city.control;

import com.city.action.Action;
import com.city.action.DeleteFormAction;
import com.city.action.DeleteProcAction;
import com.city.action.FindPassWordAction;
import com.city.action.IdCheckAction;
import com.city.action.ImsiMainPage;
import com.city.action.LoginFormAction;
import com.city.action.LoginProcAction;
import com.city.action.LogoutAction;
import com.city.action.ModifyFormAction;
import com.city.action.ModifyProcAction;
import com.city.action.MyPage;
import com.city.action.NickCheckAction;
import com.city.action.RegFormAction;
import com.city.action.RegProcAction;
import com.city.action.*;

public class ActionFactory {
	
	private static ActionFactory instance;
	
	private ActionFactory() {}
	
	public static synchronized ActionFactory getInstance() {
		if(instance == null) {
			instance = new ActionFactory();
		}
		return instance;
	}
	
	public Action getAction(String cmd) {
		Action action = null;
		
		switch (cmd) {
		
		case "cityInfoView":
			action = new CityInfoViewAction();
			break;
			
		case "cityInfoSearch":
			action = new CityInfoSearchAction();
			break;
			
		case "myPlan":
			action = new MyPlanAction();
			break;
			
		case "myPlanClick":
			action = new MyPlanClickAction();
			break;
			
		case "necessity":
			action = new NecessityAction();
			break;
			
		case "saveProc":
			action = new SaveProcAction();
			break;
			
		case "planCityInfo":
			action = new PlanCityInfoAction();
			break;
			
		case "planInsert":
			action = new PlanInsertAction();
			break;
			
		case "updateProc":
			action = new UpdateProcAction();
			break;
			
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
			
			
			
		default:
			action = new IndexAction();
			break;
		}
	
		return action;
	}
	
}
