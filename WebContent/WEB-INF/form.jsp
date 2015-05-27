<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="notice.Notice"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>FormGenerator - Team 7 Ionia</title>

	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/main.css" rel="stylesheet">
	<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<!-- Include all compiled plugins (below), or include individual files as needed -->
	<script src="js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">

	<div class="header">
		<h2 style="color: #B2D1E0">FormGenerator</h2>
		<p class="lead" style="color: #fff">Free privacy policy generator that provides you with consistent and correct privacy policy.</p>
	</div>

<div class="row marketing">
	<form id="form1" action="generateNotice.do" onsubmit="return validateForm()" method="post">
		<div class="content-row">
			<h4>What is the name of your institution? *</h4>
			<div id="error" style="display: none">
				<h5 style="color: red;">The field could not be empty</h5>
			</div>
			<p>
				<input type="text" class="form-control" id=institutionName name="institutionName" data-validation="length" data-validation-length="min4">
			</p>
			<br />

			<h4>What opt out communication methods will you offer? (At least one) *</h4>
			<div id="error1" style="display: none">
				<h5 style="color: red;">You must select at least one opt-out method.</h5>
			</div>
			<table style="width: 100%">
				<tr>
					<td width="15%"><input type="checkbox" name="opt-out" value="1"> Phone</td>
					<td width="15%"><input type="checkbox" name="opt-out" value="2"> Website</td>
					<td width="15%"><input type="checkbox" name="opt-out" value="4"> Mail-in</td>
				</tr>
			</table>
			<br />
			
			<h4>Please input the revision date that will appear in the privacy form.</h4>
			<div id="errordate" style="display: none">
				<h5 style="color: red;">The revision date cannot be empty.</h5>
			</div>
			<input class="form-control" type="text" id="datepicker" placeholder="Example : October 2012" name="newDate">
			<br />
			
			<h4>Please select Yes if any of the following statements is true: *</h4>
			<ul>
				<li>Your organization does not have affiliates</li>
				<li>Your affiliates(if you have any) do not use personal information in a manner that requires an opt-out</li>
				<li>Your organization provides the affiliate marketing notice separately.</li>
			</ul>
			<table style="width: 40%">
				<tr>
					<td><input type="radio" name="hasAffiliates" id="radio1" value="notshare" checked> Yes</td>
					<td><input type="radio" name="hasAffiliates" id="radio2" value="share"> No</td>
				</tr>
			</table>
			<br />

			<!--  
			<h4>Two or more financial institutions that jointly provide this
				FTC model form must indicate their full names in the following
				sections. Please select Yes if your organization is going to provide
				this notice jointly with another organization:</h4>
			<table style="width: 40%">
				<tr>
					<td><input type="radio" name="optionsRadio2" id="radio3" value="many" checked> Yes</td>
					<td><input type="radio" name="optionsRadio2" id="radio4" value="one"> No</td>
				</tr>
			</table>
			<br />
			-->
		</div>

		<div class="content-row">
			<div id="error5" style="display: none">
				<h5 style="color: red;">You need to select 6 options including SSN so only need to select 5 in total besides SSN</h5>
			</div>
			<h4>Please select the types of personal information you collect and share depend on the product or service customers have with you.</h4>
			<p>Besides SSN, select only 5 more information types</p>
			<div id="addinput" onclick="checkBox()">
				<table>
					<tr>
						<td><input type="checkbox" name="checkbox" value="Income"> Income</td>
						<td><input type="checkbox" name="checkbox" value="Account Balances"> Account Balances</td>
						<td><input type="checkbox" name="checkbox" value="Payment History"> Payment History</td>
						<td><input type="checkbox" name="checkbox" value="Transaction History"> Transaction History</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="checkbox" value="Transaction or Loss History"> Transaction or Loss History</td>
						<td><input type="checkbox" name="checkbox" value="Credit History"> Credit History</td>
						<td><input type="checkbox" name="checkbox" value="Credit Scores"> Credit Scores</td>
						<td><input type="checkbox" name="checkbox" value="Assets"> Assets</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="checkbox" value="Investment Experience"> Investment Experience</td>
						<td><input type="checkbox" name="checkbox" value="Credit Based Insurance Scores"> Credit Based Insurance Scores</td>
						<td><input type="checkbox" name="checkbox" value="Insurance Claim History"> Insurance Claim History</td>
						<td><input type="checkbox" name="checkbox" value="Account Transactions"> Account Transactions</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="checkbox" value="Risk Tolerance"> Risk Tolerance</td>
						<td><input type="checkbox" name="checkbox" value="Medical Related Debts"> Medical Related Debts</td>
						<td><input type="checkbox" name="checkbox" value="Credit Card or other debt"> Credit Card or other debt</td>
						<td><input type="checkbox" name="checkbox" value="Mortgage Rates and Payments"> Mortgage Rates and Payments</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="checkbox" value="Retirement Assets"> Retirement Assets</td>
						<td><input type="checkbox" name="checkbox" value="Checking account information"> Checking account information</td>
						<td><input type="checkbox" name="checkbox" value="Employment Information retirement portfolio"> Employment Information retirement portfolio</td>
						<td><input type="checkbox" name="checkbox" value="Wire Transfer Instructions"> Wire Transfer Instructions</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="checkbox" value="Medical Information"> Medical Information</td>
						<td><input type="checkbox" name="checkbox" value="Overdraft History"> Overdraft History</td>
						<td><input type="checkbox" name="checkbox" value="Purchase History"> Purchase History</td>
						<td></td>
					</tr>
				</table>
			</div>
		</div>
		<br />

		<div class="content-row">
			<h4>Please select Yes/No or we do not share depending if the
				reason on the left column to share personal information is valid to
				your organization.</h4>
			<table border="0" class="table table-striped" style="text-align: left" summary="This 3-column table provides information about the reasons why Bank of America can share your personal information.">
				<thead>
					<tr>
						<th scope="col">Information</th>
						<th scope="col">Does ${companyName} share?</th>
						<th scope="col">Can you limit this sharing?</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><strong>Does your organization share information for everyday business purposes?</strong>
							&mdash; Such as to process transactions, maintain customers account(s), respond to
							court orders and legal investigations, or report to credit bureaus</td>
						<td class="centered-td">Yes<br /> (Mandatory) </td>
						<td class="centered-td">No<br /> (Mandatory) </td>
					</tr>
					<tr>
						<td><strong>Does your organization share information for marketing purposes </strong>
							&mdash; to such as to offer products and services to customers?</td>
						<td class="centered-td"><select name="question1" id="question1" onchange="changeQ1()">
								<option value="Yes">Yes</option>
								<option value="No">No</option></select></td>
						<td class="centered-td"><select name="question1b" id="question1b" readonly="false">
								<option value="Yes" id="share1">Yes</option>
								<option value="No" id="no1">No</option>
								<option value="No" id="noShare1">We do not share</option></select></td>
					</tr>
					<tr>
						<td><strong> Does your organization share information to do joint marketing with other financial companies?</strong></td>
						<td class="centered-td"><select name="question2" id="question2" onchange="changeQ2()">
								<option value="Yes">Yes</option>
								<option value="No">No</option></select></td>
						<td class="centered-td"><select name="question2b" id="question2b" readonly="false">
								<option value="Yes" id="share2">Yes</option>
								<option value="No" id="no2">No</option>
								<option value="No" id="noShare2">We do not share</option></select></td>
					</tr>
					<tr>
						<td><strong>Does your organization share information with affiliates&rsquo; for everyday business purposes? </strong>
							&mdash; Information about transactions and experiences from customers</td>
						<td class="centered-td"><select name="question3" id="question3" onchange="changeQ3()">
								<option value="Yes">Yes</option>
								<option value="No">No</option></select></td>
						<td class="centered-td"><select name="question3b" id="question3b" readonly="false">
								<option value="Yes" id="share3">Yes</option>
								<option value="No" id="no3">No</option>
								<option value="No" id="noShare3">We do not share</option></select></td>
					</tr>
					<tr>
						<td><strong>Does your organization share information for affiliates&rsquo; everyday business purposes? </strong>
							&mdash; Information such as creditworthiness</td>
						<td class="centered-td"><select id="question4" name="question4" onchange="changeQ4()">
								<option value="Yes">Yes</option>
								<option value="No">No</option></select></td>
						<td class="centered-td"><select id="question4b" name="question4b" readonly="false">
								<option value="Yes" id="share4">Yes</option>
								<option value="No" id="noShare4">We do not share</option></select></td>
					</tr>
					<c:choose>
						<c:when test="${hasAffiliates}">
							<tr>
								<td><strong><span id="optionalQuestion">Will the affiliates market to your customers? </span></strong></td>
								<td class="centered-td"><select id="question5" name="question5" onchange="changeQ5()">
										<option value="Yes">Yes</option>
										<option value="No">No</option></select></td>
								<td class="centered-td"><select id="question5b" name="question5b" readonly="false">
										<option value="Yes" id="share5">Yes</option>
										<option value="No" id="noShare5">We do not share</option></select></td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr style="display: none">
								<td><strong><span id="optionalQuestion">Will the affiliates market to your customers? </span></strong></td>
								<td class="centered-td"><select id="question5" name="question5" onchange="changeQ5()">
										<option value="Yes">Yes</option>
										<option value="No">No</option></select></td>
								<td class="centered-td"><select id="question5b" name="question5b" readonly="false">
										<option value="Yes" id="share5">Yes</option>
										<option value="No" id="noShare5">We do not share</option></select></td>
							</tr>
						</c:otherwise>
					</c:choose>

					<tr>
						<td><strong>For nonaffiliates to market to you</strong></td>
						<td class="centered-td"><select id="question6" name="question6" onchange="changeQ6()">
								<option value="Yes">Yes</option>
								<option value="No">No</option></select></td>
						<td class="centered-td"><select id="question6b" name="question6b" readonly="false">
								<option value="Yes" id="share6">Yes</option>
								<option value="No" id="noShare6">We do not share</option></select></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br />

		<div class="content-row">
			<h4>How many days can you begin sharing new customer's information from the date you sent the notice to the customer?</h4>
			<br />
			<div id="error1" style="display: none">
				<h5 style="color: red;">The number of days need to be larger than 30</h5>
			</div>
			<input type="text" class="form-control" id="numberOfDays" placeholder="No less than 30 days" name="numOfDays">
		</div>
		<br />

		<div class="content-row">
			<h4>What customer service contact information will you provide?</h4>
			<br />
			<div id="error2" style="display: none">
				<h5 style="color: red;">You need to select at least one of the contact method</h5>
			</div>

			<table style="width: 100%">
				<tr>
					<td width="15%"><input name="contactMethod" id="phone1" type="checkbox" value="phone" /> Phone</td>
					<td><input type="text" class="form-control" placeholder="Phone Number" id="phoneText" name="phoneText"></td>
				</tr>
				<tr>
					<td width="15%"><input name="contactMethod" type="checkbox" id="website1" value="website" /> Website</td>
					<td><input type="text" class="form-control" placeholder="Website Address" id="websiteText" name="websiteText"></td>
				</tr>
			</table>
		</div>
		<br />
		<c:if test="${opt_phone}">
			<div class="content-row">
				<table class="table table-striped" style="text-align: left">
					<tr>
						<td class="cpn-heading"><h4>Phone Opt-out</h4></td>
					</tr>
				</table>
				<h4>What's your phone number for opt-out?</h4>
				<div id="errorPhone" style="display: none">
					<h5 style="color: red;">The field could not be empty</h5>
				</div>
				<input type="text" class="form-control" placeholder="Phone number for opt-out" id="phonephone" name="phoneOptOut">
			</div>
			<br />
		</c:if>

		<c:if test="${opt_website}">
			<div class="content-row">
				<table class="table table-striped" style="text-align: left">
					<tr>
						<td class="cpn-heading"><h4>Website Opt-out</h4></td>
					</tr>
				</table>
				<h4>What's your website for opt-out?</h4>
				<div id="errorWebsite" style="display: none">
					<h5 style="color: red;">The field could not be empty</h5>
				</div>
				<input type="text" class="form-control" placeholder="Website for opt-out" id="websitewebsite" name="websiteOptOut">
			</div>
			<br />
		</c:if>

		<c:if test="${opt_cookie}">
			<div class="content-row">
				<table class="table table-striped" style="text-align: left">
					<tr>
						<td class="cpn-heading"><h4>Cookie Opt-out</h4></td>
					</tr>
				</table>
				<h4>What's your link for cookie-based opt-out?</h4>
				<div id="errorCookie" style="display: none">
					<h5 style="color: red;">The field could not be empty</h5>
				</div>
				<input type="text" class="form-control" placeholder="Link for cookie-base opt-out" name="cookieOptOut" id="cookiecookie">
			</div>
			<br />
		</c:if>

		<c:if test="${opt_doNotTrack}">
			<div class="content-row">
				<table class="table table-striped" style="text-align: left">
					<tr>
						<td class="cpn-heading"><h4>Do Not Track Opt-out</h4></td>
					</tr>
				</table>
				<h4>What's your link for Do-Not-Track-based opt-out?</h4>
				<div id="errorTrack" style="display: none">
					<h5 style="color: red;">The field could not be empty</h5>
				</div>
				<input type="text" class="form-control" placeholder="Link for Do-Not-Track-based opt-out" name="doNotTrackOptOut" id="tracktrack">
			</div>
			<br />
		</c:if>

		<br />
		<c:if test="${opt_mail}">
			<div class="content-row" id="mailinForm">
				<table class="table table-striped" style="text-align: left">
					<tr>
						<td class="cpn-heading"><h4>Mail-in Opt-out</h4></td>
					</tr>
				</table>
				<h4>Do you need additional information from customers except for customer's name and address?</h4>
				<input name="additionalInfo" type="checkbox" value="yes" onclick="showdiv1(this)" /> Yes <br />
				<div id="optionalInfo" class="leftpad" style="display: none">
					<h5>Please select the additional information you need:</h5>
					<input type="radio" name="optionsRadios" id="radio1" value="Account Number" checked> Account Number<br /> 
					<input type="radio" name="optionsRadios" id="radio1" value="Opt-out Number"> Opt-out Number<br /> 
					<input type="radio" name="optionsRadios" id="radio1" value="Truncated Account Number"> Truncated Account Number<br />
				</div>
				<br />
				<h4>The mail-in opt-out form should be mailed to:</h4>
				<div id="errorMail" style="display: none">
					<h5 style="color: red;">The field could not be empty</h5>
				</div>
				<table style="width: 100%">
					<tr>
						<td>Street:</td>
						<td>&nbsp;&nbsp;<input name="street" type="text" id="streetstreet"></td>
						<td>City:</td>
						<td>&nbsp;&nbsp;<input name="city" type="text" id="citycity"></td>
					</tr>
					<tr>
						<td>State:</td>
						<td>&nbsp;&nbsp; <select name="state">
								<option value="AL">Alabama</option>
								<option value="AK">Alaska</option>
								<option value="AZ">Arizona</option>
								<option value="AR">Arkansas</option>
								<option value="CA">California</option>
								<option value="CO">Colorado</option>
								<option value="CT">Connecticut</option>
								<option value="DE">Delaware</option>
								<option value="DC">District Of Columbia</option>
								<option value="FL">Florida</option>
								<option value="GA">Georgia</option>
								<option value="HI">Hawaii</option>
								<option value="ID">Idaho</option>
								<option value="IL">Illinois</option>
								<option value="IN">Indiana</option>
								<option value="IA">Iowa</option>
								<option value="KS">Kansas</option>
								<option value="KY">Kentucky</option>
								<option value="LA">Louisiana</option>
								<option value="ME">Maine</option>
								<option value="MD">Maryland</option>
								<option value="MA">Massachusetts</option>
								<option value="MI">Michigan</option>
								<option value="MN">Minnesota</option>
								<option value="MS">Mississippi</option>
								<option value="MO">Missouri</option>
								<option value="MT">Montana</option>
								<option value="NE">Nebraska</option>
								<option value="NV">Nevada</option>
								<option value="NH">New Hampshire</option>
								<option value="NJ">New Jersey</option>
								<option value="NM">New Mexico</option>
								<option value="NY">New York</option>
								<option value="NC">North Carolina</option>
								<option value="ND">North Dakota</option>
								<option value="OH">Ohio</option>
								<option value="OK">Oklahoma</option>
								<option value="OR">Oregon</option>
								<option value="PA">Pennsylvania</option>
								<option value="RI">Rhode Island</option>
								<option value="SC">South Carolina</option>
								<option value="SD">South Dakota</option>
								<option value="TN">Tennessee</option>
								<option value="TX">Texas</option>
								<option value="UT">Utah</option>
								<option value="VT">Vermont</option>
								<option value="VA">Virginia</option>
								<option value="WA">Washington</option>
								<option value="WV">West Virginia</option>
								<option value="WI">Wisconsin</option>
								<option value="WY">Wyoming</option>
						</select>
						</td>
						<td>Zip:</td>
						<td>&nbsp;&nbsp;<input type="text" name="zip" id="zipzip"></td>
					</tr>
				</table>
				<br />

				<h4>Will you provide your joint accountholders the choice to opt out for only one accountholder?</h4>
				<input type="radio" name="optionsRadios1" id="radio1" value="q3Y" onclick="showdiv2(this)">Yes<br /> 
				<input type="radio" name="optionsRadios1" id="radio2" value="q3N" onclick="blockdiv2(this)" checked>No<br />

				<!--<div class="leftpad" id="jointAccount" style="display: none">
					<h5>If you have a joint account, will you apply your choice(s)
						only to yourself?</h5>
					<input type="radio" name="optionsRadios2" id="radio3" value="q3aY">Yes<br />
					<input type="radio" name="optionsRadios2" id="radio4" value="q3aN"
						checked>No<br />
					<h5>Are you a financial institutions that provide insurance
						products or services?</h5>
					<input type="radio" name="optionsRadios3" id="radio5" value="q3bY">Yes<br />
					<input type="radio" name="optionsRadios3" id="radio6" value="q3bN"
						checked>No<br />
				</div>-->
				<br />

				<h4>Do you offer an opt-out for your own marketing?</h4>
				<input type="radio" name="optionsRadios7" id="radio13" value="q5Y" onclick="showdiv4(this)">Yes<br /> 
				<input type="radio" name="optionsRadios7" id="radio14" value="q5N" onclick="blockdiv4(this)" checked>No<br />
				
				<!--<div class="leftpad" id="selectStatement" style="display: none">
					<h5>Please select one of the following two statements:</h5>
					<input type="radio" name="optionsRadios9" id="radio1"
						value="q5a" onclick="showdiv8(this)" checked>Do not share
					my personal information to market to me.<br />
					<div id="choice4" style="display: none">
						<input type="radio" name="optionsRadios8" id="radio15"
							value="q5aY">Yes<br /> <input type="radio"
							name="optionsRadios8" id="radio16" value="q5aN" checked>No<br />
					</div>
					<input type="radio" name="optionsRadios9" id="radio17"
						value="q5b" onclick="showdiv9(this)">Do not use my
					personal information to market to me.<br />
					<div id="choice5" style="display: none">
						<input type="radio" name="optionsRadios10" id="radio18"
							value="q5bY">Yes<br /> <input type="radio"
							name="optionsRadios10" id="radio19" value="q5bN" checked>No<br />
					</div>
				</div>-->
				<br />

				<h4>Do you offer an opt-out for joint marketing?</h4> 
				<input type="radio" name="optionsRadios11" id="radio20" value="q6Y" onclick="showdiv3(this)">Yes<br /> 
				<input type="radio" name="optionsRadios11" id="radio21" value="q6N" onclick="blockdiv3(this)" checked>No<br />
				
				<!--<div class="leftpad" id="jointMarket" style="display: none">
					<h5>Will you share your personal information with other
						financial institutions to jointly market to you?</h5>
					<input type="radio" name="optionsRadios12" id="radio22"
						value="q6aY">Yes<br /> <input type="radio"
						name="optionsRadios12" id="radio23" value="q6aN" checked>No<br />
				</div>-->
				<!--
				<br />
				<h4>Do you want to include a barcode and/or "tagline" at the
					bottom of page one?</h4>
				<br /> <label><input name="opt-out" type="checkbox"
					value="q7Barcode" />&nbsp;&nbsp;Barcode</label><a href="default.asp"><img
					src="image/question.png" class="masterTooltip"
					title="Tooltip on image" alt="" /></a><input name="barcodeFile"
					type="file" id="exampleInputFile"> <br /> <label><input
					name="opt-out" type="checkbox" value="q7Tagline" />&nbsp;&nbsp;Tagline
				</label><a href="default.asp"><img src="image/question.png"
					class="masterTooltip" title="Tooltip on image" alt="" /></a><input
					name="toglineText" type="text">-->
			</div>
		</c:if>
		

		<div class="content-row">
			<%
				Boolean onlyone = true;
				if (session.getAttribute("onlyone") != null) {
					onlyone = (Boolean) session.getAttribute("onlyone");
				}
				if (!onlyone) {
			%>

			<h4>Please list the financial institutions that jointly provide this notice.*</h4>
			<div id="error0" style="display: none">
				<h5 style="color: red;">The field could not be empty</h5>
			</div>

			<div id="div3">
				<p>
					<textarea id="question0" name="question0" class="form-control" rows="4"></textarea>
				</p>
			</div>
			<br />

			<%
				};
			%>
		</div>
		<div class="content-row">
			<h4>
				How do you protect personal information? * <a
					href="http://en.wikipedia.org/wiki/Personal_Information_Protection_and_Electronic_Documents_Act"
					target="_blank"><span class="glyphicon glyphicon-question-sign"></span></a>
			</h4>

			<div id="error1" style="display: none">
				<h5 style="color: red;">The field could not be empty and the number of word is limited to 30</h5>
			</div>
			<p>
				<textarea id="question1" name="question1" class="form-control"
					rows="5" maxlength="100" cols="10"
					placeholder="You may only provide additional information pertaining to your safeguards practices following the designated response to this question. Such information may include information about the use of cookies or other measures you use to safeguard personal information. Limited to a maximum of 30 additional words."></textarea>
			</p>
			<br />



			<div class="content-row">

				<div id="error2" style="display: none">
					<h5 style="color: red;">The field need to be exactly five methods</h5>
				</div>
				<div id="error5" style="display: none">
					<h5 style="color: red;">You need to select 6 options including SSN so only need to select 5 in total besides SSN</h5>
				</div>
				<h4>How do you collect the personal information?* (Exactly five methods)</h4>
				<div id="addssninput" onclick="checkBox()">
					<table>
						<tr>
							<td><input type="checkbox" name="checkbox" value="Open an account"> Open an account</td>
							<td><input type="checkbox" name="checkbox" value="Deposit money"> Deposit money</td>
							<td><input type="checkbox" name="checkbox" value="Make deposits or withdrawals from your account"> Make deposits or withdrawals from your account</td>
							<td><input type="checkbox" name="checkbox" value="Pay your bills"> Pay your bills</td>
						</tr>
						
						<tr>
							<td><input type="checkbox" name="checkbox" value="Apply for a loan"> Apply for a loan</td>
							<td><input type="checkbox" name="checkbox" value="Use your credit or debit card"> Use your credit or debit card</td>
							<td><input type="checkbox" name="checkbox" value="Seek financial or tax advice"> Seek financial or tax advice</td>
							<td><input type="checkbox" name="checkbox" value="Seek advice about your investments"> Seek advice about your investments</td>
						</tr>
						
						<tr>
							<td><input type="checkbox" name="checkbox" value="Apply for insurance"> Apply for insurance</td>
							<td><input type="checkbox" name="checkbox" value="Pay insurance premiums"> Pay insurance premiums</td>
							<td><input type="checkbox" name="checkbox" value="File an insurance claim"> File an insurance claim</td>
							<td><input type="checkbox" name="checkbox" value="Buy securities from us"> Buy securities from us</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="checkbox" value="Sell securities to us"> Sell securities to us</td>
							<td><input type="checkbox" name="checkbox" value="Direct us to buy securities"> Direct us to buy securities</td>
							<td><input type="checkbox" name="checkbox" value="Direct us to sell your securities"> Direct us to sell your securities</td>
							<td><input type="checkbox" name="checkbox" value="Enter into an investment advisory contract"> Enter into an investment advisory contract</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="checkbox" value="Give us your income information"> Give us your income information</td>
							<td><input type="checkbox" name="checkbox" value="Provide employment information"> Provide employment information</td>
							<td><input type="checkbox" name="checkbox" value="Give us your employment history"> Give us your employment history</td>
							<td><input type="checkbox" name="checkbox" value="Tell us about your investment or retirement portfolio"> Tell us about your investment or retirement portfolio</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="checkbox" value="Tell us about your investment or retirement earnings"> Tell us about your investment or retirement earnings</td>
							<td><input type="checkbox" name="checkbox" value="Apply for financing"> Apply for financing</td>
							<td><input type="checkbox" name="checkbox" value="Apply for a lease"> Apply for a lease</td>
							<td><input type="checkbox" name="checkbox" value="Provide account information"> Provide account information</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="checkbox" value="Give us your contact information"> Give us your contact information</td>
							<td><input type="checkbox" name="checkbox" value="Pay us by check"> Pay us by check</td>
							<td><input type="checkbox" name="checkbox" value="Give us your wage statements"> Give us your wage statements</td>
							<td><input type="checkbox" name="checkbox" value="Provide your mortgage information"> Provide your mortgage information</td>
						</tr>

						<tr>
							<td><input type="checkbox" name="checkbox" value="Make a wire transfer"> Make a wire transfer</td>
							<td><input type="checkbox" name="checkbox" value="Tell us who receives the money"> Tell us who receives the money</td>
							<td><input type="checkbox" name="checkbox" value="Tell us where to send the money"> Tell us where to send the money</td>
							<td><input type="checkbox" name="checkbox" value="Show your government-issued ID"> Show your government-issued ID</td>
						</tr>

						<tr>
							<td><input type="checkbox" name="checkbox" value="Show your driver's license"> Show your driver's license</td>
							<td><input type="checkbox" name="checkbox" value="Order a commodity futures or option trade"> Order a commodity futures or option trade</td>
							<td></td>
							<td></td>
						</tr>

					</table>
				</div>
			</div>
		</div>
		<br /> <br />


		<!--<h4>What is the reason you don't allow user to limit all
				sharing? *</h4>
			<p>
				<textarea id="reason" name = "question3" class="form-control" rows="6" maxlength="100" placeholder="Hint: if the state privacy law provisions are described in &quot;Other Important Information&quot;, you must add the sentence: &quot;See below for more on your rights under state law.&quot;"></textarea>
			</p>
			<br />-->
		<h4>Do you collect users' personal information from your affiliates and/or credit bureaus?</h4>
		<div class="radio">
			<label> 
				<input type="radio" name="collect" id="Collect" value="yes" onclick="block(this)" checked> Yes
			</label>
		</div>
		<div class="radio">
			<label> 
				<input type="radio" name="collect" id="Collect" value="no" onclick="show(this)"> No
			</label>
		</div>

		<div class="leftpad" id="collect2div" style="display: none">
			<h5>Do you collect information from other companies?</h5>
			<div class="radio">
				<label> 
					<input type="radio" name="collect2" id="Collect2" value="yes" checked> Yes
				</label>
			</div>
			<div class="radio">
				<label> 
					<input type="radio" name="collect2" id="Collect2" value="no"> No
				</label>
			</div>
		</div>
		<br />

		<h4>Will you refer to state laws for the question "Why can't customers limit all sharing" ?</h4>
		<div class="radio">
			<label> 
				<input type="radio" name="refer" id="StateLaw" value="yes" onclick="showDescription(this)"> Yes
			</label>
		</div>
		<div class="radio">
			<label> 
				<input type="radio" name="refer" id="StateLaw" value="no" onclick="blockDescription(this)" checked> No
			</label>
		</div>
		<div class="leftpad" id="LawDescription" style="display: none">
			<h5>Please describe the state law provisions you will refer to here.</h5>
			<p>
				<textarea id="tld" name="tld" class="form-control" rows="3"></textarea>
			</p>
		</div>
		<br />

		<h4>
			What happens when a customer limit sharing for an account he hold <br />jointly with someone else? *
		</h4>
		<div class="radio">
			<label> 
				<input type="radio" name="radios" id="LimitShare1" value="radio1" checked> "Your choices will apply to everyone on your account."
			</label>
		</div>
		<div class="radio">
			<label> 
				<input type="radio" name="radios" id="LimitShare2" value="radio2"> "Your choices will apply to everyone on your account - unless you tell us otherwise."
			</label>
		</div>
		<br />

		<div class="content-row">
			<%
				Boolean param1 = false;
				if (session.getAttribute("param1") != null) {
					param1 = (Boolean) session.getAttribute("param1");
				}
				if (param1) {
			%>
			<h4>Please list the affiliates you share with below.*</h4>
			<div id="error3" style="display: none">
				<h5 style="color: red;">The field could not be empty</h5>
			</div>
			<div id="div1">
				<label>Financial companies:</label>
				<p>
					<textarea id="t11" name="question5_1" id="question5_1" class="form-control" rows="4"></textarea>
				</p>
				<label>Nonfinancial companies:</label>
				<p>
					<textarea id="t12" name="question5_2" id="question5_2" class="form-control" rows="4"></textarea>
				</p>
				<label>Others:</label>
				<p>
					<textarea id="t13" name="question5_3" id="question5_3" class="form-control" rows="4"></textarea>
				</p>
			</div>
			<br />
			<%
				};
			%>
			<%
				Boolean param2 = false;
				if (session.getAttribute("param2") != null) {
					param2 = (Boolean) session.getAttribute("param2");
				}
				if (param2) {
			%>
		
			<h4>Please list the nonaffiliates you share with below.*</h4>
			<div id="error4" style="display: none">
				<h5 style="color: red;">The field could not be empty</h5>
			</div>
		
			<div id="div2">
				<p>
					<textarea id="t2" name="question6" class="form-control" rows="4"></textarea>
				</p>
			</div>
			<br />
			<%
				};
			%>
			<%
				Boolean param3 = false;
				if (session.getAttribute("param3") != null) {
					param3 = (Boolean) session.getAttribute("param3");
				}
				if (param3) {
			%>
		
			<h4>Please list the joint marketing partners below.*</h4>
			<div id="error5" style="display: none">
				<h5 style="color: red;">The field could not be empty</h5>
			</div>
		
			<div id="div3">
				<p>
					<textarea id="t3" name="question7" class="form-control" rows="4"></textarea>
				</p>
			</div>
			<br />
			<%
				};
			%>
			<h4>
				Do you have other important informations? <a
					href="http://www.privacy.va.gov/docs/plregulations_po_book.pdf"
					target="_blank"><span class="glyphicon glyphicon-question-sign"></span></a>
			</h4>
		
			<p>
				<textarea id="t4" name="question8" class="form-control" id="question8" rows="5"
					placeholder="Hint: This section is optional. Only the following types of information can appear in this box. 
					(1) State and/or international privacy law information; and/or 
					(2) Acknowledgment of receipt form."></textarea>
			</p>
		
			<br />
			<p align="center">
				<button type="submit" class="btn btn-primary btn-primary-lg" name="next2" value="true">Generate Privacy Form</button>
			</p>
		</div>
	</form>
