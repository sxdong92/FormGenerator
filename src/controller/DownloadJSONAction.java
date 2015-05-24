package controller;

import javax.servlet.http.HttpServletRequest;

public class DownloadJSONAction {
	public DownloadJSONAction() {
		
	}
	
	public String getName() { return "downloadJSON.do"; }
	
	public String perform(HttpServletRequest request) {
		
		// link to download file? 
		return "JSONFile";
	}

}
