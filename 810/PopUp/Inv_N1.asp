<%
	Response.Buffer	=	True
	
%>
<HTML>
	<head>
		<title>Infocon System | EDI | Edit
			<%=sCaption%>
			Details</title>
		<Link Rel="StyleSheet" Type="Text/Css" href="../../../../Includefile/infocon-global.css">
			<SCRIPT LANGUAGE="javascript">
<!--
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
function setTable(iIndexNo)
{	
	var iSetIndex = iIndexNo	
	var N1_N1_02 = "N1_N1_02"+iSetIndex
	var N1_N1_03 = "N1_N1_03"+iSetIndex
	var N1_N1_04 = "N1_N1_04"+iSetIndex
	var N1_N3_01 = "N1_N3_01"+iSetIndex
	var N1_N3_02 = "N1_N3_02"+iSetIndex
	var N1_N4_01 = "N1_N4_01"+iSetIndex
	var N1_N4_02 = "N1_N4_02"+iSetIndex
	var N1_N4_03 = "N1_N4_03"+iSetIndex
	var N1_N4_04 = "N1_N4_04"+iSetIndex
	
	
	var sContent = "<TABLE width='90%' Align='Left' cellpadding='0' cellspacing='0' BORDER='0'>"
				
				
				
				if(iIndexNo=='2')
				 {
						
							if(document.frmN1.N1_03.value!="")
							{
								sContent=sContent + "<TR> <TD>" +
									"<INPUT TYPE='text' name='Delemeter' value='ID [' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='3' readonly='true'/>" +
									"<INPUT size='2' TYPE='text' name='"+N1_N1_03+"' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true'>" +
									"<INPUT TYPE='text' name='Delemeter' value= ']=' size='1' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true'/>" +
									"<INPUT TYPE='text' name='"+N1_N1_04+"' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true' size='15'>"+
									
									
									"</TD></TR>" 
							}
						
							if(document.frmN1.N1_02.value!="")
							{
								sContent=sContent + "<TR> <TD>" +
									"<INPUT TYPE='text' name='"+N1_N1_02+"' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true' size='50'>" +
									"</TD></TR>" 
							}				
							
								
							if(document.frmN1.N3_01.value != "")
							{
								sContent=sContent +
								"<TR>" +
									"<TD >" +
									"<INPUT TYPE='text' size='55' name='"+N1_N3_01+"' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true'>" +
								"</TD>" +
								"</TR>" 
							}
							if(document.frmN1.N3_02.value != "")
							{
								sContent=sContent +
								"<TR>" +
									"<TD >" +
									"<INPUT TYPE='text' size='55' name='"+N1_N3_02+"' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true'>" +
								"</TD>" +
								"</TR>" 
							}
							
							
							sContent=sContent+ "<TR>" +
						"<TD>" + frmN1.N4_01.value
							
							
							sContent	=	sContent+"  "+frmN1.N4_02.value				
							sContent	=	sContent+"  "+frmN1.N4_03.value
							sContent	=	sContent+"  "+frmN1.N4_04.value
							
						sContent	=	sContent +	"<INPUT TYPE='hidden' name='"+N1_N4_01+"'  Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true'> " +
							"<INPUT TYPE='hidden' name='"+N1_N4_02+"'  size='2' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true'> " +
							"<INPUT TYPE='hidden' name='"+N1_N4_03+"'  size='6' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true'> " +
							"<INPUT TYPE='hidden' name='"+N1_N4_04+"'  size='6' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true'> " +
				            
						"</TD>" +		    
						"</TR>"
					sContent = sContent +"</TABLE>"
				}
				if(iIndexNo=='1')	
				 {
					if(document.frmN1.N1_03.value!="")
							{
								sContent=sContent + "<TR> <TD>" +
									"<INPUT TYPE='text' name='Delemeter' value='ID [' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' size='3' readonly='true'/>" +
									"<INPUT size='2' TYPE='text' name='"+N1_N1_03+"' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true'>" +
									"<INPUT TYPE='text' name='Delemeter' value= ']=' size='1' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true'/>" +
									"<INPUT TYPE='text' name='"+N1_N1_04+"' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true' size='15'>"+
									
									
									"</TD></TR>" 
							}
						
							if(document.frmN1.N1_02.value!="")
							{
								sContent=sContent + "<TR> <TD>" +
									"<INPUT TYPE='text' name='"+N1_N1_02+"' Class='inputtext' style='BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px' readonly='true' size='50'>" +
									"</TD></TR>" 
							}	
							sContent = sContent +"</TABLE>"			
							
				}			
		
		switch(iIndexNo)
		{
			
			
		    	
			case "1":
				window.opener.Su.innerHTML = sContent
				break
			case "2":
				window.opener.St.innerHTML = sContent
				break
			
				
		}
		
			
}
var iIndexNo	=	"<%=Request.QueryString("Mode")%>"	