</div>



</div>

		<script>
			function downloadHTML(fileName) {
				var aLink = document.createElement('a');
				var blob = new Blob([ document.documentElement.outerHTML ]);
				var evt = document.createEvent("HTMLEvents");
				evt.initEvent("click", false, false);
				aLink.download = fileName;
				aLink.href = URL.createObjectURL(blob);
				aLink.dispatchEvent(evt);
			}

			function downloadFile(fileName) {
				var aLink = document.createElement('a');
				var blob = new Blob([ '${jsonFile}' ]);
				var evt = document.createEvent("HTMLEvents");
				evt.initEvent("click", false, false);
				aLink.download = fileName;
				aLink.href = URL.createObjectURL(blob);
				aLink.dispatchEvent(evt);
			}
		</script>




		<script>
	function addItemAll(source, target) {
		for (var x = 0; x < source.length; x++) {
			var opt = source.options[x];
			target.options[target.options.length] = new Option(opt.text,
					opt.value, 0, 0);
		}
		for (var x = source.length - 1; x >= 0; x--) {
			source.options[x] = null;
		}
	}
	function delItemAll(source, target) {
		for (var x = 0; x < target.length; x++) {
			var opt = target.options[x];
			source.options[source.options.length] = new Option(opt.text,
					opt.value, 0, 0);
		}
		for (var x = target.length - 1; x >= 0; x--) {
			target.options[x] = null;
		}
	}

	function addItem(source, target) {
		var count = 0;
		for (var x = 0; x < source.length; x++) {
			var opt = source.options[x];
			if (opt.selected) {
				target.options[target.options.length] = new Option(opt.text,
						opt.value, 0, 0);
				source.options[x].value = 0;
				count++;
			}
		}

		for (var y = count; y > 0; y--) {
			for (var z = 0; z < source.length; z++) {
				if (source.options[z].value == 0) {
					source.options[z] = null;
				}
			}
		}
	}

	function delItem(source, target) {
		var count = 0;
		for (var x = target.length - 1; x >= 0; x--) {
			var opt = target.options[x];
			if (opt.selected) {
				source.options[source.options.length] = new Option(opt.text,
						opt.value, 0, 0);
				target.options[x].value = 0;
				count++;
				target.options[x] = null;
			}
		}

		for (var y = count; y > 0; y--) {
			for (var z = 0; z < target.length; z++) {
				if (target.options[z].value == 0) {
					target.options[z] = null;
				}
			}
		}
	}
