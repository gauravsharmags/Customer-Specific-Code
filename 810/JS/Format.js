//Creates link dynamically
function editHREF()
{	
   
   /*var curdate=new Date();
   alert(curdate);
   alert(curdate.getMonth())
   month=curdate.getMonth()
   dd=curdate.getDate()
   y=curdate.getFullYear()
   alert(month + "/" + dd + "/" + y)*/
   



	if(typeof(DTMHref)!="undefined" && DateTimeTable.rows.length >= 2)
	{	
		createID(DTMHref,'PopUp/INV_Date.ASP','EditDTM',100,20,500,150,'frm_810XSL','DateTimeTable','DTMHref')
	}
	if(typeof(ReferenceHREF)!="undefined" && RefTable.rows.length >= 2)
	{	
		createID(ReferenceHREF,'PopUp/INV_REFRENCE.ASP','EditReferenceDetails',100,20,700,200,'frm_810XSL','RefTable','ReferenceHREF')
	}
		
	if(typeof(itemHref)!="undefined")
	{	
		createIDForItem(itemHref,'PopUp/Inv_Item.ASP','EditItemDetails',30,20,700,700,'frm_810XSL','ItemTable','itemHref')
	}
	if(typeof(ITDHref)!="undefined" && ITDTable_Header.rows.length >=2)
	{
		createID(ITDHref,'PopUp/INV_Terms.ASP','EditTermsDetails',100,20,660,330,'frm_810XSL','ITDTable_Header','ITDHref')
	}
	if(typeof(TXIHref)!="undefined" && TXITable_Header.rows.length >=2)
	{
		createID(TXIHref,'PopUp/INV_Tax.ASP','EditTaxDetails',100,20,660,230,'frm_810XSL','TXITable_Header','TXIHref')
	}	
	if(typeof(SACHref)!="undefined" && SacTable_Header.rows.length >=2)
	{
		createID(SACHref,'PopUp/Inv_SAC.asp','EditAllowanceDetails',100,20,660,500,'frm_810XSL','SacTable_Header','SACHref')
	}			
}

function createID(objHrefName,sUrl,sWinName,iLeft,iTop,iWidth,iHeight,sFormName,sObjdelTable,sObjHrefName)
{ 
	iTop=parseInt(parseInt(screen.height/2)-parseInt(iHeight/2))
	iLeft=parseInt(parseInt(screen.width/2)-parseInt(iWidth/2))

	var blank = ''
	if(isArray(objHrefName)==true)
	{
		for(i=0;i<objHrefName.length;i++)
		{
			objHrefName[i].innerHTML =	"<a onMouseOver='return setStatusBlank()' href=javascript:window.open('" + sUrl + "','" + sWinName + "','left="+iLeft+",top="+iTop+",width="+iWidth+",height="+iHeight+",scrollbars=1');" + sFormName + ".action='" + sUrl + "?Mode="+i+"&TD_id="+sObjHrefName+"';"+sFormName+".target='"+ sWinName + "';"+sFormName+".submit()>[Edit]</a>"
			
				objHrefName[i].innerHTML = objHrefName[i].innerHTML + "&nbsp;<a href=javascript:delRow(" + sObjdelTable + "," + parseInt(i + 1) + ");if(typeof(" + sObjHrefName + ")!='undefined')createID(" + sObjHrefName + ",'" + sUrl + "','" + sWinName + "'," + iLeft + "," + iTop + "," + iWidth + "," + iHeight + ",'" + sFormName + "','" + sObjdelTable + "','" + sObjHrefName + "',true);>[Del]</a>"
		}	
	}
	else
	{
			objHrefName.innerHTML =	"<a onMouseOver='return setStatusBlank()' href=javascript:window.open('" + sUrl + "','" + sWinName + "','left="+iLeft+",top="+iTop+",width="+iWidth+",height="+iHeight+",scrollbars=1');" + sFormName + ".action='" + sUrl + "?Mode=0&TD_id="+sObjHrefName+"';"+sFormName+".target='"+ sWinName + "';"+sFormName+".submit()>[Edit]</a>"
			
				objHrefName.innerHTML = objHrefName.innerHTML + "&nbsp;<a href=javascript:delRow(" + sObjdelTable + ",1);>[Del]</a>"
	}	
}

