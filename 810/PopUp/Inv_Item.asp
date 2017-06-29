<!--#Include File="../../../../IncludeFile/Globalaspfunction.asp"-->
<!--#Include File="../../../../IncludeFile/Connection.asp"-->
<!---------#Include File="../../../../IncludeFile/adovbs.inc"---->
<html>
	<head>
		<title>Infoconn Systems | EDI | Invoice Item</title>
		<SCRIPT LANGUAGE="javascript">
var bNewFlag	=	"<%=Request.QueryString("Create")%>"
var iRowId		=	"<%=Request.QueryString("Mode")%>"



function checkLenDesc()
{
	var sVal	=	document.frmItem.IT1_PID_05.value
	var iLen	=	sVal.length
	var newval	=	""
	if(iLen > 80)
	{
		alert("Maxmium length for Description field is 80")
		newval	=	sVal.substring(0,80)
		document.frmItem.IT1_PID_05.value	=	newval
		return false
	}
	return true
}



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


function addNewItemRow(iRowID)
{	
		iRowID	=	parseInt(iRowID)
		var SelRaiseVal = "SelRaise_"+parseInt(iRowID+1)
		window.opener.ItemTable.insertRow(iRowID)
		window.opener.ItemTable.rows(iRowID).insertCell(0)
		window.opener.ItemTable.rows(iRowID).cells(0).innerHTML="<Table width='100%' Border='0' bordercolor='black' Align='Center' cellspacing='0' Cellpadding='1' style='Border-Collapse:Collapse' ID='Table1'>"+
											"<TR bgcolor='#5225BA'>"+
												"<TD width='30%'>"+
													"<Font color='#FFFFFF'>"+
															"<B>Item </B> - "+
															"<input type='text' name='IT1_IT1_01' class='inputText' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px;BackGround-Color:#5225BA;Text:White;Color:White' readonly='true' ID='Text1'>"+
															
														"</input>"+
														"</Font>"+
												"</TD>"+
												"<TD width='13%' nowrap='true' align='center'>"+
													"<Font color='#FFFFFF'>"+
														"<B>Quantity / Mea.</B>"+
													"</Font>"+
												"</TD>"+
												"<TD width='10%' align='center'>"+
													"<Font color='#FFFFFF'>"+
														"<B>Unit Price</B>"+
													"</Font>"+
												"</TD>"+
												"<TD width='13%' nowrap='true' align='center'>"+
													"<Font color='#FFFFFF'>"+
														"<B>Ext Price</B>"+
													"</Font>"+
												"</TD>"+
												"<TD width='10%' nowrap='true' align='center'>"+
													"<Font color='#FFFFFF'>"+
														"<B>Edit</B>"+
													"</Font>"+
												"</TD>"+
											"</TR>"+
											"<TR>"+
												"<TD>"+
													
												"</TD>"+
												"<TD align='right'>"+
													"<INPUT TYPE='text' style='TEXT-ALIGN: right' Class='inputtext' size='9' name='IT1_IT1_02' maxlength='15' onKeyup='accessExtPrice(); return checkIsNan(frm_810XSL.IT1_IT1_02)' ID='Text2'>"+
														
													"</INPUT>"+
													"<INPUT TYPE='TEXT' Class='inputtext' name='IT1_IT1_03' SIZE='3' style='text-align:center;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' ID='Text3'>"+
														
													"</INPUT>"+
												"</TD>"+
												"<TD align='center'>"+
													"<INPUT TYPE='text' name='IT1_IT1_04' style='text-align:center;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' Class='inputText' size='10' ID='Text4'>"+
														
													"</INPUT>"+
												"</TD>"+
												"<TD id='ExtPrice' align='center'></TD>"+
												"<TD Align='center' id='itemHref'>Edit</TD>"+
											"</TR>"+
											"<TR>"+
												"<TD colspan='5' ID='td_PSID_Detail'>"+
													"<Table border='0' width='100%' bordercolor='black' cellspacing='0' Cellpadding='1' style='Border-Collapse:Collapse' ID='Table2'>"+
														"<TR BGCOLOR='#EDEDED' ID='Psid_Row' style='display:none'>"+
															
															"<TD width='49%'>"+
																"<font color='000000'>"+
																	"<b>Service / Product ID Qualifier</b>"+
																"</font>"+
															"</TD>"+
															"<TD>"+
																"<font color='000000'>"+
																	"<b>Service / Product ID</b>"+
																"</font>"+
															"</TD>"+
														"</TR>"+
														
															"<TR>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_06' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' size='72' readonly='true' ID='Text6'></INPUT>"+
																			
																		
																"</TD>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_07' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='50' ID='Text8'></INPUT>"+
																			
																		
																"</TD>"+
															"</TR>"+
															"<TR>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_08' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' size='60' readonly='true' ID='Text10'></INPUT>"+
																			
																		
																"</TD>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_09' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='50' ID='Text12'></INPUT>"+
																			
																		
																"</TD>"+
															"</TR>"+
															"<TR>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_10' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' size='60' readonly='true' ID='Text10'></INPUT>"+
																			
																		
																"</TD>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_11' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='50' ID='Text12'></INPUT>"+
																			
																		
																"</TD>"+
															"</TR>"+
															"<TR>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_12' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' size='60' readonly='true' ID='Text10'></INPUT>"+
																			
																		
																"</TD>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_13' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='50' ID='Text12'></INPUT>"+
																			
																		
																"</TD>"+
															"</TR>"+
															"<TR>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_14' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' size='60' readonly='true' ID='Text10'></INPUT>"+
																			
																		
																"</TD>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_15' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='50' ID='Text12'></INPUT>"+
																			
																		
																"</TD>"+
															"</TR>"+
															"<TR>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_16' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' size='60' readonly='true' ID='Text10'></INPUT>"+
																			
																		
																"</TD>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_17' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='50' ID='Text12'></INPUT>"+
																			
																		
																"</TD>"+
															"</TR>"+
															"<TR>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_18' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' size='60' readonly='true' ID='Text10'></INPUT>"+
																			
																		
																"</TD>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_19' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='50' ID='Text12'></INPUT>"+
																			
																		
																"</TD>"+
															"</TR>"+
															"<TR>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_20' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' size='60' readonly='true' ID='Text10'></INPUT>"+
																			
																		
																"</TD>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_21' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='50' ID='Text12'></INPUT>"+
																			
																		
																"</TD>"+
															"</TR>"+
                                                            		"<TR>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_22' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' size='60' readonly='true' ID='Text10'></INPUT>"+
																			
																		
																"</TD>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_23' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='50' ID='Text12'></INPUT>"+
																			
																		
																"</TD>"+
															"</TR>"+
                                                            		"<TR>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_24' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' size='60' readonly='true' ID='Text10'></INPUT>"+
																			
																		
																"</TD>"+
																"<TD>"+
																	
																			"<INPUT TYPE='text' Class='inputtext' name='IT1_IT1_25' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='50' ID='Text12'></INPUT>"+
																			
																		
																"</TD>"+
															"</TR>"+
													"</Table>"+
												"</TD>"+
											"</TR>"+
											"<TR>"+
		"<TD colspan='5' ID='td_PID_Detail'>"+
			"<Table border='0' width='100%' bordercolor='black' cellspacing='0' Cellpadding='1' style='Border-Collapse:Collapse'>"+
				"<TR BGCOLOR='#EDEDED' ID='PID_Row' style='display:none'>"+
					"<TD width='100%' colspan='6'>"+
						"<font color='000000'>"+
							"<b>Product/Item Description</b>"+
						"</font>"+
					"</TD>"+
				"</TR>"+
				"<TR id='TR_PID_Row1' style='display:none'>"+
					"<TD width='15%' nowrap='true'>"+
						"<B>Type</B>"+
					"</TD>"+
					"<TD width='1%'>"+
						"<b>:</b>"+
					"</TD>"+
					"<TD width='25%' align='left'>"+
						"<INPUT TYPE='text' name='IT1_PID_01' Class='inputtext' size='15' maxlength='6' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true'></INPUT>"+
					"</TD>"+
					"<TD width='10%' nowrap='true'>"+
						"<B>Description </B>"+
					"</TD>"+
					"<TD width='1%'>"+
						"<b>:</b>"+
					"</TD>"+
					"<TD width='25%' align='left'>"+
						"<INPUT TYPE='TEXT' Class='inputtext' size='30' maxlength='50' name='IT1_PID_05' readonly='true' style='Border-Top:0;Border-Bottom:0;Border-Left:0;Border-Right:0;'></INPUT>"+
					"</TD>"+
				"</TR>"+
			"</Table>"+
		"</TD>"+
	"</TR>"+
											
											"<TR>"+
												"<TD colspan='5' ID='td_PO4_Detail'>"+
													"<Table border='0' width='100%' bordercolor='black' cellspacing='0' Cellpadding='1' style='Border-Collapse:Collapse' ID='Table3'>"+
														"<TR BGCOLOR='#EDEDED' id='po4_row' style='display:none'>"+
															
															"<TD width='100%' colspan='6'>"+
																"<font color='000000'>"+
																	"<b>Item Physical Details</b>"+
																"</font>"+
															"</TD>"+
														"</TR>"+
														"<TR id='po4_row_head1' style='display:none'>"+
															
															"<TD nowrap='true' width='5%'>"+
																"<font color='000000'>"+
																	"<B>Pack</B>"+
																"</font>"+
															"</TD>"+
															"<TD>"+
																"<B>:</B>"+
															"</TD>"+
															"<TD>"+
																
																		"<INPUT TYPE='text' Class='inputtext' name='IT1_PO4_01' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='10' ID='Text14'></INPUT>"+
																	
															"</TD>"+
															"<TD nowrap='true' width='10%'>"+
																"<font color='000000'>"+
																	"<B>Inner Pack</B>"+
																"</font>"+
															"</TD>"+
															"<TD>"+
																"<B>:</B>"+
															"</TD>"+
															"<TD>"+
																
																		"<INPUT TYPE='text' Class='inputtext' name='IT1_PO4_14' style='display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='10' ID='Text16'></INPUT>"+
																
															"</TD>"+
														"</TR>"+
													"</Table>"+
												"</TD>"+
											"</TR>"+
											"<TR>"+
												"<TD colspan='5' ID='td_SAC_Detail'>"+
													"<Table border='0' width='100%' bordercolor='black' cellspacing='0' Cellpadding='1' style='Border-Collapse:Collapse' ID='Table4'>"+
														"<TR BGCOLOR='#EDEDED' ID='sac_row' style='display:none'>"+
															
															"<TD colspan='9'>"+
																"<b>"+
															 "Allowance/Charge Information</b>"+
															"</TD>"+
														"</TR>"+
														"<TR id='sac_row1' style='display:none'>"+
															
															"<TD width='10%'>"+
																"<font color='000000'>"+
																	"<b>Indicator</b>"+
																"</font>"+
															"</TD>"+
															"<TD>"+
																"<B>:</B>"+
															"</TD>"+
															"<TD>"+
																
																		"<INPUT TYPE='text' Class='inputtext' name='IT1_SAC_SAC_01' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='15' ID='Text18'></INPUT>"+
																	
															"</TD>"+
															"<TD>"+
																"<font color='000000'>"+
																	"<b>Code</b>"+
																"</font>"+
															"</TD>"+
															"<TD>"+
																"<B>:</B>"+
															"</TD>"+
															"<TD>"+
																
																		"<INPUT TYPE='text' Class='inputtext' name='IT1_SAC_SAC_02' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='45' ID='Text20'></INPUT>"+
																	
															"</TD>"+
															"<TD>"+
																"<font color='000000'>"+
																	"<b>Amount</b>"+
																"</font>"+
															"</TD>"+
															"<TD>"+
																"<B>:</B>"+
															"</TD>"+
															"<TD align='left'>"+
																
																		"<INPUT TYPE='text' Class='inputtext' name='IT1_SAC_SAC_05' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='10' ID='Text22'></INPUT>"+
																	
															"</TD>"+
														"</TR>"+
														"<TR id='sac_row2' style='display:none'>"+
															
															"<TD width='15%'>"+
																"<font color='000000'>"+
																	"<b>Percent Qualifier</b>"+
																"</font>"+
															"</TD>"+
															"<TD>"+
																"<B>:</B>"+
															"</TD>"+
															"<TD>"+
																
																		"<INPUT TYPE='text' Class='inputtext' name='IT1_SAC_SAC_06' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='20' ID='Text24'></INPUT>"+
																	
															"</TD>"+
															"<TD>"+
																"<font color='000000'>"+
																	"<b>Percent</b>"+
																"</font>"+
															"</TD>"+
															"<TD>"+
																"<B>:</B>"+
															"</TD>"+
															"<TD>"+
																
																		"<INPUT TYPE='text' Class='inputtext' name='IT1_SAC_SAC_07' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='6' ID='Text26'></INPUT>"+
																	
															"</TD>"+
															"<TD>"+
																"<font color='000000'>"+
																	"<b>Handling Code</b>"+
																"</font>"+
															"</TD>"+
															"<TD>"+
																"<B>:</B>"+
															"</TD>"+
															"<TD>"+
																
																		"<INPUT TYPE='text' Class='inputtext' name='IT1_SAC_SAC_12' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='20' ID='Text28'></INPUT>"+
																	
															"</TD>"+
														"</TR>"+
														"<TR id='sac_row3' style='display:none'>"+
															
															"<TD>"+
																"<font color='000000'>"+
																	"<b>Rate</b>"+
																"</font>"+
															"</TD>"+
															"<TD>"+
																"<B>:</B>"+
															"</TD>"+
															"<TD align='left'>"+
																
																		"<INPUT TYPE='text' Class='inputtext' name='IT1_SAC_SAC_08' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='10' ID='Text30'></INPUT>"+
																	
															"</TD>"+
															"<TD>"+
																"<font color='000000'>"+
																	"<b>Quantity</b>"+
																"</font>"+
															"</TD>"+
															"<TD>"+
																"<B>:</B>"+
															"</TD>"+
															"<TD>"+
																
																		"<INPUT TYPE='text' Class='inputtext' name='IT1_SAC_SAC_10' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='6' ID='Text32'></INPUT>"+
																	
															"</TD>"+
															"<TD>"+
																"<font color='000000'>"+
																	"<b>Measurement Code</b>"+
																"</font>"+
															"</TD>"+
															"<TD>"+
																"<B>:</B>"+
															"</TD>"+
															"<TD>"+
																
																		"<INPUT TYPE='text' Class='inputtext' name='IT1_SAC_SAC_09' style='text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;' readonly='true' size='10' ID='Text34'></INPUT>"+
																	
															"</TD>"+
														"</TR>"+ 
													"</Table>"+
												"</TD>"+
											"</TR>"+ 
										"</Table>"+
									"</TD>"+
								"</TR>"+
							
					"</Table>"
}

