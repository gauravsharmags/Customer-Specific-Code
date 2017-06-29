<%@ Language=VBScript %>
<%
	Response.Buffer = true 

%>
<!--#Include File="../../../IncludeFile/Globalaspfunction.asp"-->


<HTML>
<HEAD>
<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
<Title>.</Title>
<link rel=stylesheet type=text/css href="../../../Includefile/infocon-global.css">
			<SCRIPT LANGUAGE="javascript" src="js/Format.js"></SCRIPT>			
			<SCRIPT LANGUAGE="javascript" src="js/810New.js"> </SCRIPT>
<SCRIPT LANGUAGE=javascript>

function FilePrint()
{
document.frm_810XSL.cmdClose.style.visibility		=	"hidden"
document.frm_810XSL.cmdPrint.style.visibility		=	"hidden"	
window.print()
document.frm_810XSL.cmdClose.style.visibility		=	"visible"
document.frm_810XSL.cmdPrint.style.visibility		=	"visible"	
}
</SCRIPT>
</HEAD>
<BODY topmargin=0 leftmargin=0 onfocus="accessExtPrice();" onload="accessExtPrice();FilePrint();frm_810XSL.txt_CustomerName.value='<%=session("CustomerName")%>';">
<%

iDocId	=	Trim(Request.Form("hid_DocNo"))
sTRID = Trim(Request.Form("hid_TradeRelID"))


Dim s810Xml,iCntr, jCntr, sErrorMsg
icntr=1

s810Xml = "<?xml version='1.0' encoding='ISO-8859-1' ?><EDI-004010><Interchange-Control>"