function delRow(delTable, Idx) 
{
	
	if(delTable.rows.length >= 1 && confirm("Do you want to delete this record ?") == true) 
	{
	  delTable.deleteRow(Idx);
	}
}



function createIDForItem(objHrefName,sUrl,sWinName,iLeft,iTop,iWidth,iHeight,sFormName,sObjdelTable,sObjHrefName)
{	
	iTop=parseInt(parseInt(screen.height/2)-parseInt(iHeight/2))-25
	iLeft=parseInt(parseInt(screen.width/2)-parseInt(iWidth/2))
	
	if(isArray(objHrefName)==true)
	{
		for(i=0;i<objHrefName.length;i++)
		{
			objHrefName[i].innerHTML =	"<a onMouseOver='return setStatusBlank()' href=javascript:window.open('" + sUrl + "','" + sWinName + "','left="+iLeft+",top="+iTop+",width="+iWidth+",height="+iHeight+",scrollbars=1');" + sFormName + ".action='" + sUrl + "?Mode="+i+"';"+sFormName+".target='"+ sWinName + "';"+sFormName+".submit()>[Edit]</a>"
			
				objHrefName[i].innerHTML = objHrefName[i].innerHTML + "&nbsp;<a onMouseOver='return setStatusBlank()' href=javascript:delItemRow('" + sObjdelTable + "'," + parseInt(i) + ");if(typeof(" + sObjHrefName + ")!='undefined')createIDForItem(" + sObjHrefName + ",'" + sUrl + "','" + sWinName + "'," + iLeft + "," + iTop + "," + iWidth + "," + iHeight + ",'" + sFormName + "','" + sObjdelTable + "','" + sObjHrefName + "',true);>[Del]</a>"
		}	
	}
	else
	{
			objHrefName.innerHTML =	"<a onMouseOver='return setStatusBlank()' href=javascript:window.open('" + sUrl + "','" + sWinName + "','left="+iLeft+",top="+iTop+",width="+iWidth+",height="+iHeight+",scrollbars=1');" + sFormName + ".action='" + sUrl + "?Mode=0';"+sFormName+".target='"+ sWinName + "';"+sFormName+".submit()>[Edit]</a>"
			
				objHrefName.innerHTML = objHrefName.innerHTML + "&nbsp;<a onMouseOver='return setStatusBlank()' href=javascript:delItemRow('" + sObjdelTable + "',1);>[Del]</a>"
	}	
}

function delItemRow(delTable, Idx) 
{
	if(eval(delTable+".rows.length") > 1)
	{
		if(confirm("Do you want to delete this item ?")==true)
		{
				eval(delTable+".deleteRow"+"("+Idx+")")
		}
	}	
	else
	{
		alert("Last item cannot be removed")		
	}
		
}


function setBlank(tableID)
{	
	
	var table = document.all ? document.all[tableID] : document.getElementById(tableID);	
	if(table.innerHTML!="")
	 {
	    if(confirm("Do you want to delete : " + tableID)==true)  
	      {
			var blankValue = "";
			table.innerHTML=blankValue;
		  }
     }		  	
}
function isArray(obj)
{
	return(typeof(obj.length)=="undefined")?false:true;
}

