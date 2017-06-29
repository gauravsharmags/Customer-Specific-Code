<!--#Include File="../../../../IncludeFile/Globalaspfunction.asp"-->

<%Response.Buffer	=	True%>
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
<HTML>
<head>
<title>Infoconn Systems | EDI | Add Invoice Terms</title>
<Link Rel=StyleSheet Type=Text/Css href="../../../../Includefile/infocon-global.css">

<SCRIPT LANGUAGE=javascript>
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
function isValidDate(dateStr,datef) 
{
		var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{4})$/;
		var matchArray = dateStr.match(datePat); 

		if (matchArray == null) 
		{
			alert("Please enter Date in MM/DD/YYYY format.");
			datef.select();
			datef.focus();
			return false;
		}

		month = matchArray[1];
		day = matchArray[3];
		year = matchArray[4];

		if (month < 1 || month > 12) 
		{ 
			alert("Month must be between 1 and 12.");
			datef.focus();
			return false;
		}

		if (day < 1 || day > 31) 
		{
			alert("Day must be between 1 and 31.");
			datef.focus();
			return false;
		}

		if ((month==4 || month==6 || month==9 || month==11) && day==31) 
		{
			alert("Month "+month+" doesn't have 31 days!");
			datef.focus();
			return false;
		}

		if (month == 2)
		{ 
			var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
			if (day>29 || (day==29 && !isleap)) 
			{
				alert("February " + year + " doesn't have " + day + " days!");
				datef.focus();
				return false;
			}
		}