s810Xml = s810Xml & "<SegmentRef Pos='0' ID='ISA'  Description='Interchange Control Header'>"
	s810Xml = s810Xml & "<Element Pos='01' ID='I01' Description='Authorization Information Qualifier' Type='ID' MinLength='2' MaxLength='2' Value='" & Request.Form("ISA_01") & "' /> "
	s810Xml = s810Xml & "<Element Pos='02' ID='I02' Description='Authorization Information' Type='AN' MinLength='10' MaxLength='10' Value='" & Request.Form("ISA_02") & "' /> "
	s810Xml = s810Xml & "<Element Pos='03' ID='I03' Description='Security Information Qualifier' Type='ID' MinLength='2' MaxLength='2' Value='" & Request.Form("ISA_03") & "' /> "
	s810Xml = s810Xml & "<Element Pos='04' ID='I04' Description='Security Information' Type='AN' MinLength='10' MaxLength='10' Value='" & Request.Form("ISA_04") & "' /> "
	s810Xml = s810Xml & "<Element Pos='05' ID='I05' Description='Interchange ID Qualifier' Type='ID' MinLength='2' MaxLength='2' Value='" & sISA7 & "'/>"
	s810Xml = s810Xml & "<Element Pos='06' ID='I06' Description='Interchange Sender ID' Type='AN' MinLength='15' MaxLength='15' Value='" & sISA8 & "'/>"
	s810Xml = s810Xml & "<Element Pos='07' ID='I05' Description='Interchange ID Qualifier' Type='ID' MinLength='2' MaxLength='2' Value='" & sISA5 & "'/>"
	s810Xml = s810Xml & "<Element Pos='08' ID='I07' Description='Interchange Receiver ID' Type='AN' MinLength='15' MaxLength='15' Value='" & sISA6 & "'/>"
	s810Xml = s810Xml & "<Element Pos='09' ID='I08' Description='Interchange Date' Type='DT' MinLength='6' MaxLength='6' Value='" & sISA9 & "'/>"
	s810Xml = s810Xml & "<Element Pos='10' ID='I09' Description='Interchange Time' Type='TM' MinLength='4' MaxLength='4' Value='" & sISA10 & "'/>"
	s810Xml = s810Xml & "<Element Pos='11' ID='I10' Description='Interchange Control Standards Identifier' Type='ID' MinLength='1' MaxLength='1' Value='" & Request.Form("ISA_11") & "' /> "
	s810Xml = s810Xml & "<Element Pos='12' ID='I11' Description='Interchange Control Version Number' Type='ID' MinLength='5' MaxLength='5' Value='" & Request.Form("ISA_12") & "'/>"
	s810Xml = s810Xml & "<Element Pos='13' ID='I12' Description='Interchange Control Number' Type='N0' MinLength='9' MaxLength='9' Value='" & sICN & "'/>"
	s810Xml = s810Xml & "<Element Pos='14' ID='I13' Description='Acknowledgment Requested' Type='ID' MinLength='1' MaxLength='1' Value='" & Request.Form("ISA_14") & "'/> "
	s810Xml = s810Xml & "<Element Pos='15' ID='I14' Description='Usage Indicator' Type='ID' MinLength='1' MaxLength='1' Value='" & Request.Form("hid_FileStatus") & "'/> "
	s810Xml = s810Xml & "<Element Pos='16' ID='I15' Description='Component Element Separator' Type='AN' MinLength='1' MaxLength='1' Value='" & Request.Form("ISA_16") & "' /> "
	s810Xml = s810Xml & "</SegmentRef>"
						
	if Err.number <> 0 then
		sErrorMsg = sErrorMsg & vbcrlf & "ISA :-" & Err.number & "-" & Err.description & "<BR>"
		err.Clear 
	end if
	
	'---GS
	s810Xml = s810Xml & "<Functional-Group-Control>"
	s810Xml = s810Xml & "<SegmentRef Pos='0' ID='GS'  Description='Functional Group Header'>" 			
	s810Xml = s810Xml & "<Element Pos='01' ID='479' Description='Functional Identifier Code' Type='ID' MinLength='2' MaxLength='2' Value='" & Request.Form("GS_01") & "' /> "
	s810Xml = s810Xml & "<Element Pos='02' ID='142' Description='Application Senders Code' Type='AN' MinLength='2' MaxLength='15' Value='" & sGS2 & "' />" 
	s810Xml = s810Xml & "<Element Pos='03' ID='124' Description='Application Receivers Code' Type='AN' MinLength='2' MaxLength='15' Value='" & sGS3 & "' /> "
	s810Xml = s810Xml & "<Element Pos='04' ID='373' Description='Date' Type='DT' MinLength='6' MaxLength='6' Value='" & sISA9 & "' /> "
	s810Xml = s810Xml & "<Element Pos='05' ID='337' Description='Time' Type='TM' MinLength='4' MaxLength='8' Value='" & sISA10 & "' /> "
	s810Xml = s810Xml & "<Element Pos='06' ID='28' Description='Group Control Number' Type='N0' MinLength='1' MaxLength='9' Value='" & sFGCN & "' /> "
	s810Xml = s810Xml & "<Element Pos='07' ID='455' Description='Responsible Agency Code' Type='ID' MinLength='1' MaxLength='2' Value='" & Request.Form("GS_07") & "' /> "
	s810Xml = s810Xml & "<Element Pos='08' ID='480' Description='Version / Release / Industry Identifier Code' Type='AN' MinLength='1' MaxLength='12' Value='" & Request.Form("GS_08") & "' /> "
	s810Xml = s810Xml & "</SegmentRef>"

	s810Xml = s810Xml & "<Transaction-Set-Control><SegmentRef Pos='10' ID='ST'  Description='Transaction Set Header'>"
	s810Xml = s810Xml & "<Element Pos='02' ID='329' Description='Transaction Set Control Number' Type='AN' MinLength='4' MaxLength='9' Value='" & Request.Form("ST_329") & "'/>"
	s810Xml = s810Xml & "</SegmentRef>"
		
	s810Xml = s810Xml & "<SegmentRef Pos='200' ID='BIG'  Description='Beginning Segment for Invoice'>" 
	s810Xml = s810Xml & "<Element Pos='01' ID='373' Description='Date' Type='DT' MinLength='8' MaxLength='8' Value='" & Request.Form("BIG_01") & "'/>"
	s810Xml = s810Xml & "<Element Pos='02' ID='76' Description='Invoice Number' Type='AN' MinLength='1' MaxLength='22' Value='" & replace(replace(Request.Form("BIG_02"),"&","-"),"'","`") & "'/>" 
    s810Xml = s810Xml & "<Element Pos='03' ID='373' Description='Purchase Order Date' Type='DT' MinLength='8' MaxLength='8' Value='" & Request.Form("BIG_03") & "'/>"
	s810Xml = s810Xml & "<Element Pos='04' ID='324' Description='Purchase Order Number' Type='AN' MinLength='1' MaxLength='22' Value='" & Request.Form("BIG_04") & "'/>"
	s810Xml = s810Xml & "<Element Pos='07' ID='640' Desc='"& Request.Form("BIG_07_DESC") &"' Value='" & f_CutStringFromCombo(Request.Form("BIG_07")) & "'/>"
			
	s810Xml = s810Xml & "</SegmentRef>"

	if iParentDocID <> 0 then
		s810Xml = s810Xml & "<SegmentRef ID='FROMPO' Description='This is a Dummy Segment to evaluate the Invoice is from PO or not'>" 
		s810Xml = s810Xml & "<Element Pos='01' ID='1' Description='Mode' Value='PO'/>"
		s810Xml = s810Xml & "</SegmentRef>"
	end if
			
	
			iCntr = 1
			if Request.Form.Item("REF_01").count >= 1 then
				do while iCntr <= Request.Form.item("REF_01").count
					s810Xml = s810Xml & "<SegmentRef Pos='500' ID='REF'  Description='Reference Identification'>" 
					s810Xml = s810Xml & "<Element Pos='01' ID='128' Description='Reference Identification Qualifier' Type='ID' MinLength='2' MaxLength='3' Desc='"& Replace(Request.Form("REF_01")(iCntr),"'","`") &"' Value='" & f_CutStringFromCombo(Request.Form("REF_01")(iCntr)) & "'/>"
					s810Xml = s810Xml & "<Element Pos='02' ID='127' Description='Reference Identification' Type='AN' MinLength='1' MaxLength='50' Value='" & Replace(Request.Form("REF_02")(iCntr),"'","`") & "'/>"
					s810Xml = s810Xml & "</SegmentRef>"				
					icntr = iCntr + 1
				loop
			end if
			if Err.number <> 0 then
				sErrorMsg = sErrorMsg & vbcrlf & "REF :-" & Err.number & "-" & Err.description & "<BR>"
				err.Clear 
			end if	
		
		
		
			'SU
			
			s810Xml = s810Xml & "<N1-LOOP><SegmentRef Pos='700' ID='N1'  Description='Name'>" 
			s810Xml = s810Xml & "<Element Pos='01' ID='98' Description='Entity Identifier Code' Type='ID' MinLength='2' MaxLength='3'  Value='SU'/>"
			s810Xml = s810Xml & "<Element Pos='02' ID='93' Description='Name' Type='AN' MinLength='1' MaxLength='60' Value='" & replace(replace(Request.Form("N1_N1_021"),"&","-"),"'","`") & "'/>"
			s810Xml = s810Xml & "<Element Pos='03' ID='66' Description='Identification Code Qualifier' Type='ID' MinLength='1' MaxLength='2' Value='" & Request.Form("N1_N1_031") & "'/>"
			s810Xml = s810Xml & "<Element Pos='04' ID='67' Description='Identification Code' Type='AN' MinLength='2' MaxLength='80' Value='" & Request.Form("N1_N1_041") & "'/>"
			s810Xml = s810Xml & "</SegmentRef>"
			s810Xml = s810Xml & "</N1-LOOP>"
			
			''ST
			s810Xml = s810Xml & "<N1-LOOP><SegmentRef Pos='700' ID='N1'  Description='Name'>" 
			s810Xml = s810Xml & "<Element Pos='01' ID='98' Description='Entity Identifier Code' Type='ID' MinLength='2' MaxLength='3'  Value='ST'/>"
			s810Xml = s810Xml & "<Element Pos='02' ID='93' Description='Name' Type='AN' MinLength='1' MaxLength='60' Value='" & replace(replace(Request.Form("N1_N1_022"),"&","-"),"'","`") & "'/>"
			s810Xml = s810Xml & "<Element Pos='03' ID='66' Description='Identification Code Qualifier' Type='ID' MinLength='1' MaxLength='2' Value='" & Request.Form("N1_N1_032") & "'/>"
			s810Xml = s810Xml & "<Element Pos='04' ID='67' Description='Identification Code' Type='AN' MinLength='2' MaxLength='80' Value='" & Request.Form("N1_N1_042") & "'/>"
			s810Xml = s810Xml & "</SegmentRef>"
			
			s810Xml = s810Xml & "<SegmentRef Pos='900' ID='N3'  Description='Address Information'>" 
			s810Xml = s810Xml & "<Element Pos='01' ID='166' Description='Address' Type='AN' MinLength='1' MaxLength='55'  Value='" & killChars(Request.Form("N1_N3_012")) & "'/>"
			s810Xml = s810Xml & "<Element Pos='02' ID='166' Description='Address' Type='AN' MinLength='1' MaxLength='55'  Value='" & killChars(Request.Form("N1_N3_022")) & "'/>"
			s810Xml = s810Xml & "</SegmentRef>"
			s810Xml = s810Xml & "<SegmentRef Pos='1000' ID='N4'  Description='Geographical Location'>" 
			s810Xml = s810Xml & "<Element Pos='01' ID='19' Description='City' Type='AN' MinLength='2' MaxLength='30'  Value='" & Request.Form("N1_N4_012") & "'/>"
			s810Xml = s810Xml & "<Element Pos='02' ID='156' Description='State' Type='ID' MinLength='2' MaxLength='2'  Value='" & Request.Form("N1_N4_022") & "'/>"
			s810Xml = s810Xml & "<Element Pos='03' ID='116' Description='Postal Code' Type='ID' MinLength='3' MaxLength='15'  Value='" & Request.Form("N1_N4_032") & "'/>"
			s810Xml = s810Xml & "<Element Pos='04' ID='26' Description='Country Code' Type='ID' MinLength='2' MaxLength='3'  Value='" & Request.Form("N1_N4_042") & "'/>"
			s810Xml = s810Xml & "</SegmentRef>"
			s810Xml = s810Xml & "</N1-LOOP>"
	
	
	
		
	
	
	
	
		iCntr=1
		if Request.Form.Item("ITD_01").count >= 1 then
			do while iCntr <= Request.Form.item("ITD_01").count
				s810Xml = s810Xml & "<SegmentRef Pos='1300' ID='ITD'  Description='Terms of SaleDeferred Terms of Sale'>" 
				s810Xml = s810Xml &	"<Element Pos='01' ID='336' Description='Terms Type Code' Type='ID' MinLength='2' MaxLength='2' Value=' " & f_CutStringFromCombo(Request.Form("ITD_01")(iCntr)) &"' Desc= '" & Request.Form("ITD_01")(iCntr) & "'/> "
				s810Xml = s810Xml & "<Element Pos='02' ID='333' Description='Terms Basis Date Code' Type='ID' MinLength='1' MaxLength='2' Value='" & f_CutStringFromCombo(Request.Form("ITD_02")(iCntr))& "'  Desc='" & Request.Form("ITD_02")(iCntr)& "'/>"
				s810Xml = s810Xml & "<Element Pos='03' ID='338' Description='Terms Discount Percent' Type='R' MinLength='1' MaxLength='6' Value='" & Request.Form("ITD_03")(iCntr) & "'/>"
				
				s810Xml = s810Xml & "<Element Pos='05' ID='351' Description='Terms Discount Days Due' Type='N0' MinLength='1' MaxLength='3' Value='" & Request.Form("ITD_05")(iCntr) & "'/>"
				
				s810Xml = s810Xml & "<Element Pos='07' ID='386' Description='Terms Net Days' Type='N0' MinLength='1' MaxLength='3' Value='"& Request.Form("ITD_07")(iCntr) &"'/>" 		
				s810Xml = s810Xml & "<Element Pos='08' ID='362' Description='Terms Discount Amount' Type='N2' MinLength='1' MaxLength='10' Value='"& Request.Form("ITD_08")(iCntr) &"'/>" 		
				s810Xml = s810Xml & "<Element Pos='12' ID='352' Description='Terms Description' Type='AN' MinLength='1' MaxLength='80' Value='"& killChars(Request.Form("ITD_12")(iCntr)) &"'/>" 		
				
				s810Xml = s810Xml & "</SegmentRef>"
				icntr = iCntr + 1
			loop
		end if
		
		
			iCntr = 1
		if Request.Form.Item("DTM_01").count >= 1 then
			do while iCntr <= Request.Form.item("DTM_01").count
				s810Xml = s810Xml & "<SegmentRef Pos='1400' ID='DTM'  Description='Reference Identification'>" 
				s810Xml = s810Xml & "<Element Pos='01' ID='374' Description='Date Qualifier' Type='ID' MinLength='2' MaxLength='3' Desc='"& Replace(Request.Form("DTM_01")(iCntr),"'","`") &"' Value='" & f_CutStringFromCombo(Request.Form("DTM_01")(iCntr)) & "'/>"
				s810Xml = s810Xml & "<Element Pos='02' ID='373' Description='Date ' Type='DT' MinLength='1' MaxLength='8' Value='" & Request.Form("DTM_02")(iCntr) & "'/>"
				s810Xml = s810Xml & "</SegmentRef>"				
				icntr = iCntr + 1
			loop
		end if
		if Err.number <> 0 then
			sErrorMsg = sErrorMsg & vbcrlf & "DTM :-" & Err.number & "-" & Err.description & "<BR>"
			err.Clear 
		end if
		
		
			s810Xml = s810Xml & "<SegmentRef Pos='1500' ID='FOB'  Description='F.O.B. Related Instruction'>" 
			s810Xml = s810Xml &	"<Element Pos='01' ID='146' Description='Shipment Method of Payment' Type='ID' MinLength='2' MaxLength='2' Value=' " & f_CutStringFromCombo(Request.Form("FOB_01")) &"' Desc= '" & Request.Form("FOB_01") & "'/> "
			s810Xml = s810Xml & "</SegmentRef>"
			
			if Err.number <> 0 then
			  sErrorMsg = sErrorMsg & vbcrlf & "FOB :-" & Err.number & "-" & Err.description & "<BR>"
			  err.Clear 
		    end if
		
		''''''***************************************************************************************
		''ITEM DETAIL	
		iCntr = 1
		jCntr = 1
		