//date formatting 
function formatDate(obj)
{
	var dt = new Date()
	var dtDate = obj.value
	
	if (dtDate.length == 8)
	{
		
		if((dtDate.substr(1,1) != "/" && dtDate.substr(2,1) != "/") || (dtDate.substr(1,1) != "-" && dtDate.substr(2,1) != "-"))
		{
			dtDate = dtDate.substr(4,2) + "/" + dtDate.substr(6,2) + "/" + dtDate.substr(0,4)
			obj.value = dtDate
		}
	}
	else 
	if (dtDate.length == 6)
	{
		if((dtDate.substr(1,1) != "/" && dtDate.substr(2,1) != "/") || (dtDate.substr(1,1) != "-" && dtDate.substr(2,1) != "-"))
		{
			//dtDate = dtDate.substr(2,2) + "/" + dtDate.substr(4,2) + "/" + dtDate.substr(0,2)
			dtDate = dtDate.substr(2,2) + "/" + dtDate.substr(4,2) + "/20" + dtDate.substr(0,2)
			obj.value = dtDate
		}
	}
}
function popWin(sURL,sWinName,iWidth,iHeight,Parameter)
{
	iTop=parseInt(parseInt(screen.height/2)-parseInt(iHeight/2))
	iLeft=parseInt(parseInt(screen.width/2)-parseInt(iWidth/2))
	window.open(sURL,sWinName,'toolbar=0,status=0,width='+ iWidth +',height='+ iHeight +',top='+ iTop + ',left='+ iLeft +',scrollbars=1')
	document.frm_810XSL.action	= sURL+"?Mode="+Parameter
	document.frm_810XSL.target	= sWinName
	document.frm_810XSL.submit()
}