</script>


<script>
	function validateForm() {
		var text = document.getElementById('name').value;
		var len = text.split(" ");
		if (len == 0) {
			document.getElementById("error").style.display = "block";
			return false;
		} else {
			document.getElementById("error").style.display = "none";
		}

		var sum = 0;
		var checkboxes = document.getElementsByName('opt-out');
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				sum++;
			}
		}
		if (sum < 1) {
			document.getElementById("error1").style.display = "block";
			return false;
		} else {
			document.getElementById("error1").style.display = "none";
		}

		var flag1 = true;

		var sum1 = 0;
		var checkboxes1 = document.getElementsByName('contactMethod');

		var text1 = document.getElementById('datepicker').value;
		var len1 = text1.split(" ");
		if (len1 == 0) {
			document.getElementById("errordate").style.display = "block";
			flag1 = false;
		} else {
			document.getElementById("errordate").style.display = "none";
		}

		for (var j = 0; j < checkboxes1.length; j++) {
			if (checkboxes1[j].checked) {
				sum1++;
			}
		}
		if (sum1 < 1) {
			document.getElementById("error2").style.display = "block";
			flag1 = false;
		} else {
			document.getElementById("error2").style.display = "none";
		}

		var x = document.getElementById('numberOfDays').value;

		if (x < 30) {
			document.getElementById("error1").style.display = "block";
			flag1 = false;
		} else {
			document.getElementById("error1").style.display = "none";
		}

		var sum1 = 0;
		var checkboxes1 = document.getElementsByName('checkbox');

		for (var j = 0; j < checkboxes1.length; j++) {
			if (checkboxes1[j].checked) {
				sum1++;
			}
		}

		if (sum1 != 5) {
			document.getElementById("error5").style.display = "block";
			flag1 = false;

		} else {
			document.getElementById("error5").style.display = "none";
		}
