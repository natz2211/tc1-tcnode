<%@  page
 language="java"
 errorPage="/errorPage.jsp"
  import="com.topcoder.common.web.data.Navigation,
          com.topcoder.shared.util.ApplicationServer"
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Working at TopCoder</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="working_tc"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="99%"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
        <jsp:include page="../body_top.jsp" >
           <jsp:param name="image" value="about_tc"/>
           <jsp:param name="image1" value="white"/>
           <jsp:param name="title" value="Working at TopCoder"/>
        </jsp:include>

        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                  <TR>
                        <TD><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="10" BORDER="0"/></TD>
                     </TR>
                      <TR>
                        <TD CLASS="statText" BGCOLOR="#43515E" HEIGHT="18" VALIGN="middle">&#160;&#160;<B>Great Jobs at TopCoder</B></TD>
                     </TR>
                  </TABLE>


            <table border="0" cellspacing="0" cellpadding="0"  width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><br/>

<P>
<B>Internal TopCoder Developer</B>
</P>

<p>
TopCoder is looking to hire a full-time software developer to design and implement enhancements to TopCoder's internal systems.  Candidates must work well under pressure in a high-risk environment and must have good communication skills.
</p>
<p><b>Responsibilities</b></p>
<ul>
<li>Implement enhancements to the TopCoder competition engine and TopCoder website</li>
<li>Design and develop new functionality to compliment TopCoder's internal systems and private label software offerings </li>
<li>Setup and administration of TopCoder SRMs, private label competitions, and major tournaments</li>
</ul>

<p><b>Environment</b></p>
<ul>
<li>TopCoder's systems are written mostly in Java - with some C++ and Microsoft .Net</li>
<li>TopCoder's development environment consists of mostly Linux and Solaris, with some Windows 2000</li>
</ul>

<p><b>Requirements</b></p>
<ul>
<li>You must have knowledge of Java and C++ - knowledge of C# and VB.NET a plus</li>
<li>You must have some experience with relational databases</li>
<li>You must be a logical thinker and a fast learner</li>
<li>You must be willing to relocate to the Hartford, CT area</li>
</ul>

                        <p>
                        <A href="mailto:jobs@topcoder.com?subject=Internal Developer">Apply for this job.<a/>
                        </p>
                        <p><br /></p>

                    </td>
                </tr>
            </table>

            <p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="about"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>