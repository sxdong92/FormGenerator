package controller;

import javax.servlet.http.HttpServletRequest;

public class UploadJSONAction extends Action {
	public UploadJSONAction() {
		
	}
	
	public String getName() { return "uploadJSON.do"; }
	
	public String perform(HttpServletRequest request) {
		
		return "formpage.jsp";
	}

}