<%boolean ifPhone1 = session.getAttribute("opt_phone") == null
					? false
					: true;%>
	var ifPhone =
<%=ifPhone1%>
	;

		if (ifPhone) {
			var phoneNum = document.getElementById('phonephone').value;

			if (ifPhone && (phoneNum == null || phoneNum == "")) {
				document.getElementById('errorPhone').style.display = "block";
				flag1 = false;

			} else {
				document.getElementById('errorPhone').style.display = "none";
			}

		}
<%boolean ifWebsite1 = session.getAttribute("opt_website") == null
					? false
					: true;%>
	var ifWebsite =
<%=ifWebsite1%>
	;
		if (ifWebsite) {
			var websiteAdd = document.getElementById('websitewebsite').value;

			if (ifWebsite && (websiteAdd == null || websiteAdd == "")) {
				document.getElementById('errorWebsite').style.display = "block";
				flag1 = false;

			} else {
				document.getElementById('errorWebsite').style.display = "none";
			}
		}
<%boolean ifMailin1 = session.getAttribute("opt_mail") == null
					? false
					: true;%>
	var ifMailin =
<%=ifMailin1%>
	;
		if (ifMailin) {
			var mailinStreet = document.getElementById('streetstreet').value;
			var mailinCity = document.getElementById('citycity').value;
			var mailinZip = document.getElementById('zipzip').value;

			if (ifMailin
					&& ((mailinStreet == null || mailinStreet == "")
							|| (mailinCity == null || mailinCity == "") || (mailinZip == null || mailinZip == ""))) {
				document.getElementById('errorMail').style.display = "block";
				flag1 = false;

			} else {
				document.getElementById('errorMail').style.display = "none";
			}
		}
