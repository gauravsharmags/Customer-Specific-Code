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

    ''Define Current Date Time
dt=day(date())
if len(dt)=1 then
	dt="0" & dt
else   
	dt = dt
end if  
mn = month(date())
if len(mn)=1 then
	mn="0" & mn
else   
	mn = mn
end if
yr = year(date())  
BEGDate = TRIM(mn&"/"&dt&"/"&yr)
%>
	<!---------#Include File="../../../IncludeFile/adovbs.inc"---->
	<!--#Include File="../../../IncludeFile/Connection.asp"-->
	<!--#Include File="../../../IncludeFile/Globalaspfunction.asp"-->
<%		
	Dim iRecIdDoc, iTrdRelId, iParentDocId, sFileStatus
	iRecIdDoc		=	Trim(Request.Form("hid_RecIdDoc"))
	iTrdRelId		=	Trim(Request.Form("hid_TrdRelId"))
	iParentDocId	=	Trim(Request.Form("hid_RecIdDoc"))
%>
	<HTML>
		<HEAD>
			<link rel=stylesheet type=text/css href="../../../Includefile/infocon-global.css">
			<SCRIPT LANGUAGE="javascript" src="js/Format.js"></SCRIPT>	
			<SCRIPT LANGUAGE="javascript" src="js/Validate_810.js"></SCRIPT>		
			<SCRIPT LANGUAGE="javascript" src="js/810New.js"> </SCRIPT>
            <script language="JavaScript">
                function forDate() 
                {
                    document.frm_810XSL.BIG_01.value = '<%=BEGDate%>'


                    if ((typeof (document.frm_810XSL.DTM_02) == "undefined") == false && frm_810XSL.DTM_02.value != '') {
                        if (isArray(document.frm_810XSL.DTM_02) == true) {
                            for (i = 0; i < document.frm_810XSL.DTM_02.length; i++) {
                                document.frm_810XSL.DTM_02[i].value = '<%=BEGDate%>'
                            }
                        }
                        else {
                            document.frm_810XSL.DTM_02.value = '<%=BEGDate%>'
                        }
                    }


                    
                }
            </script>
		</HEAD>
<%
	if iRecIdDoc = "" Then 
		Response.Redirect "../../../Inbox.asp"
	End if 

	'Getting Production/Test
	sFileStatus	=	f_GetISA15Value("810", iTrdRelId)
%><!--accessExtPrice();-->
		<BODY Topmargin=0 LeftMargin=0 onfocus ="editHREF();accessExtPrice();forDate();"  onload="DisplayStatus();editHREF();accessExtPrice();formatDate(frm_810XSL.BIG_03);frm_810XSL.txt_CustomerName.value='<%=session("CustomerName")%>';forDate()"> 
			<!-- #include file="../../../IncludeFile/CustomLiveEDItop.inc"-->
			<Form Action="Process810.asp" Method="post" name="frm_810XSL">
				<input type="hidden" name="hid_RecIdDoc" value="<%=iRecIdDoc%>">
				<input type="hidden" name="hid_ParentDocId" value="<%=iParentDocId%>">
				<input type="hidden" name="hid_TrdRelId" value="<%=iTrdRelId%>">
				<input type="hidden" name="hid_FileStatus" value="<%=sFileStatus%>">
				<input type="hidden" name="hid_ProcessMode" value="fromPO">
<%
	Dim oXML , oXSl 
	Dim sErrorDesc

	Set oXML	=	Server.CreateObject("Microsoft.XMLDOM")
	oXML.async	=	false	
	
	if iRecIdDoc  <> "" Then 	
		sXmlData=f_ReadXmlFromDataBase(iRecIdDoc)	'This fuction is in "Globalaspfunction.asp" file
		sXmlData=replace(sXmlData,"ISO-8859-1","utf-16")
		oXML.loadxml(sXmlData)
    '  oXML.load(server.MapPath("850.xml"))
	Else
		Response.Redirect "/Edi/LiveEdi/Inbox.asp"
	End if
	
	if oXML.parseError <> 0 then
		sErrorDesc = "ERROR in loading Document : " & oXML.parseError.reason & " at line : " & oXML.parseError.line  & " and col : " & oXML.parseError.linepos
	else
		Dim iCount 
		iCount	=	0
		For each item in Request.Form("hid_CheckBoxStatus")
			if UCase(item) =  "ON" Then 
				Call s_SetDisplayItemInPO(oXML, "PO1-LOOP["&iCount&"]/SegmentRef", "PO1", "T")			
			End if 
			iCount = iCount + 1
		Next 
		
		Set oXSl	=	Server.CreateObject("Microsoft.XMLDOM")
		oXSl.async=	false
		oXSl.load(Server.MapPath("810.XSL"))
		if oXSl.parseError <> 0 then
			sErrorDesc = "ERROR in Formatting : " & oXSl.parseError.reason & " at line : " & oXSl.parseError.line  & " and col : " & oXSl.parseError.linepos
		end if
	end if

	if trim(sErrorDesc) <> "" then 
%>
				<BR>
				<center><font color="red">Document cannot be displayed. Please email support@infoconn.com for assistance.</font></center>
				<BR>
				<Input type='Hidden' name='hid_ErrorDesc' value="<%=sErrorDesc%>">
<%
	Else
%>			
				<div id="printData">
<%					
					Response.Write  oXML.transformNode(oXSl)
%>
				</div>
<%
	End If
	
	set oXML = nothing
	set oXSL = nothing
%>
			</Form>
			<!----#Include File="../../../IncludeFile/infocon-global-footerEDILive.stm"--->
		</BODY>
	</HTML>
<%
	Sub s_SetDisplayItemInPO(po_OrigXML, ps_SegmentTag, ps_SegmentID, pb_Flag)
		Dim oXMLDOMNode, oElement, oNodeList
	    
		Set oNodeList	=	po_OrigXML.getElementsByTagName("Interchange-Control/Functional-Group-Control/Transaction-Set-Control/" & ps_SegmentTag)
		For Each oXMLDOMNode In oNodeList
			Set oElement = oXMLDOMNode
			If UCase(Trim(oElement.getAttributeNode("ID").Value)) = ps_SegmentID Then
				oElement.setAttribute "DisplayInPO", pb_Flag
			End If
			Set oElement = Nothing
		Next
	       
		Set oNodeList = Nothing
	End Sub
%>