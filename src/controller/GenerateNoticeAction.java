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
		
		notice.institutionName = request.getParameter("institutionName");
		notice.lastRevDate = request.getParameter("startDate");
		
		String hasAff = request.getParameter("hasAffiliates");
		if(hasAff.equals("share")) {
			notice.hasAffiliates = true;
		}
		
		String[] optMethods = request.getParameterValues("opt-out");
		for(String s : optMethods) {
			if(s.equals("1")) {
				notice.optByPhone = true;
			}
			else if(s.equals("2")) {
				notice.optByWebsite = true;
			}
			else if(s.equals("3")) {
				notice.optByMail = true;
			}
		}
		
		String[] personalInfos = request.getParameterValues("infoCheck");
		if(personalInfos != null) {
			for(String s : personalInfos) {
				notice.PersonalInfoTypes.add(s);
			}
		}
		
		for(int i = 1; i <= 6; i++) {
			notice.isShared[i] = request.getParameter("question" + i).equals("No") ? false : true;
			notice.isLimited[i] = request.getParameter("question" + i + "b").equals("No") ? false : true;	
		}
		
		String day = request.getParameter("sharelimitDays");
		notice.sharelimitDays = Integer.parseInt(day);
		
		notice.optPhone = request.getParameter("phonephone");
		notice.optWebsite = request.getParameter("websitewebsite");
		notice.Address = request.getParameter("address");
		notice.city = request.getParameter("city");
		notice.state = request.getParameter("state");
		notice.zipcode = request.getParameter("zipcode");
		
		String[] contacts = request.getParameterValues("contacts");
		if(contacts != null) {
			for(String s : contacts) {
				if(s.equals("phone")) notice.contactByPhone = true;
				if(s.equals("website")) notice.contactByWebsite = true;
			}
		}
		notice.contactPhone = request.getParameter("contactPhone");
		notice.contactWebsite = request.getParameter("contactWebsite");
		
		
		notice.protectWay = request.getParameter("protectWays");
		
		String[] collects = request.getParameterValues("collectWays");
		if(collects != null) {
			for(String s : collects) {
				notice.collectWays.add(s);
			}
		}
		notice.collectFromCompanies = request.getParameter("collectFromCompanies").equals("yes") ? true : false;
		notice.collectFromOthers = request.getParameter("collectFromOthers").equals("yes") ? true : false;
		
		notice.provideLaw = request.getParameter("provideLaw").equals("yes") ? true : false;
		notice.law = request.getParameter("law");
		
		notice.applyToEveryone = request.getParameter("applyToEveryone").equals("yes") ? true : false;
		
		notice.affiliates = request.getParameter("affiliates");
		notice.nonaffiliates = request.getParameter("nonaffiliates");
		notice.jointMarketing = request.getParameter("jointMarketing");
		
		notice.otherInfo = request.getParameter("otherInfo");
		
		session.setAttribute("notice", notice);
		System.out.print(notice);
		
		return "notice.jsp";
	}

}
