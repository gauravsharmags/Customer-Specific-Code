<!--#Include File="../../../../IncludeFile/Globalaspfunction.asp"-->

<HTML>
<title>Infocon Systems | EDI | Add Invoice Reference Number</title>
<Link Rel=StyleSheet Type=Text/Css href="../../../../Includefile/infocon-global.css">

<SCRIPT LANGUAGE=javascript>
var iIndex;
iIndex	=	"<%=Trim(Request.QueryString("Mode"))%>"
var bNewFlag	=	"<%=Request.QueryString("Create")%>"
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
function isArray(obj)
{
	return(typeof(obj.length)=="undefined")?false:true;
}

function CreateRow()
{
		window.opener.RefTable.insertRow(1)
		window.opener.RefTable.rows(1).insertCell(0)
		window.opener.RefTable.rows(1).cells(0).innerHTML	="<Input type='text' Name='REF_01' Class='inputText' readonly='true' size='67' style='Border-Top:0;Border-Bottom:0;Border-Left:0;Border-Right:0;'>" 
								
		window.opener.RefTable.rows(1).insertCell(1)
		window.opener.RefTable.rows(1).cells(1).innerHTML = "<Input type='text' Name='REF_02' Class='inputText' size='35' readonly='true' style='Border-Top:0;Border-Bottom:0;Border-Left:0;Border-Right:0;'> " 
		window.opener.RefTable.rows(1).insertCell(2)
		window.opener.RefTable.rows(1).cells(2).id		=	"ReferenceHREF"
		window.opener.RefTable.rows(1).cells(2).style.textAlign = "center"
}
function validate()
{
	if(removeSpace(document.frmRef.REF_02) != true)
	{
		return false
	}
	if(frmRef.REF_01.value=="" )
	{
		alert("Please Select Reference Identification Qualifier")
		frmRef.REF_01.focus()
		return false
	}
	if(frmRef.REF_01.value=="" && frmRef.REF_02.value!="")
	{
		alert("Please Select Reference Identification Qualifier")
		frmRef.REF_01.focus()
		return false
	}
	
	if(frmRef.REF_02.value=="" && frmRef.REF_01.value!="")
	{
		alert("Please Enter Reference ID")
		frmRef.REF_02.focus()
		return false
	}
	if(frmRef.REF_01.value=="IA")
	{
	    
	    if(parseInt(frmRef.REF_02.value.toString().length)!=9)
	     {
			alert("Please Enter 9 character Reference ID for Qualifier 'IA'")
			frmRef.REF_02.focus()
			return false
		 }
	}
		
	return true
}
function fillValues()
{
	
	if(validate() == true)	
	{
		if(bNewFlag.toUpperCase() == "NEW")
		{
				CreateRow()
		}
		if(isArray(window.opener.frm_810XSL.REF_01)==true)
		{
			
			window.opener.frm_810XSL.REF_01[iIndex].value	=	frmRef.REF_01.options[frmRef.REF_01.selectedIndex].text
			window.opener.frm_810XSL.REF_02[iIndex].value		=	frmRef.REF_02.value
		}
		else
		{
			
			window.opener.frm_810XSL.REF_01  .value	=	frmRef.REF_01.options[frmRef.REF_01.selectedIndex].text
			window.opener.frm_810XSL.REF_02.value		=	frmRef.REF_02.value
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
<BODY text=black TopMargin=0 LeftMargin=0>
<%
DIM iIndex , REF_01 , REF_02

iIndex	=	Trim(Cint(Request.QueryString("Mode")))

If iIndex	=	0 Then 
	iIndex	=	1
Else
	iIndex	=	iIndex + 1
End if 
	if UCase(Request.QueryString("Create")) = "NEW" Then 
		REF_01	=	""
		REF_02	=	""
	Else
		On Error Resume Next 
		REF_01	=	f_CutStringFromCombo(Trim(Request.Form("REF_01")(iIndex)))
		REF_02	=	Trim(Request.Form("REF_02")(iIndex))
	End if 
%>
<Table Width=100% Cellpadding=0 cellspacing=0 height=100% bgcolor="#FFFFFF" border=0>
	<TR><BR>
		<TD align="center"><Font size=3><B>Edit Reference</Font></B></TD>
	</TR>
	<TR><TD><HR style="Color:Black"></TD></TR>
	<TR>
		<TD Bgcolor= "#ffffff" width=85% valign=top>
			<form method=post action='INV_REFRENCE.asp' name=frmRef onsubmit="return fillValues()">
				<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="white">
					<TR>
						<TD nowrap="nowrap"><IMG SRC="/images/pixel.gif" WIDTH=640 HEIGHT=1 ALT=""></TD>
					</TR>
					<tr> 
						<td align=center>
							  <table width='90%' class='header' border=0 align=center>
								<tr>
									<td width="35%" nowrap><b>Reference Identification Qualifier</b></td>
									<td><B>:</B></td>
									<td align="left" >
										<select class="inputText" name="REF_01" style='width:250'>
											<option value=''></option>
											<option value='IA' <%if REF_01 = "IA" Then%>Selected<%end if %>>IA Internal Vendor Number</option>
											<option value='DP' <%if REF_01 = "DP" Then%>Selected<%end if %>>DP Department Number</option>
											<option value='MR' <%if REF_01 = "MR" Then%>Selected<%end if %>>MR Merchandise Type Code</option>
										</select>
									</td>
								</tr>
								<tr>
									<td ><b>Reference ID</b></td>
									<td><B>:</B></td>
									<td align="left"><input type=text class="inputText" name="REF_02" MAXLENGTH='30' size=30 value="<%=REF_02%>"></td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><input Class=InputButton type="submit"  value="OK" style="Width:60" id=submit1 name=submit1><input Class=InputButton type="button"  onclick="window.close()" value="Cancel" style="Width:60" id=button1 name=button1></td>
					</tr>
				</table>
			</form>
		</TD>
	</TR>
</Table>
</body>
</html>