function doNull(sDataElement,sRowID,segName)
{    
	var sDataElArray	=	sDataElement.split(",")
	var ilen			=	sDataElArray.length
	var sRowIDArray		=	sRowID.split(",")
	var iRowlen			=	sRowIDArray.length
	//return(typeof(obj.length)=="undefined")
	//if(((eval("typeof(frm_810XSL."+sRowIDArray[0]+") != 'undefined'") && (eval(sRowIDArray[0]+".style.display")=='inline'))) || ((eval("typeof(frm_810XSL."+sRowIDArray[1]+") != 'undefined'") && (eval(sRowIDArray[1]+".style.display")=='inline'))))
	
	if(iRowlen==2)
		{
			if(eval(sRowIDArray[0]+".style.display")=='inline' || eval(sRowIDArray[1]+".style.display")=='inline')
			{
				if(confirm("Do you want to delete "+segName+" value(s) ?")==true)
				{
					if(ilen > 1)
					{
						for(i=0;i<sDataElArray.length;i++)
						{   
							if(eval("typeof(frm_810XSL."+sDataElArray[i]+") != 'undefined'"))
							{
								eval("frm_810XSL."+sDataElArray[i]+".value	=''")			 
							}	
						}
					}
					else
					{
						if(eval("typeof(frm_810XSL."+sDataElArray+") != 'undefined'"))
						{
							eval("frm_810XSL."+sDataElArray+".value	=''")
						}	
					}
					if(sRowID != "")
					{
						if(iRowlen>1)
						{
							for(j=0;j<sRowIDArray.length;j++)
							{
								if(eval("typeof("+sRowIDArray[j]+") != 'undefined'"))
								{
									eval(sRowIDArray[j]+".style.display	=	'NONE'")
								}	
							}
						}
						else
						{
						  
							if(eval("typeof("+sRowIDArray+") != 'undefined'"))
							{
								eval(sRowIDArray+".style.display	=	'NONE'")	
							}	
						}
					}
					
				}	
			}	
		}
		if(iRowlen==3)
		{
			if(eval(sRowIDArray[0]+".style.display")=='inline' || eval(sRowIDArray[1]+".style.display")=='inline' || eval(sRowIDArray[2]+".style.display")=='inline')
			{
				if(confirm("Do you want to delete "+segName+" value(s) ?")==true)
				{
					if(ilen > 1)
					{
						for(i=0;i<sDataElArray.length;i++)
						{   
							if(eval("typeof(frm_810XSL."+sDataElArray[i]+") != 'undefined'"))
							{
								eval("frm_810XSL."+sDataElArray[i]+".value	=''")			 
							}	
						}
					}
					else
					{
						if(eval("typeof(frm_810XSL."+sDataElArray+") != 'undefined'"))
						{
							eval("frm_810XSL."+sDataElArray+".value	=''")
						}	
					}
					if(sRowID != "")
					{
						if(iRowlen>1)
						{
							for(j=0;j<sRowIDArray.length;j++)
							{
								if(eval("typeof("+sRowIDArray[j]+") != 'undefined'"))
								{
									eval(sRowIDArray[j]+".style.display	=	'NONE'")
								}	
							}
						}
						else
						{
						  
							if(eval("typeof("+sRowIDArray+") != 'undefined'"))
							{
								eval(sRowIDArray+".style.display	=	'NONE'")	
							}	
						}
					}
					
				}	
			}	
		}	
		if(iRowlen==5)
		{
			if(eval(sRowIDArray[0]+".style.display")=='inline' || eval(sRowIDArray[1]+".style.display")=='inline' || eval(sRowIDArray[2]+".style.display")=='inline' || eval(sRowIDArray[3]+".style.display")=='inline' || eval(sRowIDArray[4]+".style.display")=='inline')
			{
				if(confirm("Do you want to delete "+segName+" value(s) ?")==true)
				{
					if(ilen > 1)
					{
						for(i=0;i<sDataElArray.length;i++)
						{   
							if(eval("typeof(frm_810XSL."+sDataElArray[i]+") != 'undefined'"))
							{
								eval("frm_810XSL."+sDataElArray[i]+".value	=''")			 
							}	
						}
					}
					else
					{
						if(eval("typeof(frm_810XSL."+sDataElArray+") != 'undefined'"))
						{
							eval("frm_810XSL."+sDataElArray+".value	=''")
						}	
					}
					if(sRowID != "")
					{
						if(iRowlen>1)
						{
							for(j=0;j<sRowIDArray.length;j++)
							{
								if(eval("typeof("+sRowIDArray[j]+") != 'undefined'"))
								{
									eval(sRowIDArray[j]+".style.display	=	'NONE'")
								}	
							}
						}
						else
						{
						  
							if(eval("typeof("+sRowIDArray+") != 'undefined'"))
							{
								eval(sRowIDArray+".style.display	=	'NONE'")	
							}	
						}
					}
					
				}	
			}	
		}	
		if(iRowlen==1)
		{
			if(eval(sRowIDArray[0]+".style.display")=='inline')
			{
				if(confirm("Do you want to delete "+segName+" value(s) ?")==true)
				{
					if(ilen > 1)
					{
						for(i=0;i<sDataElArray.length;i++)
						{   
							if(eval("typeof(frm_810XSL."+sDataElArray[i]+") != 'undefined'"))
							{
								eval("frm_810XSL."+sDataElArray[i]+".value	=''")			 
							}	
						}
					}
					else
					{
						if(eval("typeof(frm_810XSL."+sDataElArray+") != 'undefined'"))
						{
							eval("frm_810XSL."+sDataElArray+".value	=''")
						}	
					}
					if(sRowID != "")
					{
						if(iRowlen>1)
						{
							for(j=0;j<sRowIDArray.length;j++)
							{
								if(eval("typeof("+sRowIDArray[j]+") != 'undefined'"))
								{
									eval(sRowIDArray[j]+".style.display	=	'NONE'")
								}	
							}
						}
						else
						{
						  
							if(eval("typeof("+sRowIDArray+") != 'undefined'"))
							{
								eval(sRowIDArray+".style.display	=	'NONE'")	
							}	
						}
					}
					
				}	
			}	
		}	
			
}
function PopWinNew(sURL,sWinName,iWidth,iHeight,Parameter)
{
		if(sURL=="PopUp/INV_Tax.asp")
		 {
		   if(typeof(TXIHref)!='undefined' && typeof(TXIHref)!='unknown')
		     {
		       if(isArray(TXIHref)== true )
		        {
		          alert("Only Two TXI Segment Allowed")
		          return
		        }
		      }
		  }        
		       
		iTop=parseInt(parseInt(screen.height/2)-parseInt(iHeight/2))
		iLeft=parseInt(parseInt(screen.width/2)-parseInt(iWidth/2))

		window.open(sURL,sWinName,'toolbar=0,status=0,width='+ iWidth +',height='+ iHeight +',top='+ iTop +',left='+ iLeft +',scrollbars=1')
		document.frm_810XSL.action	= sURL+"?Mode="+Parameter+"&Create=New"
		document.frm_810XSL.target	= sWinName
		document.frm_810XSL.submit()
	
}
function addItemWithExsiting(id,sURL,sWinName,iWidth,iHeight,Parameter)
{
	var irowID = id.rows.length;
				
		window.open(sURL,sWinName,'toolbar=0,status=0,width='+ iWidth +',height='+ iHeight +',top=30,left=160,scrollbars=1')
		document.frm_810XSL.action	= sURL+"?Mode="+irowID+"&Create=New"
		document.frm_810XSL.target	= sWinName	
		document.frm_810XSL.submit()	
		
}