function changeValue()
{
	if(validate(iIndexNo) == true)
	{	
		setTable(iIndexNo)
		if(document.frmN1.N1_02.value!="")
		{
			eval("window.opener.frm_810XSL.N1_N1_02"+iIndexNo+".value		=	frmN1.N1_02.value")
		}
		if(document.frmN1.N1_03.value!="")
		{
			eval("window.opener.frm_810XSL.N1_N1_03"+iIndexNo+".value		=	frmN1.N1_03.value")
			eval("window.opener.frm_810XSL.N1_N1_04"+iIndexNo+".value		=	frmN1.N1_04.value")
		}
		if(iIndexNo=='2')
		 {
				if(document.frmN1.N3_01.value != "")
				{
					eval("window.opener.frm_810XSL.N1_N3_01"+iIndexNo+".value		=	frmN1.N3_01.value")
				}
				if(document.frmN1.N3_02.value != "")
				{
					eval("window.opener.frm_810XSL.N1_N3_02"+iIndexNo+".value		=	frmN1.N3_02.value")
				}
				if(document.frmN1.N4_01.value != "")
				{		
					eval("window.opener.frm_810XSL.N1_N4_01"+iIndexNo+".value		=	frmN1.N4_01.value")
				}
				if(document.frmN1.N4_02.value != "")
				{	
					eval("window.opener.frm_810XSL.N1_N4_02"+iIndexNo+".value		=	frmN1.N4_02.value")
				}
				if(document.frmN1.N4_03.value != "")
				{	
					eval("window.opener.frm_810XSL.N1_N4_03"+iIndexNo+".value		=	frmN1.N4_03.value")
				}
				if(document.frmN1.N4_04.value != "")
				{	
					eval("window.opener.frm_810XSL.N1_N4_04"+iIndexNo+".value		=	frmN1.N4_04.value")
				}
		  }
		window.close()
	}	
	else
	{
		return false
	}
}


function validate(iIndex)
{
	
	if(removeSpace(document.frmN1.N1_02) != true)
	{
		return false
	}
		 
	if(removeSpace(document.frmN1.N1_04) != true)
	{
		return false
	}
	
	if(iIndex=='2')
	 {	
		if(removeSpace(document.frmN1.N3_01) != true)
		{
			return false
		}
		if(removeSpace(document.frmN1.N3_02) != true)
		{
			return false
		}
		if(removeSpace(document.frmN1.N4_01) != true)
		{
			return false
		}
		if(removeSpace(document.frmN1.N4_02) != true)
		{
			return false
		}
		if(removeSpace(document.frmN1.N4_03) != true)
		{
			return false
		}
		if(removeSpace(document.frmN1.N4_04) != true)
		{
			return false
		}
	 }
	if(iIndexNo=="1")
	 {
		if(document.frmN1.N1_03.value=="" && document.frmN1.N1_02.value=="")
			{
				alert(" Please Select : \n ID Qualifier \n OR Name")
				document.frmN1.N1_03.focus()
				return false
			}
	 }
	else
	 {
		if(document.frmN1.N1_03.value=="")
			{
				alert(" Please Select : \n ID Qualifier")
				document.frmN1.N1_03.focus()
				return false
			}
	 }
	
	
	
	if(document.frmN1.N1_03.value == "" && document.frmN1.N1_04.value != "")
	{
		alert("Please Select ID Qualifier")
		document.frmN1.N1_03.focus()
		return false
	}
	if(document.frmN1.N1_03.value != "" && document.frmN1.N1_04.value == "")
	{
		alert("Please Enter ID")
		document.frmN1.N1_04.focus()
		return false
	} 
	
	
	if(iIndex=='2')
	 {	
		if(document.frmN1.N1_04.value.length!="13")
		{
			alert("Please enter 13 digit id")
			document.frmN1.N1_04.select()
			return false
		}
			
		if(document.frmN1.N4_03.value != "")
		{
			if(document.frmN1.N4_03.value!="" && isNaN(document.frmN1.N4_03.value))
			{
				alert("Please Enter Numeric value In Zip Code")
				document.frmN1.N4_03.focus()
				return false
			}
		}	
	}
	return true 
}
//-->
			</SCRIPT>
	</head>
	<%
	
	iIndex		=	Request.QueryString("Mode") 
	
Select Case(iIndex)	
	
	Case	"1"
		sCaption		=	"Supplier/Manufacturer"
		EntityID		=	"SU"
		N1_02		=	Trim(Request.Form("N1_N1_02" & iIndex))
		N1_04		=	Trim(Request.Form("N1_N1_04" & iIndex))
		N1_03		=	Trim(Request.Form("N1_N1_03" & iIndex))
	
	Case	"2"
		sCaption		=	"Ship To"
		EntityID		=	"ST"
		N1_02		=	Trim(Request.Form("N1_N1_02" & iIndex))
		N1_04		=	Trim(Request.Form("N1_N1_04" & iIndex))
		N1_03		=	Trim(Request.Form("N1_N1_03" & iIndex))
		N3_01		=	Trim(Request.Form("N1_N3_01" & iIndex))
		N3_02		=	Trim(Request.Form("N1_N3_02" & iIndex))
		N4_01		=	Trim(Request.Form("N1_N4_01" & iIndex))
		N4_02		=	Trim(Request.Form("N1_N4_02" & iIndex))
		N4_03		=	Trim(Request.Form("N1_N4_03" & iIndex))
		N4_04		=	Trim(Request.Form("N1_N4_04" & iIndex))
