<%@ page language="java" contentType="text/html; charset=US-ASCII"
	pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>Download File</title>
</head>
<body>
	<h3>Download File</h3>
	<h4 style="color:red">${message}</h4>
	<form action="downloadHTML.do" method="post">
		<input type="submit" name="download" value="Download File"/>
	</form>
	<h4 style="color:red">Download json file here</h4>
	<form action="downloadJSON.do" method="post">
		<input type="submit" name="downloadJson" value="Download JsonFile"/>
	</form>
</body>
</html>