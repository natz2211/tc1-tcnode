<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.winformula.Constants" %>
<%@ page import="com.topcoder.web.winformula.model.ContestProperty" %>
<%@ page import="com.topcoder.web.winformula.model.PrizeType" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Winformula Developer Challenge :: Powered by TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>

</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="../tcTop.jsp"/>
            <jsp:include page="../topNav.jsp">
                <jsp:param name="node" value="contests"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<div class="linkBox"><a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests">back to
    Contests</a></div>


<c:if test="${contest.id>0}">
    <div class="breadcrumb">
        <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=ViewContests">Contests</a>
        &gt;
        ${contest.name}
        <c:if test="${not empty contest.submissions}">
            &gt;
            <a href="${sessionInfo.servletPath}?module=ViewSubmissions&amp;<%=Constants.CONTEST_ID%>=${contest.id}">submissions</a>
        </c:if>
    </div>
</c:if>


<h1>Edit Contest Details</h1>


<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="editForm">
<tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditContest"/>
<tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

<div class="header">Contest Details</div>

<table cellpadding="0" cellspacing="0" class="input">
<tbody>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.CONTEST_NAME%>">
            <span class="bigRed">${err}<br/></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name">
        Contest Name:
    </td>
    <td class="value" width="100%">
        <tc-webtag:textInput name="<%=Constants.CONTEST_NAME%>"/>
    </td>
</tr>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.CONTEST_STATUS_ID%>"> <span class="bigRed">${err}
            <br/></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name">
        Status:
    </td>
    <td class="value">
        <tc-webtag:objectSelect name="<%=Constants.CONTEST_STATUS_ID%>" list="${contestStatuses}" valueField="id"
                                textField="description"/>
    </td>
</tr>
<tr>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.START_TIME%>"><span class="bigRed">${err}
            <br/></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name" nowrap="nowrap">
        Contest Start<br/>(Eastern Time):
    </td>
    <td class="value">
        <tc-webtag:textInput name="<%=Constants.START_TIME%>" id="<%=Constants.START_TIME%>"/>
        <button id="trigger<%=Constants.START_TIME%>">Set</button>
    </td>
</tr>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.END_TIME%>"><span class="bigRed">${err}
            <br/></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name" nowrap="nowrap">
        Contest End<br/>(Eastern Time):
    </td>
    <td class="value">
        <tc-webtag:textInput name="<%=Constants.END_TIME%>" id="<%=Constants.END_TIME%>"/>
        <button id="trigger<%=Constants.END_TIME%>">Set</button>
    </td>
</tr>
<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.FORUM_ID%>"><span class="bigRed">${err}
            <br/></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name">
        Forum:
    </td>
    <td class="value">
        <tc-webtag:rscSelect name="<%=Constants.FORUM_ID%>"
                             list="<%=(ResultSetContainer)request.getAttribute("forums")%>" fieldText="name"
                             fieldValue="forum_id" selectedValue="${contest.forumId}"/>
    </td>
</tr>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="<%=Constants.EVENT_ID%>"><span class="bigRed">${err}</span>
            <br/></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name">
        Event:
    </td>
    <td class="value">
        <tc-webtag:objectSelect name="<%=Constants.EVENT_ID%>" list="${events}" valueField="id" textField="description"/>
    </td>
</tr>

<c:set value="<%=Constants.PROJECT_ID_KEY%>" var="projectId"/>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="${projectId}"><span class="bigRed">${err}</span>
            <br /></tc-webtag:errorIterator>
    </td>
</tr>

<tr>
    <td class="name">
        Project:
    </td>
    <td class="value">
        <tc-webtag:rscSelect name="${projectId}"
                             list="<%=(ResultSetContainer)request.getAttribute("projects")%>" fieldText="project_name"
                             fieldValue="project_id"/>
    </td>
</tr>


<c:set value="<%=Constants.FILE_TYPE%>" var="fileType"/>

<tr>
    <td colspan="2">
        <tc-webtag:errorIterator id="err" name="${fileType}"><span class="bigRed">${err}
            <br/></span></tc-webtag:errorIterator>
    </td>
</tr>
<tr>
    <td class="name">
        Allowed Submission File Types:
    </td>
    <td class="value">
        <tc-webtag:objectSelect name='${fileType}' size="4" useTopValue="false" multiple="true" list="${fileTypes}"
                                valueField="id" textField="description"/>
    </td>
</tr>


<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.MIN_HEIGHT%>" var="minHeight"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.MAX_HEIGHT%>" var="maxHeight"/>
<tr>
    <td colspan="2">
        <div style="padding: 10px 0px 10px 0px;">
            <strong>Size Requirements:</strong> Leave blank for no requirements. Enter the same value for the min and
            max to require an exact size. If you allow non-image file submissions
            (pdf, txt, html)
            they will not be held to these requirements.
        </div>
    </td>
