package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import notice.Notice;

public class DownloadJSONAction extends Action {
	public DownloadJSONAction() {
		
	}
	
	public String getName() { return "downloadJson.do"; }
	
	public String perform(HttpServletRequest request) {
		if (request.getParameter("downloadJson") == null) {
			return "form.jsp";
		}
		
		HttpSession session = request.getSession(true);
		Notice notice = (Notice) session.getAttribute("notice");
		if (notice == null) notice = new Notice();

		String json = notice.writeToJSON();
		request.setAttribute("jsonFile", json);
		
		return "jsonFile";
	}

}