<%boolean ifCookie1 = session.getAttribute("opt_cookie") == null
					? false
					: true;%>
	var ifCookie =
<%=ifCookie1%>
	;

		if (ifCookie) {
			var cookieAdd = document.getElementById('cookiecookie').value;

			if (ifCookie && (cookieAdd == null || cookieAdd == "")) {
				document.getElementById('errorCookie').style.display = "block";
				flag1 = false;

			} else {
				document.getElementById('errorCookie').style.display = "none";
			}

		}
<%boolean ifTrack1 = session.getAttribute("opt_doNotTrack") == null
					? false
					: true;%>
	var ifTrack =
<%=ifTrack1%>
	;

		if (ifTrack) {
			var trackAdd = document.getElementById('tracktrack').value;

			if (ifTrack && (trackAdd == null || trackAdd == "")) {
				document.getElementById('errorTrack').style.display = "block";
				flag1 = false;

			} else {
				document.getElementById('errorTrack').style.display = "none";
			}

		}
		if (flag1) {
			return true;
		} else {
			$("html, body").animate({
				scrollTop : 0
			}, "fast");
			return false;
		}

		var flag2 = true;
		var text2 = document.getElementById('question1').value;
		var len2 = text2.split(" ");
		if (text2.length == 0 || len2 > 30) {
			flag2 = false;
			document.getElementById("error1").style.display = "block";
		} else {
			document.getElementById("error1").style.display = "none";
		}
		var sum = document.all.mylocs.length;
		if (sum != 5) {
			flag2 = false;
			document.getElementById("error2").style.display = "block";
		} else {
			document.getElementById("error2").style.display = "none";

			for (var x = 0; x < (document.all.mylocs).length; x++) {
				document.all.mylocs.options[x].selected = true;

			}
		}
