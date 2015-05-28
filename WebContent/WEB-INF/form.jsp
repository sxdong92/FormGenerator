<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="notice.Notice"%>
<%@page import="java.util.HashSet"%>
<%@page import="java.util.ArrayList"%>
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


<%
	Notice n = (Notice) session.getAttribute("notice");
	boolean exist = false;
	if(n != null) exist = true;
%>
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
				<input type="text" class="form-control" id=institutionName name="institutionName" data-validation="length" data-validation-length="min4" 
				<% if(exist && n.institutionName != null && !n.institutionName.equals("")) { %> value="<%=n.institutionName%>" <% } %>>
			</p>
			<br />

			<h4>What opt out communication methods will you offer? (At least one) *</h4>
			<div id="error-opt-out" style="display: none">
				<h5 style="color: red;">You must select at least one opt-out method.</h5>
			</div>
			<table style="width: 100%">
				<tr>
					<td width="15%"><input type="checkbox" name="opt-out" value="1" onclick="showPhone(this)" <% if(exist && n.optByPhone) { %>checked<% } %>> Phone</td>
					<td width="15%"><input type="checkbox" name="opt-out" value="2" onclick="showWebsite(this)" <% if(exist && n.optByWebsite) { %>checked<% } %>> Website</td>
					<td width="15%"><input type="checkbox" name="opt-out" value="3" onclick="showMail(this)" <% if(exist && n.optByMail) { %>checked<% } %>> Mail-in</td>
				</tr>
			</table>
			<br />
			
			<h4>Please input the revision date that will appear in the privacy form.</h4>
			<div id="errordate" style="display: none">
				<h5 style="color: red;">The revision date cannot be empty.</h5>
			</div>
				<input class="form-control" type="text" id="startDate" placeholder="Example : October 2012" name="startDate" 
				<% if(exist && n.lastRevDate != null && !n.lastRevDate.equals("")) { %> value="<%=n.lastRevDate%>" <% } %>>
			<br />
			
			<h4>Please select Yes if any of the following statements is true: *</h4>
			<ul>
				<li>Your organization does not have affiliates</li>
				<li>Your affiliates(if you have any) do not use personal information in a manner that requires an opt-out</li>
				<li>Your organization provides the affiliate marketing notice separately.</li>
			</ul>
			<table style="width: 40%">
				<tr>
					<td><input type="radio" name="hasAffiliates" id="radioAffYes" value="share" checked onclick="showAff(this)"> Yes</td>
					<td><input type="radio" name="hasAffiliates" id="radioAffNo" value="notshare" onclick="blockAff(this)"> No</td>
				</tr>
			</table>
			<br />
		</div>

		<div class="content-row">
			<div id="error-info-checkboxes" style="display: none">
				<h5 style="color: red;">You need to select 6 options including SSN so only need to select 5 in total besides SSN</h5>
			</div>
			<h4>Please select the types of personal information you collect and share depend on the product or service customers have with you.</h4>
			<p>Besides SSN, select only 5 more information types</p>
			<%
				HashSet<String> map = new HashSet<String>();
				ArrayList<String> personal = new ArrayList<String>();
				if(n != null) personal = n.PersonalInfoTypes;
				for(String s : personal) {
					map.add(s);
				}
			%>
			<div id="addinput">
				<table>
					<tr>
						<td><input type="checkbox" name="infoCheck" value="Income" <% if(exist && map.contains("Income")) { %>checked<% } %>> Income</td>
						<td><input type="checkbox" name="infoCheck" value="Account Balances" <% if(exist && map.contains("Account Balances")) { %>checked<% } %>> Account Balances</td>
						<td><input type="checkbox" name="infoCheck" value="Payment History" <% if(exist && map.contains("Payment History")) { %>checked<% } %>> Payment History</td>
						<td><input type="checkbox" name="infoCheck" value="Transaction History" <% if(exist && map.contains("Transaction History")) { %>checked<% } %>> Transaction History</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="infoCheck" value="Transaction or Loss History" <% if(exist && map.contains("Transaction or Loss History")) { %>checked<% } %>> Transaction or Loss History</td>
						<td><input type="checkbox" name="infoCheck" value="Credit History" <% if(exist && map.contains("Credit History")) { %>checked<% } %>> Credit History</td>
						<td><input type="checkbox" name="infoCheck" value="Credit Scores" <% if(exist && map.contains("Credit Scores")) { %>checked<% } %>> Credit Scores</td>
						<td><input type="checkbox" name="infoCheck" value="Assets" <% if(exist && map.contains("Assets")) { %>checked<% } %>> Assets</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="infoCheck" value="Investment Experience" <% if(exist && map.contains("Investment Experience")) { %>checked<% } %>> Investment Experience</td>
						<td><input type="checkbox" name="infoCheck" value="Credit Based Insurance Scores" <% if(exist && map.contains("Credit Based Insurance Scores")) { %>checked<% } %>> Credit Based Insurance Scores</td>
						<td><input type="checkbox" name="infoCheck" value="Insurance Claim History" <% if(exist && map.contains("Insurance Claim History")) { %>checked<% } %>> Insurance Claim History</td>
						<td><input type="checkbox" name="infoCheck" value="Account Transactions" <% if(exist && map.contains("Account Transactions")) { %>checked<% } %>> Account Transactions</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="infoCheck" value="Risk Tolerance" <% if(exist && map.contains("Risk Tolerance")) { %>checked<% } %>> Risk Tolerance</td>
						<td><input type="checkbox" name="infoCheck" value="Medical Related Debts" <% if(exist && map.contains("Medical Related Debts")) { %>checked<% } %>> Medical Related Debts</td>
						<td><input type="checkbox" name="infoCheck" value="Credit Card or other debt" <% if(exist && map.contains("Credit Card or other debt")) { %>checked<% } %>> Credit Card or other debt</td>
						<td><input type="checkbox" name="infoCheck" value="Mortgage Rates and Payments" <% if(exist && map.contains("Mortgage Rates and Payments")) { %>checked<% } %>> Mortgage Rates and Payments</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="infoCheck" value="Retirement Assets" <% if(exist && map.contains("Retirement Assets")) { %>checked<% } %>> Retirement Assets</td>
						<td><input type="checkbox" name="infoCheck" value="Checking account information" <% if(exist && map.contains("Checking account information")) { %>checked<% } %>> Checking account information</td>
						<td><input type="checkbox" name="infoCheck" value="Employment Information retirement portfolio" <% if(exist && map.contains("Employment Information retirement portfolio")) { %>checked<% } %>> Employment Information retirement portfolio</td>
						<td><input type="checkbox" name="infoCheck" value="Wire Transfer Instructions" <% if(exist && map.contains("Wire Transfer Instructions")) { %>checked<% } %>> Wire Transfer Instructions</td>
					</tr>
					<tr>
						<td><input type="checkbox" name="infoCheck" value="Medical Information" <% if(exist && map.contains("Medical Information")) { %>checked<% } %>> Medical Information</td>
						<td><input type="checkbox" name="infoCheck" value="Overdraft History" <% if(exist && map.contains("Overdraft History")) { %>checked<% } %>> Overdraft History</td>
						<td><input type="checkbox" name="infoCheck" value="Purchase History" <% if(exist && map.contains("Purchase History")) { %>checked<% } %>> Purchase History</td>
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
								<option value="No" id="no1">No</option></select></td>
					</tr>
					<tr>
						<td><strong> Does your organization share information to do joint marketing with other financial companies?</strong></td>
						<td class="centered-td"><select name="question2" id="question2" onchange="changeQ2()">
								<option value="Yes">Yes</option>
								<option value="No">No</option></select></td>
						<td class="centered-td"><select name="question2b" id="question2b" readonly="false">
								<option value="Yes" id="share2">Yes</option>
								<option value="No" id="no2">No</option></select></td>
					</tr>
					<tr>
						<td><strong>Does your organization share information with affiliates&rsquo; for everyday business purposes? </strong>
							&mdash; Information about transactions and experiences from customers</td>
						<td class="centered-td"><select name="question3" id="question3" onchange="changeQ3()">
								<option value="Yes">Yes</option>
								<option value="No">No</option></select></td>
						<td class="centered-td"><select name="question3b" id="question3b" readonly="false">
								<option value="Yes" id="share3">Yes</option>
								<option value="No" id="no3">No</option></select></td>
					</tr>
					<tr>
						<td><strong>Does your organization share information for affiliates&rsquo; everyday business purposes? </strong>
							&mdash; Information such as creditworthiness</td>
						<td class="centered-td"><select id="question4" name="question4" onchange="changeQ4()">
								<option value="Yes">Yes</option>
								<option value="No">No</option></select></td>
						<td class="centered-td"><select id="question4b" name="question4b" readonly="false">
								<option value="Yes" id="share4">Yes</option>
								<option value="No" id="no4">No</option></select></td>
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
										<option value="No" id="no5">No</option></select></td>
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
										<option value="No" id="no5">No</option></select></td>
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
								<option value="No" id="no6">No</option></select></td>
					</tr>
				</tbody>
			</table>
		</div>
		<br />

		<div class="content-row">
			<h4>How many days can you begin sharing new customer's information from the date you sent the notice to the customer?</h4>
			<br />
			<div id="error-days" style="display: none">
				<h5 style="color: red;">The number of days need to be larger than 30</h5>
			</div>
			<input type="text" class="form-control" id="sharelimitDays" placeholder="No less than 30 days" name="sharelimitDays"
			<% if(exist) { %> value="<%=n.sharelimitDays%>" <% } %>>
		</div>
		<br />
		
		
		<!-- Opt Methods -->
		<div class="content-row" id="phoneArea" <% if(exist && n.optByPhone) { %>style="display: block"<% } else {%>style="display: none"<% } %>>
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
				<input type="text" class="form-control" placeholder="Phone number for opt-out" id="phonephone" name="phonephone"
				<% if(exist && n.optPhone != null && !n.optPhone.equals("")) { %> value="<%=n.optPhone%>" <% } %>>
			</div>
		</div>
		<br />
		

		<div class="content-row" id="websiteArea" <% if(exist && n.optByWebsite) { %>style="display: block"<% } else {%>style="display: none"<% } %>>
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
				<input type="text" class="form-control" placeholder="Website for opt-out" id="websitewebsite" name="websitewebsite"
				<% if(exist && n.optWebsite != null && !n.optWebsite.equals("")) { %> value="<%=n.optWebsite%>" <% } %>>
			</div>
			<br />
		</div>
		<br />
		
		<div class="content-row" id="mailArea" <% if(exist && n.optByMail) { %>style="display: block"<% } else {%>style="display: none"<% } %>>
			<div class="content-row" id="mailinForm">
				<table class="table table-striped" style="text-align: left">
					<tr>
						<td class="cpn-heading"><h4>Mail-in Opt-out</h4></td>
					</tr>
				</table>
				<!--  
				<h4>Do you need additional information from customers except for customer's name and address?</h4>
				<input name="additionalInfo" type="checkbox" value="yes" onclick="showdiv1(this)" /> Yes <br />
				<div id="optionalInfo" class="leftpad" style="display: none">
					<h5>Please select the additional information you need:</h5>
					<input type="radio" name="optionsRadios" id="radio1" value="Account Number" checked> Account Number<br /> 
					<input type="radio" name="optionsRadios" id="radio1" value="Opt-out Number"> Opt-out Number<br /> 
					<input type="radio" name="optionsRadios" id="radio1" value="Truncated Account Number"> Truncated Account Number<br />
				</div>
				<br />
				-->
				<h4>The mail-in opt-out form should be mailed to:</h4>
				<div id="errorMail" style="display: none">
					<h5 style="color: red;">The field could not be empty</h5>
				</div>
				<table style="width: 100%">
					<tr>
						<td>Street:</td>
						<td>&nbsp;&nbsp;<input name="address" type="text" id="address"
						<% if(exist && n.Address != null && !n.Address.equals("")) { %> value="<%=n.Address%>" <% } %>></td>
						<td>City:</td>
						<td>&nbsp;&nbsp;<input name="city" type="text" id="city" 
						<% if(exist && n.city != null && !n.city.equals("")) { %> value="<%=n.city%>" <% } %>></td>
					</tr>
					<tr>
						<td>State:</td>
						<td>&nbsp;&nbsp; <select name="state">
								<option value="AL" <% if(exist && n.state.equals("AL")) { %>selected<% } %>>Alabama</option>
								<option value="AK" <% if(exist && n.state.equals("AK")) { %>selected<% } %>>Alaska</option>
								<option value="AZ" <% if(exist && n.state.equals("AZ")) { %>selected<% } %>>Arizona</option>
								<option value="AR" <% if(exist && n.state.equals("AR")) { %>selected<% } %>>Arkansas</option>
								<option value="CA" <% if(exist && n.state.equals("CA")) { %>selected<% } %>>California</option>
								<option value="CO" <% if(exist && n.state.equals("CO")) { %>selected<% } %>>Colorado</option>
								<option value="CT" <% if(exist && n.state.equals("CT")) { %>selected<% } %>>Connecticut</option>
								<option value="DE" <% if(exist && n.state.equals("DE")) { %>selected<% } %>>Delaware</option>
								<option value="DC" <% if(exist && n.state.equals("DC")) { %>selected<% } %>>District Of Columbia</option>
								<option value="FL" <% if(exist && n.state.equals("FL")) { %>selected<% } %>>Florida</option>
								<option value="GA" <% if(exist && n.state.equals("GA")) { %>selected<% } %>>Georgia</option>
								<option value="HI" <% if(exist && n.state.equals("HI")) { %>selected<% } %>>Hawaii</option>
								<option value="ID" <% if(exist && n.state.equals("ID")) { %>selected<% } %>>Idaho</option>
								<option value="IL" <% if(exist && n.state.equals("IL")) { %>selected<% } %>>Illinois</option>
								<option value="IN" <% if(exist && n.state.equals("IN")) { %>selected<% } %>>Indiana</option>
								<option value="IA" <% if(exist && n.state.equals("IA")) { %>selected<% } %>>Iowa</option>
								<option value="KS" <% if(exist && n.state.equals("KS")) { %>selected<% } %>>Kansas</option>
								<option value="KY" <% if(exist && n.state.equals("KY")) { %>selected<% } %>>Kentucky</option>
								<option value="LA" <% if(exist && n.state.equals("LA")) { %>selected<% } %>>Louisiana</option>
								<option value="ME" <% if(exist && n.state.equals("ME")) { %>selected<% } %>>Maine</option>
								<option value="MD" <% if(exist && n.state.equals("MD")) { %>selected<% } %>>Maryland</option>
								<option value="MA" <% if(exist && n.state.equals("MA")) { %>selected<% } %>>Massachusetts</option>
								<option value="MI" <% if(exist && n.state.equals("MI")) { %>selected<% } %>>Michigan</option>
								<option value="MN" <% if(exist && n.state.equals("MN")) { %>selected<% } %>>Minnesota</option>
								<option value="MS" <% if(exist && n.state.equals("MS")) { %>selected<% } %>>Mississippi</option>
								<option value="MO" <% if(exist && n.state.equals("MO")) { %>selected<% } %>>Missouri</option>
								<option value="MT" <% if(exist && n.state.equals("MT")) { %>selected<% } %>>Montana</option>
								<option value="NE" <% if(exist && n.state.equals("NE")) { %>selected<% } %>>Nebraska</option>
								<option value="NV" <% if(exist && n.state.equals("NV")) { %>selected<% } %>>Nevada</option>
								<option value="NH" <% if(exist && n.state.equals("NH")) { %>selected<% } %>>New Hampshire</option>
								<option value="NJ" <% if(exist && n.state.equals("NJ")) { %>selected<% } %>>New Jersey</option>
								<option value="NM" <% if(exist && n.state.equals("NM")) { %>selected<% } %>>New Mexico</option>
								<option value="NY" <% if(exist && n.state.equals("NY")) { %>selected<% } %>>New York</option>
								<option value="NC" <% if(exist && n.state.equals("NC")) { %>selected<% } %>>North Carolina</option>
								<option value="ND" <% if(exist && n.state.equals("ND")) { %>selected<% } %>>North Dakota</option>
								<option value="OH" <% if(exist && n.state.equals("OH")) { %>selected<% } %>>Ohio</option>
								<option value="OK" <% if(exist && n.state.equals("OK")) { %>selected<% } %>>Oklahoma</option>
								<option value="OR" <% if(exist && n.state.equals("OR")) { %>selected<% } %>>Oregon</option>
								<option value="PA" <% if(exist && n.state.equals("PA")) { %>selected<% } %>>Pennsylvania</option>
								<option value="RI" <% if(exist && n.state.equals("RI")) { %>selected<% } %>>Rhode Island</option>
								<option value="SC" <% if(exist && n.state.equals("SC")) { %>selected<% } %>>South Carolina</option>
								<option value="SD" <% if(exist && n.state.equals("SD")) { %>selected<% } %>>South Dakota</option>
								<option value="TN" <% if(exist && n.state.equals("TN")) { %>selected<% } %>>Tennessee</option>
								<option value="TX" <% if(exist && n.state.equals("TX")) { %>selected<% } %>>Texas</option>
								<option value="UT" <% if(exist && n.state.equals("UT")) { %>selected<% } %>>Utah</option>
								<option value="VT" <% if(exist && n.state.equals("VT")) { %>selected<% } %>>Vermont</option>
								<option value="VA" <% if(exist && n.state.equals("VA")) { %>selected<% } %>>Virginia</option>
								<option value="WA" <% if(exist && n.state.equals("WA")) { %>selected<% } %>>Washington</option>
								<option value="WV" <% if(exist && n.state.equals("WV")) { %>selected<% } %>>West Virginia</option>
								<option value="WI" <% if(exist && n.state.equals("WI")) { %>selected<% } %>>Wisconsin</option>
								<option value="WY" <% if(exist && n.state.equals("WY")) { %>selected<% } %>>Wyoming</option>
						</select>
						</td>
						<td>Zip:</td>
						<td>&nbsp;&nbsp;<input type="text" name="zipcode" id="zipcode"
						<% if(exist && n.zipcode != null && !n.zipcode.equals("")) { %> value="<%=n.zipcode%>" <% } %>></td>
					</tr>
				</table>
			</div>
		</div>
		<br />

		<!-- Contact Methods -->
		<div class="content-row">
			<h4>What customer service contact information will you provide?</h4>
			<br />
			<div id="error-contact" style="display: none">
				<h5 style="color: red;">You need to select at least one of the contact method</h5>
			</div>
			<table style="width: 100%">
				<tr>
					<td width="15%"><input name="contacts" id="contactByPhone" type="checkbox" value="phone" <% if(exist && n.contactByPhone) { %>checked<% } %>/> Phone</td>
					<td><input type="text" class="form-control" placeholder="Phone Number" id="contactPhone" name="contactPhone"
					<% if(exist && n.contactPhone != null && !n.contactPhone.equals("")) { %> value="<%=n.contactPhone%>" <% } %>></td>
				</tr>
				<tr>
					<td width="15%"><input name="contacts" id="contactByWebsite" type="checkbox" value="website" <% if(exist && n.contactByWebsite) { %>checked<% } %>/> Website</td>
					<td><input type="text" class="form-control" placeholder="Website Address" id="contactWebsite" name="contactWebsite"
					<% if(exist && n.contactWebsite != null && !n.contactWebsite.equals("")) { %> value="<%=n.contactWebsite%>" <% } %>></td>
				</tr>
			</table>
		</div>
		<br />
		
		
		
		<!-- PAGE TWO -->
		<div class="content-row">
			<h4>
				How do you protect personal information? * 
				<a href="http://en.wikipedia.org/wiki/Personal_Information_Protection_and_Electronic_Documents_Act"
					target="_blank"><span class="glyphicon glyphicon-question-sign"></span></a>
			</h4>
			<div id="error-protect" style="display: none">
				<h5 style="color: red;">The field could not be empty and the number of word is limited to 30</h5>
			</div>
			<p>
				<textarea id="protectWay" name="protectWays" class="form-control" rows="5" maxlength="100" cols="10"
					placeholder="You may only provide additional information pertaining to your safeguards practices 
					following the designated response to this question. Such information may include information about the use of 
					cookies or other measures you use to safeguard personal information. Limited to a maximum of 
					30 additional words."><% if(exist && n.protectWay != null && !n.protectWay.equals("")) { %><%=n.protectWay%><% } %></textarea>
			</p>
			<br />

			<%
				HashSet<String> collectMap = new HashSet<String>();
				ArrayList<String> collects = new ArrayList<String>();
				if(n != null) collects = n.collectWays;
				for(String s : collects) {
					collectMap.add(s);
				}
			%>
			<div class="content-row">
				<div id="error2" style="display: none">
					<h5 style="color: red;">The field need to be exactly five methods</h5>
				</div>
				<div id="error-collect" style="display: none">
					<h5 style="color: red;">You need to select 6 options including SSN so only need to select 5 in total besides SSN</h5>
				</div>
				<h4>How do you collect the personal information?* (Exactly five methods)</h4>
				<div id="collectWays" onclick="checkBox()">
					<table>
						<tr>
							<td><input type="checkbox" name="collectWays" value="Open an account" <% if(exist && collectMap.contains("Open an account")) { %>checked<% } %>> Open an account</td>
							<td><input type="checkbox" name="collectWays" value="Deposit money" <% if(exist && collectMap.contains("Deposit money")) { %>checked<% } %>> Deposit money</td>
							<td><input type="checkbox" name="collectWays" value="Make deposits or withdrawals from your account" <% if(exist && collectMap.contains("Make deposits or withdrawals from your account")) { %>checked<% } %>> Make deposits or withdrawals from your account</td>
							<td><input type="checkbox" name="collectWays" value="Pay your bills" <% if(exist && collectMap.contains("Pay your bills")) { %>checked<% } %>> Pay your bills</td>
						</tr>
						
						<tr>
							<td><input type="checkbox" name="collectWays" value="Apply for a loan" <% if(exist && collectMap.contains("Apply for a loan")) { %>checked<% } %>> Apply for a loan</td>
							<td><input type="checkbox" name="collectWays" value="Use your credit or debit card" <% if(exist && collectMap.contains("Use your credit or debit card")) { %>checked<% } %>> Use your credit or debit card</td>
							<td><input type="checkbox" name="collectWays" value="Seek financial or tax advice" <% if(exist && collectMap.contains("Seek financial or tax advice")) { %>checked<% } %>> Seek financial or tax advice</td>
							<td><input type="checkbox" name="collectWays" value="Seek advice about your investments" <% if(exist && collectMap.contains("Seek advice about your investments")) { %>checked<% } %>> Seek advice about your investments</td>
						</tr>
						
						<tr>
							<td><input type="checkbox" name="collectWays" value="Apply for insurance" <% if(exist && collectMap.contains("Apply for insurance")) { %>checked<% } %>> Apply for insurance</td>
							<td><input type="checkbox" name="collectWays" value="Pay insurance premiums" <% if(exist && collectMap.contains("Pay insurance premiums")) { %>checked<% } %>> Pay insurance premiums</td>
							<td><input type="checkbox" name="collectWays" value="File an insurance claim" <% if(exist && collectMap.contains("File an insurance claim")) { %>checked<% } %>> File an insurance claim</td>
							<td><input type="checkbox" name="collectWays" value="Buy securities from us" <% if(exist && collectMap.contains("Buy securities from us")) { %>checked<% } %>> Buy securities from us</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="collectWays" value="Sell securities to us" <% if(exist && collectMap.contains("Sell securities to us")) { %>checked<% } %>> Sell securities to us</td>
							<td><input type="checkbox" name="collectWays" value="Direct us to buy securities" <% if(exist && collectMap.contains("Direct us to buy securities")) { %>checked<% } %>> Direct us to buy securities</td>
							<td><input type="checkbox" name="collectWays" value="Direct us to sell your securities" <% if(exist && collectMap.contains("Direct us to sell your securities")) { %>checked<% } %>> Direct us to sell your securities</td>
							<td><input type="checkbox" name="collectWays" value="Enter into an investment advisory contract" <% if(exist && collectMap.contains("Enter into an investment advisory contract")) { %>checked<% } %>> Enter into an investment advisory contract</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="collectWays" value="Give us your income information" <% if(exist && collectMap.contains("Give us your income information")) { %>checked<% } %>> Give us your income information</td>
							<td><input type="checkbox" name="collectWays" value="Provide employment information" <% if(exist && collectMap.contains("Provide employment information")) { %>checked<% } %>> Provide employment information</td>
							<td><input type="checkbox" name="collectWays" value="Give us your employment history" <% if(exist && collectMap.contains("Give us your employment history")) { %>checked<% } %>> Give us your employment history</td>
							<td><input type="checkbox" name="collectWays" value="Tell us about your investment or retirement portfolio" <% if(exist && collectMap.contains("Tell us about your investment or retirement portfolio")) { %>checked<% } %>> Tell us about your investment or retirement portfolio</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="collectWays" value="Tell us about your investment or retirement earnings" <% if(exist && collectMap.contains("Tell us about your investment or retirement earnings")) { %>checked<% } %>> Tell us about your investment or retirement earnings</td>
							<td><input type="checkbox" name="collectWays" value="Apply for financing" <% if(exist && collectMap.contains("Apply for financing")) { %>checked<% } %>> Apply for financing</td>
							<td><input type="checkbox" name="collectWays" value="Apply for a lease" <% if(exist && collectMap.contains("Apply for a lease")) { %>checked<% } %>> Apply for a lease</td>
							<td><input type="checkbox" name="collectWays" value="Provide account information" <% if(exist && collectMap.contains("Provide account information")) { %>checked<% } %>> Provide account information</td>
						</tr>
						<tr>
							<td><input type="checkbox" name="collectWays" value="Give us your contact information" <% if(exist && collectMap.contains("Give us your contact information")) { %>checked<% } %>> Give us your contact information</td>
							<td><input type="checkbox" name="collectWays" value="Pay us by check" <% if(exist && collectMap.contains("Pay us by check")) { %>checked<% } %>> Pay us by check</td>
							<td><input type="checkbox" name="collectWays" value="Give us your wage statements" <% if(exist && collectMap.contains("Give us your wage statements")) { %>checked<% } %>> Give us your wage statements</td>
							<td><input type="checkbox" name="collectWays" value="Provide your mortgage information" <% if(exist && collectMap.contains("Provide your mortgage information")) { %>checked<% } %>> Provide your mortgage information</td>
						</tr>

						<tr>
							<td><input type="checkbox" name="collectWays" value="Make a wire transfer" <% if(exist && collectMap.contains("Make a wire transfer")) { %>checked<% } %>> Make a wire transfer</td>
							<td><input type="checkbox" name="collectWays" value="Tell us who receives the money" <% if(exist && collectMap.contains("Tell us who receives the money")) { %>checked<% } %>> Tell us who receives the money</td>
							<td><input type="checkbox" name="collectWays" value="Tell us where to send the money" <% if(exist && collectMap.contains("Tell us where to send the money")) { %>checked<% } %>> Tell us where to send the money</td>
							<td><input type="checkbox" name="collectWays" value="Show your government-issued ID" <% if(exist && collectMap.contains("Show your government-issued ID")) { %>checked<% } %>> Show your government-issued ID</td>
						</tr>

						<tr>
							<td><input type="checkbox" name="collectWays" value="Show your driver's license" <% if(exist && collectMap.contains("Show your driver's license")) { %>checked<% } %>> Show your driver's license</td>
							<td><input type="checkbox" name="collectWays" value="Order a commodity futures or option trade" <% if(exist && collectMap.contains("Order a commodity futures or option trade")) { %>checked<% } %>> Order a commodity futures or option trade</td>
							<td></td>
							<td></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<br /> <br />
		
		<h4>Do you collect users' personal information from other companies?</h4>
		<div class="radio">
			<label> 
				<input type="radio" name="collectFromCompanies" id="collectFromCompanies" value="yes" checked> Yes
			</label>
		</div>
		<div class="radio">
			<label> 
				<input type="radio" name="collectFromCompanies" id="collectFromCompanies" value="no"> No
			</label>
		</div>

		<div class="leftpad" id="collect2div" style="display: none">
			<h5>Do you collect users' information from others?</h5>
			<div class="radio">
				<label> 
					<input type="radio" name="collectFromOthers" id="collectFromOthers" value="yes" checked> Yes
				</label>
			</div>
			<div class="radio">
				<label> 
					<input type="radio" name="collectFromOthers" id="collectFromOthers" value="no"> No
				</label>
			</div>
		</div>
		<br />

		<h4>Will you refer to state laws for the question "Why can't customers limit all sharing" ?</h4>
		<div class="radio">
			<label> 
				<input type="radio" name="provideLaw" id="provideLaw" value="yes" onclick="showDescription(this)"> Yes
			</label>
		</div>
		<div class="radio">
			<label> 
				<input type="radio" name="provideLaw" id="notProvideLaw" value="no" onclick="blockDescription(this)" checked> No
			</label>
		</div>
		<div class="leftpad" id="LawDescription" style="display: none">
			<h5>Please describe the state law provisions you will refer to here.</h5>
			<div id="error-law" style="display: none">
				<h5 style="color: red;">This field should not be empty.</h5>
			</div>
			<p>
				<textarea id="law" name="law" class="form-control" rows="3"><% if(exist && n.law != null && !n.law.equals("")) { %><%=n.law%><% } %></textarea>
			</p>
		</div>
		<br />

		<h4>
			What happens when a customer limit sharing for an account he hold <br />jointly with someone else? *
		</h4>
		<div class="radio">
			<label> 
				<input type="radio" name="applyToEveryone" id="applyToEveryone" value="yes" checked> "Your choices will apply to everyone on your account."
			</label>
		</div>
		<div class="radio">
			<label> 
				<input type="radio" name="applyToEveryone" id="applyToEveryone" value="no"> "Your choices will apply to everyone on your account - unless you tell us otherwise."
			</label>
		</div>
		<br />

		<div class="content-row" id="aboutAff">
			<h4>Please list the affiliates you share with below.*</h4>
			<div id="errorAffs" style="display: none">
				<h5 style="color: red;">The field could not be empty</h5>
			</div>
			<div id="div1">
				<label>Financial companies:</label>
				<p>
					<textarea id="affiliates" name="affiliates" id="affiliates" class="form-control" rows="4"><% if(exist && n.affiliates != null && !n.affiliates.equals("")) { %><%=n.affiliates%><% } %></textarea>
				</p>
				<label>Nonfinancial companies:</label>
				<p>
					<textarea id="nonaffiliates" name="nonaffiliates" id="nonaffiliates" class="form-control" rows="4"><% if(exist && n.nonaffiliates != null && !n.nonaffiliates.equals("")) { %><%=n.nonaffiliates%><% } %></textarea>
				</p>
				<label>Joint marketing:</label>
				<p>
					<textarea id="jointMarketing" name="jointMarketing" id="jointMarketing" class="form-control" rows="4"><% if(exist && n.jointMarketing != null && !n.jointMarketing.equals("")) { %><%=n.jointMarketing%><% } %></textarea>
				</p>
			</div>
			<br />
		</div>
		
		<div class="content-row">
			<h4>
				Do you have other important informations? 
				<a href="http://www.privacy.va.gov/docs/plregulations_po_book.pdf"
					target="_blank"><span class="glyphicon glyphicon-question-sign"></span></a>
			</h4>
		
			<p>
				<textarea id="t4" name="otherInfo" class="form-control" id="otherInfo" rows="5"
					placeholder="Hint: This section is optional. Only the following types of information can appear in this box. 
					(1) State and/or international privacy law information; and/or 
					(2) Acknowledgment of receipt form."><% if(exist && n.otherInfo != null && !n.otherInfo.equals("")) { %><%=n.otherInfo%><% } %></textarea>
			</p>
		
			<br />
			<p align="center">
				<button type="submit" class="btn btn-primary btn-primary-lg" name="next2" value="true">Generate Form</button>
			</p>
		</div>
	</form>
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
	
	function blockAff(ch) {
		if (ch.checked) {
			document.getElementById("aboutAff").style.display = "none";
		} else {
			document.getElementById("aboutAff").style.display = "block";
		}
	}
