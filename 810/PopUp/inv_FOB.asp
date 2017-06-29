<%@ Language=VBS%>
<!--#Include File="../../../../IncludeFile/Globalaspfunction.asp"-->
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<Link Rel=StyleSheet Type=Text/Css href="../../../../Includefile/infocon-global.css">

<TITLE>Infocon Systems | EDI | FOB Form</TITLE>
<SCRIPT LANGUAGE=javascript>
function validate()
{
	
	if(window.FOB_01.value=="")
	{
		alert("Please select Shipment Method of Payment")
		window.FOB_01.focus()
		return false
	}
	
	return true
}

function CheckVal()
{
	if(validate() == true)
	{
		window.opener.frm_810XSL.FOB_01.value	=	window.FOB_01.options[window.FOB_01.selectedIndex].text
		
		if(window.FOB_01.value!="")
		{
			window.opener.TR_fob1.style.display="INLINE"
		}
		else
		{
			window.opener.TR_fob1.style.display="NONE"
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
Dim FOB_01  , FOB_02


FOB_01	=	f_CutStringFromCombo(Trim(Request.Form("FOB_01")))


%>
<BODY text=black TopMargin=0 LeftMargin=0>
<BR>
     <TABLE class=header width="100%" Border=0>
        <TR>
          <TD align=center colspan=2><B>Add / Edit FOB Details</B></TD>
        </TR>
        <TR>
          <TD align=center colspan=2 width=100%><hr color=navy></TD>
        </TR>
        <TR>
			<TD width="50%"><B>Shipment Method of Payment</B></TD>
			<TD>
				<SELECT name=FOB_01 style="width:150" class="inputText">					
				    <OPTION value="" Selected></OPTION>
					<OPTION value="CC" <%if UCase(FOB_01) = "CC" Then%> Selected <%End if %>>CC Collect</OPTION>
					<OPTION value="PP" <%if UCase(FOB_01) = "PP" Then%> Selected <%End if %>>PP Prepaid(By Seller)</OPTION>
					
				</SELECT>
			
			</TD>
		</TR>
		   
		<TR>	
		   <TD  colSpan=2 align="center"><BR>
				<INPUT name=CurrencyButton Class=InputButton type=button onclick="CheckVal()"  value="OK" style="width:60"><INPUT name=CurrencyButton Class=InputButton type=button value="Cancel" onclick="window.close()" style="width:60">
			</TD>	
        </TR> 	
        </TABLE>
</BODY>
</HTML>