if Request.Form.Item("IT1_IT1_02").count >= 1 then
	do while iCntr <= Request.Form.item("IT1_IT1_02").count				
				
			s810Xml = s810Xml & "<IT1-LOOP><SegmentRef Pos='100' ID='IT1'  Description='Baseline Item Data (Invoice)'>"
			
			s810Xml = s810Xml & "<Element Pos='02' ID='358' Description='Quantity Invoiced' Type='R' MinLength='1' MaxLength='10'  Value='" & Request.Form("IT1_IT1_02")(iCntr) & "'/>"
			s810Xml = s810Xml & "<Element Pos='03' ID='355' Description='Unit or Basis for Measurement Code' Type='ID' MinLength='2' MaxLength='2' Value='" & f_CutStringFromCombo(Request.Form("IT1_IT1_03")(iCntr))& "'  Desc='" & Request.Form("IT1_IT1_03")(iCntr) & "'/>"
			s810Xml = s810Xml & "<Element Pos='04' ID='212' Description='Unit Price' Type='R' MinLength='1' MaxLength='17' Value='" & Request.Form("IT1_IT1_04")(iCntr) & "'/>"
			
			s810Xml = s810Xml & "<Element Pos='06' ID='235' Description='Product/Service ID Qualifier' Type='ID' MinLength='2' MaxLength='2' Desc='" & Replace(Request.Form("IT1_IT1_06")(iCntr),"'","`") & "'  Value='" & f_CutStringFromCombo(Request.Form("IT1_IT1_06")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='07' ID='234' Description='Product/Service ID' Type='AN' MinLength='1' MaxLength='48' Value='" & Request.Form("IT1_IT1_07")(iCntr) & "'/>"
			s810Xml = s810Xml & "<Element Pos='08' ID='235' Description='Product/Service ID Qualifier' Type='ID' MinLength='2' MaxLength='2' Desc='" & Replace(Request.Form("IT1_IT1_08")(iCntr),"'","`") & "'  Value='" & f_CutStringFromCombo(Request.Form("IT1_IT1_08")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='09' ID='234' Description='Product/Service ID' Type='AN' MinLength='1' MaxLength='48' Value='" & Request.Form("IT1_IT1_09")(iCntr) & "'/>"
			
			s810Xml = s810Xml & "<Element Pos='10' ID='235' Description='Product/Service ID Qualifier' Type='ID' MinLength='2' MaxLength='2' Desc='" & Replace(Request.Form("IT1_IT1_10")(iCntr),"'","`") & "'  Value='" & f_CutStringFromCombo(Request.Form("IT1_IT1_10")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='11' ID='234' Description='Product/Service ID' Type='AN' MinLength='1' MaxLength='48' Value='" & Request.Form("IT1_IT1_11")(iCntr) & "'/>"
			s810Xml = s810Xml & "<Element Pos='12' ID='235' Description='Product/Service ID Qualifier' Type='ID' MinLength='2' MaxLength='2' Desc='" & Replace(Request.Form("IT1_IT1_12")(iCntr),"'","`") & "'  Value='" & f_CutStringFromCombo(Request.Form("IT1_IT1_12")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='13' ID='234' Description='Product/Service ID' Type='AN' MinLength='1' MaxLength='48' Value='" & Request.Form("IT1_IT1_13")(iCntr) & "'/>"
			s810Xml = s810Xml & "<Element Pos='14' ID='235' Description='Product/Service ID Qualifier' Type='ID' MinLength='2' MaxLength='2' Desc='" & Replace(Request.Form("IT1_IT1_14")(iCntr),"'","`") & "'  Value='" & f_CutStringFromCombo(Request.Form("IT1_IT1_14")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='15' ID='234' Description='Product/Service ID' Type='AN' MinLength='1' MaxLength='48' Value='" & Request.Form("IT1_IT1_15")(iCntr) & "'/>"
			s810Xml = s810Xml & "<Element Pos='16' ID='235' Description='Product/Service ID Qualifier' Type='ID' MinLength='2' MaxLength='2' Desc='" & Replace(Request.Form("IT1_IT1_16")(iCntr),"'","`") & "'  Value='" & f_CutStringFromCombo(Request.Form("IT1_IT1_16")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='17' ID='234' Description='Product/Service ID' Type='AN' MinLength='1' MaxLength='48' Value='" & Request.Form("IT1_IT1_17")(iCntr) & "'/>"
			s810Xml = s810Xml & "<Element Pos='18' ID='235' Description='Product/Service ID Qualifier' Type='ID' MinLength='2' MaxLength='2' Desc='" & Replace(Request.Form("IT1_IT1_18")(iCntr),"'","`") & "'  Value='" & f_CutStringFromCombo(Request.Form("IT1_IT1_18")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='19' ID='234' Description='Product/Service ID' Type='AN' MinLength='1' MaxLength='48' Value='" & Request.Form("IT1_IT1_19")(iCntr) & "'/>"
			s810Xml = s810Xml & "<Element Pos='20' ID='235' Description='Product/Service ID Qualifier' Type='ID' MinLength='2' MaxLength='2' Desc='" & Replace(Request.Form("IT1_IT1_20")(iCntr),"'","`") & "'  Value='" & f_CutStringFromCombo(Request.Form("IT1_IT1_20")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='21' ID='234' Description='Product/Service ID' Type='AN' MinLength='1' MaxLength='48' Value='" & Request.Form("IT1_IT1_21")(iCntr) & "'/>"
			s810Xml = s810Xml & "<Element Pos='22' ID='235' Description='Product/Service ID Qualifier' Type='ID' MinLength='2' MaxLength='2' Desc='" & Replace(Request.Form("IT1_IT1_22")(iCntr),"'","`") & "'  Value='" & f_CutStringFromCombo(Request.Form("IT1_IT1_22")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='23' ID='234' Description='Product/Service ID' Type='AN' MinLength='1' MaxLength='48' Value='" & Request.Form("IT1_IT1_23")(iCntr) & "'/>"
    		s810Xml = s810Xml & "<Element Pos='24' ID='235' Description='Product/Service ID Qualifier' Type='ID' MinLength='2' MaxLength='2' Desc='" & Replace(Request.Form("IT1_IT1_24")(iCntr),"'","`") & "'  Value='" & f_CutStringFromCombo(Request.Form("IT1_IT1_24")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='25' ID='234' Description='Product/Service ID' Type='AN' MinLength='1' MaxLength='48' Value='" & Request.Form("IT1_IT1_25")(iCntr) & "'/>"
			s810Xml = s810Xml & "</SegmentRef>"
			
			''PID 
			s810Xml = s810Xml & "<PID-LOOP><SegmentRef Pos='60' ID='PID'  Description='Product/Item Description'>" 
			s810Xml = s810Xml & "<Element Pos='01' ID='349' Description='Item Description Type' Type='ID' MinLength='1' MaxLength='1' Value='" & f_CutStringFromCombo(Request.Form("IT1_PID_01")(iCntr)) & "' Desc='" & Request.Form("IT1_PID_01")(iCntr) & "'/>"
			s810Xml = s810Xml & "<Element Pos='05' ID='352' Description='Description' Type='AN' MinLength='1' MaxLength='80' Value='" & killChars(Request.Form("IT1_PID_05")(iCntr)) & "'/>"
			s810Xml = s810Xml & "</SegmentRef></PID-LOOP>"	
			
			s810Xml = s810Xml & "<SegmentRef Pos='1000' ID='PO4'  Description='Item Physical Details'>" 
			s810Xml = s810Xml & "<Element Pos='01' ID='356' Description='Pack' Type='N0' MinLength='1' MaxLength='6' Value='" & Request.Form("IT1_PO4_01")(iCntr) & "'/>"
			s810Xml = s810Xml & "<Element Pos='14' ID='810' Description='Inner Pack' Type='N0' MinLength='1' MaxLength='6' Value='" & Request.Form("IT1_PO4_14")(iCntr) & "'/>"
			s810Xml = s810Xml & "</SegmentRef>"
			
			
			s810Xml = s810Xml & "<SAC-LOOP><SegmentRef Pos='1800' ID='SAC' Description='Service, Promotion, Allowance, or Charge Information'>"
			s810Xml = s810Xml & "<Element Pos='01' ID='248'  Description='Allowance or Charge Indicator' Type='ID' MinLength='1' MaxLength='1' Value='" & f_CutStringFromCombo(Request.Form("IT1_SAC_SAC_01")(iCntr)) & "' Desc='" & Trim(Request.Form("IT1_SAC_SAC_01")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='02' ID='1300' Description='Service, Promotion, Allowance, or Charge Code' Type='ID' MinLength='4' MaxLength='4' Value='" & f_CutStringFromCombo(Request.Form("IT1_SAC_SAC_02")(iCntr)) & "' Desc='" & Trim(Request.Form("IT1_SAC_SAC_02")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='05' ID='610'  Description='Amount' Type='N2' MinLength='1' MaxLength='15' Value='"&Request.Form("IT1_SAC_SAC_05") (iCntr)&"'/>"
			s810Xml = s810Xml & "<Element Pos='06' ID='378' Description='Allowance or Charge Percentage Qualifier' Type='ID' MinLength='1' MaxLength='1' Value='" & f_CutStringFromCombo(Request.Form("IT1_SAC_SAC_06")(iCntr)) & "' Desc='" & Trim(Request.Form("IT1_SAC_SAC_06")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='07' ID='332'  Description='Percent' Type='R' MinLength='1' MaxLength='6' Value='"&Request.Form("IT1_SAC_SAC_07") (iCntr)&"'/>"
			s810Xml = s810Xml & "<Element Pos='08' ID='118'  Description='Allowance or Charge Rate' Type='R' MinLength='1' MaxLength='9' Value='"&Request.Form("IT1_SAC_SAC_08") (iCntr)&"'/>"
			s810Xml = s810Xml & "<Element Pos='09' ID='355' Description='Unit or Basis for Measurement Code' Type='ID' MinLength='2' MaxLength='2' Value='" & f_CutStringFromCombo(Request.Form("IT1_SAC_SAC_09")(iCntr)) & "' Desc='" & Trim(Request.Form("IT1_SAC_SAC_09")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='10' ID='380'  Description='Quantity' Type='R' MinLength='1' MaxLength='15' Value='"&Request.Form("IT1_SAC_SAC_10") (iCntr)&"'/>"
			s810Xml = s810Xml & "<Element Pos='12' ID='331' Description='Allowance or Charge Method' Type='ID' MinLength='2' MaxLength='2' Value='" & f_CutStringFromCombo(Request.Form("IT1_SAC_SAC_12")(iCntr)) & "' Desc='" & Trim(Request.Form("IT1_SAC_SAC_12")(iCntr)) & "'/>"
			s810Xml = s810Xml & "</SegmentRef></SAC-LOOP></IT1-LOOP>"
			
			
			
				
			
			
			
		iCntr = iCntr + 1
	loop
end if
		iCntr = 1 
		if Err.number <> 0 then
			sErrorMsg = sErrorMsg & vbcrlf & "IT1-LOOP :-" & Err.number & "-" & Err.description & "<BR>"
			err.Clear 
		End if
		
		iCntr	=	1			
			if Request.Form.Item("TXI_01").count >= 1 then
				do while iCntr <= Request.Form.item("TXI_01").count
					s810Xml = s810Xml & "<SegmentRef Pos='200' ID='TXI'  Description='Tax Information'>" 
					s810Xml = s810Xml & "<Element Pos='01' ID='963' Description='Tax Type Code' Type='ID' MinLength='2' MaxLength='2' Desc='"& Request.Form("TXI_01")(iCntr) &"' Value='" & f_CutStringFromCombo(Request.Form("TXI_01")(iCntr))& "'/>"
					s810Xml = s810Xml & "<Element Pos='02' ID='782' Description='Monetary Amount' Type='R' MinLength='1' MaxLength='18' Value='" & Request.Form("TXI_02")(iCntr) & "'/>"
					s810Xml = s810Xml & "<Element Pos='03' ID='954' Description='Percent' Type='R' MinLength='1' MaxLength='10' Value='" & Request.Form("TXI_03")(iCntr) & "'/>"
					s810Xml = s810Xml & "<Element Pos='04' ID='955' Description='Tax Jurisdiction Code Qualifier' Type='ID' MinLength='2' MaxLength='2' Desc='"& Request.Form("TXI_04")(iCntr) &"' Value='" & f_CutStringFromCombo(Request.Form("TXI_04")(iCntr))& "'/>"
					s810Xml = s810Xml & "<Element Pos='05' ID='956' Description='Tax Jurisdiction Code' Type='AN' MinLength='1' MaxLength='10' Desc='"& Request.Form("TXI_05")(iCntr) &"' Value='" & Request.Form("TXI_05")(iCntr)& "'/>"
					s810Xml = s810Xml & "<Element Pos='08' ID='828' Description='Dollar Basis For Percent' Type='R' MinLength='1' MaxLength='9' Value='" & Request.Form("TXI_08")(iCntr) & "'/>"
                    s810Xml = s810Xml & "<Element Pos='09' ID='325' Description='Tax Identification Number' Type='AN' MinLength='1' MaxLength='20' Desc='"& Request.Form("TXI_09")(iCntr) &"' Value='" & Request.Form("TXI_09")(iCntr)& "'/>"
					s810Xml = s810Xml & "</SegmentRef>"				
					iCntr = iCntr + 1
				loop
			end if
			if Err.number <> 0 then
				sErrorMsg = sErrorMsg & vbcrlf & "TXI :-" & Err.number & "-" & Err.description & "<BR>"
				err.Clear 
			end if
			
			s810Xml = s810Xml & "<SegmentRef Pos='300' ID='CAD' Description='Carrier Detail'>"
			s810Xml = s810Xml & "<Element Pos='01' ID='91'  Description='Type Code' Type='ID' MinLength='2' MaxLength='3'  Desc='"& replace(replace(Request.Form("CAD_01"),"&","-"),"'","`") &"' Value='" & f_CutStringFromCombo(Request.Form("CAD_01"))& "'/>"
			s810Xml = s810Xml & "<Element Pos='04' ID='140'  Description='Standard Carrier Alpha Code' Type='ID' MinLength='2' MaxLength='4'  Value='"& replace(replace(Request.Form("CAD_04"),"&","-"),"'","`") &"'/>"
			s810Xml = s810Xml & "<Element Pos='05' ID='387'  Description='Routing' Type='AN' MinLength='1' MaxLength='35' Value='" & killChars(Request.Form("CAD_05")) & "'/>"
			s810Xml = s810Xml & "<Element Pos='07' ID='128'  Description='Reference ID Qualifier' Type='ID' MinLength='2' MaxLength='3'  Desc='"& replace(replace(Request.Form("CAD_07"),"&","-"),"'","`") &"' Value='" & f_CutStringFromCombo(Request.Form("CAD_07"))& "'/>"
			s810Xml = s810Xml & "<Element Pos='08' ID='127'  Description='Reference ID' Type='AN' MinLength='1' MaxLength='50' Value='"&replace(replace(Request.Form("CAD_08"),"&","-"),"'","`")&"'/>"
			s810Xml = s810Xml & "</SegmentRef>"
		 
		 
		 
			iCntr	=	1			
			if Request.Form.Item("SAC_SAC_01").count >= 1 then
				do while iCntr <= Request.Form.item("SAC_SAC_01").count
					s810Xml = s810Xml & "<SAC-LOOP><SegmentRef Pos='400' ID='SAC' Description='Service, Promotion, Allowance, or Charge Information'>"
			s810Xml = s810Xml & "<Element Pos='01' ID='248'  Description='Allowance or Charge Indicator' Type='ID' MinLength='1' MaxLength='1' Value='" & f_CutStringFromCombo(Request.Form("SAC_SAC_01")(iCntr)) & "' Desc='" & Trim(Request.Form("SAC_SAC_01")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='02' ID='1300' Description='Service, Promotion, Allowance, or Charge Code' Type='ID' MinLength='4' MaxLength='4' Value='" & f_CutStringFromCombo(Request.Form("SAC_SAC_02")(iCntr)) & "' Desc='" & Trim(Request.Form("SAC_SAC_02")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='05' ID='610'  Description='Amount' Type='N2' MinLength='1' MaxLength='15' Value='"&Request.Form("SAC_SAC_05")(iCntr)&"'/>"
			s810Xml = s810Xml & "<Element Pos='06' ID='378' Description='Allowance, or Charge Percent Qualifier' Type='ID' MinLength='1' MaxLength='1' Value='" & f_CutStringFromCombo(Request.Form("SAC_SAC_06")(iCntr)) & "' Desc='" & Trim(Request.Form("SAC_SAC_06")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='07' ID='332'  Description='Percent' Type='R' MinLength='1' MaxLength='6' Value='"&Request.Form("SAC_SAC_07")(iCntr)&"'/>"
			s810Xml = s810Xml & "<Element Pos='08' ID='118'  Description='Rate' Type='R' MinLength='1' MaxLength='9' Value='"&Request.Form("SAC_SAC_08")(iCntr)&"'/>"
			s810Xml = s810Xml & "<Element Pos='09' ID='355' Description='Unit or Basis for Measurement Code' Type='ID' MinLength='2' MaxLength='2' Value='" & f_CutStringFromCombo(Request.Form("SAC_SAC_09")(iCntr)) & "' Desc='" & Trim(Request.Form("SAC_SAC_09")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='10' ID='380'  Description='Quantity' Type='R' MinLength='1' MaxLength='15' Value='"&Request.Form("SAC_SAC_10")(iCntr)&"'/>"
			s810Xml = s810Xml & "<Element Pos='12' ID='331' Description='Allowance or Charge Method' Type='ID' MinLength='2' MaxLength='2' Value='" & f_CutStringFromCombo(Request.Form("SAC_SAC_12")(iCntr)) & "' Desc='" & Trim(Request.Form("SAC_SAC_12")(iCntr)) & "'/>"
			s810Xml = s810Xml & "<Element Pos='13' ID='127'  Description='Reference ID' Type='AN' MinLength='1' MaxLength='50' Value='"&replace(replace(Request.Form("SAC_SAC_13")(iCntr),"&","-"),"'","`")&"'/>"
			s810Xml = s810Xml & "<Element Pos='14' ID='770'  Description='Option Number' Type='AN' MinLength='1' MaxLength='20' Value='"&replace(replace(Request.Form("SAC_SAC_14")(iCntr),"&","-"),"'","`")&"'/>"
			s810Xml = s810Xml & "<Element Pos='15' ID='352'  Description='Description' Type='AN' MinLength='1' MaxLength='80' Value='"&Request.Form("SAC_SAC_15")(iCntr)&"'/>"
			s810Xml = s810Xml & "<Element Pos='16' ID='819' Description='Language Code' Type='ID' MinLength='2' MaxLength='3' Value='"&replace(replace(Request.Form("SAC_SAC_16")(iCntr),"&","-"),"'","`")&"'/>"
			s810Xml = s810Xml & "</SegmentRef></SAC-LOOP>"			
					iCntr = iCntr + 1
				loop
			end if
			if Err.number <> 0 then
				sErrorMsg = sErrorMsg & vbcrlf & "SAC :-" & Err.number & "-" & Err.description & "<BR>"
				err.Clear 
			end if
		 
			'ISS
			s810Xml = s810Xml & "<ISS-LOOP><SegmentRef Pos='600' ID='ISS' Description='Service, Promotion, Allowance, or Charge Information'>"
			s810Xml = s810Xml & "<Element Pos='01' ID='382'  Description='Number of carton shipped' Type='ID' MinLength='1' MaxLength='1' Value='"& Request.Form("ISS_01")&"' />"
			s810Xml = s810Xml & "<Element Pos='02' ID='355' Description='Service, Promotion, Allowance, or Charge Code' Type='ID' MinLength='4' MaxLength='4' Value='"&f_CutStringFromCombo(Trim(Request.Form("ISS_02") ))&"' Desc='"&Request.Form("ISS_02") &"'/>"
			s810Xml = s810Xml & "<Element Pos='03' ID='81'  Description='Number of carton shipped' Type='ID' MinLength='1' MaxLength='1' Value='"& Request.Form("ISS_03")&"' />"
			s810Xml = s810Xml & "<Element Pos='04' ID='355' Description='Service, Promotion, Allowance, or Charge Code' Type='ID' MinLength='4' MaxLength='4' Value='"&f_CutStringFromCombo(Trim(Request.Form("ISS_04") ))&"' Desc='"&Request.Form("ISS_04") &"'/>"
			s810Xml = s810Xml & "</SegmentRef></ISS-LOOP>"

		s810Xml = s810Xml & "<SegmentRef Pos='80' ID='SE'  Description='Transaction Set Trailer'>"
		s810Xml = s810Xml & "<Element Pos='01' ID='96' Description='Number of Included Segments' Type='N0' MinLength='1' MaxLength='10' Value='20'/>"
		s810Xml = s810Xml & "<Element Pos='02' ID='329' Description='Transaction Set Control Number' Type='AN' MinLength='4' MaxLength='9' Value='" & sTSCN & "'/>"
		s810Xml = s810Xml & "</SegmentRef>"
		s810Xml = s810Xml & "</Transaction-Set-Control>"
		s810Xml = s810Xml & "<SegmentRef Pos='0' ID='GE'  Description='Functional Group Trailer'>"
		s810Xml = s810Xml & "<Element Pos='01' ID='97' Description='Number of Transaction Sets Included' Type='N0' MinLength='1' MaxLength='6' Value='1'/>"
		s810Xml = s810Xml & "<Element Pos='02' ID='28' Description='Group Control Number' Type='N0' MinLength='1' MaxLength='9' Value='" & sFGCN & "'/>"
		s810Xml = s810Xml & "</SegmentRef>"
		s810Xml = s810Xml & "</Functional-Group-Control>"
		s810Xml = s810Xml & "<SegmentRef Pos='0' ID='IEA'  Description='Interchange Control Trailer'>"
		s810Xml = s810Xml & "<Element Pos='01' ID='I16' Description='Number of Included Functional Groups' Type='N0' MinLength='1' MaxLength='5' Value='1'/>"
		s810Xml = s810Xml & "<Element Pos='02' ID='I12' Description='Interchange Control Number' Type='N0' MinLength='9' MaxLength='9' Value='" & sICN & "'/>"
		s810Xml = s810Xml & "</SegmentRef>"
		s810Xml = s810Xml & "</Interchange-Control>"
		s810Xml = s810Xml & "</EDI-004010>"
		
		Dim sDBErrors
		sDBErrors = ""
		Dim obj810XML
		Set obj810XML	=	Server.CreateObject("Microsoft.XMLDOM")
		obj810XML.async	=	false
		obj810XML.loadXML(s810Xml)
		If obj810XML.parseError <> 0 then
			sErrorDesc = "ERROR in XML : " & obj810XML.parseError.reason & " at line : " & obj810XML.parseError.line  & " and col : " & obj810XML.parseError.linepos
		End if
		
		Set objXSl	=	Server.CreateObject("Microsoft.XMLDOM")
		objXSl.async=	false
		objXSl.load(Server.MapPath("Print810.XSL"))
		If objXSl.parseError <> 0 then
			sErrorDesc = "ERROR in Formatting : " & objXSl.parseError.reason & " at line : " & objXSl.parseError.line  & " and col : " & objXSl.parseError.linepos
		End if
		if trim(sErrorDesc) <> ""   then %>
		
			<BR>
			<center><font color=red>Document cannot be displayed. Please email support@infoconn.com for assistance.</font></center>
			<BR>
			<Input type='Hidden' name='ErrorDesc' value="<%=sErrorDesc%>">
		<%Else%>
			<Form   name="frm_810XSL">
		<TABLE WIDTH="100%" BORDER="0" CELLSPACING="1" CELLPADDING="1" ID="Table1">
			<TR>
				<TD align=right>
					<INPUT type="button" name="cmdPrint" class="inputbutton" value="Print" onclick="FilePrint()" ID="Button1">
					<INPUT type="button" name="cmdClose" class="inputbutton" value="Close" onclick="window.close()" ID="Button1"></INPUT>
				</TD>
				<TD align=right width="1%"></td>
			</TR>
			<TR>
				<TD colspan='2'><%=obj810XML.transformNode(objXSl)%></TD>
			</TR>
		</TABLE>
		</Form>
		<%End If%>
	
	<%
		Set obj810XML = nothing
		Set objXSl = nothing
	%>
</Center><br>
</BODY>
</HTML>

<%function killChars(strWords)
		if strWords <> "" Then 
			dim badChars, newChars
			badChars = Array("&", "<", ">","'")
			newChars = Array("&amp;","&lt;","&gt;","")
			for i = 0 to UBound(badChars)
				strWords	= replace(strWords, badChars(i), newChars(i))
			next
			killChars = strWords
		End if 	
	end function
%>