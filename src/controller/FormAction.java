package controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import notice.Notice;

public class FormAction extends Action {
	public FormAction() {

	}

	public String getName() {
		return "form.do";
	}

	public String perform(HttpServletRequest request) {
		// request comes from homepage.jsp
		// if action == "new a form", jump to form.jsp
		// if action == "upload", read the file and jump to form.jsp
		HttpSession session = request.getSession();

		Notice notice = null;
		// upload json
		if (ServletFileUpload.isMultipartContent(request)) {
			try {
				request.setCharacterEncoding("utf-8");
				ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());
				List<FileItem> list = (List<FileItem>) upload.parseRequest(request);

				for (FileItem item : list) {
					String name = item.getFieldName();
					
					if (!item.isFormField()) {
						System.out.println(name);
						InputStream in = item.getInputStream();
						notice = Notice.readFromJSON(in);
						System.out.println(notice.writeToJSON());
						in.close();
						
						session.setAttribute("jsonFile", notice.writeToJSON());
						session.setAttribute("notice", notice);
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		return "form.jsp";
	}
}
