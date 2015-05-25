package controller;

import javax.servlet.http.HttpServletRequest;

public class FormAction extends Action {
	public FormAction() {
		
	}
	
	public String getName() { return "form.do"; }
	
	public String perform(HttpServletRequest request) {
		
		return "form.jsp";
	}
}