<%if (!onlyone) {%>
	var q0 = document.getElementById('question0').value.length;
		if (q0 == 0) {
			flag2 = false;
			document.getElementById("error0").style.display = "block";
		} else {
			document.getElementById("error0").style.display = "none";
		}
<%}%>
	
<%if (param1) {%>
	var q11 = document.getElementById('t11').value.length;
		var q12 = document.getElementById('t12').value.length;
		var q13 = document.getElementById('t13').value.length;
		if ((q11 == 0) & (q12 == 0) & (q13 == 0)) {
			flag2 = false;
			document.getElementById("error3").style.display = "block";
		} else {
			document.getElementById("error3").style.display = "none";
		}
<%}%>
	
<%if (param2) {%>
	var q2 = document.getElementById('t2').value.length;
		if (q2 == 0) {
			flag2 = false;
			document.getElementById("error4").style.display = "block";
		} else {
			document.getElementById("error4").style.display = "none";
		}
<%}%>
	
<%if (param3) {%>
	var q3 = document.getElementById('t3').value.length;
		if (q3 == 0) {
			flag2 = false;
			document.getElementById("error5").style.display = "block";
		} else {
			document.getElementById("error5").style.display = "none";
		}
<%}%>
	return flag2;
	}
</script>



<script src="js/jquery.loadJSON.js"></script>
<script>
	$(document)
			.ready(
					function() {
<%Boolean uploadFile = false;
			String json = "";
			if (session.getAttribute("jsonFile") != null) {
				json = "'" + (String) session.getAttribute("jsonFile") + "'";
				uploadFile = true;
			}
			if (uploadFile) {%>
	var form1 = jQuery.parseJSON(
<%=json%>
	);
						$('form').loadJSON(form1);
						if (form1.additionalInfo) {
							document.getElementById("optionalInfo").style.display = "block";
						}
						if (form1.websiteText == "undefined") {
							document.getElementById("websiteText").value = "";
						}
						if (form1.phoneText == "undefined") {
							document.getElementById("phoneText").value = "";
						}
						for (var i = 0; i < 3; i++) {
							var j = i + 1;
							if (form1.share[i] == "Yes") {
								document.getElementById("question" + j).value = "Yes";
								if (form1.limit[i] == "Yes") {
									document.getElementById("question" + j
											+ "b").options.selectedIndex = 0;
								} else {
									document.getElementById("question" + j
											+ "b").options.selectedIndex = 1;
								}
							} else {
								document.getElementById("question" + j).value = "No";
								document.getElementById("question" + j + "b").options.selectedIndex = 2;
							}
						}

						for (var i = 3; i < form1.share.length; i++) {
							var j = i + 1;
							if (form1.share[i] == "Yes") {
								document.getElementById("question" + j).value = "Yes";
								document.getElementById("question" + j + "b").options.selectedIndex = 0;
							} else {
								document.getElementById("question" + j).value = "No";
								document.getElementById("question" + j + "b").options.selectedIndex = 1;
							}
						}

						if (form1.collect == "no") {
							document.getElementById("collect2div").style.display = "block";
						}

						if (form1.refer == "no") {
							document.getElementById("LawDescription").style.display = "block";
						}

						addItem(document.all.locs, document.all.mylocs);

						if (form1.question5_1 == "undefined") {
							document.getElementById("question5_1").value = "";
						}
						if (form1.question5_2 == "undefined") {
							document.getElementById("question5_2").value = "";
						}
						if (form1.question5_3 == "undefined") {
							document.getElementById("question5_3").value = "";
						}
						if (form1.question8 == "undefined") {
							document.getElementById("question8").value = "";
						}
<%}%>
	});