function checkIsNan(objTxtBox)
{
if (isArray(objTxtBox) == true)
	{
		for(i=0;i<objTxtBox.length;i++)
		{
			if (isNaN(objTxtBox[i].value)) 
			{
				alert("Non-numeric values are not allowed for quantity field")
				objTxtBox[i].value	=	""
				objTxtBox[i].focus()
				objTxtBox[i].select()
				return false
				break;
			}
		}
	}	
	else
	{
			if (isNaN(objTxtBox.value)) 
			{
				alert("Non-numeric values are not allowed for quantity field")
				objTxtBox.value	=	""
				objTxtBox.focus()
				objTxtBox.select()
				return false
			}
	
	}
	return true
}
function setStatusBlank()
{
	window.status='';
	return true;
}



function roundOff(value, precision)
{
    value = "" + value
    precision = parseInt(precision);
    var whole = "" + Math.round(value * Math.pow(10, precision));
    var decPoint = whole.length - precision;
    if(decPoint != 0)
    {
            result = whole.substring(0, decPoint);
            result += ".";
            result += whole.substring(decPoint, whole.length);
    }
    else
    {
            result = value;
    }
    return result;
}
//~~~~~~*****~~~~~
function FormatAmount(num) 
{
  var i,l,d;
  var nums;
  var ret;
  if (isNaN(num) || num=="" || num == null)
  {
	num = 0;
  }
  nums = String(Math.round(num*100));
  while (nums.length <3) nums = "0" + nums;
  l = nums.length-3;
  ret = "." + nums.charAt(l+1) + nums.charAt(l+2);
  d=0;
  for (i=l; i>=0; i--) {
        ret = nums.charAt(i) + ret;
    d++;
        if (d==3 && i>0 && nums.indexOf("-") < 0 )
		{
			ret="," + ret;
			d=0;
        }
  }
  ret = "$" + ret;
  return ret;
}

function removeAllSpaces(objtextBox)
{
	var sVal	=	objtextBox.value
	var iLen	=	sVal.length
	var i
	for(i=0;i<=iLen-1;i++)
	{
		if(sVal.charAt(i) == " ")
		{
			alert("Spaces are not allowed")
			objtextBox.select()
			return false
		}
	}
	return true
}
function removeSpecialCharacters(objtextBox,chars)
{
	var sChar = chars
	var iCharLen	=	sChar.length
	var sVal	=	objtextBox.value
	var iValLen	=	sVal.length

	for(i=0 ; i<iCharLen ; i++)
	{
		for(j=0 ; j<iValLen ; j++)
		{
			if(sVal.charAt(j) == sChar.charAt(i))
			{
				alert("Please remove " + sChar.charAt(i) + " from Invoice No")
				objtextBox.select()
				return false
			}
		}
	}
	return true
}

