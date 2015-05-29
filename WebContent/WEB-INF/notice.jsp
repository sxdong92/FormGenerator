<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>FormGenerator - Team 7 - Ionia</title>
<style>
body {
  font-family: "Arial", Helvetica, sans-serif
}

table {
  width: 100%;
  border-collapse: collapse;
}

table, td, th
{
  border-top: 1px solid #80B2CC;
  border-bottom: 1px solid #80B2CC;
}

th {
  background-color: #006699;
  color: white;
  padding: 5px;
}

td {
  padding: 5px 10px;
}

h3 {
  width: 100%;
  background-color: #006699;
  color: white;
  padding: 5px;
}

.content-section {
  width: 70%;
  margin-left: 15%;
  padding-top: 10px;
  padding-bottom: 10px;
}

.content-row {
  width: 100%;
}

.cpn-heading {
  width: 20%;
  padding: 5px;
  background-color: #006699;
  color: white;
  vertical-align: center;
}

.cpn-heading-white {
  width: 20%;
  padding: 5px;
  vertical-align: center;
  border-right: 1px solid #80B2CC;
  font-weight: bold;
}

.cpn-details {
  width: 75%;
  padding: 5px 15px;
}

.cpn-header {
  width: 70%;
  color: #006699;
  text-align: center;
  margin-left: 15%;
}

.centered-td {
  text-align: center;
  border-left: 1px solid #80B2CC;
}

.bottom-border {
  border-bottom: 1px solid #80B2CC;
}
</style>
</head>
<%@page import = "notice.Notice" %>
<%
	Notice n = (Notice) session.getAttribute("notice");
%>