</script>
<script type="text/javascript">
	function checkBox() {

		var sum1 = 0;
		var checkboxes1 = document.getElementsByName('checkbox');

		for (var j = 0; j < checkboxes1.length; j++) {
			if (checkboxes1[j].checked) {
				sum1++;
			}
		}

		if (sum1 > 5) {
			document.getElementById("error5").style.display = "block";
			flag = false;

		} else {
			document.getElementById("error5").style.display = "none";
		}

	}
</script>

<script type="text/javascript">
	changeQ1();
	changeQ2();
	changeQ3();
	changeQ4();
	changeQ5();
	changeQ6();
	mailinFormShow();
</script>


<script>
	function showDescription(ch) {
		if (ch.checked) {
			document.getElementById("LawDescription").style.display = "block";
		} else {
			document.getElementById("LawDescription").style.display = "none";
		}
	}
	function blockDescription(ch) {
		if (ch.checked) {
			document.getElementById("LawDescription").style.display = "none";
		} else {
			document.getElementById("LawDescription").style.display = "block";
		}
	}
</script>
<script>
	function show(ch) {
		if (ch.checked) {
			document.getElementById("collect2div").style.display = "block";
		} else {
			document.getElementById("collect2div").style.display = "none";
		}
	}
	function block(ch) {
		if (ch.checked) {
			document.getElementById("collect2div").style.display = "none";
		} else {
			document.getElementById("collect2div").style.display = "block";
		}
	}
</script>

    <div align="center">
        <h4>Download File</h4>
        <button onclick="downloadHTML('notice.html')">Download HTML File</button>
        <button onclick="downloadFile('notice.json')">Download JSON File</button>
    </div>

		<div class="footer">
			<p>Team 7 Ionia</p>
		</div>
	</div>
</body>
</html>
