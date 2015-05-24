package controller;

import javax.servlet.http.HttpServletRequest;

public class FormAction extends Action {
	public FormAction() {
		
	}
	
	public String getName() { return "homepage.do"; }
	
	public String perform(HttpServletRequest request) {
		
		return "download.jsp";
	}
}