return true;  
}
function validate()
{
	
	var iTrdRel		=	 '<%=Trim(Request.Form("hid_TradeRelID"))%>'
	var qty;
	
	if(frmTerms.ITD_01.value	== "")
	{
		alert("Please Select Terms Type Code")
		frmTerms.ITD_01.focus()
		return false
	}
	if(frmTerms.ITD_01.value == "05" && frmTerms.ITD_07.value == "")
	{
		alert("Please Enter Terms Net Days")
		frmTerms.ITD_07.select()
		return false
	}
	if(frmTerms.ITD_01.value == "08" && frmTerms.ITD_03.value == "")
	{
		alert("Please Enter Terms Discount Percent")
		frmTerms.ITD_03.select()
		return false
	}
	if(frmTerms.ITD_02.value	== "")
	{
		alert("Please Select Terms Basis Date Code")
		frmTerms.ITD_02.focus()
		return false
	}
	if(removeSpace(frmTerms.ITD_03)==false)
		{
			return false
		}
	
	if(frmTerms.ITD_03.value!="")
	{
		
		if(isNaN(frmTerms.ITD_03.value) || frmTerms.ITD_03.value<0)
		{
			
			alert("please Enter Valid Numeric Value  Discount Percent")
			frmTerms.ITD_03.select()
			return false
		}
	
		if(frmTerms.ITD_05.value=="")
		 {
		   	alert("please Enter Discount Days Due")
		   	frmTerms.ITD_05.select()
		   	return false
		 }
		 
	}
	
	
	if(frmTerms.ITD_08.value!="")
	{
		
		if(isNaN(frmTerms.ITD_08.value) || frmTerms.ITD_08.value<0)
		{
			
			alert("please Enter Valid Numeric Value  Discount Amount")
			frmTerms.ITD_08.select()
			return false
		}
	
		if(frmTerms.ITD_05.value=="")
		 {
		   	alert("please Enter Discount Days Due")
		   	frmTerms.ITD_05.select()
		   	return false
		 }
	}
	
	if(removeSpace(frmTerms.ITD_05)==false)
		{
			return false
		}
			
	if(frmTerms.ITD_05.value!="")
	{
		if(isNaN(frmTerms.ITD_05.value) || frmTerms.ITD_05.value<0)
		{
			alert("please Enter Valid Numeric Value  Terms Discount Days Due")
			frmTerms.ITD_05.select()
			return false
		}
	}
	if(frmTerms.ITD_07.value=="")
		 {
		   	alert("please Enter Terms Net Days")
		   	frmTerms.ITD_07.select()
		   	return false
		 }
	if(removeSpace(frmTerms.ITD_07)==false)
		{
			return false
		}
	
	if(frmTerms.ITD_07.value!="")
	{
		if(isNaN(frmTerms.ITD_07.value) || frmTerms.ITD_07.value<0)
		{
			alert("please Enter Valid Numeric Value  Terms Net Days")
			frmTerms.ITD_07.select()
			return false
		}
	}
	
	
	if(removeSpace(frmTerms.ITD_08)==false)
		{
			return false
		}
	
	
	return true
}
function isArray(obj)
{
	return(typeof(obj.length)=="undefined")?false:true;
}
function createRow()
{

var sContent = "<Table Border='0' bordercolor='black' width='100%'>"+
			"<TR id='TR_ITD_01' style='display:none'>"+
				"<TD nowrap='true'><b>Type Code</b></TD>"+
				"<TD><B>:</B></TD>"+
				"<TD><INPUT TYPE='text' Name='ITD_01' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='25' readonly='true' Class='inputtext' /></TD>"+
				"<TD nowrap='true'><b>Discount Percent</b></TD>"+
				"<TD><B>:</B></TD>"+
				"<TD><INPUT TYPE='text' Name='ITD_03' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='4' readonly='true' Class='inputtext' /></TD>"+
				"<TD nowrap='true'><b>Basis Date Code</b></TD>"+
				"<TD><B>:</B></TD>"+
				"<TD>"+
				"<INPUT TYPE='text' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true' size='20' name='ITD_02' /></TD>"+
				
				
				"<TD id='ITDHref' align='right'>[Edit]</TD>"+
			"</TR>"+
			"<TR id='TR_ITD_02' style='display:none'>"+
			
			   
				"<TD nowrap='true'><b>Discount Days Due</b></TD>"+
				"<TD width='1%' align='center'><B>:</B></TD>"+
				"<TD><INPUT TYPE='text' Name='ITD_05' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='4' readonly='true' Class='inputtext' /></TD>"+
				
				"<TD nowrap='true'><b>Net Days</b></TD>"+
				"<TD><B>:</B></TD>"+
				"<TD><INPUT TYPE='text' Name='ITD_07' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='4' readonly='true' Class='inputtext' /></TD>"+
				"<TD nowrap='true'><b>Discount Amount</b></TD>"+
				"<TD><B>:</B></TD>"+
				"<TD><INPUT TYPE='text' Name='ITD_08' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='10' readonly='true' Class='inputtext' /></TD>"+
			
			"</TR>"+
			"<TR id='TR_ITD_03' style='display:none'>"+
			
			   
				"<TD nowrap='true'><b>Description</b></TD>"+
				"<TD width='1%' align='center'><B>:</B></TD>"+
				"<TD colspan='7'><INPUT TYPE='text' Name='ITD_12' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='80' readonly='true' Class='inputtext' /></TD>"+
				
				
			
			"</TR>"+
									
		"</Table>"
//alert(window.opener.ITDTable_Header.rows.length)
window.opener.ITDTable_Header.insertRow(1)
window.opener.ITDTable_Header.rows(1).insertCell(0)
window.opener.ITDTable_Header.rows(1).cells(0).colSpan	=	"2"
window.opener.ITDTable_Header.rows(1).cells(0).innerHTML	= sContent

}
function checkVal()
{	
	var iIndex		=	"<%=Cint(Trim(Request.QueryString("Mode")))%>"
	var sMode		=	"<%=UCase(Request.QueryString("Create"))%>"
	iIndex= parseInt(iIndex)
	//validate() == 
	
	if (validate() == true)
	{
	    
		if(sMode == "NEW")
			{
				createRow()
			}
			if(isArray(window.opener.frm_810XSL.ITD_01) ==false)
			{
				window.opener.frm_810XSL.ITD_01.value	=	frmTerms.ITD_01.options[frmTerms.ITD_01.selectedIndex].text
				window.opener.frm_810XSL.ITD_02.value	=	frmTerms.ITD_02.options[frmTerms.ITD_02.selectedIndex].text
				window.opener.frm_810XSL.ITD_03.value	=	frmTerms.ITD_03.value
				
				window.opener.frm_810XSL.ITD_05.value	=	frmTerms.ITD_05.value
				
				window.opener.frm_810XSL.ITD_07.value	=	frmTerms.ITD_07.value
				window.opener.frm_810XSL.ITD_08.value	=	frmTerms.ITD_08.value
				window.opener.frm_810XSL.ITD_12.value	=	frmTerms.ITD_12.value
				
			
			
				if (frmTerms.ITD_01.value != '' || frmTerms.ITD_02.value != '' || frmTerms.ITD_03.value != '')
				{
					window.opener.TR_ITD_01.style.display = "INLINE"
				}
				else 
				{
					window.opener.TR_ITD_01.style.display = "NONE"
				}	
			
							
				if (frmTerms.ITD_05.value != '' || frmTerms.ITD_08.value != '' || frmTerms.ITD_07.value != '')
				{
					window.opener.TR_ITD_02.style.display = "INLINE"
				}
				else 
				{
					window.opener.TR_ITD_02.style.display = "NONE"
				}	
				
				if (frmTerms.ITD_12.value != '')
				{
					window.opener.TR_ITD_03.style.display = "INLINE"
				}
				else 
				{
					window.opener.TR_ITD_03.style.display = "NONE"
				}	
				
			}
			else
			{
				window.opener.frm_810XSL.ITD_01[iIndex].value	=	frmTerms.ITD_01.options[frmTerms.ITD_01.selectedIndex].text
				window.opener.frm_810XSL.ITD_02[iIndex].value	=	frmTerms.ITD_02.options[frmTerms.ITD_02.selectedIndex].text
				window.opener.frm_810XSL.ITD_03[iIndex].value	=	frmTerms.ITD_03.value
				
				window.opener.frm_810XSL.ITD_05[iIndex].value	=	frmTerms.ITD_05.value
				
				window.opener.frm_810XSL.ITD_07[iIndex].value	=	frmTerms.ITD_07.value
				window.opener.frm_810XSL.ITD_08[iIndex].value	=	frmTerms.ITD_08.value
				window.opener.frm_810XSL.ITD_12[iIndex].value	=	frmTerms.ITD_12.value
				
			    
			
				if (frmTerms.ITD_01.value != '' || frmTerms.ITD_02.value != '' || frmTerms.ITD_03.value != '')
				{
					window.opener.TR_ITD_01[iIndex].style.display = "INLINE"
				}
				else 
				{
					window.opener.TR_ITD_01[iIndex].style.display = "NONE"
				}	
			
							
				if (frmTerms.ITD_05.value != '' || frmTerms.ITD_08.value != '' || frmTerms.ITD_07.value != '')
				{
					window.opener.TR_ITD_02[iIndex].style.display = "INLINE"
				}
				else 
				{
					window.opener.TR_ITD_02[iIndex].style.display = "NONE"
				}
				
				if (frmTerms.ITD_12.value != '')
				{
					window.opener.TR_ITD_03[iIndex].style.display = "INLINE"
				}
				else 
				{
					window.opener.TR_ITD_03[iIndex].style.display = "NONE"
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
<%
	
if UCase(Request.QueryString("Create")) = "NEW" Then 
		ITD_01		=	""
		ITD_02		=	""
		ITD_03		=	""
		ITD_05		=	""
		ITD_07		=	""
		ITD_08		=	""
		ITD_12		=	""
		
	else
		ITD_01		=	f_CutStringFromCombo(Trim(Request.Form("ITD_01")(iIndex)))
		ITD_02		=	f_CutStringFromCombo(Trim(Request.Form("ITD_02")(iIndex)))
		ITD_03		=	Trim(Request.Form("ITD_03")(iIndex))	
		
		ITD_05		=	Trim(Request.Form("ITD_05")(iIndex))
		
		ITD_07		=	Trim(Request.Form("ITD_07")(iIndex))
		ITD_08		=	Trim(Request.Form("ITD_08")(iIndex))
		ITD_12		=	Trim(Request.Form("ITD_12")(iIndex))
		
		
end if		
	on error resume next 
	if Err.number <> 0 then 
		Response.Write "Error2 Occured  = "&Err.number
		Response.End
	end if 

%>
<BODY text=black TopMargin=0 LeftMargin=0>
<Table Width=100%  Cellpadding=0 cellspacing=0 height=100% bgcolor="#FFFFFF" border=0>
	<TR>
		<TD valign=top></TD>
	</TR>
	<TR>
		<TD Bgcolor= "#ffffff" width=85% valign=top>
<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="white">
<tr> 
<td align="center">
<form method=post Action="Inv_Terms.asp"  name=frmTerms onSubmit="return checkVal();">
<table width='80%' class='header' align="center" border="0">
	<tr>
		<td colspan=2 align=center><b>Edit Terms</b></td>
	</tr>
	<tr>
		<td colspan=2 width="100%"><hr color="navy"></td>
	</tr>
	</table>
<table width='100%' class='header' align="center" border="0" >
	<tr>
		<td align="right"><b>Terms Type Code</b><TD>:</TD></td>
		<td align="left">
			<select class="inputText" name="ITD_01" style="width:200">
				<option value=""></option>
				<Option value='02'<%if ITD_01="02" then%>	selected <%end if%>>02 End of Month</Option>
				<Option value='05'<%if ITD_01="05" then%>	selected <%end if%> >05 Discount Not Applicable</Option>				
				<Option value='08'<%if ITD_01="08" then%>	selected <%end if%> >08 Basic Discount Offered</Option>
		    </select>
		</td>
	</tr>
	<tr>
		<td align="right"><b>Basis Date Code</b><TD>:</TD></td>
		<td align="left">
			<select class="inputText" name="ITD_02" style="width:200">
				<option value=""></option>				
				<Option value='1' <%if ITD_02="1" then%>	selected <%end if%> >1 Ship Date</Option>
				<Option value='3' <%if ITD_02="3" then%>	selected <%end if%> >3 Invoice Date</Option>
				<Option value='7' <%if ITD_02="7" then%>	selected <%end if%> >7 Effective Date</Option>
				<Option value='15' <%if ITD_02="15" then%>	selected <%end if%> >15 Receipt of Goods</Option>
			</select>
		</td>
	</tr>
	<tr>
		<td align="right"><b>Terms Discount percent<TD>:</TD></b></td>
		<td align="left"><input class="inputText" type=text name="ITD_03" size=6 maxlength=6 value="<%=ITD_03%>"> </td>
	</tr>

	
	<tr>
		<td align="right"><b>Terms Discount Days due<TD>:</TD></b></td>
		<td><input class="inputText" type=text name="ITD_05" maxlength=3 value="<%=ITD_05%>"> </td>
	</tr>

	<tr>
		<td align="right"><b>Terms Net days<TD>:</TD></b></td>
		<td><input class="inputText" type=text name="ITD_07" maxlength=3 value="<%=ITD_07%>"></td>
	</tr>
	<tr>
		<td align="right"><b>Discount Amount<TD>:</TD></b></td>
		<td><input class="inputText" type=text name="ITD_08" maxlength=10 value="<%=ITD_08%>"></td>
	</tr>
	<tr>
		<td align="right"><b>Description<TD>:</TD></b></td>
		<td><textarea name="ITD_12" cols="30" rows="3"><%=ITD_12%></textarea></td>
	</tr>
		
	
	<tr align="left" >
	<TD></TD>
	<td colspan="2"><input type=submit  value="OK" name="buttonTerms" Class=InputButton style="width:50"><input type=button value="Cancel" name="buttonTerms" Class=InputButton onclick="window.close()"></TD>
	</TR>
</table>
</form>
</td></tr>
</table>
</TD>
</TR>
<TR>
	<TD Colspan=4>&nbsp;</TD>
</TR>
<TR>
	<TD  Valign=Top Colspan=4></TD>
</TR>
</Table>
</body>
</html>