</tr>
<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${minHeight}">${err}
                    <br/></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${maxHeight}">${err}
                    <br/></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="name">
        Height Requirements (px):
    </td>
    <td class="value">
        <tc-webtag:textInput name="${minHeight}" size="4"/>
        to
        <tc-webtag:textInput name="${maxHeight}" size="4"/>
    </td>
</tr>

<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.MIN_WIDTH%>" var="minWidth"/>
<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.MAX_WIDTH%>" var="maxWidth"/>

<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${minWidth}">${err}
                    <br/></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${maxWidth}">${err}
                    <br/></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="name">
        Width Requirements (px):
    </td>
    <td class="value">
        <tc-webtag:textInput name="${minWidth}" size="4"/>
        to
        <tc-webtag:textInput name="${maxWidth}" size="4"/>
    </td>
</tr>


<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.VIEWABLE_SUBMISSIONS%>" var="viewSubmissions"/>

<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${viewSubmissions}">${err}
                    <br/></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="name">
        Are submissions viewable?:
    </td>
    <td class="value">
        <tc-webtag:listSelect name="${viewSubmissions}" useTopValue="false" list="${viewSubmissionAnswers}"/>
    </td>
</tr>


<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.VIEWABLE_SUBMITTERS%>" var="viewSubmitters"/>

<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${viewSubmitters}">${err}
                    <br/></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="name">
        Are submitter user names viewable?:
    </td>
    <td class="value">
        <tc-webtag:listSelect name="${viewSubmitters}" useTopValue="false" list="${viewSubmitterAnswers}"/>
    </td>
</tr>


<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.MAX_SUBMISSIONS%>" var="maxSubmissions"/>

<tr>
    <td colspan="2">
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${maxSubmissions}">${err}
                    <br/></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr>
    <td class="name">
        Max # of submissions (leave empty if there should be no max):
    </td>
    <td class="value">
        <tc-webtag:textInput name="${maxSubmissions}" size="4"/>
    </td>
</tr>


</tbody>
</table>


<script language="javascript" type="text/javascript">
    Calendar.setup(
    {
        inputField  : "<%=Constants.START_TIME%>",         // ID of the input field
        ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
        button      : "trigger<%=Constants.START_TIME%>",       // ID of the button
        showsTime   : true,
        singleClick  : false,
        cache       : true
    }
            );
    Calendar.setup(
    {
        inputField  : "<%=Constants.END_TIME%>",         // ID of the input field
        ifFormat    : "<%=Constants.JS_DATE_FORMAT%>",    // the date format
        button      : "trigger<%=Constants.END_TIME%>",      // ID of the button
        showsTime    : true,
        singleClick  : false,
        cache       : true
    }
            );
</script>


<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.CONTEST_OVERVIEW_TEXT%>" var="overviewText"/>

<p>
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${overviewText}">${err}
                    <br/></tc-webtag:errorIterator></span>
    <strong>Contest Overview:</strong> You may include HTML, the content entered here is exactly what will be inserted
    into the contest
    details page.<br/><br/>
    <tc-webtag:textArea name="${overviewText}" rows="8" cols="80"/>
</p>


<script language="javascript" type="text/javascript">
    <!--
var defaultOverview= "General description of the contest goes here. Give background info, overview about what the client " +
"is seeking, and general look and feel info.\n\n" +
"Entries must be your original work, and must not infringe on the copyright or licenses of others. Stock art, clip art, " +
"templates and other design elements from other sources are prohibited unless specifically permitted in the " +
"Specification Document."
var overviewText = getValue("document.editForm", "${overviewText}");
                       if ( overviewText==null || overviewText.length==0) {
                         putValue("document.editForm", "${overviewText}", defaultOverview);
                        }
                -->
</script>

<c:set value="<%=Constants.CONTEST_PROPERTY+ContestProperty.PRIZE_DESCRIPTION%>" var="prizeDesc"/>

<p>
                <span class="bigRed"><tc-webtag:errorIterator id="err" name="${prizeDesc}">${err}
                    <br/></tc-webtag:errorIterator></span>
    <strong>Prize Description:</strong> You may include HTML, the content entered here is exactly what will be inserted
    into the contest
    details page.
    <br/><br/>
    <tc-webtag:textArea name="${prizeDesc}" rows="8" cols="80"/>
</p>

<script language="javascript" type="text/javascript">
    <!--
var defaultPrizeDesc= "TopCoder Winformula will compensate the member with the first place submission, as selected "+
"by the client.  The payment will be distributed in one full installment once the final vector-based version of " +
"the winning submission has been received by TopCoder Winformula.";
var prizeDesc = getValue("document.editForm", "${prizeDesc}");
                       if ( prizeDesc==null || prizeDesc.length==0) {
                         putValue("document.editForm", "${prizeDesc}", defaultPrizeDesc);
                        }
                -->
</script>

<p>
    <button name="submit" value="submit" type="submit">Save</button>
</p>


</form>