<body>
  <div class="table-module">
    <div>
      <h2 class="cpn-header">U.S. Consumer Privacy Notice</h2>
      <div class="content-section">
        <div class="content-row">
          <table>
            <tr>
              <td class="cpn-heading">FACTS</td>
              <td class="cpn-details">
                <p>
                  WHAT DOES <b><%=n.institutionName%></b> DO WITH YOUR PERSONAL INFORMATION? 
                </p>
              </td>
            </tr>
          </table>
        </div>
        <div class="content-row">
          <table>
            <tr>
              <td class="cpn-heading">Why?</td>
              <td class="cpn-details">
                <p>Financial companies choose how they share your personal
                  information. Under federal law, that means personally
                  identifiable information. Federal law gives consumers the right
                  to limit some but not all sharing. Federal law also requires us
                  to tell you how we collect, share, and protect your personal
                  information. Please read this notice carefully to understand
                  what we do.</p>
              </td>
            </tr>
          </table>
        </div>
        <div class="content-row">
          <table>
            <tr>
              <td class="cpn-heading">What?</td>
              <td class="cpn-details">
                <p>The types of personal information we collect and share
                  depend on the product or service you have with us.</p>
                <p>This information can include:</p>
                <ul>
                <% 
                	for(int i=0; i<n.PersonalInfoTypes.size(); i++) {
                %>
                  <li>
                  	<b><%= n.PersonalInfoTypes.get(i) %></b>
                  </li>
                <% 
                	}
                %>
                </ul>
              </td>
            </tr>
          </table>
        </div>
        <div class="content-row">
          <table>
            <tr>
              <td class="cpn-heading">How?</td>
              <td class="cpn-details">
                <p>All financial companies need to share customers&rsquo;
                  personal information to run their everyday business. In the
                  section below, we list the reasons financial companies can
                  share their customers&rsquo; personal information; the reasons
                  <b><%=n.institutionName%></b> chooses to share; and whether you can limit
                  this sharing.</p>
              </td>
            </tr>
          </table>
        </div>
      </div>

      <div class="content-section ">
        <table border="0"
          summary="This 3-column table provides information about the reasons why this institution can share your personal information.">
          <thead>
            <tr>
              <th scope="col">Reasons we can share your personal
                information</th>
              <th scope="col">Does <b><%=n.institutionName%></b> share?</th>
              <th scope="col">Can you limit this sharing?</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>For our everyday business purposes </strong>&mdash;
                such as to process your transactions, maintain your account(s),
                respond to court orders and legal investigations, or report to
                credit bureaus</td>
              <td class="centered-td">Yes</td>
              <td class="centered-td">No</td>
            </tr>
            <tr>
              <td><strong>For our marketing purposes </strong>&mdash; with
                service providers we use to offer our products and services to
                you (please see below to limit the ways we contact you)</td>
              <td class="centered-td"><% if(n.isShared[1]) { %>Yes<% } else { %>No<% } %></td>
              <td class="centered-td">
              <% if(!n.isShared[1]) { %>We do not share<% } else { if(n.isLimited[1]) { %>Yes<% } else { %>No<% }} %>
              </td>
            </tr>
            <tr>
              <td><strong>For joint marketing with other
                  financial companies</strong></td>
              <td class="centered-td"><% if(n.isShared[2]) { %>Yes<% } else { %>No<% } %></td>
              <td class="centered-td"> <% if(!n.isShared[2]) { %>We do not share<% } else { if(n.isLimited[2]) { %>Yes<% } else { %>No<% }} %></td>
            </tr>
            <tr>
              <td><strong>For our affiliates&rsquo; everyday
                  business purposes </strong>&mdash; Information about your transactions
                and experiences</td>
              <td class="centered-td"><% if(n.isShared[3]) { %>Yes<% } else { %>No<% } %></td>
              <td class="centered-td"> <% if(!n.isShared[3]) { %>We do not share<% } else { if(n.isLimited[3]) { %>Yes<% } else { %>No<% }} %></td>
            </tr>
            <tr>
              <td><strong>For our affiliates&rsquo; everyday
                  business purposes </strong>&mdash; Information about your
                creditworthiness</td>
              <td class="centered-td"><% if(n.isShared[4]) { %>Yes<% } else { %>No<% } %></td>
              <td class="centered-td"> <% if(!n.isShared[4]) { %>We do not share<% } else { if(n.isLimited[4]) { %>Yes<% } else { %>No<% }} %></td>
            </tr>
            <tr>
              <td><strong>For nonaffiliates to market to you </strong>&mdash;
                for all credit card accounts</td>
              <td class="centered-td"><% if(n.isShared[5]) { %>Yes<% } else { %>No<% } %></td>
              <td class="centered-td"> <% if(!n.isShared[5]) { %>We do not share<% } else { if(n.isLimited[5]) { %>Yes<% } else { %>No<% }} %></td>
            </tr>
            <tr>
              <td><strong>For nonaffiliates to market to you </strong>&mdash;
                for accounts and services endorsed by another organization
                (e.g., debit card co-branded with a baseball team)
                &ldquo;Sponsored Accounts&rdquo;</td>
              <td class="centered-td"><% if(n.isShared[6]) { %>Yes<% } else { %>No<% } %></td>
              <td class="centered-td"> <% if(!n.isShared[6]) { %>We do not share<% } else { if(n.isLimited[6]) { %>Yes<% } else { %>No<% }} %></td>
            </tr>
          </tbody>
        </table>
      </div>

      <div class="content-section">
        <div class="content-row">
          <table>
            <tr>
              <td class="cpn-heading">To limit our sharing</td>
              <td class="cpn-details">
                <ul>
                <%
                	if(n.optByPhone) {
                %>
                	<li><%=n.optPhone %> - our menu will prompt you through your choices</li>
                <%
                	}
                %>
                <%
                	if(n.optByWebsite) {
                %>
                	<li>Visit us online: <a title="privacy_overview" name="privacy_overview_1" href="/privacy/overview.go" target="_self"><%=n.optWebsite %></a>
                  </li>
                <%
                	}
                %>
                <%
                	if(n.optByMail) {
                %>
                	<li>Mail the form below</li>
                <%
                	}
                %>
                </ul>
                <p class="ptop-5">
                  <strong>Please note:</strong><br/>If you are a new customer,
                  we can begin sharing your information <%=n.sharelimitDays %> days from the date we
                  sent this notice. When you are no longer our customer, we
                  continue to share your information as described in this notice.
                  However, you can contact us at any time to limit our sharing.
                </p>
              </td>
            </tr>
          </table>
        </div>
        <div class="content-row">
          <table>
            <tr>
              <td class="cpn-heading">Questions?</td>
              <td class="cpn-details">
                <p>
                <%
                	if(n.contactByPhone) {
                %>
                	Call <%=n.contactPhone %> 
                <%
                	}
                
                	if(n.contactByPhone && n.contactByWebsite) {
                %>
                	or 
                <%
                	}
                %>
                <%
                	if(n.contactByWebsite) {
                %>
                	go to <a title="privacy_overview" name="privacy_overview_3" href="/privacy/overview.go" target="_self"><%=n.contactWebsite %></a>
                <%
                	}
                %>
                </p>
              </td>
            </tr>
          </table>
        </div>
      </div>
      
      <!--  -->
      <%
      	if(n.optByMail) {
      %>
      <div class="content-section">
                <div class="content-row">
                    <h3>
                        Mail-in Form
                    </h3>
                    <table>
                        <tr>
                            <td class="mailin-heading">
                                <p>
                                    <strong>Leave Blank OR</strong></br>
		      						&mdash;[If you have a joint account,</br>
		     						your choice(s) will apply to everyone</br> 
		     						on your account unless you mark below</br>
		      						<b>Apply my choice only to me</b>]
                                </p>
                            </td>
                            <td class="mailin-details">
                                <p class="padding-5px">
                                    Mark any/all you want to limit:
                                </p>
                                <p class="padding-5px">
                                    [ ] Do not share information about my creditworthiness with your affiliates
                                    for their everyday business purposes.
                                </p>
                                <p class="padding-5px">
                                    [ ] Do not share my personal information with nonaffiliates to market
                                    their products and services to me.
                                </p>
                                <table>
                                    <tr>
                                        <td class="mail-addr-heading" width="80px">
                                            Name
                                        </td>
                                        <td class="mail-addr-details" width="300px">
                                        </td>
                                        <td class="mail-addr-mailto" rowspan="5">
                                            <p>
                                                <strong>
                                                    Mail To:
                                                </strong>
                                            </p>
                                            <p>
                                                <%=n.Address %>
                                                <br/>
                                                <%=n.city %>
                                                <br/>
                                                <%=n.state %>
                                                <br/>
                                                <%=n.zipcode %>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="mail-addr-heading" rowspan="3" width="80px">
                                            Address
                                        </td>
                                        <td class="mail-addr-details"  width="300px">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="mail-addr-details">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="mail-addr-details">
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="mail-addr-heading" width="80px">
                                            Account #
                                        </td>
                                        <td class="mail-addr-details"  width="300px">
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
      <%
      	}
      %>
    </div>

    <div class="content-section">
      <h3>Who we are</h3>
      <div class="content-row">
        <table>
          <tr>
            <td class="cpn-heading-white">Who is providing this notice?</td>
            <td class="cpn-details">
              <p>
                <b><%=n.institutionName%></b>
              </p>
            </td>
          </tr>
        </table>
      </div>
    </div>

    <div class="content-section">
      <h3>What we do</h3>
      <div class="content-row">
        <table>
          <tr>
            <td class="cpn-heading-white">How does <b><%=n.institutionName%></b> protect my
              personal information?</td>
            <td class="cpn-details">
              <p>
                To protect your personal information from unauthorized access and
                use, we use security measures that comply with federal law. These
                measures include computer safeguards and secured files and
                buildings. </br>
                <%=n.protectWay %>
              </p>
            </td>
          </tr>
        </table>
      </div>
      <div class="content-row">
        <table>
          <tr>
            <td class="cpn-heading-white">How does <b><%=n.institutionName%></b> collect my personal information?</td>
            <td class="cpn-details">
              <p>
                We collect your personal information, for example, when you:
                <ul>
                <% 
                	for(int i=0; i<n.collectWays.size(); i++) {
                %>
                  <li>
                  	<b><%=n.collectWays.get(i)%></b>
                  </li>
                <% 
                	}
                %>
                </ul>
                </br>
                <% if(n.collectFromCompanies) { %> We also collect your personal information from other companies.</br> <% } %>
                <% if(n.collectFromOthers) { %> We also collect your personal information from others, such as credit bureaus, affiliates, or other companies.</br> <% } %>
              </p>
              <p>
                We also collect your personal information from others, such as credit bureaus, affiliates, or other companies.
              </p>
            </td>
          </tr>
        </table>
      </div>
      <div class="content-row">
        <table>
          <tr>
            <td class="cpn-heading-white">Why can't I limit all sharing?</td>
            <td class="cpn-details">
              <p>
                Federal law gives you the right to limit some but not all sharing related to:
                <ul>
                  <li>affiliates' everyday business purposes-information about your creditworthiness</li>
                  <li>affiliates from using your information to market to you</li>
                  <li>nonaffiliates to market to you</li>
                </ul>
              </p>
              <p>
                State laws and individual <b><%=n.institutionName%></b> companies may give you more rights to limit sharing. See Other important information section for your rights under state law.
              </p>
            </td>
          </tr>
        </table>
      </div>
      <div class="content-row">
        <table>
          <tr>
            <td class="cpn-heading-white">What happens when I limit sharing for an account I hold jointly with someone else?</td>
            <td class="cpn-details">
            	<% 
            		if(n.applyToEveryone) { 
            	%> 
            	<p>
                	Your choices will apply to everyone on your account.
              	</p>
            	<% 
            		} 
            		else {
            	%>
              	<p>
                	Your choices will apply to everyone on your account - unless you tell us otherwise.
              	</p>
               	<% 
            		} 
            	%>
            </td>
          </tr>
        </table>
      </div>
    </div>

    <div class="content-section">
      <h3>Definitions</h3>
      <div class="content-row">
        <table>
          <tr>
            <td class="cpn-heading-white">Affiliates</td>
            <td class="cpn-details">
              <p>
                Companies related by common ownership or control. They can be Financial and nonfinancial companies.
