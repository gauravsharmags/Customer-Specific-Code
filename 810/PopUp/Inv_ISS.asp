<!--#Include File="../../../../IncludeFile/Globalaspfunction.asp"-->
<!--#Include File="../../../../IncludeFile/Connection.asp"-->
<!---------#Include File="../../../../IncludeFile/adovbs.inc"---->
<HTML>
	<head>
		<title>Infoconn Systems | EDI | Add Invoice ISS</title>
		<Link Rel="StyleSheet" Type="Text/Css" href="../../../../Includefile/infocon-global.css">
			<SCRIPT LANGUAGE="javascript">
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
	var iTrdRel		=	 '<%=Trim(Request.Form("hid_TradeRelID"))%>'
	var qty;
	
	
	if(frmISS.ISS_01.value == '' && frmISS.ISS_03.value == '')
	{
		alert("Please Enter:\nUnit Shipped OR \nWeight")
		return false
	}
	if(frmISS.ISS_01.value != '' && isNaN(frmISS.ISS_01.value))
	{
		alert("Please enter valid numeric value for Number Of Unit Shipped field")
		frmISS.ISS_01.select()
		return false
	}
	if(frmISS.ISS_01.value != '' && frmISS.ISS_02.value == '' )
	{
		alert("Please Select UOM")
		frmISS.ISS_02.focus()
		return false
	}
	if(frmISS.ISS_01.value == '' && frmISS.ISS_02.value != '' )
	{
		alert("Please Enter Unit Shipped")
		frmISS.ISS_01.focus()
		return false
	}

	if(frmISS.ISS_03.value != '' && isNaN(frmISS.ISS_03.value))
	{
		alert("Please enter valid numeric value for Weight")
		frmISS.ISS_03.select()
		return false
	}
	if(frmISS.ISS_03.value != '' && frmISS.ISS_04.value == '' )
	{
		alert("Please Select UOM")
		frmISS.ISS_04.focus()
		return false
	}
	if(frmISS.ISS_03.value == '' && frmISS.ISS_04.value != '' )
	{
		alert("Please Enter Weight")
		frmISS.ISS_03.focus()
		return false
	}
	return true
}

function checkVal()
{	
	var iIndex		=	"<%=Cint(Trim(Request.QueryString("Mode")))%>"
	iIndex= parseInt(iIndex)
	if (validate() == true)
	{
		window.opener.frm_810XSL.ISS_01.value	=	frmISS.ISS_01.value
		window.opener.frm_810XSL.ISS_02.value	=	frmISS.ISS_02.options[frmISS.ISS_02.selectedIndex].text
		window.opener.frm_810XSL.ISS_03.value	=	frmISS.ISS_03.value
		window.opener.frm_810XSL.ISS_04.value	=	frmISS.ISS_04.options[frmISS.ISS_04.selectedIndex].text	

		if (frmISS.ISS_01.value != '' || frmISS.ISS_02.value != '' || frmISS.ISS_03.value != '' || frmISS.ISS_04.value != '')
		{
			window.opener.TR_ISS_01.style.display = "INLINE"
		}
		else 
		{
			window.opener.TR_ISS_01.style.display = "NONE"
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
	</head>
	<%

Dim iIndex	 , sMode
	iIndex	=	Trim(Cint(Request.QueryString("mode")))
	
	if iIndex = 0 Then 
		iIndex = 1
	Else
		iIndex = iIndex + 1
	End if 
	On Error Resume Next 
		ISS_01		=	Trim(Request.Form("ISS_01"))
		ISS_02		=	f_CutStringFromCombo(Trim(Request.Form("ISS_02")))
		ISS_03		=	Trim(Request.Form("ISS_03"))
		ISS_04		=	f_CutStringFromCombo(Trim(Request.Form("ISS_04")))	
		


%>
	<BODY text="black" style="SCROLLBAR-FACE-COLOR: #c8e3ff; SCROLLBAR-HIGHLIGHT-COLOR: #0099ff"
		TopMargin="0" LeftMargin="0">
		<Table Width="100%" Cellpadding="0" cellspacing="0" height="100%" bgcolor="#FFFFFF" border="0">
			<TR>
				<TD valign="top"></TD>
			</TR>
			<TR>
				<TD Bgcolor="#ffffff" width="85%" valign="top">
					<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="white">
						<tr>
							<td align="center">
								<form method="post" Action="Inv_ISS.asp" name="frmISS" onSubmit="return checkVal();">
									<table width='80%' class='header' align="center" border="0">
										<tr>
											<td colspan="2" align="center"><b>Edit Shipment Summary Details</b></td>
										</tr>
										<tr>
											<td colspan="2" width="100%"><hr color="navy">
											</td>
										</tr>
									</table>
									<table width='100%' class='header' align="center" border="0">
										<tr>
											<td align="right"><b>Unit Shipped<TD>:</TD>
												</b>
											</td>
											<td align="left"><input class="inputText" type=text name="ISS_01" size=6 maxlength=6 value="<%=ISS_01%>" ID="Text1">
											</td>
										</tr>
										<tr>
											<td align="right"><b>Unit of Measure</b>
											<TD>:</TD>
							</td>
							<td align="left">
								<select class="inputText" name="ISS_02" style="width:200">
									<option value=""></option>
									<Option value='CA' <%if ISS_02="CA" then%>	selected <%end if%> >CA Case</Option>
									<Option value='EA' <%if ISS_02="EA" then%>	selected <%end if%> >EA Each</Option>
									
								</select>
							</td>
						</tr>
						<tr>
							<td align="right"><b>Weight<TD>:</TD>
								</b>
							</td>
							<td align="left"><input class="inputText" type=text name="ISS_03" size=6 maxlength=6 value="<%=ISS_03%>">
							</td>
						</tr>
						<tr>
							<td align="right"><b>Unit of Measure</b>
							<TD>:</TD>
				</TD>
				<td align="left">
					<select class="inputText" name="ISS_04" style="width:200" ID="Select2">
						<option value=""></option>
						<Option value='KG' <%if ISS_04="KG" then%>	selected <%end if%> >KG Kilogram</Option>
						<Option value='LB' <%if ISS_04="LB" then%>	selected <%end if%> >LB Pound</Option>
					</select>
				</td>
			</TR>
			<tr align="left">
				<TD></TD>
				<td colspan="2"><input type="submit" value="OK" name="buttonTerms" Class="InputButton" style="width:50"><input type="button" value="Cancel" name="buttonTerms" Class="InputButton" onclick="window.close()"></td>
			</tr>
		</Table>
		</form> </TD> </TR> </Table> </TD> </TR>
		<TR>
			<TD Colspan="4">&nbsp;</TD>
		</TR>
		<TR>
			<TD Valign="Top" Colspan="4"></TD>
		</TR>
		</Table>
	</BODY>
</HTML>
