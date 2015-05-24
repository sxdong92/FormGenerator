package controller;

import javax.servlet.http.HttpServletRequest;

public class DownloadHTMLAction extends Action {
	public DownloadHTMLAction() {
		
	}
	
	public String getName() { return "downloadHTML.do"; }
	
	public String perform(HttpServletRequest request) {
		
		// link to download file? 
		return "htmlFile";
	}
}
