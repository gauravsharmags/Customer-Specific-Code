<!--#Include File="../../../../IncludeFile/Globalaspfunction.asp"-->
<!--#Include File="../../../../IncludeFile/Connection.asp"-->
<!---------#Include File="../../../../IncludeFile/adovbs.inc"---->
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
	<title>Infoconn Systems | EDI | Add/Edit Allowance/Charge Details</title>
	<Link Rel="StyleSheet" Type="Text/Css" href="../../../../Includefile/infocon-global.css">
		<SCRIPT LANGUAGE="javascript">
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
	if(removeSpace(frmAllowance.SAC_05)== false)
	{
		return false
	}
	if(removeSpace(frmAllowance.SAC_07)== false)
	{
		return false
	}
	if(removeSpace(frmAllowance.SAC_08)== false)
	{
		return false
	}
	if(removeSpace(frmAllowance.SAC_10)== false)
	{
		return false
	}
	if(removeSpace(frmAllowance.SAC_13)== false)
	{
		return false
	}
	if(removeSpace(frmAllowance.SAC_14)== false)
	{
		return false
	}
	if(removeSpace(frmAllowance.SAC_15)== false)
	{
		return false
	}
	if(removeSpace(frmAllowance.SAC_16)== false)
	{
		return false
	}
	if(frmAllowance.SAC_01.value=="")
	{
		alert("Please Select Allowance Charge Indicator")
		frmAllowance.SAC_01.focus()
		return false
	}
	if(frmAllowance.SAC_01.value!="" && frmAllowance.SAC_05.value=="")
	 {
	    alert(" Please Enter Allowance/Charge Amount")
		frmAllowance.SAC_05.focus()
		return false
	 }
	if(frmAllowance.SAC_02.value == '')
	{
		alert("Please Select Service/Promotion Code")
		frmAllowance.SAC_02.focus()
		return false
	}
	if(frmAllowance.SAC_07.value!="" && frmAllowance.SAC_06.value=="")
	{
		alert("Please Select Percent Qualifier")
		frmAllowance.SAC_06.focus()
		return false
	}
	if(frmAllowance.SAC_07.value=="" && frmAllowance.SAC_06.value!="")
	{
		alert("Please Enter Percent")
		frmAllowance.SAC_07.select()
		return false
	}
	if(frmAllowance.SAC_02.value=="D170" && frmAllowance.SAC_10.value=="")
	{
		alert("Please Enter Quantity")
		frmAllowance.SAC_10.select()
		return false
	}
	if(frmAllowance.SAC_01.value=="A" && frmAllowance.SAC_12.value=="06")
	{
		alert("Handling Code '06' is only used for Indicator 'C'")
		frmAllowance.SAC_12.focus()
		return false
	}
	if(frmAllowance.SAC_09.value=="" && frmAllowance.SAC_10.value!="")
	{
		alert("Please Select UOM in Allowance/Charge")
		frmAllowance.SAC_09.focus()
		return false
	}
	if(frmAllowance.SAC_09.value!="" && frmAllowance.SAC_10.value=="")
	{
		alert("Please Enter Quantity")
		frmAllowance.SAC_10.select()
		return false
	}
	if(frmAllowance.SAC_13.value!="" && frmAllowance.SAC_02.value=="")
	{
		alert("Please Select Service/Promotion Code")
		frmAllowance.SAC_02.focus()
		return false
	}
	if(frmAllowance.SAC_14.value!="" && frmAllowance.SAC_13.value=="")
	{
		alert("Please Enter Reference ID")
		frmAllowance.SAC_13.select()
		return false
	}
	if(frmAllowance.SAC_16.value!="" && frmAllowance.SAC_15.value=="")
	{
		alert("Please Enter Description")
		frmAllowance.SAC_15.select()
		return false
	}
	if(frmAllowance.SAC_05.value =='')
	{
		alert("Please Enter Amount")
		frmAllowance.SAC_05.focus()
		return false
	}
		
	
	if(frmAllowance.SAC_05.value!="" && (isNaN(frmAllowance.SAC_05.value) || frmAllowance.SAC_05.value<= 0))
	{
		alert("Please Enter Valid Amount")
		frmAllowance.SAC_05.select()
		return false
	}
	if(frmAllowance.SAC_07.value!="")
	 {
		if((frmAllowance.SAC_07.value<=0) || (isNaN(frmAllowance.SAC_07.value)))
		{
			alert("Please Enter numeric Percent")
			frmAllowance.SAC_07.select()
			return false
		}
     } 
     if(frmAllowance.SAC_08.value!="")
	 {
		if((frmAllowance.SAC_08.value<=0) || (isNaN(frmAllowance.SAC_08.value)))
		{
			alert("Please Enter numeric Rate")
			frmAllowance.SAC_08.select()
			return false
		}
     }
     if(frmAllowance.SAC_10.value!="")
	 {
		if((frmAllowance.SAC_10.value<=0) || (isNaN(frmAllowance.SAC_10.value)))
		{
			alert("Please Enter numeric Quantity")
			frmAllowance.SAC_10.select()
			return false
		}
     }
	
		
	return true
	
}
function createRow()
{
var sContent = "<Table Border='0' Width='100%' bordercolor='black' cellspacing='2' Cellpadding='1' style='Border-Collapse:Collapse' bgColor='white' ID='Table1'>"+
"												<TR id='TR_SAC_Row1' style='display:none'>"+
"													<TD nowrap='true'>"+
"														<B>Indicator</B>"+
"													</TD>"+
"													<TD>"+
"														<INPUT TYPE='text' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true' size='15' name='SAC_SAC_01' ID='Text1'>"+
"															</INPUT>"+
"													</TD>"+
"													<TD>"+
"														<B>Code</B>"+
"													</TD>"+
"													<TD>"+
"														<INPUT TYPE='text' Class='inputtext' style='TEXT-ALIGN:left;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true' size='45' name='SAC_SAC_02' ID='Text2'>"+
"															</INPUT>"+
"													</TD>"+
"													<TD>"+
"														<B>Amount</B>"+
"													</TD>"+
"													<TD>"+
"														<INPUT TYPE='text' Class='inputtext' name='SAC_SAC_05' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true' size='15' ID='Text3'>"+
"															</INPUT>"+
"													</TD>"+
"													<TD id='SACHref'></TD>"+
"												</TR>"+
"												<TR id='TR_SAC_Row2' style='display:none'>"+
"													<TD>"+
"														<b>Percent Qualifier</b>"+
"													</TD>"+
"													<TD>"+
"														<INPUT TYPE='text' name='SAC_SAC_06' Class='inputtext' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='40' ID='Text4'>"+
"															</INPUT>"+
"													</TD>"+
"													<TD>"+
"														<font color='000000'>"+
"															<b>Percent</b>"+
"														</font>"+
"													</TD>"+
"													<TD>"+
"														<INPUT TYPE='text' name='SAC_SAC_07' Class='inputtext' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='6' ID='Text5'>"+
"															</INPUT>"+
"													</TD>"+
"													<TD>"+
"														<font color='000000'>"+
"															<b>Rate</b>"+
"														</font>"+
"													</TD>"+
"													<TD>"+
"														<INPUT TYPE='text' name='SAC_SAC_08' Class='inputtext' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='7' ID='Text6'>"+
"															</INPUT>"+
"													</TD>"+
"												</TR>"+
"												<TR id='TR_SAC_Row3' style='display:none'>"+
"													<TD>"+
"														<b>UOM</b>"+
"													</TD>"+
"													<TD>"+
"														<INPUT TYPE='text' name='SAC_SAC_09' Class='inputtext' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='10' ID='Text7'>"+
"															</INPUT>"+
"													</TD>"+
"													"+
"													<TD nowrap='true'>"+
"														<B>Handling Code</B>"+
"													</TD>"+
"													<TD>"+
"														<INPUT TYPE='text' Class='inputtext' style='TEXT-ALIGN:left;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true' size='30' name='SAC_SAC_12' ID='Text8'>"+
"															</INPUT>"+
"													</TD>"+
"													<TD>"+
"														<font color='000000'>"+
"															<b>Quantity</b>"+
"														</font>"+
"													</TD>"+
"													<TD>"+
"														<INPUT TYPE='text' name='SAC_SAC_10' Class='inputtext' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='7' ID='Text9'>"+
"															</INPUT>"+
"													</TD>"+
"												</TR>"+
"												<TR id='TR_SAC_Row4' style='display:none'>"+
"													<TD>"+
"														<b>Reference ID</b>"+
"													</TD>"+
"													<TD>"+
"														<INPUT TYPE='text' name='SAC_SAC_13' Class='inputtext' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='40' ID='Text10'>"+
"															</INPUT>"+
"													</TD>"+
"													<TD>"+
"														<font color='000000'>"+
"															<b>Option No.</b>"+
"														</font>"+
"													</TD>"+
"													<TD>"+
"														<INPUT TYPE='text' name='SAC_SAC_14' Class='inputtext' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='25' ID='Text11'>"+
"															</INPUT>"+
"													</TD>"+
"													<TD nowrap='true'>"+
"														<B>Language Code</B>"+
"													</TD>"+
"													<TD>"+
"														<INPUT TYPE='text' Class='inputtext' style='TEXT-ALIGN:left;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true' size='15' name='SAC_SAC_16' ID='Text12'>"+
"															</INPUT>"+
"													</TD>"+
"												</TR>"+
"												<TR id='TR_SAC_Row5' style='display:none'>"+
"													<TD nowrap='true'>"+
"														<B>Description</B>"+
"													</TD>"+
"													<TD colspan='5'>"+
"														<INPUT TYPE='text' Class='inputtext' style='TEXT-ALIGN:left;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true' size='80' name='SAC_SAC_15' ID='Text13'>"+
"															</INPUT>"+
"													</TD>"+
"												</TR>"+
"											</Table>"

BGCOLOR="#FFFFFF"
window.opener.SacTable_Header.insertRow(1)
//window.opener.SacTable_Header.rows(1).BGCOLOR="#FFFFFF"
window.opener.SacTable_Header.rows(1).insertCell(0)
window.opener.SacTable_Header.rows(1).cells(0).colSpan	=	"2"
window.opener.SacTable_Header.rows(1).cells(0).innerHTML	= sContent
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
		
		if(isArray(window.opener.frm_810XSL.SAC_SAC_01) == true)
		{
		window.opener.frm_810XSL.SAC_SAC_01[iIndex].value	=	frmAllowance.SAC_01.options[frmAllowance.SAC_01.selectedIndex].text
		window.opener.frm_810XSL.SAC_SAC_02[iIndex].value	=	frmAllowance.SAC_02.options[frmAllowance.SAC_02.selectedIndex].text
		window.opener.frm_810XSL.SAC_SAC_05[iIndex].value	=	frmAllowance.SAC_05.value
		window.opener.frm_810XSL.SAC_SAC_06[iIndex].value	=	frmAllowance.SAC_06.options[frmAllowance.SAC_06.selectedIndex].text
		window.opener.frm_810XSL.SAC_SAC_07[iIndex].value	=	frmAllowance.SAC_07.value
		window.opener.frm_810XSL.SAC_SAC_08[iIndex].value	=	frmAllowance.SAC_08.value
		window.opener.frm_810XSL.SAC_SAC_09[iIndex].value	=	frmAllowance.SAC_09.options[frmAllowance.SAC_09.selectedIndex].text
		window.opener.frm_810XSL.SAC_SAC_10[iIndex].value	=	frmAllowance.SAC_10.value
		window.opener.frm_810XSL.SAC_SAC_12[iIndex].value	=	frmAllowance.SAC_12.options[frmAllowance.SAC_12.selectedIndex].text
		window.opener.frm_810XSL.SAC_SAC_13[iIndex].value	=	frmAllowance.SAC_13.value
		window.opener.frm_810XSL.SAC_SAC_14[iIndex].value	=	frmAllowance.SAC_14.value
		window.opener.frm_810XSL.SAC_SAC_15[iIndex].value	=	frmAllowance.SAC_15.value
		window.opener.frm_810XSL.SAC_SAC_16[iIndex].value	=	frmAllowance.SAC_16.value
		
		if(frmAllowance.SAC_01.value != ''	|| frmAllowance.SAC_02.value  != '' || frmAllowance.SAC_05.value  != '')
		{
			window.opener.TR_SAC_Row1[iIndex].style.display	=	"INLINE"
		}
		else
		{
			window.opener.TR_SAC_Row1[iIndex].style.display	=	"NONE"
		}
		if(frmAllowance.SAC_06.value != ''	|| frmAllowance.SAC_07.value  != '' || frmAllowance.SAC_08.value  != '')
		{
			window.opener.TR_SAC_Row2[iIndex].style.display	=	"INLINE"
		}
		else
		{
			window.opener.TR_SAC_Row2[iIndex].style.display	=	"NONE"
		}
		if(frmAllowance.SAC_09.value != ''	|| frmAllowance.SAC_10.value  != '' || frmAllowance.SAC_12.value  != '')
		{
			window.opener.TR_SAC_Row3[iIndex].style.display	=	"INLINE"
		}
		else
		{
			window.opener.TR_SAC_Row3[iIndex].style.display	=	"NONE"
		}
		if(frmAllowance.SAC_13.value != ''	|| frmAllowance.SAC_14.value  != '' || frmAllowance.SAC_16.value  != '')
		{
			window.opener.TR_SAC_Row4[iIndex].style.display	=	"INLINE"
		}
		else
		{
			window.opener.TR_SAC_Row4[iIndex].style.display	=	"NONE"
		}
		if(frmAllowance.SAC_15.value != '')
		{
			window.opener.TR_SAC_Row5[iIndex].style.display	=	"INLINE"
		}
		else
		{
			window.opener.TR_SAC_Row5[iIndex].style.display	=	"NONE"
		}
		}
		else
		{
			window.opener.frm_810XSL.SAC_SAC_01.value	=	frmAllowance.SAC_01.options[frmAllowance.SAC_01.selectedIndex].text
		window.opener.frm_810XSL.SAC_SAC_02.value	=	frmAllowance.SAC_02.options[frmAllowance.SAC_02.selectedIndex].text
		window.opener.frm_810XSL.SAC_SAC_05.value	=	frmAllowance.SAC_05.value
		window.opener.frm_810XSL.SAC_SAC_06.value	=	frmAllowance.SAC_06.options[frmAllowance.SAC_06.selectedIndex].text
		window.opener.frm_810XSL.SAC_SAC_07.value	=	frmAllowance.SAC_07.value
		window.opener.frm_810XSL.SAC_SAC_08.value	=	frmAllowance.SAC_08.value
		window.opener.frm_810XSL.SAC_SAC_09.value	=	frmAllowance.SAC_09.options[frmAllowance.SAC_09.selectedIndex].text
		window.opener.frm_810XSL.SAC_SAC_10.value	=	frmAllowance.SAC_10.value
		window.opener.frm_810XSL.SAC_SAC_12.value	=	frmAllowance.SAC_12.options[frmAllowance.SAC_12.selectedIndex].text
		window.opener.frm_810XSL.SAC_SAC_13.value	=	frmAllowance.SAC_13.value
		window.opener.frm_810XSL.SAC_SAC_14.value	=	frmAllowance.SAC_14.value
		window.opener.frm_810XSL.SAC_SAC_15.value	=	frmAllowance.SAC_15.value
		window.opener.frm_810XSL.SAC_SAC_16.value	=	frmAllowance.SAC_16.value
		
		if(frmAllowance.SAC_01.value != ''	|| frmAllowance.SAC_02.value  != '' || frmAllowance.SAC_05.value  != '')
		{
			window.opener.TR_SAC_Row1.style.display	=	"INLINE"
		}
		else
		{
			window.opener.TR_SAC_Row1.style.display	=	"NONE"
		}
		if(frmAllowance.SAC_06.value != ''	|| frmAllowance.SAC_07.value  != '' || frmAllowance.SAC_08.value  != '')
		{
			window.opener.TR_SAC_Row2.style.display	=	"INLINE"
		}
		else
		{
			window.opener.TR_SAC_Row2.style.display	=	"NONE"
		}
		if(frmAllowance.SAC_09.value != ''	|| frmAllowance.SAC_10.value  != '' || frmAllowance.SAC_12.value  != '')
		{
			window.opener.TR_SAC_Row3.style.display	=	"INLINE"
		}
		else
		{
			window.opener.TR_SAC_Row3.style.display	=	"NONE"
		}
		if(frmAllowance.SAC_13.value != ''	|| frmAllowance.SAC_14.value  != '' || frmAllowance.SAC_16.value  != '')
		{
			window.opener.TR_SAC_Row4.style.display	=	"INLINE"
		}
		else
		{
			window.opener.TR_SAC_Row4.style.display	=	"NONE"
		}
		if(frmAllowance.SAC_15.value != '')
		{
			window.opener.TR_SAC_Row5.style.display	=	"INLINE"
		}
		else
		{
			window.opener.TR_SAC_Row5.style.display	=	"NONE"
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
	<BODY text="black" TopMargin="0" LeftMargin="0">
		<%


	if UCase(Request.QueryString("Create")) = "NEW" Then 
		
	
	else
	
		SAC_01		=	f_CutStringFromCombo(Trim(Request.Form("SAC_SAC_01")(iIndex)))
		SAC_02		=	f_CutStringFromCombo(Trim(Request.Form("SAC_SAC_02")(iIndex)))
		SAC_05		=	Trim(Request.Form("SAC_SAC_05")(iIndex))
		SAC_06		=	f_CutStringFromCombo(Trim(Request.Form("SAC_SAC_06")(iIndex)))
		SAC_07		=	Trim(Request.Form("SAC_SAC_07")(iIndex))
		SAC_08		=	Trim(Request.Form("SAC_SAC_08")(iIndex))
		SAC_09		=	f_CutStringFromCombo(Trim(Request.Form("SAC_SAC_09")(iIndex)))
		SAC_10		=	Trim(Request.Form("SAC_SAC_10")(iIndex))
		SAC_12		=	f_CutStringFromCombo(Trim(Request.Form("SAC_SAC_12")(iIndex)))
		SAC_13		=	Trim(Request.Form("SAC_SAC_13")(iIndex))
		SAC_14		=	Trim(Request.Form("SAC_SAC_14")(iIndex))
		SAC_15		=	Trim(Request.Form("SAC_SAC_15")(iIndex))
		SAC_16		=	Trim(Request.Form("SAC_SAC_16")(iIndex))
	
	
	
		
		
	End if 
	
	
%>
		<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="white">
			<TR>
				<TD align="center"><BR>
					<Font Size="3"><B>Add / Edit Allowance/Charge Detail</B></Font></TD>
			</TR>
			<TR>
				<TD><hr style="color:black;width:100%">
				</TD>
			</TR>
			<tr>
				<td>
					<FORM Action="INV_ALLOWANCE.asp" method="post" name="frmAllowance" onsubmit="return CheckVal()">
						&nbsp;&nbsp;&nbsp;
						<TABLE class="header" width="100%" border="0">
							<!--<TR>
								<TD align="center" colspan="3"><B>Edit Allowance/Charge Details</B></TD>
							</TR>
							<TR>
								<TD align="center" colspan="3" width="100%"><hr color="navy">
								</TD>
							</TR>-->
							<TR>
								<TD align="center"><B>Segment</B></TD>
								<TD><B>:</B></TD>
								<TD align="left"><B>SAC</B></TD>
							</TR>
							<TR>
								<TD align="center" nowrap><B>Indicator</B>
								</TD>
								<TD><B>:</B></TD>
								<TD align="left">
									<Select Name="SAC_01" Class="InputText" Style="Width:270">
										<Option value=""></Option>
										<Option <%if UCase(SAC_01) = "A" Then %> Selected <%End if %> value="A">A Allowance</Option>
										<Option <%if UCase(SAC_01) = "C" Then %> Selected <%End if %> value="C">C Charge</Option>
									</Select>
								</TD>
							</TR>
							<TR>
								<TD align="center"><B>Service/Promotion Code</B></TD>
								<TD><B>:</B></TD>
								<TD align="left">
									<SELECT Class="InputText" name="SAC_02" style="width:260">
										<% Call f_FillPopupCombo("ServicePromotionAllowanceCode_1300",SAC_02) %>
									</SELECT>
								</TD>
							</TR>
							<TR>
								<TD align="center"><B>Amount</B></TD>
								<TD><B>:</B></TD>
								<TD align="left"><INPUT class=inputText maxLength=15 name=SAC_05 size=20  value="<%=SAC_05%>">
								</TD>
							</TR>
							<TR>
								<TD width="30%" Align="center" nowrap><B>Percent Qualifier</B></TD>
								<TD><B>:</B></TD>
								<TD>
									<select class="inputText" Name="SAC_06" style='width:275' ID="Select2">
										<Option value=""></Option>
										<Option value="1"  <%if SAC_06 = "1" THEN%>selected<%end if %>>1 Item List Cost</Option>
										<Option value="2"  <%if SAC_06 = "2" THEN%>selected<%end if %>>2 Item Net Cost</Option>
										<Option value="3"  <%if SAC_06 = "3" THEN%>selected<%end if %>>3 Discount/Gross</Option>
										<Option value="4"  <%if SAC_06 = "4" THEN%>selected<%end if %>>4 Discount/Net</Option>
										<Option value="5"  <%if SAC_06 = "5" THEN%>selected<%end if %>>5 Base Price per 
											Unit</Option>
										<Option value="6"  <%if SAC_06 = "6" THEN%>selected<%end if %>>6 Base Price Amount</Option>
										<Option value="7"  <%if SAC_06 = "7" THEN%>selected<%end if %>>7 Base Price Amount 
											Less Privious Discount</Option>
									</select>
								</TD>
							</TR>
							<TR>
								<TD width="30%" Align="center" nowrap><B>Percent</B>
								</TD>
								<TD><B>:</B></TD>
								<TD><INPUT TYPE="text" Class="inputtext" Name = "SAC_07" value="<%=SAC_07%>" maxlength='7' size="15" ID="Text2" onchange="javaScript:change(frmAllowance.SAC_07)"></TD>
							</TR>
							<TR>
								<TD width="30%" Align="center" nowrap><B>Rate</B>
								</TD>
								<TD><B>:</B></TD>
								<TD><INPUT TYPE="text" Class="inputtext" Name = "SAC_08" value="<%=SAC_08%>" maxlength='9' size="15" ID="Text3"></TD>
							</TR>
							<TR>
								<TD width="30%" Align="center" nowrap><B>UOM</B></TD>
								<TD><B>:</B></TD>
								<TD>
									<select class="inputText" Name="SAC_09" style='width:275' ID="Select7">
										<Option value=""></Option>
										<Option value="CA"  <%if SAC_09 = "CA" THEN%>selected<%end if %>>CA Case</Option>
										<Option value="EA"  <%if SAC_09 = "EA" THEN%>selected<%end if %>>EA Each</Option>
									</select>
								</TD>
							</TR>
							<TR>
								<TD width="30%" Align="center" nowrap><B>Quantity</B>
								</TD>
								<TD><B>:</B></TD>
								<TD><INPUT TYPE="text" Class="inputtext" Name = "SAC_10" value="<%=SAC_10%>" maxlength='9' size="15" ID="Text7"></TD>
							</TR>
							<TR>
								<TD align="center" nowrap><B>Handling code</B>
								</TD>
								<TD><B>:</B></TD>
								<TD align="left">
									<Select Name="SAC_12" Class="InputText" Style="Width:270">
										<Option value=""></Option>
										<Option <%if UCase(SAC_12) = "02" Then %> Selected <%End if %> value="02">02 
											Allowance Off Invoice</Option>
										<Option <%if UCase(SAC_12) = "06" Then %> Selected <%End if %> value="06">06 Charge 
											Paid by Customer</Option>
									</Select>
								</TD>
							</TR>
							<TR>
								<TD width="30%" Align="center" nowrap><B>Reference ID</B>
								</TD>
								<TD><B>:</B></TD>
								<TD><INPUT TYPE="text" Class="inputtext" Name = "SAC_13" value="<%=SAC_13%>" maxlength='40' size="45" ID="Text1"></TD>
							</TR>
							<TR>
								<TD width="30%" Align="center" nowrap><B>Option Number</B>
								</TD>
								<TD><B>:</B></TD>
								<TD><INPUT TYPE="text" Class="inputtext" Name = "SAC_14" value="<%=SAC_14%>" maxlength='20' size="25" ID="Text4"></TD>
							</TR>
							<TR>
								<TD width="30%" Align="center" nowrap><B>Description<Font color="red">*</Font></B>
								</TD>
								<TD><B>:</B></TD>
								<td align="left"><textarea class="InpuText" Name="SAC_15" rows='3' cols='50' ID="Textarea2"><%=SAC_15%></textarea></td>
							</TR>
							<TR>
								<TD align="center" nowrap><B>Language Code</B>
								</TD>
								<TD><B>:</B></TD>
								<TD align="left">
									<INPUT TYPE="text" Class="inputtext" Name = "SAC_16" value="<%=SAC_16%>" maxlength='3' size="4" ID="Text4">
								</TD>
							</TR>
							<TR>
								<TD align="center" colSpan="3">
									<INPUT name="AllowanceButton" Class="InputButton" type="SUBMIT" value="OK" style="width:60"><INPUT name="AllowanceButton" Class="InputButton" type="button" value="Cancel" onclick="window.close()"
										style="width:60">
							</TR>
						</TABLE>
					</FORM>
				</td>
			</tr>
		</table>
	</BODY>
</Html>
