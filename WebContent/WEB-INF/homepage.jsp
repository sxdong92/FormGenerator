<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>FormGenerator - Ionia</title>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/main.css" rel="stylesheet">
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->

<style type="text/css">
.blocks {
	padding: 20px 20px;
	background: #66A3C2;
	width: 95%;
	height: 150px;
	border-radius: 30px;
	font-family: "Trebuchet MS", Helvetica, sans-serif;
	font-size: 90%;
	color: #00478F;
	text-align: center;
}

.blocks:hover {
	padding: 20px 20px;
	background: #00476B;
	width: 95%;
	height: 150px;
	border-radius: 30px;
	font-family: "Trebuchet MS", Helvetica, sans-serif;
	font-size: 90%;
	color: #99ADD6;
	text-align: center;
}

#blockref {
	color: #FFFFFF;
	font-size: 200%;
	text-decoration: none;
}

.buttontable {
	width: 80%;
	margin-top: 100px;
	margin-bottom: 100px;
}


h1, h2, h3, h4, h5, h6 {
	font-family: "Trebuchet MS", Helvetica, sans-serif;
}
</style>
</head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap.file-input.js"></script>
<script>
	$(document).ready(function() {
		$('input[type=file]').bootstrapFileInput();
	});
</script>

<body>

	<div class="container">
		<div style="margin: 50px">
			<h1 style="color: #66A3C2; text-align: center">Online Privacy
				Form Generator</h1>
			<hr />
		</div>

		<div align="center">
		<h5 style="margin-top: 30px">
				<a href="form.do" id="blockref"
					style="color: #00476B; text-align: center">Create New Privacy
					Form</a>
			</h5>
			<h2 style="margin-top: 30px">Or</h2>
			
			<h2 style="margin-top: 30px; color: #00476B">Have Back Up Forms? Resume From
				Backup File</h2>
			<h4 style="color: red">${message}</h4>
			<form action="form.do" method="post" enctype="multipart/form-data">
				<table>
					<tr>
						<td>
							<div style="margin: 30px">
								<input type="file" name="file" title="Select the Backup File"
									data-filename-placement="inside" />
							</div>
						</td>
					</tr>
					<tr>
						<td align="center"><input type="submit" name="upload"
							class="btn btn-primary btn-primary-lg" value="Upload" /></td>
					</tr>
				</table>
			</form>
		</div>
	</div>

	<br>
	<br>
	<br>

	<div style="margin: 50px">
		<br> <br> <br>
		<p style="color: #00476B; text-align: center">Team 7 Ionia @2015</p>
	</div>

</body>
</html>
