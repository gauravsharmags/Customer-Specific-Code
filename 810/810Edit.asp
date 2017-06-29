<!--
AUTHOR:     Dinesh Kumar Jha
Date:          09 June 2011
Modified Date: 
Status:        Completed
Note:
-->
<%@ Language=VBScript %>
<%
	Response.Buffer		=	True 
	
	If trim(Session("UserID")) = "" then
		Response.Redirect "../../../Default.asp"
	End IF
%>
	<!---------#Include File="../../../IncludeFile/adovbs.inc"---->
	<!--#Include File="../../../IncludeFile/Connection.asp"-->
	<!--#Include File="../../../IncludeFile/Globalaspfunction.asp"-->
<%		
	Dim iRecIdDoc, iTrdRelId, iParentDocId
	iRecIdDoc		=	Trim(Request.Form("hid_RecIdDoc"))
	iTrdRelId		=	Trim(Request.Form("hid_TrdRelId"))
	iParentDocId	=	Trim(Request.Form("hid_ParentDocId"))

	if iRecIdDoc = "" Then 
		Response.Redirect "/EDI/LiveEdi/Outbox.asp"
	End if
%>
	<HTML>
		<HEAD>
			<link rel=stylesheet type=text/css href="../../../Includefile/infocon-global.css">
			<SCRIPT LANGUAGE="javascript" src="js/Format.js"></SCRIPT>	
			<SCRIPT LANGUAGE="javascript" src="js/Validate_810.js"></SCRIPT>		
			<SCRIPT LANGUAGE="javascript" src="js/810New.js"> </SCRIPT>
		</HEAD>
<%
    'Getting Production/Test
	sFileStatus	=	f_GetISA15Value("810", iTrdRelId)
	
	Dim oXML , oXSl 
	Dim  sErrorDesc
	Set oXML	=	Server.CreateObject("Microsoft.XMLDOM")
	oXML.async=	false
	'''loading xml file thru XmlDom onject
	if iRecIdDoc  <> "" Then 	
	    ''readXmlFromDataBase	:	lying in general.inc. Reads xml from database for 
	    XmlData=f_ReadXmlFromDataBase(iRecIdDoc)
		XmlData=replace(XmlData,"ISO-8859-1","utf-16")
		oXML.loadxml(XmlData)	'This fuction is in "Globalaspfunction.asp" file
	Else
		Response.Redirect "/EDI/LiveEdi/Outbox.asp"
	End if 

	if oXML.parseError <> 0 then
		sErrorDesc = "ERROR in loading Document : " & oXML.parseError.reason & " at line : " & oXML.parseError.line  & " and col : " & oXML.parseError.linepos
	else	 
		Set oXSl	=	Server.CreateObject("Microsoft.XMLDOM")
		oXSl.async=	false
		oXSl.load(Server.MapPath("810Edit.XSL"))
		if oXSl.parseError <> 0 then
			sErrorDesc = "ERROR in Formatting : " & oXSl.parseError.reason & " at line : " & oXSl.parseError.line  & " and col : " & oXSl.parseError.linepos
		end if
	end if

	if trim(sErrorDesc) <> "" then
%>
		<BODY Topmargin=0 LeftMargin=0 >	
			<!-- #include file="../../../IncludeFile/CustomErrLiveEDItop.inc"-->
			<BR>
			<center><font color=red>Document cannot be displayed. Please email support@infoconn.com for assistance.</font></center>
			<BR>
			<Input type='Hidden' name='hid_ErrorDesc' value="<%=sErrorDesc%>">
<% 
	Else
%>
		<BODY Topmargin=0 LeftMargin=0 onfocus ="editHREF();accessExtPrice();"  onload="DisplayStatus();editHREF();accessExtPrice();frm_810XSL.txt_CustomerName.value='<%=session("CustomerName")%>';"> 
			<!-- #include file="../../../IncludeFile/CustomLiveEDItop.inc"-->
			<Form Action="Process810.asp" Method="post" name="frm_810XSL">
				<input type="hidden" name="hid_RecIdDoc" value="<%=iRecIdDoc%>">
				<input type="hidden" name="hid_ParentDocId" value="<%=iParentDocId%>">
				<input type="hidden" name="hid_TrdRelId" value="<%=iTrdRelId%>">	 
				<input type="hidden" name="hid_ProcessMode" value="Edit">	
				<input type="hidden" name="hid_FileStatus" value="<%=sFileStatus%>">
				<Div>
<%
		Response.Write  oXML.transformNode(oXSl)
%>
				</Div>
<%
	End if
	
	set oXML = nothing
	set oXSL = nothing
%>
			</Form>
			<!----#Include File="../../../IncludeFile/infocon-global-footerEDILive.stm"--->
		</BODY>
	</HTML>