<c:if test="${contest!=null && contest.id>0}">
    <p>
        Click
        <a href="http://<%=ApplicationServer.WINFORMULA_SERVER_NAME%>?<%=Constants.MODULE_KEY%>=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${contest.id}"
           target="_blank">here</a>
        to see what the contest details page will look like.
    </p>


    <br/><br/>

    <div class="header">Documentation</div>

    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="removeDocForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="RemoveDocument"/>
        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
        <tc-webtag:hiddenInput name="<%=Constants.DOCUMENT_ID%>"/>

        <p>
            <c:forEach items="${contest.documents}" var="document">
                ${document.type.description}
                <a href="${sessionInfo.servletPath}?<%=Constants.MODULE_KEY%>=DownloadDocument&amp;<%=Constants.DOCUMENT_ID%>=${document.id}">
                        ${document.originalFileName}</a>
                <button onClick="document.removeDocForm.<%=Constants.DOCUMENT_ID%>.value ='${document.id}'">
                    Remove
                </button>
                <br/>
            </c:forEach>
        </p>
    </form>


    <c:set value="<%=Constants.DOCUMENT%>" var="doc"/>
    <c:set value="<%=Constants.DOCUMENT_TYPE_ID%>" var="docType"/>
    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="addDocumentForm"
          enctype="multipart/form-data">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AddDocument"/>
        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

        <p>
    <span class="bigRed"><tc-webtag:errorIterator id="err" name="${doc}">${err}
        <br/></tc-webtag:errorIterator></span>
        <span class="bigRed"><tc-webtag:errorIterator id="err" name="${doc}">${err}
            <br/></tc-webtag:errorIterator></span>
            <tc-webtag:objectSelect name="${docType}" list="${docTypes}" valueField="id" textField="description"/>
            <input type="file" name="${doc}">
            <button name="submit" value="submit" type="submit">Add</button>
            <br/><br/>
            Only certain file formats are accepted, if there is something you need to upload that doesn't work, ask
            around
            to get it added.
        </p>
    </form>



<c:set value="<%=PrizeType.CONTEST%>" var="contestPrize"/>
<div class="header">Prizes</div>

<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="removePrizeForm">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="RemovePrize"/>
    <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
    <tc-webtag:hiddenInput name="<%=Constants.PRIZE_ID%>"/>

    <p>
        <c:forEach items="${contest.prizes}" var="prize">
            Type: ${prize.type.description}
            <c:if test="${prize.type.id==contestPrize}">
                Place: ${prize.place}
            </c:if>
            Prize Amount:
            <fmt:formatNumber value="${prize.amount}" type="currency"/>
            <button onClick="document.removePrizeForm.<%=Constants.PRIZE_ID%>.value ='${prize.id}'">
                Remove
            </button>
            <br/>
        </c:forEach>
    </p>
</form>

<c:set value="<%=Constants.PRIZE_PLACE%>" var="prizePlace"/>
<c:set value="<%=Constants.PRIZE_VALUE%>" var="prizeValue"/>
<c:set value="<%=Constants.PRIZE_TYPE_ID%>" var="prizeType"/>
<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="addPrizeForm">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AddPrize"/>
    <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>

    <table cellpadding="0" cellspacing="0" class="input">
        <tr>
            <td colspan="2">
      <span class="bigRed"><tc-webtag:errorIterator id="err" name="${prizePlace}">${err}
          <br/></tc-webtag:errorIterator></span>
      <span class="bigRed"><tc-webtag:errorIterator id="err" name="${prizeValue}">${err}
          <br/></tc-webtag:errorIterator></span>
            </td>
        </tr>
        <tr>
            <td class="name">
                Place #:
            </td>
            <td class="value">
                <tc-webtag:textInput name="${prizePlace}"/>
            </td>
        </tr>
        <tr>
            <td class="name">
                Amount:
            </td>
            <td class="value">
                <tc-webtag:textInput name="${prizeValue}"/>
            </td>
        </tr>

        <tr>
            <td class="name">
                Prize Type:
            </td>
            <td class="value">
                <tc-webtag:objectSelect name='${prizeType}' list="${prizeTypes}" valueField="id" textField="description"/>
                <button name="submit" value="submit" type="submit">
                    Add
                </button>
            </td>
        </tr>


    </table>

</form>
<%--
<br/><br/>

<div class="header">After Contest</div>

<form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="sendToReviewForm">
    <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminSendToReview"/>
    <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
    <button name="submit" value="submit" type="submit">
        Send Submissions to Online Review
    </button>

</form>
 
<c:if test="${resultsReady}">
    <form action="${sessionInfo.secureAbsoluteServletPath}" method="POST" name="loadromReviewForm">
        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="AdminLoadFromReview"/>
        <tc-webtag:hiddenInput name="<%=Constants.CONTEST_ID%>"/>
        <button name="submit" value="submit" type="submit">
            Load Results From Online Review
        </button>

    </form>

</c:if>
--%>
 
</c:if>



                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../tcFoot.jsp"/>

    </div>
</body>
</html>