End Select 

		On Error Resume Next 
		
		
%>
	<BODY text="black" TopMargin="0" LeftMargin="0">
		<BR>
		<BR>
		<Table Width="100%" Cellpadding="0" cellspacing="0"  bgcolor="#FFFFFF" border="0">
			<TR>
				<TD valign="top" align="center" id="td_n1_01_Header"><Font size="3" color="navy">Edit
						<%=sCaption%>
						Details</Font></TD>
			</TR>
			<TR>
				<TD valign="top"><HR style="width:100%;color:black">
				</TD>
			</TR>
			<TR>
				<TD Bgcolor="#ffffff" width="85%" valign="top">
					<BR>
					<table width="100%" cellpadding="0" cellspacing="0" border="0" bgcolor="white">
						<tr>
							<td>
								<form method="post" Action="Inv_N1.asp" name="frmN1" onsubmit="return changeValue()">
									<table width="100%" border="0" cellpadding="3" bgcolor="#FFFFFF">
										<input type="hidden" name="hid_id" value=<%=EntityID%>>
										<tr>
											<td align="right"><b>Entity ID code:</b></td>
											<td align="left" id="td_n1_01"><B><%=EntityID%></B></td>
										</tr>
										<tr>
											<td align="right"><b>ID Qualifier:</b></td>
											<td align="left">
												<select class="inputText" name="N1_03" style='width:300'>
													<Option value=''></Option>
													<%if iIndex = "1" then %>
													<!--	<Option value='1' <%if N1_03 = "1" Then%>selected<%End if%>>1 DUNS Number,Dun & Bradstreet</Option>
														<Option value='9' <%if N1_03 = "9" Then%>selected<%End if%>>9 DUNS+4,DUNS Number with Four Character Suffix</Option>-->
														<Option value='UL' <%if N1_03 = "UL" Then%>selected<%End if%>>UL Global Location Number(GLN)</Option>
													<%else%>
														<Option value='UL' <%if N1_03 = "UL" Then%>selected<%End if%>>UL Global Location Number(GLN)</Option>
													<%end if%>														
												</select>
											</td>
										<tr>
											<td align="right"><b>ID:</b></td>
											<td align="left"><input class="inputText" type=text Name=N1_04 size=15 maxlength="80"  value="<%=N1_04%>" ID="Text1"></td>
										</tr>
										<tr>
											<td align="right"><b>Name:</b></td>
											<td align="left"><input class="inputText" type=text Name=N1_02 size=60 maxlength="55" value="<%=N1_02%>" onchange=javascript:this.value=this.value.toUpperCase(); ID="Text4"></td>
										</tr>
										<%if iIndex = "2" then %>
										<tr>
											<td align="right"><b>Address1:</b></td>
											<td align="left"><input class="inputText" type=text Name=N3_01 size=60 maxlength="55" value="<%=N3_01%>" onchange=javascript:this.value=this.value.toUpperCase();></td>
										</tr>
										<tr>
											<td align="right"><b>Address2:</b></td>
											<td align="left"><input class="inputText" type=text Name=N3_02 size=60 maxlength="55" value="<%=N3_02%>" onchange=javascript:this.value=this.value.toUpperCase(); ID="Text2"></td>
										</tr>
										<tr>
											<td align="right"><b>City:</b></td>
											<td align="left"><input class="inputText" type=text Name=N4_01 size=35 maxlength=30 value="<%=N4_01%>" onchange=javascript:this.value=this.value.toUpperCase();></td>
										</tr>
										<tr>
											<td align="right"><b>State:</b></td>
											<td align="left"><input class="inputText" type=text Name=N4_02 size=2 maxlength=2 value="<%=N4_02%>" onchange=javascript:this.value=this.value.toUpperCase();></td>
										</tr>
										<tr>
											<td align="right"><b>Zip:</b></td>
											<td align="left"><input class="inputText" type=text Name=N4_03 size="18" maxlength="15" value="<%=N4_03%>"></td>
										</tr>
										<tr>
											<td align="right"><b>Country Code:</b></td>
											<td align="left"><input class="inputText" type=text Name=N4_04 size="5" maxlength="3" value="<%=N4_04%>" ID="Text3" onchange=javascript:this.value=this.value.toUpperCase();></td>
										</tr>
										<%end if%>
										<tr>
											<td align="RIGHT">&nbsp;</td>
											<TD ALIGN="center"><input Class="InputButton" type="submit" value='OK' name="ShiptoButton" style="width:60"><input Class="InputButton" onclick="window.close()" type="button" value='Close' style="width:60" name="ShiptoButton"></TD>
										</tr>
									</table>
								</form>
							</td>
						</tr>
					</table>
				</TD>
			</TR>
		</Table>
	</BODY>
</HTML>