Our affiliates include companies that utilize the names <b><%=n.institutionName%></b>; <b><%=n.institutionName%></b>; U.S. Trust; LandSafe or Merrill Lynch, financial companies such as General Fidelity Life Insurance Company.
              </p>
              <ul>
                <li>
                  <%=n.affiliates%>
                </li>
              </ul>
            </td>
          </tr>
        </table>
      </div>
      <div class="content-row">
        <table>
          <tr>
            <td class="cpn-heading-white">Nonaffiliates</td>
            <td class="cpn-details">
              <p>
                Companies not related by common ownership or control. They can be Financial and nonfinancial companies.
              <ul>
                <li>
                  <%=n.nonaffiliates%>
                </li>
              </ul>
            </p>
            </td>
          </tr>
        </table>
      </div>
      <div class="content-row">
        <table>
          <tr>
            <td class="cpn-heading-white">Joint Marketing</td>
            <td class="cpn-details">
              <p>
                A formal agreement between nonaffiliated financial companies that together market financial products or services to you.
              <ul>
                <li>
                  <%=n.jointMarketing %>
                </li>
              </ul>
            </p>
            </td>
          </tr>
        </table>
      </div>
    </div>

    <div class="content-section">
      <h3>Other important information</h3>
      <div class="content-row bottom-border">
        <p>
          <%=n.otherInfo %>
        </p>
      </div>
    </div>

    <div class="content-section">
      <p>Rev. <%=n.lastRevDate %></p>
    </div>
  </div>
  
        <script>
            function downloadHTML(fileName) {
                var aLink = document.createElement('a');
                
                d = document.getElementById('removepart');
                var backup = d.outerHTML;
                d.outerHTML = "";
                var blob = new Blob([ document.documentElement.outerHTML ]);
                var evt = document.createEvent("HTMLEvents");
                evt.initEvent("click", false, false);
                aLink.download = fileName;
                aLink.href = URL.createObjectURL(blob);
                aLink.dispatchEvent(evt);
                window.location.reload(true);
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
  
  
    <div id='removepart' align="center">
        <h4>Download File</h4>
        <button onclick="downloadHTML('notice.html')">Download HTML File</button>
        <button onclick="downloadFile('notice.json')">Download JSON File</button>
    </div>
</body>
</html>