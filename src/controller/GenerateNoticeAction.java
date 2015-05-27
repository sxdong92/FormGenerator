package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import notice.Notice;

public class GenerateNoticeAction extends Action {
	public GenerateNoticeAction() {
		
	}
	
	public String getName() { return "generateNotice.do"; }
	
	public String perform(HttpServletRequest request) {
		// request comes from form.jsp
		
		HttpSession session = request.getSession(true);
		Notice notice = (Notice) session.getAttribute("notice");
		if(notice == null) notice = new Notice();
		
		notice.institutionName = request.getParameter("name");
		
		
		
		session.setAttribute("notice", notice);
		return "notice.jsp";
	}

}