function validate()
{
	
	if(removeSpace(frmItem.IT1_02)== false)
	{
		return false
	}
	if(removeSpace(frmItem.IT1_04)== false)
	{
		return false
	}
	
	
	if(removeSpace(frmItem.IT1_07)== false)
	{
		return false
	}
	
	if(removeSpace(frmItem.PID_05)== false)
	{
		return false
	}
	
	
	if(frmItem.IT1_04.value=="")
	{
		alert("Please Enter Item Price")
		frmItem.IT1_04.select()
		return false
	}
	if(frmItem.IT1_03.value=="")
	{
		alert ("Please Select UOM")
		frmItem.IT1_03.focus()
		return false
	}  
	/*if(frmItem.IT1_03.value=="CA" && (frmItem.IT1_PO4_01.value=="" && frmItem.IT1_PO4_14.value==""))
	{
		alert ("Please Enter Item Physical Details")
		frmItem.IT1_PO4_01.focus()
		return false
	} */
//    if(frmItem.PID_05.value=="")
//	    {
//			alert ("Please  Enter Description")
//			frmItem.PID_05.focus()
//			return false
//		}	
     
	if(frmItem.IT1_PO4_01.value!="" || frmItem.IT1_PO4_14.value!="")
	{
		if(frmItem.IT1_PO4_01.value=="")
	    {
			alert ("Please  Enter  Packs")
			frmItem.IT1_PO4_01.focus()
			return false
		}	
	
		if(frmItem.IT1_PO4_14.value=="")
	    {
			alert ("Please  Enter Inner Packs")
			frmItem.IT1_PO4_14.focus()
			return false
		}	
	 }
	if(frmItem.IT1_02.value=="")
	{
		alert("Please Enter Quantity")
		frmItem.IT1_02.select()
		frmItem.IT1_02.focus()
		return false
	}
	
	if(isNaN(frmItem.IT1_02.value) || frmItem.IT1_02.value <= 0)
	{
		alert("Please Enter Valid Quantity ")
		frmItem.IT1_02.focus()
		return false
	}
//	if(isNaN(frmItem.IT1_04.value) || frmItem.IT1_04.value <= 0)
//	{
//		alert("Please Enter Valid Price ")
//		frmItem.IT1_04.focus()
//		return false
//	}
	
	//ID1
	if(frmItem.IT1_06.value=="")
	{
		alert("Please Select 1st Product /Service ID qualifier")
		frmItem.IT1_06.focus()
		return false
	}
	if(frmItem.IT1_07.value!="" && frmItem.IT1_06.value=="")
	{
		alert("Please Select 1st Product /Service ID qualifier")
		frmItem.IT1_06.focus()
		return false
	}
	if(frmItem.IT1_07.value=="" && frmItem.IT1_06.value!="")
	{
		alert("Please 1st Enter Product/Service ID ")
		frmItem.IT1_07.select()
		return false
	}
	if(frmItem.IT1_09.value!="" && frmItem.IT1_08.value=="")
	{
		alert("Please Select 2nd Product /Service ID qualifier")
		frmItem.IT1_08.focus()
		return false
	}
	if(frmItem.IT1_09.value=="" && frmItem.IT1_08.value!="")
	{
		alert("Please  Enter 2nd Product/Service ID ")
		frmItem.IT1_09.select()
		return false
	}
	if(frmItem.IT1_11.value!="" && frmItem.IT1_10.value=="")
	{
		alert("Please Select 3rd Product /Service ID qualifier")
		frmItem.IT1_10.focus()
		return false
	}
	if(frmItem.IT1_11.value=="" && frmItem.IT1_10.value!="")
	{
		alert("Please  Enter 3rd Product/Service ID ")
		frmItem.IT1_11.select()
		return false
	}
	
	if(frmItem.IT1_13.value!="" && frmItem.IT1_12.value=="")
	{
		alert("Please Select 4th Product /Service ID qualifier")
		frmItem.IT1_12.focus()
		return false
	}
	if(frmItem.IT1_13.value=="" && frmItem.IT1_12.value!="")
	{
		alert("Please  Enter 4th Product/Service ID ")
		frmItem.IT1_13.select()
		return false
	}
	//add new PSID
	if(frmItem.IT1_15.value!="" && frmItem.IT1_14.value=="")
	{
		alert("Please Select 5th Product /Service ID qualifier")
		frmItem.IT1_14.focus()
		return false
	}
	if(frmItem.IT1_15.value=="" && frmItem.IT1_14.value!="")
	{
		alert("Please  Enter 5th Product/Service ID ")
		frmItem.IT1_15.select()
		return false
	}
	
	if(frmItem.IT1_17.value!="" && frmItem.IT1_16.value=="")
	{
		alert("Please Select 6th Product /Service ID qualifier")
		frmItem.IT1_16.focus()
		return false
	}
	if(frmItem.IT1_17.value=="" && frmItem.IT1_16.value!="")
	{
		alert("Please  Enter 6th Product/Service ID ")
		frmItem.IT1_17.select()
		return false;
	}
	
	if(frmItem.IT1_19.value!="" && frmItem.IT1_18.value=="")
	{
		alert("Please Select 7th Product /Service ID qualifier")
		frmItem.IT1_18.focus()
		return false
	}
	if(frmItem.IT1_19.value=="" && frmItem.IT1_18.value!="")
	{
		alert("Please  Enter 7th Product/Service ID ")
		frmItem.IT1_19.select()
		return false;
	}
	
	if(frmItem.IT1_21.value!="" && frmItem.IT1_20.value=="")
	{
		alert("Please Select 8th Product /Service ID qualifier")
		frmItem.IT1_20.focus()
		return false
	}
	if(frmItem.IT1_21.value=="" && frmItem.IT1_20.value!="")
	{
		alert("Please  Enter 8th Product/Service ID ")
		frmItem.IT1_21.select()
		return false;
	}
	if(frmItem.IT1_23.value!="" && frmItem.IT1_22.value=="")
	{
	    alert("Please Select 9th Product /Service ID qualifier")
	    frmItem.IT1_22.focus()
	    return false
	}
	if(frmItem.IT1_23.value=="" && frmItem.IT1_22.value!="")
	{
	    alert("Please  Enter 9th Product/Service ID ")
	    frmItem.IT1_23.select()
	    return false;
	}
	if(frmItem.IT1_25.value!="" && frmItem.IT1_24.value=="")
	{
	    alert("Please Select 10th Product /Service ID qualifier")
	    frmItem.IT1_24.focus()
	    return false
	}
	if(frmItem.IT1_25.value=="" && frmItem.IT1_24.value!="")
	{
	    alert("Please  Enter 10th Product/Service ID ")
	    frmItem.IT1_25.select()
	    return false;
	}
	if(removeSpace(frmItem.IT1_PO4_01)== false)
	{
		return false
	}
	if(removeSpace(frmItem.IT1_PO4_14)== false)
	{
		return false
	}
	if(frmItem.IT1_PO4_01.value!="")
	 {
		if(isNaN(frmItem.IT1_PO4_01.value) || frmItem.IT1_PO4_01.value <= 0)
		{
			alert("Please Enter Valid Pack ")
			frmItem.IT1_PO4_01.focus()
			return false
		}
	 
	 }
	if(frmItem.IT1_PO4_14.value!="")
	 {
		if(isNaN(frmItem.IT1_PO4_14.value) || frmItem.IT1_PO4_14.value <= 0)
		{
			alert("Please Enter Valid Inner Pack ")
			frmItem.IT1_PO4_14.focus()
			return false
		}
	 
	 }
	
	if((frmItem.IT1_SAC_02.value!="" || frmItem.IT1_SAC_05.value!="" || frmItem.IT1_SAC_06.value!="" || frmItem.IT1_SAC_07.value!="" || frmItem.IT1_SAC_08.value!="" || frmItem.IT1_SAC_09.value!="" || frmItem.IT1_SAC_10.value!="" || frmItem.IT1_SAC_12.value!="") && (frmItem.IT1_SAC_01.value==""))
	 {
	   
	       alert("Please Select Allowance/Charge Indicator")
		   frmItem.IT1_SAC_01.focus()
		   return false
	     
	  }
	
	if(frmItem.IT1_SAC_01.value!="" && frmItem.IT1_SAC_05.value=="")
	 {
	    alert(" Please Enter Allowance/Charge Amount")
		frmItem.IT1_SAC_05.focus()
		return false
	 }
	
	
	
	if(frmItem.IT1_SAC_01.value!="" && frmItem.IT1_SAC_02.value=="")
	 {
	       alert("Please Select Allowance/Charge Code")
		   frmItem.IT1_SAC_02.focus()
		   return false
	   
	   
	  }
	 
	if(frmItem.IT1_SAC_01.value=="C" && frmItem.IT1_SAC_02.value=="D240")
	 {
	       alert("This Charge Code is only used with Allowance")
		   frmItem.IT1_SAC_02.focus()
		   return false
	   
	   
	  }
	  
	  if(frmItem.IT1_SAC_02.value!="" && frmItem.IT1_SAC_01.value=="")
	 {
	   
	       alert("Please Select Allowance/Charge Indicator")
		   frmItem.IT1_SAC_01.focus()
		   return false
	     
	  }
	  
	  
	if(removeSpace(frmItem.IT1_SAC_05)== false)
	{
		return false
	}
	if(removeSpace(frmItem.IT1_SAC_07)== false)
	{
		return false
	}  
	if(removeSpace(frmItem.IT1_SAC_08)== false)
	{
		return false
	} 
	if(removeSpace(frmItem.IT1_SAC_10)== false)
	{
		return false
	}
	if(frmItem.IT1_SAC_05.value!="")
	 {
		if((frmItem.IT1_SAC_05.value<=0) || (isNaN(frmItem.IT1_SAC_05.value)))
		{
			alert("Please Enter numeric Allowance/Charge Amount")
			frmItem.IT1_SAC_05.focus()
			return false
		}
     }
	if(frmItem.IT1_SAC_07.value!="")
	 {
		if((frmItem.IT1_SAC_07.value<=0) || (isNaN(frmItem.IT1_SAC_07.value)))
		{
			alert("Please Enter numeric Percent")
			frmItem.IT1_SAC_07.focus()
			return false
		}
     } 
     if(frmItem.IT1_SAC_08.value!="")
	 {
		if((frmItem.IT1_SAC_08.value<=0) || (isNaN(frmItem.IT1_SAC_08.value)))
		{
			alert("Please Enter numeric Rate")
			frmItem.IT1_SAC_08.focus()
			return false
		}
     }
     if(frmItem.IT1_SAC_10.value!="")
	 {
		if((frmItem.IT1_SAC_10.value<=0) || (isNaN(frmItem.IT1_SAC_10.value)))
		{
			alert("Please Enter numeric Quantity in Allowance/Charge Section")
			frmItem.IT1_SAC_10.focus()
			return false
		}
     }
	if(frmItem.IT1_SAC_07.value!="" && frmItem.IT1_SAC_06.value=="")
	{
		alert("Please Select Percent Qualifier")
		frmItem.IT1_SAC_06.focus()
		return false
	}
	if(frmItem.IT1_SAC_07.value=="" && frmItem.IT1_SAC_06.value!="")
	{
		alert("Please Enter Percent")
		frmItem.IT1_SAC_07.select()
		return false
	}
	
	if(frmItem.IT1_SAC_02.value=="D170" && frmItem.IT1_SAC_10.value=="")
	{
		alert("Please Enter Quantity")
		frmItem.IT1_SAC_10.select()
		return false
	}
	if(frmItem.IT1_SAC_09.value=="" && frmItem.IT1_SAC_10.value!="")
	{
		alert("Please Select UOM in Allowance/Charge")
		frmItem.IT1_SAC_09.focus()
		return false
	}
	if(frmItem.IT1_SAC_09.value!="" && frmItem.IT1_SAC_10.value=="")
	{
		alert("Please Enter Quantity")
		frmItem.IT1_SAC_10.select()
		return false
	}
	if(frmItem.IT1_SAC_01.value=="A" && frmItem.IT1_SAC_12.value=="06")
	{
		alert("Handling Code '06' is only used for Indicator 'C'")
		frmItem.IT1_SAC_12.focus()
		return false
	}
	
	return true
	
}

