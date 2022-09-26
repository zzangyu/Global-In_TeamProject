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
			
		default:
			action = new IndexAction();
			break;
		}
	
		return action;
	}
	
}
