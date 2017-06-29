<%@ Language=VBS%>
<!--#Include File="../../../../IncludeFile/Globalaspfunction.asp"-->
<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<Link Rel=StyleSheet Type=Text/Css href="../../../../Includefile/infocon-global.css">

<TITLE>Infocon Systems | EDI | Currency Form</TITLE>
<SCRIPT LANGUAGE=javascript>
function validate()
{
	
	if(window.CUR_01.value=="")
	{
		alert("Please select Entity Identifier Code")
		window.CUR_01.focus()
		return false
	}
	if(window.CUR_02.value=="")
	{
		alert("Please select Currency Code")
		window.CUR_02.focus()
		return false
	}
	return true
}

function CheckVal()
{
	if(validate() == true)
	{
		window.opener.frm_810XSL.CUR_01.value	=	window.CUR_01.options[window.CUR_01.selectedIndex].text
		window.opener.frm_810XSL.CUR_02.value	=	window.CUR_02.options[window.CUR_02.selectedIndex].text
		if(window.CUR_01.value!="")
		{
			window.opener.TR_cur1.style.display="INLINE"
		}
		else
		{
			window.opener.TR_cur1.style.display="NONE"
		}
		if(window.CUR_02.value!="")
		{
			window.opener.TR_cur2.style.display="INLINE"
		}
		else
		{
			window.opener.TR_cur2.style.display="NONE"
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
Dim cur_01  , cur_02


cur_01	=	f_CutStringFromCombo(Trim(Request.Form("cur_01")))
cur_02	=	f_CutStringFromCombo(Trim(Request.Form("cur_02")))

%>
<BODY text=black style="SCROLLBAR-FACE-COLOR: #c8e3ff; SCROLLBAR-HIGHLIGHT-COLOR: #0099ff" TopMargin=0 LeftMargin=0>
<BR>
     <TABLE class=header width="100%" Border=0>
        <TR>
          <TD align=center colspan=2><B>Add / Edit Currency Details</B></TD>
        </TR>
        <TR>
          <TD align=center colspan=2 width=100%><hr color=navy></TD>
        </TR>
        <TR>
			<TD width="30%"><B>Entity Identifier Code</B></TD>
			<TD>
				<SELECT name=CUR_01 style="width:300" class="inputText">					
				    <OPTION value="" Selected></OPTION>
					<OPTION value="BY" <%if UCase(cur_01) = "BY" Then%> Selected <%End if %>>BY Buying Party(Purchase)</OPTION>
					
				</SELECT>
			
			</TD>
		</TR>
		     <TR>
			<TD><B>Currency Code</B></TD>
			<TD>
				<SELECT  name=CUR_02 class="inputText">
					<OPTION value="" Selected></OPTION>
					<OPTION value="CAD" <%if UCase(cur_02) = "CAD" Then%> Selected <%End if %>>CAD - Canadian Dollar </OPTION>
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

