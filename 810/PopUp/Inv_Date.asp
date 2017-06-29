<!--#Include File="../../../../IncludeFile/Globalaspfunction.asp"-->
<%Response.Buffer = True %>

<head>
<title>Infoconn Systems | EDI | Add/Edit Date</title>
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
function isArray(obj){return(typeof(obj.length)=="undefined")?false:true;}
function validate()
{
	if(frmDate.DTM_02.value=="")
	{
		alert("Please enter value in Date")
		frmDate.DTM_02.select()
		return false
	}
	if(removeSpace(frmDate.DTM_02)!= true)
	{
		return false
	}
	if(isValidDate(frmDate.DTM_02.value,frmDate.DTM_02) == false)
	{
		return false
	}
	if(frmDate.DTM_02.value=="" && frmDate.DTM_01.value!="")
	{
		alert("Please enter value in Date")
		frmDate.DTM_02.select()
		return false
	}
	if(frmDate.DTM_01.value=="" && frmDate.DTM_02.value!="")
	{
		alert("Please select Date qualifier")
		frmDate.DTM_01.focus()
		return false
	}
	return true
}

function CreateRow()
{
		window.opener.DateTimeTable.insertRow(1)
		window.opener.DateTimeTable.rows(1).insertCell(0)
		window.opener.DateTimeTable.rows(1).cells(0).innerHTML	="<Input type='text' Name='DTM_01' Class='inputText' readonly='true' size='67' style='Border-Top:0;Border-Bottom:0;Border-Left:0;Border-Right:0;'>" 
								
		window.opener.DateTimeTable.rows(1).insertCell(1)
		window.opener.DateTimeTable.rows(1).cells(1).innerHTML = "<Input type='text' Name='DTM_02' Class='inputText' size='35' readonly='true' style='Border-Top:0;Border-Bottom:0;Border-Left:0;Border-Right:0;'> " 
		window.opener.DateTimeTable.rows(1).insertCell(2)
		window.opener.DateTimeTable.rows(1).cells(2).id		=	"DTMHref"
		window.opener.DateTimeTable.rows(1).cells(2).style.textAlign = "center"
}

function CheckVal()
{
	var iIndex		=	"<%=Request.Querystring("Mode")%>"
	var bNewFlag	=	"<%=Request.QueryString("Create")%>"
	
	iIndex		=	parseInt(iIndex)
	if(validate() == true)	
	{
		if(bNewFlag.toUpperCase() == "NEW")
		{				
			CreateRow()	
		}
		if(isArray(window.opener.frm_810XSL.DTM_01)==true)
		{
			
			window.opener.frm_810XSL.DTM_01[iIndex].value	=	frmDate.DTM_01.options[frmDate.DTM_01.selectedIndex].text
			window.opener.frm_810XSL.DTM_02[iIndex].value		=	frmDate.DTM_02.value
		}
		else
		{
			window.opener.frm_810XSL.DTM_01.value	=	frmDate.DTM_01.options[frmDate.DTM_01.selectedIndex].text
			window.opener.frm_810XSL.DTM_02.value		=	frmDate.DTM_02.value
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
Dim iIndex 
iIndex	=	Trim(Cint(Request.QueryString("Mode")))

If iIndex	=	0 Then 
	iIndex	=	1
Else
	iIndex	=	iIndex + 1
End if 
	if UCase(Request.QueryString("Create")) = "NEW" Then 
		DTM_01	=	""
		DTM_02	=	""
	Else
		On Error Resume Next 
		DTM_01	=	f_CutStringFromCombo(Trim(Request.Form("DTM_01")(iIndex)))		
		DTM_02	=	Trim(Request.Form("DTM_02")(iIndex))
		
	End if 
	
%>
	<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="white">
		
		<TR>
			<TD align="center"><BR><Font Size=3><B>Add / Edit Date</B></Font></TD>
		</TR>
		<TR>
			<TD><hr style="color:black;width:100%"></TD>
		</TR>
		<tr> 
			<td>
			<form method=post Action="Inv_Date.asp" name=frmDate ONSUBMIT="return CheckVal()">
				<table width='100%'  border=0>
					<tr>
						<td align="right"><b>Date qualifier:</b></td>
						<td align="left">
							<select class="inputText" name="DTM_01" style="Width:150">	
							<option value=""></option>							
								<option value='011' <%if DTM_01 = "011" then%>selected<%end if%>>011 Shipped</option>
								<option value='007' <%if DTM_01 = "007" then%>selected<%end if%>>007 Effective</option>
							</select>
						</td>
					</tr>
					<tr>
						<td align="right"><b>Date:</b></td>
						<td align="left"><input class="inputText" type=text Name="DTM_02"  maxlength=10 value="<%=DTM_02%>">&nbsp;&nbsp;<Font color=silver Size=2>MM/DD/YYYY</Font></td>
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
<%
''''*************
'''function accepts date value and retrun value 
''''in specific formatt

''''*************
function dateFor(sDate)
	sDate=	Replace(sDate,"-","")
	dd	=	mid(trim(sDate),7,2)
	mm	=	mid(trim(sDate),5,2)
	yy	=	left(sDate,4)
	Response.Write  mm&"/"&dd&"/"&yy
	'''MM/DD/YYYY'''
end function

%>