
<%Response.Buffer	=	True

InvType		=	Trim(Request.Form("BIG_07"))
%>
<HTML><head>
<title>Infoconn Systems | Edit Invoice Type</title>
<Link Rel=StyleSheet Type=Text/Css href="../../../../Includefile/infocon-global.css">
<SCRIPT LANGUAGE=javascript>
<!--
function cutString()
{
	if(frmInvoiceType.cmbInvoiceType.value != "")
	
	{	
		var iInvoiceText	=	frmInvoiceType.cmbInvoiceType.options[frmInvoiceType.cmbInvoiceType.selectedIndex].text
		var iInvoiceID		=	iInvoiceText.substring(0,2)
		var iInvoiceText	=	iInvoiceText.substring(2,iInvoiceText.length)
		window.opener.frm_810XSL.BIG_07_DESC.value	=	"["+iInvoiceID+"]"+iInvoiceText
		window.opener.frm_810XSL.BIG_07.value		=	frmInvoiceType.cmbInvoiceType.value
		window.close()
	}
	else
	{
		window.opener.frm_810XSL.BIG_07_DESC.value	=""
		window.opener.frm_810XSL.BIG_07.value		=	""
			window.close()
	}	
}
//-->
</SCRIPT>
</head>
<BODY text=black    style="SCROLLBAR-FACE-COLOR: #c8e3ff; SCROLLBAR-HIGHLIGHT-COLOR: #0099ff" TopMargin=0 LeftMargin=0>
<Table Width=100% Cellpadding=0 cellspacing=0 height=100% bgcolor="#FFFFFF" border=0>
	<TR>
		<TD   valign=top >&nbsp;</TD>
	</TR>
	<TR>
		<TD Bgcolor= "#ffffff" width=85% valign=top>
<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="white">
<TR><TD nowrap="nowrap"></TD></TR>
<tr> 
<td>
<form method=post Action="Inv_InvoiceType.asp" name =frmInvoiceType>
<table width="100%" border="0" align="center"><tr><td>
		<table width="100%" border="0" cellpadding="3" bgcolor="#FFFFFF">
		<tr>
			<td align="cENTER" valign="top" Colspan=2><b class="largeText">Edit Invoice Type</b></td>
		</tr>
		<tr>
			<td align="cENTER" valign="top" Colspan=2><hr color=navy></td>
		</tr>
		<tr>
			<td align="right"><b>Invoice type:</b></td>
			<td align="left">
			
				<select class="inputText" name="cmbInvoiceType">				   
					<option value=""></option>
					<option value="CR" <% if InvType="CN" then%>selected <%end if%>>CN Credit Invoice</option>
					<option value="CT" <% if InvType="CT" then%>selected <%end if%>>CT Cost Type Invoice</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>&nbsp;</td>
			<td align="left">
			
			<input Class=InputButton type=button value=' OK ' name=buttonSave onclick="cutString()"><input Class=InputButton type=button value='Cancel' name=buttonSave onclick="window.close()">
			</td>
		</tr>
		</table>
</form>
</td>
</tr>
</table>
</TD>
</TR>
<TR>
	<TD >&nbsp;</TD>
</TR>
<TR>
	<TD Valign=Top>&nbsp;</TD>
</TR>
</Table>
</BODY>
</HTML>

