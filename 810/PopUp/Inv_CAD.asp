<%@ Language=VBS%>
<!--#Include File="../../../../IncludeFile/Globalaspfunction.asp"-->
<!--#Include File="../../../../IncludeFile/Connection.asp"-->
<!---------#Include File="../../../../IncludeFile/adovbs.inc"---->
<HTML>
	<HEAD>
		<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
		<Link Rel="StyleSheet" Type="Text/Css" href="../../../../Includefile/infocon-global.css">
			<TITLE>Infocon Systems | EDI | Carrier Detail Form</TITLE>
			<SCRIPT LANGUAGE="javascript">

function isArray(obj)
{
	return(typeof(obj.length)=="undefined")?false:true;
}
function removeSpace(objtextBox)
{
	var sVal	=	objtextBox.value
	var iLen	=	sVal.length
		if(sVal.charAt(0) == " " || sVal.charAt(parseInt(iLen-1)) == " ")
		{
			alert("space characters are not allowed")
			objtextBox.select()
			return false
			
		}
	return true
}
function validate()
{
   
    if(removeSpace(frmAllowance.CAD_04)== false)
	{
		return false
	}   
	if(removeSpace(frmAllowance.CAD_05)== false)
	{
		return false
	}
	if(removeSpace(frmAllowance.CAD_08)== false)
	{
		return false
	}
	
	
	if(frmAllowance.CAD_04.value == '' && frmAllowance.CAD_05.value == '')
	{
		alert("Please Enter : \n SCAC OR \n Routing")
		frmAllowance.CAD_04.focus()
		return false
	}
	if(frmAllowance.CAD_07.value != '' && frmAllowance.CAD_08.value == '')
	{
		alert("Please Enter Reference ID")
		frmAllowance.CAD_08.focus()
		return false
	}
	
	if(frmAllowance.CAD_08.value != '' && frmAllowance.CAD_07.value == '')
	{
		alert("Please Enter Reference Qualifier")
		frmAllowance.CAD_07.focus()
		return false
	}
	

	return true
	
}

function CheckVal()
{
	var iIndex	=	"<%=Trim(Cint(Request.QueryString("mode")))%>"
	
	iIndex= parseInt(iIndex)
	if(validate() == true)
	{
		
		window.opener.frm_810XSL.CAD_01.value	=	frmAllowance.CAD_01.options[frmAllowance.CAD_01.selectedIndex].text
		window.opener.frm_810XSL.CAD_04.value	=	frmAllowance.CAD_04.value
		window.opener.frm_810XSL.CAD_05.value	=	frmAllowance.CAD_05.value
		window.opener.frm_810XSL.CAD_07.value	=	frmAllowance.CAD_07.options[frmAllowance.CAD_07.selectedIndex].text
		window.opener.frm_810XSL.CAD_08.value	=	frmAllowance.CAD_08.value
		
		if(frmAllowance.CAD_04.value != ''	|| frmAllowance.CAD_01.value  != '')
		{
			window.opener.TR_CAD_Row1.style.display	=	"INLINE"
		}
		else
		{
			window.opener.TR_CAD_Row1.style.display	=	"NONE"
		}
		if(frmAllowance.CAD_05.value != '')
		{
			window.opener.TR_CAD_Row3.style.display	=	"INLINE"
		}
		else
		{
			window.opener.TR_CAD_Row3.style.display	=	"NONE"
		}
		if(frmAllowance.CAD_07.value != ''	|| frmAllowance.CAD_08.value  != '')
		{
			window.opener.TR_CAD_Row2.style.display	=	"INLINE"
		}
		else
		{
			window.opener.TR_CAD_Row2.style.display	=	"NONE"
		}
		window.close()
		
		return true
	}	
	else
	{
		return false
	}	
}
			</SCRIPT>
	</HEAD>
	<%
	
	Dim iIndex	 , sMode
	iIndex	=	Trim(Cint(Request.QueryString("mode")))
	
	if iIndex = 0 Then 
		iIndex = 1
	Else
		iIndex = iIndex + 1
	End if 
	On Error Resume Next 
		
		CAD_01		=	f_CutStringFromCombo(Trim(Request.Form("CAD_01")))
		CAD_04		=	Trim(Request.Form("CAD_04"))
		CAD_05		=	Trim(Request.Form("CAD_05"))
		CAD_07		=	f_CutStringFromCombo(Trim(Request.Form("CAD_07")))
		CAD_08		=	Trim(Request.Form("CAD_08"))
		
