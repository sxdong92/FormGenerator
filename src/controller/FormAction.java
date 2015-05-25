package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

public class FormAction extends Action {
	public FormAction() {
		
	}
	
	public String getName() { return "form.do"; }
	
	public String perform(HttpServletRequest request) {
		// request comes from homepage.jsp
		// if action == "new a form", jump to form.jsp
		// if action == "upload", read the file and jump to form.jsp
		
		return "form.jsp";
	}
}
