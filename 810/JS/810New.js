// Calculating Ext. Price and total amount & formating date


function change()
{


}






function accessExtPrice()
{

  /*	var TOTQTY, TOTExtPrice, TOTPrice , Res;
	var iSacTotal, iSacLineTotal
	
	TOTQTY			=	0;
	TOTExtPrice		=	0;
	TOTPrice		=	0;
	iSacTotal		=	0;
	iSacLineTotal	=	0;
	iSac_Item_Line_Value = 0
	
	//Sac Segment In ItemLine Area
	
	
	if(typeof(frm_810XSL.SAC_01)!='undefined')
	{
		if(frm_810XSL.SAC_01.value.substring(0,1) == "C" &&  frm_810XSL.SAC_05.value!='')
		{
			
			iSacLineTotal	=	iSacLineTotal +  parseFloat(frm_810XSL.SAC_05.value)
			frm_810XSL.SAC_05.value	=	roundOff(frm_810XSL.SAC_05.value,2)
		}
		else if(frm_810XSL.SAC_01.value.substring(0,1) == "A" && frm_810XSL.SAC_05.value!='')
		{
			iSacLineTotal	=	iSacLineTotal -  parseFloat(frm_810XSL.SAC_05.value)
			
			frm_810XSL.SAC_05.value	=	roundOff(frm_810XSL.SAC_05.value,2)
		}
	}
	
	if(typeof(document.frm_810XSL.IT1_IT1_02)!='undefined')
	{
	if (isArray(document.frm_810XSL.IT1_IT1_02) == true)
	{
		for(i=0;i<document.frm_810XSL.IT1_IT1_02.length;i++)
		{
			if (document.frm_810XSL.IT1_IT1_02[i].value =="" || document.frm_810XSL.IT1_IT1_04[i].value =="")
			{	
				Res	=	0
			}
			else
			{
				Res = document.frm_810XSL.IT1_IT1_02[i].value * document.frm_810XSL.IT1_IT1_04[i].value;
				document.frm_810XSL.IT1_IT1_04[i].value=roundOff(document.frm_810XSL.IT1_IT1_04[i].value,2)
			}
			
			
			ExtPrice[i].innerText = roundOff(Math.round(10000*Res)/10000,2);	
			TOTQTY = TOTQTY + parseFloat(document.frm_810XSL.IT1_IT1_02[i].value);
			if(TOTQTY > 0)
			{
				TOTQTY	=	TOTQTY
			}
			else
			{
				TOTQTY	=	0
			}
			
			TOTExtPrice = TOTExtPrice + Res;
		}
		
		
	}
	else
	{
		if (document.frm_810XSL.IT1_IT1_02.value =="" || document.frm_810XSL.IT1_IT1_04.value =="")
			{	
				Res	=	0
			}
			else
			{
				Res = document.frm_810XSL.IT1_IT1_02.value * document.frm_810XSL.IT1_IT1_04.value;
				document.frm_810XSL.IT1_IT1_04.value=roundOff(document.frm_810XSL.IT1_IT1_04.value,2)
			}
			
			
			ExtPrice.innerText = roundOff(Math.round(10000*Res)/10000,2);	
			TOTQTY = TOTQTY + parseFloat(document.frm_810XSL.IT1_IT1_02.value);
			if(TOTQTY > 0)
			{
				TOTQTY	=	TOTQTY
			}
			else
			{
				TOTQTY	=	0
			}
			
			TOTExtPrice = TOTExtPrice + Res;
		
	}
	
	}
	
	////***************************************************************************
	///Display the item total, Allowance / charges total & grand total 
	/// also formatting the cells 
	if(iSacLineTotal != '')
	{
		TD_SacLineTotal.innerText				=	FormatAmount(parseFloat(iSacLineTotal))
		SacLineTotal_Row.style.display			=	"INLINE"
		SacLineHeaderTotal_Row.style.display	=	"INLINE"	
		TD_SacLineHeaderTotal.innerText			=	FormatAmount(parseFloat(TOTExtPrice + iSacLineTotal))
	}
	else
	{
		TD_SacLineTotal.innerText				=	FormatAmount(parseFloat(iSacLineTotal))
		SacLineTotal_Row.style.display			=	"NONE"
		SacLineHeaderTotal_Row.style.display	=	"NONE"	
		TD_SacLineHeaderTotal.innerText			=	FormatAmount(parseFloat(TOTExtPrice))
	}
		
	TQTY.style.fontWeight = "bold"
	TExtPrice.style.fontWeight = "bold"
	TD_SacLineHeaderTotal.style.fontWeight	=	"bold" // Added by shreekant for bold
	TD_SacLineTotal.style.fontWeight	=	"bold" // Added by shreekant for bold
	
	TQTY.innerText = TOTQTY;		
	
	TExtPrice.innerText = Math.round(10000*Res)/10000;	
	TExtPrice.innerText = FormatAmount(TOTExtPrice)*/
	
	
	
	
	
	
	
	
	
	var TOTQTY, TOTExtPrice, TOTPrice , Res;
	var iSacTotal, iSacLineTotal, iSac_Item_Line_Value
	
	TOTQTY			=	0;
	TOTExtPrice		=	0;
	TOTPrice		=	0;
	iSacTotal		=	0;
	iSacLineTotal	=	0;
	iSacLineTotal1	=	0;
	iSacLineTotal2	=	0;
	iSac_Item_Line_Value = 0
	
	//Sac Segment In ItemLine Area
	
	
	/*if(typeof(frm_810XSL.IT1_SAC_SAC_01)!='undefined')
	{
		if(frm_810XSL.SAC_01.value.substring(0,1) == "C" &&  frm_810XSL.SAC_05.value!='')
		{
			
			iSacLineTotal	=	iSacLineTotal +  parseFloat(frm_810XSL.SAC_05.value)
			frm_810XSL.SAC_05.value	=	roundOff(frm_810XSL.SAC_05.value,2)
		}
		else if(frm_810XSL.SAC_01.value.substring(0,1) == "A" && frm_810XSL.SAC_05.value!='')
		{
			iSacLineTotal	=	iSacLineTotal -  parseFloat(frm_810XSL.SAC_05.value)
			
			frm_810XSL.SAC_05.value	=	roundOff(frm_810XSL.SAC_05.value,2)
		}
	}*/
	
	
	
	
	
	
	
	
	
	if(typeof(document.frm_810XSL.IT1_IT1_02)!='undefined')
	{
	if (isArray(document.frm_810XSL.IT1_IT1_02) == true)
	{
		for(i=0;i<document.frm_810XSL.IT1_IT1_02.length;i++)
		{
			if (document.frm_810XSL.IT1_IT1_02[i].value =="" || document.frm_810XSL.IT1_IT1_04[i].value =="")
			{	
				Res	=	0
			}
			else
			{
				Res = document.frm_810XSL.IT1_IT1_02[i].value * document.frm_810XSL.IT1_IT1_04[i].value;
				document.frm_810XSL.IT1_IT1_04[i].value=roundOff(document.frm_810XSL.IT1_IT1_04[i].value,2)
			}
			
			
			ExtPrice[i].innerText = roundOff(Math.round(10000*Res)/10000,2);	
			TOTQTY = TOTQTY + parseFloat(document.frm_810XSL.IT1_IT1_02[i].value);
			if(TOTQTY > 0)
			{
				TOTQTY	=	TOTQTY
			}
			else
			{
				TOTQTY	=	0
			}
			
			TOTExtPrice = TOTExtPrice + Res;
		}
		
		
	}
	else
	{
		if (document.frm_810XSL.IT1_IT1_02.value =="" || document.frm_810XSL.IT1_IT1_04.value =="")
			{	
				Res	=	0
			}
			else
			{
				Res = document.frm_810XSL.IT1_IT1_02.value * document.frm_810XSL.IT1_IT1_04.value;
				document.frm_810XSL.IT1_IT1_04.value=roundOff(document.frm_810XSL.IT1_IT1_04.value,2)
			}
			
			
			ExtPrice.innerText = roundOff(Math.round(10000*Res)/10000,2);	
			TOTQTY = TOTQTY + parseFloat(document.frm_810XSL.IT1_IT1_02.value);
			if(TOTQTY > 0)
			{
				TOTQTY	=	TOTQTY
			}
			else
			{
				TOTQTY	=	0
			}
			
			TOTExtPrice = TOTExtPrice + Res;
		
	}
	
	}
	
	
	
	//TOTExtPrice=50
	
	
	
	if(typeof(frm_810XSL.SAC_SAC_07)!='undefined')
	{
		if (isArray(frm_810XSL.SAC_SAC_07) == true)
		{
			for(i=0;i<frm_810XSL.SAC_SAC_07.length;i++)
			{
				
					frm_810XSL.SAC_SAC_05[i].value = roundOff(TOTExtPrice * frm_810XSL.SAC_SAC_07[i].value / 100,2)
					
				
			}
		}
		else
		{
			frm_810XSL.SAC_SAC_05.value = roundOff(TOTExtPrice * frm_810XSL.SAC_SAC_07.value / 100,2)
		}		
	}	
	
	
	
	
	
	
	
	
	if(typeof(frm_810XSL.IT1_SAC_SAC_05) != "undefined")
	{
		if(isArray(frm_810XSL.IT1_SAC_SAC_05) != true)
		{	
			iSac_Item_Line_Value	=	frm_810XSL.IT1_SAC_SAC_05.value	
			if (iSac_Item_Line_Value > 0)
			{
				iSac_Item_Line_Value	=	roundOff(iSac_Item_Line_Value,2)
				frm_810XSL.IT1_SAC_SAC_05.value	=	roundOff(frm_810XSL.IT1_SAC_SAC_05.value,2)
			}
			else
			{
				iSac_Item_Line_Value	=	0
			}			
			if(frm_810XSL.IT1_SAC_SAC_01.value.substring(0,1) == 'C')
			{
				//iSacLineTotal1	=	TOTExtPrice + parseFloat(iSac_Item_Line_Value)
				//frm_810XSL.hid_SacLineTotal.value	=	iSac_Item_Line_Value
				iSacLineTotal1	=	parseFloat(iSacLineTotal1) + parseFloat(iSac_Item_Line_Value) 
			}
			else if(frm_810XSL.IT1_SAC_SAC_01.value.substring(0,1) == 'A')
			{
				//iSacLineTotal1	=	TOTExtPrice - parseFloat(iSac_Item_Line_Value)
				//frm_810XSL.hid_SacLineTotal.value	=	"-" + iSac_Item_Line_Value
				iSacLineTotal1	=	parseFloat(iSacLineTotal1) - parseFloat(iSac_Item_Line_Value)
			}
			
			//frm_810XSL.txtSacLineTotal.value	=	iSac_Item_Line_Value
		}
		else
		{	
			for(i=0;i<frm_810XSL.IT1_SAC_SAC_05.length;i++)
			{
				iSac_Item_Line_Value	=	frm_810XSL.IT1_SAC_SAC_05[i].value
				if(iSac_Item_Line_Value > 0)
				{
					iSac_Item_Line_Value	=	roundOff(iSac_Item_Line_Value,2)
					frm_810XSL.IT1_SAC_SAC_05[i].value	=	roundOff(frm_810XSL.IT1_SAC_SAC_05[i].value,2)
				}
				else
				{
					iSac_Item_Line_Value	=	0
				}		
				if(frm_810XSL.IT1_SAC_SAC_01[i].value.substring(0,1) == 'A' && typeof(frm_810XSL.IT1_SAC_SAC_01[i]) != 'undefined')
				{
					iSacLineTotal1	=	parseFloat(iSacLineTotal1) - parseFloat(iSac_Item_Line_Value)
				}
				else if(frm_810XSL.IT1_SAC_SAC_01[i].value.substring(0,1) == 'C' && typeof(frm_810XSL.IT1_SAC_SAC_01[i]) != 'undefined')
				{
					iSacLineTotal1	=	parseFloat(iSacLineTotal1) + parseFloat(iSac_Item_Line_Value)  
				}
				
				//frm_810XSL.hid_SacLineTotal.value	=	parseFloat(iSacLineTotal1)
				iSac_Item_Line_Value = 0
			}
			//frm_810XSL.txtSacLineTotal.value	=	parseFloat(iSacLineTotal1)
		}
	}
	
	
	if(typeof(frm_810XSL.SAC_SAC_01)!='undefined')
	{
		
		if(isArray(frm_810XSL.SAC_SAC_01) != true)
			{
				if(frm_810XSL.SAC_SAC_01.value.substring(0,1) == "C" &&  frm_810XSL.SAC_SAC_05.value!='')
				{
					iSacLineTotal2	=	iSacLineTotal2 +  parseFloat(frm_810XSL.SAC_SAC_05.value)
					//frm_810XSL.SAC_SAC_05.value	=	roundOff(frm_810XSL.SAC_SAC_05.value,2)
				}
				else if(frm_810XSL.SAC_SAC_01.value.substring(0,1) == "A" && frm_810XSL.SAC_SAC_05.value!='')
				{
					iSacLineTotal2	=	iSacLineTotal2 -  parseFloat(frm_810XSL.SAC_SAC_05.value)
					
					//frm_810XSL.SAC_SAC_05.value	=	roundOff(frm_810XSL.SAC_SAC_05.value,2)
				}
			}
		else
			{
				for(i=0;i<frm_810XSL.SAC_SAC_01.length;i++)
				{
					if(frm_810XSL.SAC_SAC_01[i].value.substring(0,1) == "C" &&  frm_810XSL.SAC_SAC_05[i].value!='')
					{
						iSacLineTotal2	=	iSacLineTotal2 +  parseFloat(frm_810XSL.SAC_SAC_05[i].value)
						//frm_810XSL.SAC_SAC_05.value	=	roundOff(frm_810XSL.SAC_SAC_05.value,2)
					}
					else if(frm_810XSL.SAC_SAC_01[i].value.substring(0,1) == "A" && frm_810XSL.SAC_SAC_05[i].value!='')
					{
						iSacLineTotal2	=	iSacLineTotal2 -  parseFloat(frm_810XSL.SAC_SAC_05[i].value)
						
						//frm_810XSL.SAC_SAC_05.value	=	roundOff(frm_810XSL.SAC_SAC_05.value,2)
					}
				}
			}
	}
	
	
	
	
	
	
	
	
	
	
	//alert(TOTExtPrice)
	//alert(FormatAmount(TOTExtPrice))
	
	////***************************************************************************
	///Display the item total, Allowance / charges total & grand total 
	/// also formatting the cells 
	/*if(iSacLineTotal != '')
	{
		TD_SacLineTotal.innerText				=	FormatAmount(parseFloat(iSacLineTotal))
		SacLineTotal_Row.style.display			=	"INLINE"
		SacLineHeaderTotal_Row.style.display	=	"INLINE"	
		TD_SacLineHeaderTotal.innerText			=	FormatAmount(parseFloat(TOTExtPrice + iSacLineTotal))
	}
	else
	{
		TD_SacLineTotal.innerText				=	FormatAmount(parseFloat(iSacLineTotal))
		SacLineTotal_Row.style.display			=	"NONE"
		SacLineHeaderTotal_Row.style.display	=	"NONE"	
		TD_SacLineHeaderTotal.innerText			=	FormatAmount(parseFloat(TOTExtPrice))
	}
		
	TQTY.style.fontWeight = "bold"
	TExtPrice.style.fontWeight = "bold"
	TD_SacLineHeaderTotal.style.fontWeight	=	"bold" // Added by shreekant for bold
	TD_SacLineTotal.style.fontWeight	=	"bold" // Added by shreekant for bold
	
	TQTY.innerText = TOTQTY;		
	
	TExtPrice.innerText = Math.round(10000*Res)/10000;	
	TExtPrice.innerText = FormatAmount(TOTExtPrice)
	
	
	*/
	
	
	
	
	
	iSacLineTotal=iSacLineTotal1+iSacLineTotal2;
	
	
	if(iSacLineTotal1 != '')
	{
		TD_SacLineTotal.innerText				=	FormatAmount(parseFloat(iSacLineTotal2))
		if(iSacLineTotal2!= '')
		 {
		  SacLineTotal_Row.style.display			=	"INLINE"
		  SacLineHeaderTotal_Row.style.display	=	"INLINE"	
		 } 
		 if(iSacLineTotal2== '')
		 {
		  SacLineTotal_Row.style.display			=	"NONE"
		  SacLineHeaderTotal_Row.style.display	=	"NONE"	
		 } 
		TD_SacLineHeaderTotal.innerText			=	FormatAmount(parseFloat(TOTExtPrice + iSacLineTotal))
	}
	else
	{
	   if(iSacLineTotal2!= '')
		 {
		  SacLineTotal_Row.style.display			=	"INLINE"
		  SacLineHeaderTotal_Row.style.display	=	"INLINE"	
		 } 
	   else
	    {
	      SacLineTotal_Row.style.display			=	"NONE"
		  SacLineHeaderTotal_Row.style.display	=	"NONE"	
		}  
	
		TD_SacLineTotal.innerText				=	FormatAmount(parseFloat(iSacLineTotal2))
		
		TD_SacLineHeaderTotal.innerText			=	FormatAmount(parseFloat(TOTExtPrice + iSacLineTotal))
	}
		
	TQTY.style.fontWeight = "bold"
	TExtPrice.style.fontWeight = "bold"
	TD_SacLineHeaderTotal.style.fontWeight	=	"bold" // Added by shreekant for bold
	TD_SacLineTotal.style.fontWeight	=	"bold" // Added by shreekant for bold
	
	TQTY.innerText = TOTQTY;
	////////////////////////////////////////////////////ISS-Summary////////////////////////////////////////////////////////////////////////////
	if (typeof (frm_810XSL.ISS_01) != 'undefined') {
	    document.frm_810XSL.ISS_01.value = TOTQTY

	    if (typeof (frm_810XSL.IT1_IT1_03) != 'undefined') {
	        if (isArray(document.frm_810XSL.IT1_IT1_03) == true) {
	            for (i = 0; i < document.frm_810XSL.IT1_IT1_03.length; i++) {
	                if (frm_810XSL.IT1_IT1_03.value != "") {
	                    if (document.frm_810XSL.IT1_IT1_03[i].value == 'EA') {
	                        document.frm_810XSL.ISS_02.value = "EA Each"
	                    }
	                    else {
	                        document.frm_810XSL.ISS_02.value = frm_810XSL.IT1_IT1_03[i].value
	                    }
	                }

	            }
	        }
	        else {

	            if (document.frm_810XSL.IT1_IT1_03.value == 'EA') {
	                document.frm_810XSL.ISS_02.value = "EA Each"
	            }
	            else {
	                document.frm_810XSL.ISS_02.value = frm_810XSL.IT1_IT1_03.value
	            }

	        }
	    }
	} 
		
		
	if(iSacLineTotal2!='' && iSacLineTotal1!='')
	 {
	    
		TExtPrice.innerText = parseFloat(Math.round(10000*Res)/10000) + parseFloat(iSacLineTotal1);	
		 TExtPrice.innerText = FormatAmount(TOTExtPrice + parseFloat(iSacLineTotal1))
     }
    if(iSacLineTotal1=='' && iSacLineTotal2!='')
	    {
	      TExtPrice.innerText = parseFloat(Math.round(10000*Res)/10000) + parseFloat(iSacLineTotal1);	
		 TExtPrice.innerText = FormatAmount(TOTExtPrice + parseFloat(iSacLineTotal1))
	    }
	if(iSacLineTotal1!='' && iSacLineTotal2=='')  
	  {  
		 TExtPrice.innerText = parseFloat(Math.round(10000*Res)/10000) + parseFloat(iSacLineTotal1);	
		 TExtPrice.innerText = FormatAmount(TOTExtPrice + parseFloat(iSacLineTotal1))
	  } 
	   
     if(iSacLineTotal2=='' && iSacLineTotal1=='')
	 {
		TExtPrice.innerText = Math.round(10000*Res)/10000;	
		TExtPrice.innerText = FormatAmount(TOTExtPrice)
     }
     
     
	
	if(typeof(frm_810XSL.IT1_IT1_01)!="undefined")
	 {
	    if(isArray(frm_810XSL.IT1_IT1_01)==true)
	     {
	        var ival;
	        var temp;
	        for(i=0;i<frm_810XSL.IT1_IT1_01.length;i++)
	         {
				iVal	=	 "000000"+(i+1)
				iVal2	=	iVal.length
				frm_810XSL.IT1_IT1_01[i].value	=	iVal.substring(iVal2-6,iVal2)
	          
	         }
	     }
		else
		 {
			var iVal	=	 "0000001"
			var iVal2	=	iVal.length
			frm_810XSL.IT1_IT1_01.value	=	iVal.substring(iVal2-6,iVal2)
		 }
	 
	}
	
	
	
	//if(frm_810XSL.BIG_03.value!="")
   //	  formatDate(frm_810XSL.BIG_03)
	
	
	///Format date  in header area 
	if ((typeof(document.frm_810XSL.DTM_02) == "undefined") == false && frm_810XSL.DTM_02.value != '')
	{
		if (isArray(document.frm_810XSL.DTM_02) == true)
		{
			for(i=0;i<document.frm_810XSL.DTM_02.length;i++)
			{
				formatDate(document.frm_810XSL.DTM_02[i])
			}
		}
		else
		{
			formatDate(document.frm_810XSL.DTM_02)
		}
	}
	
	///****************************
	
}
function OnValidate()
{
	
	var bValid = false;
	
	if(checkTpValidation() ==false)
	{
		return false
	}
	else
	{
		bValid = true;
	}
	
	if (bValid == true)
	{
		document.frm_810XSL.txt_Message.style.display="inline"
		document.frm_810XSL.txt_Message.style.color="red"
		document.frm_810XSL.txt_Message.style.fontWeight="Bold"
		document.frm_810XSL.txt_Message.value="Passes Validation!"	
		
		return true;
	}
}
// Call when we click on save button
function OnInvSubmit()
{	
	if (OnValidate())
	{
		document.frm_810XSL.target="_self"
		document.frm_810XSL.action="Process810.asp"
		frm_810XSL.submit();
	}		
	else
		return false;
}





function OnPrint()
{	
  frm_810XSL.target="Print"
  frm_810XSL.action="Print810.asp"
  win=window.open("Print810.asp","Print","left=0 top=0 width=780 height=500 tollbars=0 menubar=0 scrollbars=yes")
  frm_810XSL.submit(win)	
}