%>
	<BODY text="black" TopMargin="0" LeftMargin="0">
		<Table Width="100%" Cellpadding="0" cellspacing="0" height="100%" bgcolor="#FFFFFF" border="0"
			ID="Table1">
			<TR>
				<TD valign="top"></TD>
			</TR>
			<TR>
				<TD Bgcolor="#ffffff" width="85%" valign="top">
					<TABLE border="0" cellPadding="0" cellSpacing="0" width="100%" ID="Table2">
						<TR>
							<TD>&nbsp;</TD>
							<TD><IMG alt="Owens Direct" border="0" src="/images/shim.gif" width="8">
							</TD>
							<TD>&nbsp;</TD>
							<TD align="right" vAlign="top" width="100%"></TD>
						</TR>
					</TABLE>
					<TABLE bgColor="white" border="0" cellPadding="0" cellSpacing="0" width="100%" ID="Table3">
						<TR>
							<TD noWrap><IMG alt="" height="1" src="/images/pixel.gif" width="640"></TD>
						</TR>
						<TR>
							<TD><!-- Begin Main Form Cell -->
								<FORM Action="Inv_CAD.asp" method="post" name="frmAllowance" onsubmit="return CheckVal()"
									ID="Form1">
									&nbsp;&nbsp;&nbsp;
									<TABLE class="header" width="100%" border="0" ID="Table4">
										<TR>
											<TD align="center" colspan="3"><B>Edit Carrier Details</B></TD>
										</TR>
										<TR>
											<TD align="center" colspan="3" width="100%"><hr color="navy">
											</TD>
										</TR>
										<TR>
											<TD align="right"><B>Segment:</B></TD>
											<TD align="left" colspan='2'><B>CAD</B></TD>
										</TR>
										<TR>
											<TD align="center" nowrap><B>Type Code</B>
											</TD>
											<TD><B>:</B></TD>
											<TD align="left">
												<Select Name="CAD_01" Class="InputText" Style="Width:120" ID="Select1">
													
													<Option <%if UCase(CAD_01) = "T" Then %> Selected <%End if %> value="T">T Best Way</Option>
												</Select>
											</TD>
										</TR>
										<TR>
											<TD align="center" nowrap><B>SCA Code</B>
											</TD>
											<TD><B>:</B></TD>
											<TD align="left">
												<INPUT class=inputText maxLength=4 name=CAD_04 size=5  value="<%=CAD_04%>" ID="Text3">
											</TD>
										</TR>
										<TR>
											<TD align="center"><B>Routing</B></TD>
											<TD><B>:</B></TD>
											<TD align="left"><INPUT class=inputText maxLength=35 name=CAD_05 size=40  value="<%=CAD_05%>" ID="Text2">
											</TD>
										</TR>
										<TR>
											<TD align="center" nowrap><B>Reference ID Qualifier</B>
											</TD>
											<TD><B>:</B></TD>
											<TD align="left">
												<Select Name="CAD_07" Class="InputText" Style="Width:270" ID="Select3">
													<Option value=""></Option>
													<Option <%if UCase(CAD_07) = "BM" Then %> Selected <%End if %> value="BM">BM Bill 
														of Lading Number</Option>
													<Option <%if UCase(CAD_07) = "CN" Then %> Selected <%End if %> value="CN">CN 
														Carriers Reference Number</Option>
												</Select>
											</TD>
										</TR>
										<TR>
											<TD align="center"><B>Reference ID</B></TD>
											<TD><B>:</B></TD>
											<TD align="left"><INPUT class=inputText maxLength=50 name=CAD_08 size=40  value="<%=CAD_08%>" ID="Text1">
											</TD>
										</TR>
										<TR>
											<TD align="center" colSpan="3">
												<INPUT name="AllowanceButton" Class="InputButton" type="SUBMIT" value="OK" style="width:60"
													ID="Submit1"><INPUT name="AllowanceButton" Class="InputButton" type="button" value="Cancel" onclick="window.close()"
													style="width:60" ID="Button1">
										</TR>
									</TABLE>
								</FORM> <!-- End Main Form Cell --></TD>
						</TR>
						<!-- Begin Utility Button Cell -->
					</TABLE>
				</TD>
			</TR>
		</Table>
	</BODY>
</HTML>
