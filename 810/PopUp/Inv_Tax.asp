<!--#Include File="../../../../IncludeFile/Globalaspfunction.asp"-->
<%Response.Buffer = True %>
<%dim iIndex
	iIndex  = Trim(Cint(Request.QueryString("Mode")))
	
	if iIndex	=	0 Then 
			iIndex = 1
	Else	
		iIndex	=	  iIndex + 1
	End if 
	on error resume next 
	if Err.number <> 0 then 
		Response.Write "Error Occured  = "&Err.number
	end if 
	%>
<head>
<title>Infoconn Systems | EDI | Add/Edit Date</title>
<Link Rel=StyleSheet Type=Text/Css href="../../../../Includefile/infocon-global.css">

<SCRIPT LANGUAGE=javascript>
var iIndex		=	"<%=Request.Querystring("Mode")%>"

function isArray(obj){return(typeof(obj.length)=="undefined")?false:true;}

function change(objectBox)
{
	var str=objectBox.value.toString();
	var str1;
	i=str.indexOf(".")
	if(i!= -1)
	{
		len1=str.length;
		str1=str.substring(i+1,len1);
		if(parseInt(str1,10)==0)
		objectBox.value=parseInt(str,10)
	}
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
	if(removeSpace(document.frmTax.TAX_02) != true)
	{
		return false
	}
	if(removeSpace(document.frmTax.TAX_03) != true)
	{
		return false
	}
	if(removeSpace(document.frmTax.TAX_05) != true)
	{
		return false
	}if(removeSpace(document.frmTax.TAX_08) != true)
	{
		return false
	}
	if(removeSpace(document.frmTax.TAX_09) != true)
	{
		return false
	}
	if(frmTax.TAX_01.value=="")
	{
		alert("Please select TaxID")
		frmTax.TAX_01.focus()
		return false
	}
	if(frmTax.TAX_01.value=="PG" && frmTax.TAX_04.value=="")
	{
		alert("Please select Tax Jurisdiction Code Qualifier")
		frmTax.TAX_04.focus()
		return false
	}
	if(frmTax.TAX_02.value=="")
	{
		alert("Please Enter Monetary Amount")
		frmTax.TAX_02.select()
		return false
	}
	if(frmTax.TAX_03.value=="")
	{
		alert("Please Enter Percent")
		frmTax.TAX_03.select()
		return false
	}
	if(frmTax.TAX_02.value!="")
	{
		if(isNaN(frmTax.TAX_02.value))
		{
			alert("Please enter valid numeric value in Monetary Amount field")
			frmTax.TAX_02.select()
			frmTax.TAX_02.focus()
			return false
		}
	}	
	if(frmTax.TAX_03.value!="")
	{
		if(isNaN(frmTax.TAX_03.value))
		{
			alert("Please enter valid numeric value in Percent field")
			frmTax.TAX_03.select()
			frmTax.TAX_03.focus()
			return false
		}
	}
	if(frmTax.TAX_04.value=="" && frmTax.TAX_05.value!="")
	{
		alert("Please Select Jurisdiction Code Qualifier")
		frmTax.TAX_04.focus()
		return false
	}
	if(frmTax.TAX_04.value!="" && frmTax.TAX_05.value=="")
	{
		alert("Please Enter Jurisdiction Code ")
		frmTax.TAX_05.focus()
		return false
	}		
	return true
}
function createRow()
{
var sContent = "<Table Border='0' bordercolor='black' width='100%'>"+
			"<TR id='TR_TXI_01' style='display:none'>"+
				"<TD nowrap='true'>Type Code</TD>"+
				"<TD><B>:</B></TD>"+
				"<TD><INPUT TYPE='text' Name='TXI_01' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='20' readonly='true' Class='inputtext' /></TD>"+
				"<TD nowrap='true'>Monetory amount</TD>"+
				"<TD><B>:</B></TD>"+
				"<TD><INPUT TYPE='text' Name='TXI_02' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='12' readonly='true' Class='inputtext' /></TD>"+
				"<TD nowrap='true'>Percent</TD>"+
				"<TD><B>:</B></TD>"+
				"<TD>"+
				"<INPUT TYPE='text' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true' size='10' name='TXI_03' /></TD>"+
				
				"<TD id='TXIHref' align='right'>[Edit]</TD>"+
			"</TR>"+
			"<TR id='TR_TXI_02' style='display:none'>"+
				"<TD nowrap='true'>Jurisdiction Code Qual.</TD>"+
				"<TD width='1%' align='center'><B>:</B></TD>"+
				"<TD><INPUT TYPE='text' Name='TXI_04' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='20' readonly='true' Class='inputtext' /></TD>"+
				"<TD nowrap='true'>Jurisdiction Code</TD>"+
				"<TD><B>:</B></TD>"+
				"<TD><INPUT TYPE='text' Name='TXI_05' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='12' readonly='true' Class='inputtext' /></TD>"+
				"<TD nowrap='true'>Basis For Percent</TD>"+
				"<TD><B>:</B></TD>"+
				"<TD><INPUT TYPE='text' Name='TXI_08' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='15' readonly='true' Class='inputtext' /></TD>"+
			"</TR>"+
			"<TR id='TR_TXI_03' style='display:none'>"+
                "<TD nowrap='true'>Tax ID Number</TD>"+
				"<TD><B>:</B></TD>"+
				"<TD><INPUT TYPE='text' Name='TXI_09' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='15' readonly='true' Class='inputtext' /></TD>"+
			
			"</TR>"+						
		"</Table>"

window.opener.TXITable_Header.insertRow(1)
window.opener.TXITable_Header.rows(1).insertCell(0)
window.opener.TXITable_Header.rows(1).cells(0).colSpan	=	"2"
window.opener.TXITable_Header.rows(1).cells(0).innerHTML	= sContent
}
function CheckVal()
{
	
	var iIndex		=	"<%=Cint(Trim(Request.QueryString("Mode")))%>"
	var sMode		=	"<%=UCase(Request.QueryString("Create"))%>"
	iIndex= parseInt(iIndex)
	if(validate() == true)
	
	{	
		if(sMode == "NEW")
		{
			createRow()
		}
		
		if(isArray(window.opener.frm_810XSL.TXI_01) == true)
		{
			window.opener.frm_810XSL.TXI_01[iIndex].value	=	frmTax.TAX_01.options[frmTax.TAX_01.selectedIndex].text
			
			window.opener.frm_810XSL.TXI_02[iIndex].value	=	frmTax.TAX_02.value
			window.opener.frm_810XSL.TXI_03[iIndex].value	=	frmTax.TAX_03.value
			window.opener.frm_810XSL.TXI_04[iIndex].value	=	frmTax.TAX_04.options[frmTax.TAX_04.selectedIndex].text
			window.opener.frm_810XSL.TXI_05[iIndex].value	=	frmTax.TAX_05.value
            window.opener.frm_810XSL.TXI_08[iIndex].value	=	frmTax.TAX_08.value
			window.opener.frm_810XSL.TXI_09[iIndex].value	=	frmTax.TAX_09.value
			if(frmTax.TAX_01.value!="")
			{
				window.opener.TR_TXI_01[iIndex].style.display	=	"INLINE"
			}
			else
			{
				window.opener.TR_TXI_01[iIndex].style.display	=	"NONE"
			}
			if(frmTax.TAX_04.value!="" || frmTax.TAX_08.value!="" || frmTax.TAX_09.value!="")
			{
				window.opener.TR_TXI_02[iIndex].style.display	=	"INLINE"
			}
			else
			{
				window.opener.TR_TXI_02[iIndex].style.display	=	"NONE"
			}
            if(frmTax.TAX_09.value!="")
			{
				window.opener.TR_TXI_03[iIndex].style.display	=	"INLINE"
			}
			else
			{
				window.opener.TR_TXI_03[iIndex].style.display	=	"NONE"
			}
		}
		else
		{
			window.opener.frm_810XSL.TXI_01.value	=	frmTax.TAX_01.options[frmTax.TAX_01.selectedIndex].text
			
			window.opener.frm_810XSL.TXI_02.value	=	frmTax.TAX_02.value
			window.opener.frm_810XSL.TXI_03.value	=	frmTax.TAX_03.value
			window.opener.frm_810XSL.TXI_04.value	=	frmTax.TAX_04.options[frmTax.TAX_04.selectedIndex].text
			window.opener.frm_810XSL.TXI_05.value	=	frmTax.TAX_05.value
            window.opener.frm_810XSL.TXI_08.value	=	frmTax.TAX_08.value
			window.opener.frm_810XSL.TXI_09.value	=	frmTax.TAX_09.value
			if(frmTax.TAX_01.value!="")
			{
				window.opener.TR_TXI_01.style.display	=	"INLINE"
			}
			else
			{
				window.opener.TR_TXI_01.style.display	=	"NONE"
			}
			if(frmTax.TAX_04.value!="" || frmTax.TAX_08.value!="" || frmTax.TAX_09.value!="")
			{
				window.opener.TR_TXI_02.style.display	=	"INLINE"
			}
			else
			{
				window.opener.TR_TXI_02.style.display	=	"NONE"
			}
            if(frmTax.TAX_09.value!="")
			{
				window.opener.TR_TXI_03.style.display	=	"INLINE"
			}
			else
			{
				window.opener.TR_TXI_03.style.display	=	"NONE"
			}
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
<Html>
<BODY  text=black TopMargin=0 LeftMargin=0>
<%


	if UCase(Request.QueryString("Create")) = "NEW" Then 
		
	
	else
		TAX_01	=	f_CutStringFromCombo(Trim(Request.Form("TXI_01")(iIndex))) '' Tax TYpe Code 
		TAX_02	=	Trim(Request.Form("TXI_02")(iIndex))  ''Location ID
		TAX_03	=	Trim(Request.Form("TXI_03")(iIndex))
		TAX_04	=	f_CutStringFromCombo(Trim(Request.Form("TXI_04")(iIndex)))
		TAX_05	=	Trim(Request.Form("TXI_05")(iIndex))
        TAX_08	=	Trim(Request.Form("TXI_08")(iIndex))
		TAX_09	=	Trim(Request.Form("TXI_09")(iIndex))
	End if 
	
	
%>
	<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="white">
		<TR>
			<TD align="center"><BR><Font Size=3><B>Add / Edit Tax Detail</B></Font></TD>
		</TR>
		<TR>
			<TD><hr style="color:black;width:100%"></TD>
		</TR>
		<tr> 
			<td>
			<form method=post Action="Inv_Tax.asp" name=frmTax ONSUBMIT="return CheckVal()">
				<table width='100%'  border=0>
					<tr>
						<td align="right"><b>Tax ID:</b></td>
						<td align="left">
							<Select Name="TAX_01" class="inputtext" style="WIDTH:300">
								<Option value=''></option>
								<Option value='BE' <%if TAX_01 = "BE" Then%>selected<%end if%>>BE Harmonized Sales Tax</option>
								<Option value='GS' <%if TAX_01 = "GS" Then%>selected<%end if%>>GS Goods and Service Tax</option>
								<Option value='PG' <%if TAX_01 = "PG" Then%>selected<%end if%>>PG State or Province Tax on Goods</option>
							</Select>
						</td>
					</tr>
					<tr>
						<td align="right"><b>Monetary Amount :</b></td>
						<td align="left">
							<Input type=text class="inputText" name="TAX_02" maxlength="18" value="<%=TAX_02%>" onchange="javaScript:change(frmTax.TAX_02)">
						</td>
					</tr>
					<tr>
						<td align="right"><b>Percent :</b></td>
						<td align="left">
							<Input type=text class="inputText" name="TAX_03" maxlength="10" value="<%=TAX_03%>" onchange="javaScript:change(frmTax.TAX_03)">
						</td>
					</tr>
					<tr>
						<td align="right"><b>Jurisdiction code Qual:</b></td>
						<td align="left">
							<Select Name="TAX_04" class="inputtext" style="WIDTH:300">
								<Option value=''></option>
								<Option value='SP' <%if TAX_04 = "SP" Then%>selected<%end if%>>SP State or Province</option>
								
							</Select>
						</td>
					</tr>
					<tr>
						<td align="right"><b>Jurisdiction Code :</b></td>
						<td align="left">
							<Input type=text class="inputText" name="TAX_05" maxlength="10" value="<%=TAX_05%>">
						</td>
					</tr>
                    <tr>
						<td align="right"><b>Basis For Percent:</b></td>
						<td align="left">
							<Input type=text class="inputText" name="TAX_08" maxlength="20" value="<%=TAX_08%>" ID="Text2">
						</td>
					</tr>				
					<tr>
						<td align="right"><b>Tax ID Number:</b></td>
						<td align="left">
							<Input type=text class="inputText" name="TAX_09" maxlength="20" value="<%=TAX_09%>" ID="Text1">
						</td>
					</tr>	
					<tr>
						<td colspan="2" align="center"><input type=Submit value="OK" style="width:70" name="buttonDate" Class=Inputbutton><input type=button onclick="window.close()" value="Cancel"  style="width:70" name="buttonDate" Class=Inputbutton></td>
					</tr>
				</table>
			</form>
	</td></tr>
</table>
</body>
</html>