function fillform()
{
	var iIndex	 =	"<%=Trim(Request.QueryString("Mode"))%>"
	var sopner	 =	"<%=UCase(Trim(Request.Form("hid_ProcessMode")))%>"
	var sDocMode =  "<%=UCase(Trim(Request.Form("sDocMode")))%>"
	
	iIndex	=	parseInt(iIndex)
	if(validate() == true)
	{
		
		if(bNewFlag.toUpperCase() == "NEW")
		{
			addNewItemRow(iIndex)
		}
		
		
		if(isArray(window.opener.frm_810XSL.IT1_IT1_02) == true)		
		{
			
			
			
			window.opener.frm_810XSL.IT1_IT1_04[iIndex].value			=	window.opener.roundOff(frmItem.IT1_04.value,2)
			//window.opener.frm_810XSL.IT1_IT1_01[iIndex].value			=	frmItem.IT1_01.value
			
			window.opener.frm_810XSL.IT1_IT1_02[iIndex].value			=	frmItem.IT1_02.value
			
			window.opener.frm_810XSL.IT1_IT1_03[iIndex].value			=	frmItem.IT1_03.value
			
			
			
			
			///Service / Product ID Qualifiers
			window.opener.frm_810XSL.IT1_IT1_07[iIndex].value			=	frmItem.IT1_07.value   
			window.opener.frm_810XSL.IT1_IT1_06[iIndex].value		=	frmItem.IT1_06.options[frmItem.IT1_06.selectedIndex].text
			
			window.opener.frm_810XSL.IT1_IT1_09[iIndex].value			=	frmItem.IT1_09.value   
			window.opener.frm_810XSL.IT1_IT1_08[iIndex].value		=	frmItem.IT1_08.options[frmItem.IT1_08.selectedIndex].text
			
			window.opener.frm_810XSL.IT1_IT1_11[iIndex].value			=	frmItem.IT1_11.value   
			window.opener.frm_810XSL.IT1_IT1_10[iIndex].value		=	frmItem.IT1_10.options[frmItem.IT1_10.selectedIndex].text
			
			window.opener.frm_810XSL.IT1_IT1_13[iIndex].value			=	frmItem.IT1_13.value   
			window.opener.frm_810XSL.IT1_IT1_12[iIndex].value		=	frmItem.IT1_12.options[frmItem.IT1_12.selectedIndex].text
			
			window.opener.frm_810XSL.IT1_IT1_14[iIndex].value		=	frmItem.IT1_14.options[frmItem.IT1_14.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_15[iIndex].value			=	frmItem.IT1_15.value 
			window.opener.frm_810XSL.IT1_IT1_16[iIndex].value		=	frmItem.IT1_16.options[frmItem.IT1_16.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_17[iIndex].value			=	frmItem.IT1_17.value 
			window.opener.frm_810XSL.IT1_IT1_18[iIndex].value		=	frmItem.IT1_18.options[frmItem.IT1_18.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_19[iIndex].value			=	frmItem.IT1_19.value 
			window.opener.frm_810XSL.IT1_IT1_20[iIndex].value		=	frmItem.IT1_20.options[frmItem.IT1_20.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_21[iIndex].value			=	frmItem.IT1_21.value
			window.opener.frm_810XSL.IT1_IT1_22[iIndex].value		=	frmItem.IT1_22.options[frmItem.IT1_22.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_23[iIndex].value			=	frmItem.IT1_23.value
			window.opener.frm_810XSL.IT1_IT1_24[iIndex].value		=	frmItem.IT1_24.options[frmItem.IT1_24.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_25[iIndex].value			=	frmItem.IT1_25.value
			
			if(frmItem.IT1_06.value != '' || frmItem.IT1_07.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_06[iIndex].style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_07[iIndex].style.display	=	"INLINE"
				window.opener.Psid_Row[iIndex].style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_06[iIndex].style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_07[iIndex].style.display	=	"NONE"
			}
			if(frmItem.IT1_08.value != '' || frmItem.IT1_09.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_08[iIndex].style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_09[iIndex].style.display	=	"INLINE"
				window.opener.Psid_Row[iIndex].style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_08[iIndex].style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_09[iIndex].style.display	=	"NONE"
			}
			
			if(frmItem.IT1_10.value != '' || frmItem.IT1_11.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_10[iIndex].style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_11[iIndex].style.display	=	"INLINE"
				window.opener.Psid_Row[iIndex].style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_10[iIndex].style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_11[iIndex].style.display	=	"NONE"
			}
			
			if(frmItem.IT1_12.value != '' || frmItem.IT1_13.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_12[iIndex].style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_13[iIndex].style.display	=	"INLINE"
				window.opener.Psid_Row[iIndex].style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_12[iIndex].style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_13[iIndex].style.display	=	"NONE"
			}
			
			if(frmItem.IT1_14.value != '' || frmItem.IT1_15.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_14[iIndex].style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_15[iIndex].style.display	=	"INLINE"
				window.opener.Psid_Row[iIndex].style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_14[iIndex].style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_15[iIndex].style.display	=	"NONE"
			}
			
			if(frmItem.IT1_16.value != '' || frmItem.IT1_17.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_16[iIndex].style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_17[iIndex].style.display	=	"INLINE"
				window.opener.Psid_Row[iIndex].style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_16[iIndex].style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_17[iIndex].style.display	=	"NONE"
			}
			
			if(frmItem.IT1_18.value != '' || frmItem.IT1_19.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_18[iIndex].style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_19[iIndex].style.display	=	"INLINE"
				window.opener.Psid_Row[iIndex].style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_18[iIndex].style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_19[iIndex].style.display	=	"NONE"
			}
			if(frmItem.IT1_20.value != '' || frmItem.IT1_21.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_20[iIndex].style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_21[iIndex].style.display	=	"INLINE"
				window.opener.Psid_Row[iIndex].style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_20[iIndex].style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_21[iIndex].style.display	=	"NONE"
			}
			if(frmItem.IT1_22.value != '' || frmItem.IT1_23.value != '')
			{
			    window.opener.frm_810XSL.IT1_IT1_22[iIndex].style.display	=	"INLINE"
			    window.opener.frm_810XSL.IT1_IT1_23[iIndex].style.display	=	"INLINE"
			    window.opener.Psid_Row[iIndex].style.display	=	"INLINE"
			}
			else
			{
			    window.opener.frm_810XSL.IT1_IT1_22[iIndex].style.display	=	"NONE"
			    window.opener.frm_810XSL.IT1_IT1_23[iIndex].style.display	=	"NONE"
			}
			if(frmItem.IT1_24.value != '' || frmItem.IT1_25.value != '')
			{
			    window.opener.frm_810XSL.IT1_IT1_24[iIndex].style.display	=	"INLINE"
			    window.opener.frm_810XSL.IT1_IT1_25[iIndex].style.display	=	"INLINE"
			    window.opener.Psid_Row[iIndex].style.display	=	"INLINE"
			}
			else
			{
			    window.opener.frm_810XSL.IT1_IT1_24[iIndex].style.display	=	"NONE"
			    window.opener.frm_810XSL.IT1_IT1_25[iIndex].style.display	=	"NONE"
			}
		    //PID
			//PID
			
			
			
			
			  //PID
            window.opener.frm_810XSL.IT1_PID_01[iIndex].value	=	frmItem.PID_01.options[frmItem.PID_01.selectedIndex].text
            window.opener.frm_810XSL.IT1_PID_05[iIndex].value	=	frmItem.PID_05.value
			
			
			if(frmItem.PID_01.value!="" || frmItem.PID_01.value!="")
			{
				window.opener.TR_PID_Row1[iIndex].style.display	=	"INLINE"
				window.opener.PID_Row[iIndex].style.display	=	"INLINE"
			}
			else
			{
				window.opener.TR_PID_Row1[iIndex].style.display	=	"NONE"
				window.opener.PID_Row[iIndex].style.display	=	"NONE"
			}
			//PO4
				
			   window.opener.frm_810XSL.IT1_PO4_01[iIndex].value	=	frmItem.IT1_PO4_01.value 
			  
			   window.opener.frm_810XSL.IT1_PO4_14[iIndex].value	=	frmItem.IT1_PO4_14.value 
			   
				if(frmItem.IT1_PO4_01.value != '' || frmItem.IT1_PO4_14.value != '')
				{	
						
					window.opener.po4_row[iIndex].style.display	=	"INLINE"
					window.opener.po4_row_head1[iIndex].style.display	=	"INLINE"
					window.opener.frm_810XSL.IT1_PO4_01[iIndex].style.display	=	"INLINE"
					window.opener.frm_810XSL.IT1_PO4_14[iIndex].style.display	=	"INLINE"
				}
				else
				{
					window.opener.po4_row[iIndex].style.display	=	"NONE"
					window.opener.po4_row_head1[iIndex].style.display	=	"NONE"
					window.opener.frm_810XSL.IT1_PO4_01[iIndex].style.display	=	"NONE"
					window.opener.frm_810XSL.IT1_PO4_14[iIndex].style.display	=	"NONE"
				}
			// SAC-LOOP 
			
			  window.opener.frm_810XSL.IT1_SAC_SAC_01[iIndex].value			=	frmItem.IT1_SAC_01.options[frmItem.IT1_SAC_01.selectedIndex].text
			  window.opener.frm_810XSL.IT1_SAC_SAC_02[iIndex].value			=	frmItem.IT1_SAC_02.options[frmItem.IT1_SAC_02.selectedIndex].text
			  window.opener.frm_810XSL.IT1_SAC_SAC_05[iIndex].value			=	frmItem.IT1_SAC_05.value 
			  window.opener.frm_810XSL.IT1_SAC_SAC_06[iIndex].value			=	frmItem.IT1_SAC_06.options[frmItem.IT1_SAC_06.selectedIndex].text
			  window.opener.frm_810XSL.IT1_SAC_SAC_07[iIndex].value			=	frmItem.IT1_SAC_07.value 
			  window.opener.frm_810XSL.IT1_SAC_SAC_08[iIndex].value			=	frmItem.IT1_SAC_08.value 
			  window.opener.frm_810XSL.IT1_SAC_SAC_09[iIndex].value			=	frmItem.IT1_SAC_09.options[frmItem.IT1_SAC_09.selectedIndex].text
			  window.opener.frm_810XSL.IT1_SAC_SAC_10[iIndex].value			=	frmItem.IT1_SAC_10.value 
			  window.opener.frm_810XSL.IT1_SAC_SAC_12[iIndex].value			=	frmItem.IT1_SAC_12.options[frmItem.IT1_SAC_12.selectedIndex].text
			  
			  
			  if(frmItem.IT1_SAC_01.value != '' || frmItem.IT1_SAC_05.value != '' || frmItem.IT1_SAC_02.value != '')
			     {
			    
			  	  window.opener.sac_row1[iIndex].style.display	=	"INLINE"	
			  	  }
			  else
				 window.opener.sac_row1[iIndex].style.display	=	"NONE"
			  if(frmItem.IT1_SAC_06.value != '' || frmItem.IT1_SAC_07.value != '' || frmItem.IT1_SAC_12.value != '')
			  	 window.opener.sac_row2[iIndex].style.display	=	"INLINE"	
			  else
			  	 window.opener.sac_row2[iIndex].style.display	=	"NONE"
			  if(frmItem.IT1_SAC_08.value != '' || frmItem.IT1_SAC_09.value != '' || frmItem.IT1_SAC_10.value != '')
			  	 window.opener.sac_row3[iIndex].style.display	=	"INLINE"	
			  else
			  	 window.opener.sac_row3[iIndex].style.display	=	"NONE"	 
			  	 
			  if(frmItem.IT1_SAC_01.value != '' || frmItem.IT1_SAC_05.value != '' || frmItem.IT1_SAC_02.value != '' || frmItem.IT1_SAC_06.value != '' || frmItem.IT1_SAC_07.value != '' || frmItem.IT1_SAC_12.value != '' || frmItem.IT1_SAC_08.value != '' || frmItem.IT1_SAC_09.value != '' || frmItem.IT1_SAC_10.value != '')
			   {
			    
			  	 window.opener.sac_row[iIndex].style.display	=	"INLINE"
			   }	 
			  else
			     window.opener.sac_row[iIndex].style.display	=	"NONE" 
			
			
			
			
		}
		
		else
		{
			
			
		
			window.opener.frm_810XSL.IT1_IT1_04.value			=	window.opener.roundOff(frmItem.IT1_04.value,2)
			//window.opener.frm_810XSL.IT1_IT1_01.value			=	frmItem.IT1_01.value
			
			window.opener.frm_810XSL.IT1_IT1_02.value			=	frmItem.IT1_02.value
			
			window.opener.frm_810XSL.IT1_IT1_03.value			=	frmItem.IT1_03.value
			
			
			
			
			///Service / Product ID Qualifiers
			window.opener.frm_810XSL.IT1_IT1_07.value			=	frmItem.IT1_07.value   
			window.opener.frm_810XSL.IT1_IT1_06.value		=	frmItem.IT1_06.options[frmItem.IT1_06.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_09.value			=	frmItem.IT1_09.value   
			window.opener.frm_810XSL.IT1_IT1_08.value		=	frmItem.IT1_08.options[frmItem.IT1_08.selectedIndex].text
			
			window.opener.frm_810XSL.IT1_IT1_11.value			=	frmItem.IT1_11.value   
			window.opener.frm_810XSL.IT1_IT1_10.value		=	frmItem.IT1_10.options[frmItem.IT1_10.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_13.value			=	frmItem.IT1_13.value   
			window.opener.frm_810XSL.IT1_IT1_12.value		=	frmItem.IT1_12.options[frmItem.IT1_12.selectedIndex].text
			
			window.opener.frm_810XSL.IT1_IT1_14.value		=	frmItem.IT1_14.options[frmItem.IT1_14.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_15.value			=	frmItem.IT1_15.value 
			window.opener.frm_810XSL.IT1_IT1_16.value		=	frmItem.IT1_16.options[frmItem.IT1_16.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_17.value			=	frmItem.IT1_17.value 
			window.opener.frm_810XSL.IT1_IT1_18.value		=	frmItem.IT1_18.options[frmItem.IT1_18.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_19.value			=	frmItem.IT1_19.value 
			window.opener.frm_810XSL.IT1_IT1_20.value		=	frmItem.IT1_20.options[frmItem.IT1_20.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_21.value			=	frmItem.IT1_21.value
			window.opener.frm_810XSL.IT1_IT1_22.value		=	frmItem.IT1_22.options[frmItem.IT1_22.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_23.value			=	frmItem.IT1_23.value
			window.opener.frm_810XSL.IT1_IT1_24.value		=	frmItem.IT1_24.options[frmItem.IT1_24.selectedIndex].text
			window.opener.frm_810XSL.IT1_IT1_25.value			=	frmItem.IT1_25.value
			
			if(frmItem.IT1_06.value != '' || frmItem.IT1_07.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_06.style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_07.style.display	=	"INLINE"
				window.opener.Psid_Row.style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_06.style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_07.style.display	=	"NONE"
			}
			if(frmItem.IT1_08.value != '' || frmItem.IT1_09.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_08.style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_09.style.display	=	"INLINE"
				window.opener.Psid_Row.style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_08.style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_09.style.display	=	"NONE"
			}
			
			if(frmItem.IT1_10.value != '' || frmItem.IT1_11.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_10.style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_11.style.display	=	"INLINE"
				window.opener.Psid_Row.style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_10.style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_11.style.display	=	"NONE"
			}
			
			if(frmItem.IT1_12.value != '' || frmItem.IT1_13.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_12.style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_13.style.display	=	"INLINE"
				window.opener.Psid_Row.style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_12.style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_13.style.display	=	"NONE"
			}
			
			if(frmItem.IT1_14.value != '' || frmItem.IT1_15.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_14.style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_15.style.display	=	"INLINE"
				window.opener.Psid_Row.style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_14.style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_15.style.display	=	"NONE"
			}
			
			if(frmItem.IT1_16.value != '' || frmItem.IT1_17.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_16.style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_17.style.display	=	"INLINE"
				window.opener.Psid_Row.style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_16.style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_17.style.display	=	"NONE"
			}
			
			if(frmItem.IT1_18.value != '' || frmItem.IT1_19.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_18.style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_19.style.display	=	"INLINE"
				window.opener.Psid_Row.style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_18.style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_19.style.display	=	"NONE"
			}
			if(frmItem.IT1_20.value != '' || frmItem.IT1_21.value != '')
			{
				window.opener.frm_810XSL.IT1_IT1_20.style.display	=	"INLINE"
				window.opener.frm_810XSL.IT1_IT1_21.style.display	=	"INLINE"
				window.opener.Psid_Row.style.display	=	"INLINE"
			}
			else
			{
				window.opener.frm_810XSL.IT1_IT1_20.style.display	=	"NONE"
				window.opener.frm_810XSL.IT1_IT1_21.style.display	=	"NONE"
			}
			if(frmItem.IT1_22.value != '' || frmItem.IT1_23.value != '')
			{
			    window.opener.frm_810XSL.IT1_IT1_22.style.display	=	"INLINE"
			    window.opener.frm_810XSL.IT1_IT1_23.style.display	=	"INLINE"
			    window.opener.Psid_Row.style.display	=	"INLINE"
			}
			else
			{
			    window.opener.frm_810XSL.IT1_IT1_22.style.display	=	"NONE"
			    window.opener.frm_810XSL.IT1_IT1_23.style.display	=	"NONE"
			}
			if(frmItem.IT1_24.value != '' || frmItem.IT1_25.value != '')
			{
			    window.opener.frm_810XSL.IT1_IT1_24.style.display	=	"INLINE"
			    window.opener.frm_810XSL.IT1_IT1_25.style.display	=	"INLINE"
			    window.opener.Psid_Row.style.display	=	"INLINE"
			}
			else
			{
			    window.opener.frm_810XSL.IT1_IT1_20.style.display	=	"NONE"
			    window.opener.frm_810XSL.IT1_IT1_21.style.display	=	"NONE"
			}
			//PID
			
			
			window.opener.frm_810XSL.IT1_PID_01.value	=	frmItem.PID_01.options[frmItem.PID_01.selectedIndex].text
            window.opener.frm_810XSL.IT1_PID_05.value	=	frmItem.PID_05.value
			
			
			if(frmItem.PID_01.value!="" || frmItem.PID_01.value!="")
			{
				window.opener.TR_PID_Row1.style.display	=	"INLINE"
				window.opener.PID_Row.style.display	=	"INLINE"
			}
			else
			{
				window.opener.TR_PID_Row1.style.display	=	"NONE"
				window.opener.PID_Row.style.display	=	"NONE"
			}
			//PO4
			 
				window.opener.frm_810XSL.IT1_PO4_01.value	=	frmItem.IT1_PO4_01.value 
				window.opener.frm_810XSL.IT1_PO4_14.value	=	frmItem.IT1_PO4_14.value 
			   
				if(frmItem.IT1_PO4_01.value != '' || frmItem.IT1_PO4_14.value != '')
				{	
					window.opener.po4_row.style.display	=	"INLINE"
					window.opener.po4_row_head1.style.display	=	"INLINE"
					window.opener.frm_810XSL.IT1_PO4_01.style.display	=	"INLINE"
					window.opener.frm_810XSL.IT1_PO4_14.style.display	=	"INLINE"
				}
				else
				{
					window.opener.po4_row.style.display	=	"NONE"
					window.opener.po4_row_head1.style.display	=	"NONE"
					window.opener.frm_810XSL.IT1_PO4_01.style.display	=	"NONE"
					window.opener.frm_810XSL.IT1_PO4_14.style.display	=	"NONE"
				}
			// SAC-LOOP 
			
			  window.opener.frm_810XSL.IT1_SAC_SAC_01.value			=	frmItem.IT1_SAC_01.options[frmItem.IT1_SAC_01.selectedIndex].text
			  window.opener.frm_810XSL.IT1_SAC_SAC_02.value			=	frmItem.IT1_SAC_02.options[frmItem.IT1_SAC_02.selectedIndex].text
			  window.opener.frm_810XSL.IT1_SAC_SAC_05.value			=	frmItem.IT1_SAC_05.value 
			  window.opener.frm_810XSL.IT1_SAC_SAC_06.value			=	frmItem.IT1_SAC_06.options[frmItem.IT1_SAC_06.selectedIndex].text
			  window.opener.frm_810XSL.IT1_SAC_SAC_07.value			=	frmItem.IT1_SAC_07.value 
			  window.opener.frm_810XSL.IT1_SAC_SAC_08.value			=	frmItem.IT1_SAC_08.value 
			  window.opener.frm_810XSL.IT1_SAC_SAC_09.value			=	frmItem.IT1_SAC_09.options[frmItem.IT1_SAC_09.selectedIndex].text
			  window.opener.frm_810XSL.IT1_SAC_SAC_10.value			=	frmItem.IT1_SAC_10.value 
			  window.opener.frm_810XSL.IT1_SAC_SAC_12.value			=	frmItem.IT1_SAC_12.options[frmItem.IT1_SAC_12.selectedIndex].text
			  
			  
			  if(frmItem.IT1_SAC_01.value != '' || frmItem.IT1_SAC_05.value != '' || frmItem.IT1_SAC_02.value != '')
			  	 window.opener.sac_row1.style.display	=	"INLINE"	
			  else
				 window.opener.sac_row1.style.display	=	"NONE"
			  if(frmItem.IT1_SAC_06.value != '' || frmItem.IT1_SAC_07.value != '' || frmItem.IT1_SAC_12.value != '')
			  	 window.opener.sac_row2.style.display	=	"INLINE"	
			  else
			  	 window.opener.sac_row2.style.display	=	"NONE"
			  if(frmItem.IT1_SAC_08.value != '' || frmItem.IT1_SAC_09.value != '' || frmItem.IT1_SAC_10.value != '')
			  	 window.opener.sac_row3.style.display	=	"INLINE"	
			  else
			  	 window.opener.sac_row3.style.display	=	"NONE"	 
			  	 
			  if(frmItem.IT1_SAC_01.value != '' || frmItem.IT1_SAC_05.value != '' || frmItem.IT1_SAC_02.value != '' || frmItem.IT1_SAC_06.value != '' || frmItem.IT1_SAC_07.value != '' || frmItem.IT1_SAC_12.value != '' || frmItem.IT1_SAC_08.value != '' || frmItem.IT1_SAC_09.value != '' || frmItem.IT1_SAC_10.value != '')
			  	 window.opener.sac_row.style.display	=	"INLINE"
			  else
			     window.opener.sac_row.style.display	=	"NONE"
			  
			 
			 
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
		<Link Rel="StyleSheet" Type="Text/Css" href="../../../../Includefile/infocon-global.css">
	</head>
	<BODY text="black" TopMargin="0" LeftMargin="0">
		<%
	Dim iIndex 
	iIndex	=	Trim(Request.QueryString("Mode")) 
	On Error Resume Next
	if CInt(iIndex) = 0 then 
		iIndex = 1
	else
		iIndex = iIndex+1
	End if
	
	if UCase(Request.QueryString("Create")) = "NEW" Then 
		''Edit By	:	Deepak Bansal
		IT1_01	=	Trim(Request.Form("IT1_IT1_01")(iIndex-1)+1)
		
	Else
		
		IT1_02		=	Trim(Request.Form("IT1_IT1_02")(iIndex))
		IT1_01		=	Trim(Request.Form("IT1_IT1_01")(iIndex))
		IT1_03		=	Trim(Request.Form("IT1_IT1_03")(iIndex))
		IT1_04		=	Trim(Request.Form("IT1_IT1_04")(iIndex))
		IT1_06		=   f_CutStringFromCombo(Trim(Request.Form("IT1_IT1_06")(iIndex)))
		IT1_07		=	Trim(Request.Form("IT1_IT1_07")(iIndex))
		IT1_08		=   f_CutStringFromCombo(Trim(Request.Form("IT1_IT1_08")(iIndex)))
		IT1_09		=	Trim(Request.Form("IT1_IT1_09")(iIndex))
		IT1_10		=   f_CutStringFromCombo(Trim(Request.Form("IT1_IT1_10")(iIndex)))
		IT1_11		=	Trim(Request.Form("IT1_IT1_11")(iIndex))
		IT1_12		=   f_CutStringFromCombo(Trim(Request.Form("IT1_IT1_12")(iIndex)))
		IT1_13		=	Trim(Request.Form("IT1_IT1_13")(iIndex))
		IT1_14		=   f_CutStringFromCombo(Trim(Request.Form("IT1_IT1_14")(iIndex)))
		IT1_15		=	Trim(Request.Form("IT1_IT1_15")(iIndex))
		IT1_16		=   f_CutStringFromCombo(Trim(Request.Form("IT1_IT1_16")(iIndex)))
		IT1_17		=	Trim(Request.Form("IT1_IT1_17")(iIndex))
		IT1_18		=   f_CutStringFromCombo(Trim(Request.Form("IT1_IT1_18")(iIndex)))
		IT1_19		=	Trim(Request.Form("IT1_IT1_19")(iIndex))
		IT1_20		=   f_CutStringFromCombo(Trim(Request.Form("IT1_IT1_20")(iIndex)))
		IT1_21		=	Trim(Request.Form("IT1_IT1_21")(iIndex))
        IT1_22		=   f_CutStringFromCombo(Trim(Request.Form("IT1_IT1_22")(iIndex)))
		IT1_23		=	Trim(Request.Form("IT1_IT1_23")(iIndex))
        IT1_24		=   f_CutStringFromCombo(Trim(Request.Form("IT1_IT1_24")(iIndex)))
		IT1_25		=	Trim(Request.Form("IT1_IT1_25")(iIndex))
		
		PID_01		=	f_CutStringFromCombo(Trim(Request.Form("IT1_PID_01")(iIndex)))
		PID_05		=	Trim(Request.Form("IT1_PID_05")(iIndex))
		
		IT1_PO4_01	=	Trim(Request.Form("IT1_PO4_01")(iIndex))
		IT1_PO4_14	=	Trim(Request.Form("IT1_PO4_14")(iIndex))
		
		IT1_SAC_01	=	f_CutStringFromCombo(Trim(Request.Form("IT1_SAC_SAC_01")(iIndex)))
		IT1_SAC_02	=	f_CutStringFromCombo(Trim(Request.Form("IT1_SAC_SAC_02")(iIndex)))
		IT1_SAC_05	=	Trim(Request.Form("IT1_SAC_SAC_05")(iIndex))
		IT1_SAC_06	=	f_CutStringFromCombo(Trim(Request.Form("IT1_SAC_SAC_06")(iIndex)))
		IT1_SAC_07	=	Trim(Request.Form("IT1_SAC_SAC_07")(iIndex))
		IT1_SAC_08	=	Trim(Request.Form("IT1_SAC_SAC_08")(iIndex))
		IT1_SAC_09	=	f_CutStringFromCombo(Trim(Request.Form("IT1_SAC_SAC_09")(iIndex)))
		IT1_SAC_10	=	Trim(Request.Form("IT1_SAC_SAC_10")(iIndex))
		IT1_SAC_12	=	f_CutStringFromCombo(Trim(Request.Form("IT1_SAC_SAC_12")(iIndex)))
			
	End if 
	
	
%>
		<Table Width="100%" Cellpadding="0" cellspacing="0" height="100%" bgcolor="#FFFFFF" border="0">
			<TR>
				<TD align="center"><BR>
					<BR>
					<B>Add/Edit Item Details<B></TD>
			</TR>
			<TR>
				<TD><HR style="Color:black">
				</TD>
			</TR>
			<TR>
				<TD Bgcolor="#ffffff" width="85%" valign="top">
					<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="white">
						<TR>
							<TD nowrap="nowrap"><IMG SRC="/images/pixel.gif" WIDTH="640" HEIGHT="1" ALT=""></TD>
						</TR>
						<tr>
							<td valign="top">
								<form method="post" action="Inv_Item.asp" name="frmItem" onsubmit="return fillform()">
									<div id="td_Item_Detail" align="center"><Fieldset align="center" style="width:98%;border-color:black"><Legend>Item Detail</Legend>
											<table width='100%' class='header' border="0">
												<tr>
													<td align="center"><b>Price<FONT COLOR="RED">*</FONT></b></td>
													<TD><B>:</B></TD>
													<td align="left"><input class="inputText"  type=text Name="IT1_04" size=14 maxlength=10 value="<%=IT1_04%>"></td>
												</tr>
												<tr>
													<td align="center" nowrap><b>Quantity Invoiced<FONT COLOR="RED">*</FONT></b></td>
													<TD><B>:</B></TD>
													<td align="left"><input class="inputText"  type=text Name="IT1_02" size=9 maxlength=10 value="<%=IT1_02%>"></td>
												</tr>
												<TR>
													<TD width="30%" Align="center" nowrap><B><B>UOM<FONT COLOR="RED">*</FONT></B></TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_03" style='width:200'>
															<Option value=""></Option>
															<Option value="CA"  <%if IT1_03 = "CA" THEN%>selected<%end if %>>CA Case</Option>
															<Option value="EA"  <%if IT1_03 = "EA" THEN%>selected<%end if %>>EA Each</Option>
														</select>
													</TD>
												</TR>
												<!--<tr>
													<td align="center" nowrap><b>PO Line Number</b></td>
													<TD><B>:</B></TD>
													<td align="left"><input class="inputText"  type=text Name="IT1_01" size=13 maxlength=11 value="<%=IT1_01%>"></td>
												</tr>-->
											</table>
										</Fieldset>
									</div>
									<div id="td_PSID_Detail" align="center">
										<Fieldset style="width:98%;border-color:black" align="center">
											<Legend>Service / Product ID And Qualifier</Legend>
											<table width='100%' class='header' border="0">
												<TR>
													<TD width="30%" Align="center" nowrap><B>ID Qualifier 1 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_06" style='width:275'>
															<Option value=""></Option>
															<Option value="CH"  <%if IT1_06 = "CH" THEN%>selected<%end if %>>CH Country of Origin Code</Option>
															<Option value="IN"  <%if IT1_06 = "IN" THEN%>selected<%end if %>>IN Buyers Item Number</Option>
															<Option value="EN"  <%if IT1_06 = "EN" THEN%>selected<%end if %>>EN EAN/UCC-13</Option>
															<Option value="LT"  <%if IT1_06 = "LT" THEN%>selected<%end if %>>LT Lot Number</Option>
												<!--			<Option value="UI"  <%if IT1_06 = "UI" THEN%>selected<%end if %>>UI UPC Consumer Package Code(1-5-5)</Option-->>
															<Option value="UK"  <%if IT1_06 = "UK" THEN%>selected<%end if %>>UK Global Trade Item Number</Option>
															<Option value="UP"  <%if IT1_06 = "UP" THEN%>selected<%end if %>>UP UCC-12</Option>
															<Option value="ZZ"  <%if IT1_06 = "ZZ" THEN%>selected<%end if %>>ZZ Mutually Defined</Option>
														</select>
													</TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B><B> ID 1 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_07" value="<%=IT1_07%>" maxlength='45' size="35"></TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B>ID Qualifier 2 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_08" style='width:275' ID="Select6">
															<Option value=""></Option>
															<Option value="CH"  <%if IT1_08 = "CH" THEN%>selected<%end if %>>CH Country of Origin Code</Option>
															<Option value="IN"  <%if IT1_08 = "IN" THEN%>selected<%end if %>>IN Buyers Item Number</Option>
															<Option value="EN"  <%if IT1_08 = "EN" THEN%>selected<%end if %>>EN EAN/UCC-13</Option>
															<Option value="LT"  <%if IT1_08 = "LT" THEN%>selected<%end if %>>LT Lot Number</Option>
													<!--		<Option value="UI"  <%if IT1_08 = "UI" THEN%>selected<%end if %>>UI UPC Consumer Package Code(1-5-5)</Option>-->
															<Option value="UK"  <%if IT1_08 = "UK" THEN%>selected<%end if %>>UK Global Trade Item Number</Option>
															<Option value="UP"  <%if IT1_08 = "UP" THEN%>selected<%end if %>>UP UCC-12</Option>
															<Option value="ZZ"  <%if IT1_08 = "ZZ" THEN%>selected<%end if %>>ZZ Mutually Defined</Option>
														</select>
													</TD>
												</TR>
												
												<TR>
													<TD width="30%" Align="center" nowrap><B><B> ID 2 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_09" value="<%=IT1_09%>" maxlength='45' size="35" ID="Text4"></TD>
												</TR>
												
												<TR>
													<TD width="30%" Align="center" nowrap><B>ID Qualifier 3 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_10" style='width:275' ID="Select6">
															<Option value=""></Option>
															<Option value="CH"  <%if IT1_10 = "CH" THEN%>selected<%end if %>>CH Country of Origin Code</Option>
															<Option value="IN"  <%if IT1_10 = "IN" THEN%>selected<%end if %>>IN Buyers Item Number</Option>
															<Option value="EN"  <%if IT1_10 = "EN" THEN%>selected<%end if %>>EN EAN/UCC-13</Option>
															<Option value="LT"  <%if IT1_10 = "LT" THEN%>selected<%end if %>>LT Lot Number</Option>
													<!--		<Option value="UI"  <%if IT1_10 = "UI" THEN%>selected<%end if %>>UI UPC Consumer Package Code(1-5-5)</Option>-->
															<Option value="UK"  <%if IT1_10 = "UK" THEN%>selected<%end if %>>UK Global Trade Item Number</Option>
															<Option value="UP"  <%if IT1_10 = "UP" THEN%>selected<%end if %>>UP UCC-12</Option>
															<Option value="ZZ"  <%if IT1_10 = "ZZ" THEN%>selected<%end if %>>ZZ Mutually Defined</Option>
														</select>
													</TD>
												</TR>
												
												<TR>
													<TD width="30%" Align="center" nowrap><B><B> ID 3 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_11" value="<%=IT1_11%>" maxlength='45' size="35" ID="Text4"></TD>
												</TR>
												
												<TR>
													<TD width="30%" Align="center" nowrap><B>ID Qualifier 4 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_12" style='width:275' ID="Select6">
															<Option value=""></Option>
															<Option value="CH"  <%if IT1_12 = "CH" THEN%>selected<%end if %>>CH Country of Origin Code</Option>
															<Option value="IN"  <%if IT1_12 = "IN" THEN%>selected<%end if %>>IN Buyers Item Number</Option>
															<Option value="EN"  <%if IT1_12 = "EN" THEN%>selected<%end if %>>EN EAN/UCC-13</Option>
															<Option value="LT"  <%if IT1_12 = "LT" THEN%>selected<%end if %>>LT Lot Number</Option>
															<!--<Option value="UI"  <%if IT1_12 = "UI" THEN%>selected<%end if %>>UI UPC Consumer Package Code(1-5-5)</Option>-->
															<Option value="UK"  <%if IT1_12 = "UK" THEN%>selected<%end if %>>UK Global Trade Item Number</Option>
															<Option value="UP"  <%if IT1_12 = "UP" THEN%>selected<%end if %>>UP UCC-12</Option>
															<Option value="ZZ"  <%if IT1_12 = "ZZ" THEN%>selected<%end if %>>ZZ Mutually Defined</Option>
														</select>
													</TD>
												</TR>
												
												<TR>
													<TD width="30%" Align="center" nowrap><B><B> ID 4 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_13" value="<%=IT1_13%>" maxlength='45' size="35" ID="Text4"></TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B>ID Qualifier 5 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_14" style='width:275' ID="Select6">
															<Option value=""></Option>
															<Option value="CH"  <%if IT1_14 = "CH" THEN%>selected<%end if %>>CH Country of Origin Code</Option>
															<Option value="IN"  <%if IT1_14 = "IN" THEN%>selected<%end if %>>IN Buyers Item Number</Option>
															<Option value="EN"  <%if IT1_14 = "EN" THEN%>selected<%end if %>>EN EAN/UCC-13</Option>
															<Option value="LT"  <%if IT1_14 = "LT" THEN%>selected<%end if %>>LT Lot Number</Option>
															<!--<Option value="UI"  <%if IT1_14 = "UI" THEN%>selected<%end if %>>UI UPC Consumer Package Code(1-5-5)</Option>-->
															<Option value="UK"  <%if IT1_14 = "UK" THEN%>selected<%end if %>>UK Global Trade Item Number</Option>
															<Option value="UP"  <%if IT1_14 = "UP" THEN%>selected<%end if %>>UP UCC-12</Option>
															<Option value="ZZ"  <%if IT1_14 = "ZZ" THEN%>selected<%end if %>>ZZ Mutually Defined</Option>
														</select>
													</TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B><B> ID 5 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_15" value="<%=IT1_15%>" maxlength='45' size="35" ID="Text4"></TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B>ID Qualifier 6 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_16" style='width:275' ID="Select6">
															<Option value=""></Option>
															<Option value="CH"  <%if IT1_16 = "CH" THEN%>selected<%end if %>>CH Country of Origin Code</Option>
															<Option value="IN"  <%if IT1_16 = "IN" THEN%>selected<%end if %>>IN Buyers Item Number</Option>
															<Option value="EN"  <%if IT1_16 = "EN" THEN%>selected<%end if %>>EN EAN/UCC-13</Option>
															<Option value="LT"  <%if IT1_16 = "LT" THEN%>selected<%end if %>>LT Lot Number</Option>
															<!--<Option value="UI"  <%if IT1_16 = "UI" THEN%>selected<%end if %>>UI UPC Consumer Package Code(1-5-5)</Option>-->
															<Option value="UK"  <%if IT1_16 = "UK" THEN%>selected<%end if %>>UK Global Trade Item Number</Option>
															<Option value="UP"  <%if IT1_16 = "UP" THEN%>selected<%end if %>>UP UCC-12</Option>
															<Option value="ZZ"  <%if IT1_16 = "ZZ" THEN%>selected<%end if %>>ZZ Mutually Defined</Option>
														</select>
													</TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B><B> ID 6 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_17" value="<%=IT1_17%>" maxlength='45' size="35" ID="Text4"></TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B>ID Qualifier 7</B>
													</TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_18" style='width:275' ID="Select6">
															<Option value=""></Option>
															<Option value="CH"  <%if IT1_18 = "CH" THEN%>selected<%end if %>>CH Country of Origin Code</Option>
															<Option value="IN"  <%if IT1_18 = "IN" THEN%>selected<%end if %>>IN Buyers Item Number</Option>
															<Option value="EN"  <%if IT1_18 = "EN" THEN%>selected<%end if %>>EN EAN/UCC-13</Option>
															<Option value="LT"  <%if IT1_18 = "LT" THEN%>selected<%end if %>>LT Lot Number</Option>
															<Option value="UK"  <%if IT1_18 = "UK" THEN%>selected<%end if %>>UK Global Trade Item Number</Option>
															<Option value="UP"  <%if IT1_18 = "UP" THEN%>selected<%end if %>>UP UCC-12</Option>
															<Option value="ZZ"  <%if IT1_18 = "ZZ" THEN%>selected<%end if %>>ZZ Mutually Defined</Option>
														</select>
													</TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B><B> ID 7 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_19" value="<%=IT1_19%>" maxlength='45' size="35" ID="Text4"></TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B>ID Qualifier 8</B>
													</TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_20" style='width:275' ID="Select6">
															<Option value=""></Option>
															<Option value="CH"  <%if IT1_20 = "CH" THEN%>selected<%end if %>>CH Country of Origin Code</Option>
															<Option value="IN"  <%if IT1_20 = "IN" THEN%>selected<%end if %>>IN Buyers Item Number</Option>
															<Option value="EN"  <%if IT1_20 = "EN" THEN%>selected<%end if %>>EN EAN/UCC-13</Option>
															<Option value="LT"  <%if IT1_20 = "LT" THEN%>selected<%end if %>>LT Lot Number</Option>
															<Option value="UK"  <%if IT1_20 = "UK" THEN%>selected<%end if %>>UK Global Trade Item Number</Option>
															<Option value="UP"  <%if IT1_20 = "UP" THEN%>selected<%end if %>>UP UCC-12</Option>
															<Option value="ZZ"  <%if IT1_20 = "ZZ" THEN%>selected<%end if %>>ZZ Mutually Defined</Option>
														</select>
													</TD>
												</TR>
                                                <TR>
													<TD width="30%" Align="center" nowrap><B><B> ID 8 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_21" value="<%=IT1_21%>" maxlength='45' size="35" ID="Text4"></TD>
												</TR>
                                                <TR>
													<TD width="30%" Align="center" nowrap><B>ID Qualifier 9</B>
													</TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_22" style='width:275' ID="Select6">
															<Option value=""></Option>
															<Option value="CH"  <%if IT1_22 = "CH" THEN%>selected<%end if %>>CH Country of Origin Code</Option>
															<Option value="IN"  <%if IT1_22 = "IN" THEN%>selected<%end if %>>IN Buyers Item Number</Option>
															<Option value="EN"  <%if IT1_22 = "EN" THEN%>selected<%end if %>>EN EAN/UCC-13</Option>
															<Option value="LT"  <%if IT1_22 = "LT" THEN%>selected<%end if %>>LT Lot Number</Option>
															<Option value="UK"  <%if IT1_22 = "UK" THEN%>selected<%end if %>>UK Global Trade Item Number</Option>
															<Option value="UP"  <%if IT1_22 = "UP" THEN%>selected<%end if %>>UP UCC-12</Option>
															<Option value="ZZ"  <%if IT1_22 = "ZZ" THEN%>selected<%end if %>>ZZ Mutually Defined</Option>
														</select>
													</TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B><B> ID 9 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_23" value="<%=IT1_23%>" maxlength='45' size="35" ID="Text4"></TD>
												</TR>
                                                <TR>
													<TD width="30%" Align="center" nowrap><B>ID Qualifier 10</B>
													</TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_24" style='width:275' ID="Select6">
															<Option value=""></Option>
															<Option value="CH"  <%if IT1_24 = "CH" THEN%>selected<%end if %>>CH Country of Origin Code</Option>
															<Option value="IN"  <%if IT1_24 = "IN" THEN%>selected<%end if %>>IN Buyers Item Number</Option>
															<Option value="EN"  <%if IT1_24 = "EN" THEN%>selected<%end if %>>EN EAN/UCC-13</Option>
															<Option value="LT"  <%if IT1_24 = "LT" THEN%>selected<%end if %>>LT Lot Number</Option>
															<Option value="UK"  <%if IT1_24 = "UK" THEN%>selected<%end if %>>UK Global Trade Item Number</Option>
															<Option value="UP"  <%if IT1_24 = "UP" THEN%>selected<%end if %>>UP UCC-12</Option>
															<Option value="ZZ"  <%if IT1_24 = "ZZ" THEN%>selected<%end if %>>ZZ Mutually Defined</Option>
														</select>
													</TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B><B> ID 10 </B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_25" value="<%=IT1_25%>" maxlength='45' size="35" ID="Text4"></TD>
												</TR>
											</table>
										</Fieldset>
									</div>
									<div id="Div1" align="center">
										<Fieldset style="width:98%;border-color:black" align="center">
											<Legend>Product/Item Description</Legend>
											<table width='100%' class='header' border="0" ID="Table4">
												<TR>
													<TD width="30%" Align="center"><B>Type</B></TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="PID_01" style='width:220'>
														<option></option>
															<Option value="F"  <%if PID_01 = "F" THEN%>selected<%end if %>>F Free-form</Option>	
														</select>
													</TD>
												</TR>
												<TR>
													<TD width="30%" Align="center"><B>Description</B></TD>
													<TD><B>:</B></TD>
													<TD>
														
															<Input type=text class='inputText' name='PID_05' Maxlength='80' size='50' VALUE='<%=PID_05%>'>
														
													</TD>
												</TR>
											</table>
										</Fieldset>
									</div>
									<div id="td_po4_detail" align="center">
										<Fieldset style="width:98%;border-color:black" align="center">
											<Legend>Item Physical Details</Legend>
											<table width='100%' class='header' border="0" ID="Table2">
												<TR>
													<TD width="30%" Align="center" nowrap><B>Pack</B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_PO4_01" value="<%=IT1_PO4_01%>" maxlength='6' size="10" ID="Text5"></TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B>Inner Pack</B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_PO4_14" value="<%=IT1_PO4_14%>" maxlength='6' size="10" ID="Text6"></TD>
												</TR>
												
											</table>
										</Fieldset>
									</div>
									<div id="td_sac" align="center">
										<Fieldset style="width:98%;border-color:black" align="center">
											<Legend>Allowance/Charge Information</Legend>
											<table width='100%' class='header' border="0" ID="Table3">
												
												<TR>
													<TD width="30%" Align="center" nowrap><B><B> Allowance/Charge Indicator </B>
													</TD>
													<TD><B>:</B></TD>
													<TD>
													   <select class="inputText" Name="IT1_SAC_01" style='width:275' ID="Select3">
															<Option value=""></Option>
															<Option value="A"  <%if IT1_SAC_01 = "A" THEN%>selected<%end if %>>A Allowance</Option>
															<Option value="C"  <%if IT1_SAC_01 = "C" THEN%>selected<%end if %>>C Charge</Option>
															
															
													  </select>
													</TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B>Code</B></TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_SAC_02" style='width:275' ID="Select4">
															<% Call f_FillPopupCombo("ServicePromotionAllowanceCode_1300",IT1_SAC_02) %>
													  </select>
													</TD>
												</TR>
												
												<TR>
													<TD width="30%" Align="center" nowrap><B>Amount</B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_SAC_05" value="<%=IT1_SAC_05%>" maxlength='15' size="20" ID="Text1"></TD>
												</TR>
												
												<TR>
													<TD width="30%" Align="center" nowrap><B>Percent Qualifier</B></TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_SAC_06" style='width:275' ID="Select2">
															<Option value=""></Option>
															<Option value="1"  <%if IT1_SAC_06 = "1" THEN%>selected<%end if %>>1 Item List Cost</Option>
															<Option value="2"  <%if IT1_SAC_06 = "2" THEN%>selected<%end if %>>2 Item Net Cost</Option>
															<Option value="3"  <%if IT1_SAC_06 = "3" THEN%>selected<%end if %>>3 Discount/Gross</Option>
															<Option value="4"  <%if IT1_SAC_06 = "4" THEN%>selected<%end if %>>4 Discount/Net</Option>
															<Option value="5"  <%if IT1_SAC_06 = "5" THEN%>selected<%end if %>>5 Base Price per Unit</Option>
															<Option value="6"  <%if IT1_SAC_06 = "6" THEN%>selected<%end if %>>6 Base Price Amount</Option>
															<Option value="7"  <%if IT1_SAC_06 = "7" THEN%>selected<%end if %>>7 Base Price Amount Less Privious Discount</Option>
													  </select>
													</TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B>Percent</B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_SAC_07" value="<%=IT1_SAC_07%>" maxlength='7' size="15" ID="Text2" onchange="javaScript:change(frmItem.IT1_SAC_07)"></TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B>Rate</B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_SAC_08" value="<%=IT1_SAC_08%>" maxlength='9' size="15" ID="Text3"></TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B>UOM</B></TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_SAC_09" style='width:275' ID="Select7">
															<Option value=""></Option>
															<Option value="CA"  <%if IT1_SAC_09 = "CA" THEN%>selected<%end if %>>CA Case</Option>
															<Option value="EA"  <%if IT1_SAC_09 = "EA" THEN%>selected<%end if %>>EA Each</Option>
															
													  </select>
													</TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B>Quantity</B>
													</TD>
													<TD><B>:</B></TD>
													<TD><INPUT TYPE="text" Class="inputtext" Name = "IT1_SAC_10" value="<%=IT1_SAC_10%>" maxlength='9' size="15" ID="Text7"></TD>
												</TR>
												<TR>
													<TD width="30%" Align="center" nowrap><B>Handling Code</B></TD>
													<TD><B>:</B></TD>
													<TD>
														<select class="inputText" Name="IT1_SAC_12" style='width:275' ID="Select5">
															<Option value=""></Option>
															<Option value="02"  <%if IT1_SAC_12 = "02" THEN%>selected<%end if %>>02 Off Invoice</Option>
															<Option value="06"  <%if IT1_SAC_12 = "06" THEN%>selected<%end if %>>06 Paid by Customer</Option>
															
													  </select>
													</TD>
												</TR>
											
												
											</table>
										</Fieldset>
									</div>
									
									
									
									
									
									
									<table width='100%' class='header' border="0" Align="left">
										<tr>
											<td>&nbsp;
											</td>
										</tr>
										<tr>
											<td align="right" colspan="2">&nbsp</td>
											<TD align="center"><input type="submit" value="OK" Style="width:100" name="buttonItem" Class="InputButton">&nbsp;&nbsp;<input type="Button" value="Cancel" name="buttonItem" Style="width:100" Class="InputButton" onclick="window.close()"></TD>
										</tr>
									</table>
								</form>
							</td>
						</tr>
					</table>
					<!-- /Document table -->
				</TD>
			</TR>
		</Table>
	</BODY>
</html>
