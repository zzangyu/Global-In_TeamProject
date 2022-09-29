package com.city.control;

import com.city.action.Action;
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
			
		case "deletePlan":
			action = new DeletePlanProcAction();
			break;

		case "wishList":
			action = new WishListAction();
			break;
			
		case "insertWishList":
			action = new InsertWishList();
			break;
			
		case "deleteWishList":
			action = new DeleteWishList();
			break;
			
		case"login":
			action = new LoginFormAction();
			break;
			
		case"loginProc":
			action = new LoginProcAction();
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
		//2022-09-26 비밀번호 찾기
		case"findPwResult":
			action = new FindPwResultAction();
			break;
			
		default:
			action = new IndexAction();
			break;
		}
	
		return action;
	}
	
}
