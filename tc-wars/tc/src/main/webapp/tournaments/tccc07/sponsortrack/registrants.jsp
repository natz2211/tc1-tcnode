<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tccc07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../../script.jsp"/>

    <script type="text/javascript">
        function next() {
            var myForm = document.registrantsForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) + parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';
            myForm.submit();
        }
        function previous() {
            var myForm = document.registrantsForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value -= parseInt(myForm.<%=DataAccessConstants.NUMBER_RECORDS%>.value);
            myForm.<%=DataAccessConstants.SORT_COLUMN%>.value = '<%=request.getParameter(DataAccessConstants.SORT_COLUMN)==null?"":request.getParameter(DataAccessConstants.SORT_COLUMN)%>';
            myForm.<%=DataAccessConstants.SORT_DIRECTION%>.value = '<%=request.getParameter(DataAccessConstants.SORT_DIRECTION)==null?"":request.getParameter(DataAccessConstants.SORT_DIRECTION)%>';

            myForm.submit();
        }
    </script>

</head>
<body>

<% ResultSetContainer rsc = (ResultSetContainer) (request.getAttribute("list"));%>

<div align="center" style="background: transparent;">
    <div id="containAll">
    <div id="content">

        <jsp:include page="nav.jsp" >
        <jsp:param name="tabLev1" value="overview"/>
        <jsp:param name="tabLev2" value="registrants"/>
        <jsp:param name="tabLev3" value=""/>
        </jsp:include>

            <div id="pageBodyST">

                    <h1><span>Registrants</span></h1>

                    <form name="registrantsForm" action='${sessionInfo.servletPath}' method="get">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="TCCC07ViewRegistrants"/>
                        <tc-webtag:hiddenInput name="et" value="${et}"/>
                        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_COLUMN%>"/>
                        <tc-webtag:hiddenInput name="<%=DataAccessConstants.SORT_DIRECTION%>"/>

                        <div align="center">
                            <div class="pagingBox">
                                <%=(rsc.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
                                | <%=(rsc.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
                            </div>
                            <br>

                            <table cellpadding="0" cellspacing="0" class="stat" style="width:400px; margin-bottom: 100px;">
                                <thead>
                                    <tr>
                                        <td class="title" colspan="3">Registrants: ${numRegistrants}</td>
                                    </tr>
                                    <tr>
                                        <td class="headerC" nowrap="nowrap">
                                            <a href="/tc?module=TCCC07ViewRegistrants&amp;et=${et}<tc-webtag:sort column="<%=rsc.getColumnIndex("rank")%>"/>">TCCC
                                                Rank</a>
                                        </td>
                                        <%-- show after seeds are assigned
                                                <td class="headerC">
                                                    <a href="">Seed</a>
                                                </td>
                                        --%>
                                        <td class="header" width="100%">
                                            <a href="/tc?module=TCCC07ViewRegistrants&amp;et=${et}<tc-webtag:sort column="<%=rsc.getColumnIndex("handle_lower")%>"/>">Handle</a>
                                            <br/>
                                            <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="16" style="border: 1px solid #999999; color: #999999;" onClick="this.style.color='#333333';" maxlength="100"/>
                                        </td>
                                        <td class="headerR">
                                            <a href="/tc?module=TCCC07ViewRegistrants&amp;et=${et}<tc-webtag:sort column="<%=rsc.getColumnIndex("rating")%>"/>">Rating</a>
                                        </td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%boolean even = false;%>
                                    <rsc:iterator list='<%=rsc%>' id="resultRow">
                                        <tr class="<%=(even ? "dark" : "light")%>">
                                            <td class="valueC">
                                                <rsc:item name="rank" row='<%=resultRow%>'/>
                                            </td>
                                                <%--
                                                                <td class="valueC">
                                                                    1234
                                                                </td>
                                                --%>
                                            <td class="value">
                                                <tc-webtag:handle coderId='<%=resultRow.getIntItem("user_id")%>' context="algorithm" darkBG="true"/>
                                            </td>
                                            <td class="valueR">
                                                <rsc:item format="###0" ifNull="Unrated" name="rating" row='<%=resultRow%>'/>
                                            </td>
                                        </tr>
                                        <%even = !even;%>
                                    </rsc:iterator>
                                </tbody>
                            </table>

                            <div class="pagingBox">
                                <%=(rsc.croppedDataBefore() ? "<a href=\"Javascript:previous()\" class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
                                | <%=(rsc.croppedDataAfter() ? "<a href=\"Javascript:next()\" class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>

                                <br>

                                View &#160;
                                <tc-webtag:textInput name="<%=DataAccessConstants.NUMBER_RECORDS%>" size="4" maxlength="4"/>
                                &#160;at a time starting with &#160;
                                <tc-webtag:textInput name="<%=DataAccessConstants.START_RANK%>" size="4" maxlength="4"/>
                                <button name="nameSubmit" value="submit" type="submit">Go</button>
                            </div>
                        </div>

                    </form>

            </div>
    </div>
    <jsp:include page="footer.jsp" />
    </div>
</div>
</body>
</html>