</script>

<script>
	function showPhone(ch) {
		if (ch.checked) {
			document.getElementById("phoneArea").style.display = "block";
		} else {
			document.getElementById("phoneArea").style.display = "none";
		}
	}
	function showWebsite(ch) {
		if (ch.checked) {
			document.getElementById("websiteArea").style.display = "block";
		} else {
			document.getElementById("websiteArea").style.display = "none";
		}
	}
	function showMail(ch) {
		if (ch.checked) {
			document.getElementById("mailArea").style.display = "block";
		} else {
			document.getElementById("mailArea").style.display = "none";
		}
	}
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
	function validateForm() {
		var sum = 0;
		var checkboxes = document.getElementsByName('opt-out');
		for (var i = 0; i < checkboxes.length; i++) {
			if (checkboxes[i].checked) {
				sum++;
			}
		}
		if (sum < 1) {
			document.getElementById("error-opt-out").style.display = "block";
			return false;
		} else {
			document.getElementById("error-opt-out").style.display = "none";
		}
		
		// validate opt methods detail
		if(checkboxes[0].checked) {
			var phonephone = document.getElementById("phonephone").value;
			if(phonephone == null || phonephone == "") {
				document.getElementById("errorPhone").style.display = "block";
				return false;
			}
			else {
				document.getElementById("errorPhone").style.display = "none";
			}
		}
		
		if(checkboxes[1].checked) {
			var phonephone = document.getElementById("websitewebsite").value;
			if(phonephone == null || phonephone == "") {
				document.getElementById("errorWebsite").style.display = "block";
				return false;
			}
			else {
				document.getElementById("errorPhone").style.display = "none";
			}
		}
		
		if(checkboxes[2].checked) {
			var address = document.getElementById("address").value;
			var city = document.getElementById("city").value;
			var zipcode = document.getElementById("zipcode").value;
			if(address == null || address == "" || city == null || city == "" || zipcode == null || zipcode == "") {
				document.getElementById("errorMail").style.display = "block";
				return false;
			}
			else {
				document.getElementById("errorMail").style.display = "none";
			}
		}
		
		
		var date =  document.getElementById("startDate").value;
		if(date == null || date == "") {
			document.getElementById("errordate").style.display = "block";
			return false;
		}
		else {
			document.getElementById("errordate").style.display = "none";
		}
		
		
		var sum2 = 0;
		var checkboxes2 = document.getElementsByName('infoCheck');
		for (var i = 0; i < checkboxes2.length; i++) {
			if (checkboxes2[i].checked) {
				sum2++;
			}
		}
		if (sum2 != 5) {
			document.getElementById("error-info-checkboxes").style.display = "block";
			return false;
		} else {
			document.getElementById("error-info-checkboxes").style.display = "none";
		}
		
		var days = document.getElementById('sharelimitDays').value;
		if (days < 30) {
			document.getElementById("error-days").style.display = "block";
			return false;
		} else {
			document.getElementById("error-days").style.display = "none";
		}
		
		
		var contactMethods = document.getElementsByName('contacts');
		var sumContact = 0;
		for(var i=0; i<contactMethods.length; i++) {
			if(contactMethods[i].checked) sumContact++;
		}
		var phoneMethod = document.getElementById("contactByPhone");
		var websiteMethod = document.getElementById("contactByWebsite");
		var phoneContent = document.getElementById("contactPhone").value;
		var websiteContent = document.getElementById("contactWebsite").value;
		if(sumContact < 1) {
			document.getElementById("error-contact").style.display = "block";
			return false;
		} else if(phoneMethod.checked && phoneContent == "") {
			document.getElementById("error-contact").style.display = "block";
			return false;
		} else if(websiteMethod.checked && websiteContent == "") {
			document.getElementById("error-contact").style.display = "block";
			return false;
		} else {
			document.getElementById("error-contact").style.display = "none";
		}
		
		
		var protectContent = document.getElementById('protectWay').value;
		var protectContentLen = protectContent.split(" ");
		if (protectContent.length == 0 || protectContentLen > 30) {
			document.getElementById("error-protect").style.display = "block";
			return false;
		} else {
			document.getElementById("error-protect").style.display = "none";
		}
		
		
		var sum3 = 0;
		var checkboxes3 = document.getElementsByName('collectWays');
		for (var i = 0; i < checkboxes3.length; i++) {
			if (checkboxes3[i].checked) {
				sum3++;
			}
		}
		if (sum3 != 5) {
			document.getElementById("error-collect").style.display = "block";
			return false;
		} else {
			document.getElementById("error-collect").style.display = "none";
		}
		
		
		var law = document.getElementById("provideLaw");
		if(law.checked) {
			var lawContent = document.getElementById("law").value;
			if(lawContent == null || lawContent == "") {
				document.getElementById("error-law").style.display = "block";
				return false;
			}
			else {
				document.getElementById("error-law").style.display = "none";
			}
		}
		
		var financial = document.getElementById("affiliates").value;
		var nonfinancial = document.getElementById("nonaffiliates").value;
		var joint = document.getElementById("jointMarketing").value;
		if(financial == null || financial == "" || nonfinancial == null || nonfinancial == "" || joint == null || joint == "") {
			document.getElementById("errorAffs").style.display = "block";
			return false;
		}
		else {
			document.getElementById("errorAffs").style.display = "none";
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