function OnPrint()
{	
  frm_810XSL.target="Print"
  frm_810XSL.action="Print810.asp"
  win=window.open("Print810.asp","Print","left=0 top=0 width=780 height=500 tollbars=0 menubar=0 scrollbars=yes")
  frm_810XSL.submit(win)	
}

function isValidDate(dateStr,datef) 
{
//var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{2}|\d{4})$/;
var datePat = /^(\d{1,2})(\/|-)(\d{1,2})\2(\d{4})$/;
var matchArray = dateStr.match(datePat); 

if (matchArray == null) 
{
//alert("Date is not in a valid format");
alert("Please enter Date in MM/DD/YYYY format");
datef.select();
datef.focus();
return false;
}

month = matchArray[1];
day = matchArray[3];
year = matchArray[4];

if (month < 1 || month > 12) 
{ 
alert("Month must be in between 1 and 12");
datef.focus();
return false;
}

if (day < 1 || day > 31) 
{
alert("Day must be in between 1 and 31");
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


function DisplayStatus()
{		
	if(typeof(frm_810XSL.hid_ProcessMode) !='undefined')
	{
	    if(frm_810XSL.hid_ProcessMode.value =='Edit')
	    {	
	        if(typeof(frm_810XSL.hid_FileStatus) !='undefined')
	        {
		        if(frm_810XSL.hid_FileStatus.value.toUpperCase() == "P" && frm_810XSL.opt_Status.value.toUpperCase() == "P")
		        {
			        document.frm_810XSL.opt_Status.value ="[ Production File ]"
		        }
		        else if(frm_810XSL.hid_FileStatus.value.toUpperCase() == "T" && frm_810XSL.opt_Status.value.toUpperCase() == "T")
		        {
			        document.frm_810XSL.opt_Status.value ="[ Test File ]"
		        }
		        else if(frm_810XSL.hid_FileStatus.value.toUpperCase() == "P" && frm_810XSL.opt_Status.value.toUpperCase() == "T")
		        {
			        document.frm_810XSL.opt_Status.value ="[ This file indicator is 'TEST', \nBut if you Validate and Generate this file again, Indicator will be changed to 'PRODUCTION' ]"
			        td_Test_Prod_id.align = "center"
			        document.frm_810XSL.opt_Status.style.width = "800"
		        }
		        else if(frm_810XSL.hid_FileStatus.value.toUpperCase() == "T" && frm_810XSL.opt_Status.value.toUpperCase() == "P")
		        {
			        document.frm_810XSL.opt_Status.value ="[ This file indicator is 'PRODUCTION', \nBut if you Validate and Generate this file again, Indicator will be changed to 'TEST' ]"
			        td_Test_Prod_id.align = "center"
			        document.frm_810XSL.opt_Status.style.width = "800"
		        }
		        else if(frm_810XSL.hid_FileStatus.value == "")
		        {
			        document.frm_810XSL.opt_Status.value ="*File Indicator Undefined"
		        }
	        }
	    }
	    else
	    {
	        if(typeof(frm_810XSL.hid_FileStatus) !='undefined')
	        {
		        if(frm_810XSL.hid_FileStatus.value.toUpperCase() == "P")
		        {
			        document.frm_810XSL.opt_Status.value ="[ Production File ]"
		        }
		        else if(frm_810XSL.hid_FileStatus.value.toUpperCase() == "T")
		        {
			        document.frm_810XSL.opt_Status.value ="[ Test File ]"
		        }
		        else
		        {
			        document.frm_810XSL.opt_Status.value ="*File Indicator Undefined"
		        }
	        }
	    }
	}
}

/////*************   created by : Anupam Sinha
function checkIt(objtextBox,str,massege)
 {
   var str1=objtextBox.value.toString();
   var pos;
   for(i=0;i<str1.length;i++)
		 {
		   pos=str.indexOf(str1.charAt(i));
		   if(!(pos>=0))
		    {
		      alert(massege);
		      objtextBox.select()
		      return false
		    }  
		 }
  } 
   
   
   
   
   
   
   
   