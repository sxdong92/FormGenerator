package controller;

import javax.servlet.http.HttpServletRequest;

public class GenerateNoticeAction extends Action {
	public GenerateNoticeAction() {
		
	}
	
	public String getName() { return "generateNotice.do"; }
	
	public String perform(HttpServletRequest request) {
		// request comes from form.jsp
		
		return "notice.jsp";
	}

}
