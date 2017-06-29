

function checkTpValidation() {

    document.frm_810XSL.txt_Message.value = ""



    if (frm_810XSL.BIG_04.value == "") {
        alert("Please Fill PO Number")
        frm_810XSL.BIG_04.focus()
        return false;
    }
    if (removeAllSpaces(frm_810XSL.BIG_04) == false) {
        return false
    }
    if (removeSpecialCharacters(frm_810XSL.BIG_04, '&^') == false) {
        return false
    }
    if (frm_810XSL.BIG_03.value == "") {
        alert("Please Enter PO Date")
        frm_810XSL.BIG_03.focus()
        return false
    }
    if (!(isValidDate(frm_810XSL.BIG_03.value, frm_810XSL.BIG_03))) {
        frm_810XSL.BIG_03.select()
        frm_810XSL.BIG_03.focus()
        return false;
    }
    if (frm_810XSL.BIG_02.value == "") {
        alert("Please Fill Invoice Number")
        frm_810XSL.BIG_02.focus()
        return false;
    }
    else {

        if (checkIt(frm_810XSL.BIG_02, "0123456789", "Please Enter Numeric Characters in Invoice Number") == false)
            return false
    }






    if (removeAllSpaces(frm_810XSL.BIG_02) == false) {
        return false
    }
    if (removeSpecialCharacters(frm_810XSL.BIG_02, '&^') == false) {
        return false
    }
    if (frm_810XSL.BIG_01.value == "") {
        alert("Please Enter Invoice Date")
        frm_810XSL.BIG_01.focus()
        return false
    }
    if (!(isValidDate(frm_810XSL.BIG_01.value, frm_810XSL.BIG_01))) {
        frm_810XSL.BIG_01.select()
        frm_810XSL.BIG_01.focus()
        return false;
    }




    //SU	

    if (typeof (frm_810XSL.N1_N1_031) == 'undefined' && typeof (frm_810XSL.N1_N1_021) == 'undefined') {
        alert("Please Enter ID Qualifier  OR  Name  For : \n SU - Supplier/Manufacturer")
        hrefSu.focus()
        return false
    }

    //ST		

//    if (typeof (frm_810XSL.N1_N1_032) == 'undefined') {
//        alert("Please Enter ID Qualifier For : \n ST - Ship To")
//        hrefSt.focus()
//        return false
//    }
    if (typeof (frm_810XSL.N1_N1_042) != 'undefined') {
        if (frm_810XSL.N1_N1_042.value.length != "13") {
            alert("Please Enter 13 digit Id : \n ST - Ship To")
            hrefSt.focus()
            return false
        }
    }


    //REF		
    if (typeof (frm_810XSL.REF_01) == 'undefined') {
        alert("Please Enter Reference Identification with Qualifier 'IA'")
        frm_810XSL.REF_ADDBtn.focus()
        return false
    }
    else {
        var str;
        if (isArray(frm_810XSL.REF_01) == true) {
            var count = 0;
            for (i = 0; i < frm_810XSL.REF_01.length; i++) {
                str = document.frm_810XSL.REF_01[i].value.toString();
                if (str.substr(0, 2) == "IA")
                    count = parseInt(count) + 1;
            }
            if (parseInt(count) == 0) {
                alert("Please Enter Reference Identification with Qualifier 'IA'")
                frm_810XSL.REF_ADDBtn.focus()
                return false
            }
        }
        else {

            str = document.frm_810XSL.REF_01.value.toString();
            if (str.substr(0, 2) != "IA") {
                alert("Please Enter Reference Identification with Qualifier 'IA'")
                frm_810XSL.REF_ADDBtn.focus()
                return false
            }
        }

    }

    //ITD

    if (typeof (frm_810XSL.ITD_01) == 'undefined') {
        alert("Please Enter Terms Type Code")
        frm_810XSL.ITD_ADDBtn.focus()
        return false
    }
    else {
        if (isArray(frm_810XSL.ITD_01) == true) {
            for (i = 0; i < frm_810XSL.ITD_01.length; i++) {
                if (document.frm_810XSL.ITD_01[i].value == "") {
                    alert("Please Enter Terms Type Code")
                    ITDHref[i].focus()
                    return false
                }
                if (document.frm_810XSL.ITD_02[i].value == "") {
                    alert("Please Enter Terms Basis Date Code")
                    ITDHref[i].focus()
                    return false
                }
                if (document.frm_810XSL.ITD_07[i].value == "") {
                    alert("Please Enter Terms Net Days")
                    ITDHref[i].focus()
                    return false
                }
            }
        }
        else {

            if (document.frm_810XSL.ITD_01.value == "") {
                alert("Please Enter Terms Type Code")
                ITDHref.focus()
                return false
            }
            if (document.frm_810XSL.ITD_02.value == "") {
                alert("Please Enter Terms Basis Date Code")
                ITDHref.focus()
                return false
            }
            if (document.frm_810XSL.ITD_07.value == "") {
                alert("Please Enter Terms Net Days")
                ITDHref.focus()
                return false
            }
        }
    }





    //DTM

    /*if(typeof(frm_810XSL.DTM_01) == 'undefined')
    {
    alert("Please Enter Date/Time Reference")
    frm_810XSL.DTM_ADDBtn.focus()
    return false
    }*/
    if (typeof (frm_810XSL.DTM_01) != 'undefined') {

        if (typeof (frm_810XSL.DTM_01.length) != 'undefined') {
            for (i = 0; i < frm_810XSL.DTM_01.length; i++) {
                if (frm_810XSL.DTM_01[i].value == '' && frm_810XSL.DTM_02[i].value != '') {
                    alert("Value for Date and time field should be: \n --> 011 - Shipped")
                    DTMHref[i].focus()
                    return false
                }
                if (frm_810XSL.DTM_01[i].value != '' && frm_810XSL.DTM_02[i].value == '') {
                    alert("Value for Date and time field should not be blank")
                    DTMHref[i].focus()
                    return false
                }
                if (frm_810XSL.DTM_02[i].value != '') {
                    if (!(isValidDate(frm_810XSL.DTM_02[i].value, frm_810XSL.DTM_02[i]))) {
                        frm_810XSL.DTM_02[i].select()
                        frm_810XSL.DTM_02[i].focus()
                        return false;
                    }
                }
            }
        }
        else {
            if (frm_810XSL.DTM_01.value == '' && frm_810XSL.DTM_02.value != '') {
                alert("Value for Date and time field should be: \n --> 011 - Shipped")
                DTMHref.focus()
                return false
            }
            if (frm_810XSL.DTM_01.value != '' && frm_810XSL.DTM_02.value == '') {
                alert("Value for Date and time field should not be blank")
                DTMHref.focus()
                return false
            }
            if (frm_810XSL.DTM_02.value != '') {
                if (!(isValidDate(frm_810XSL.DTM_02.value, frm_810XSL.DTM_02))) {
                    frm_810XSL.DTM_02.select()
                    frm_810XSL.DTM_02.focus()
                    return false;
                }
            }
        }
    }
    else {
        alert("Please Enter Date/Time Detail")
        DateTimeTable.focus()
        return false
    }

    //conditions for ITD-DTM pair

    if (isArray(frm_810XSL.ITD_02) == true) {
        var count = 0;
        var str;
        for (i = 0; i < frm_810XSL.ITD_02.length; i++) {
            str = document.frm_810XSL.ITD_02[i].value.toString();
            if (str.substr(0, 1) == "7")
                count = parseInt(count) + 1;
        }
        if (parseInt(count) > 0) {
            if (isArray(frm_810XSL.DTM_01) == true) {
                for (i = 0; i < frm_810XSL.DTM_01.length; i++) {
                    str = document.frm_810XSL.DTM_01[i].value.toString();
                    if (str.substr(0, 3) == "007")
                        count = parseInt(count) + 1;
                }
                if (parseInt(count) == 0) {
                    alert("Please Enter Date/Time Reference with Qualifier '007'")
                    frm_810XSL.DTM_ADDBtn.focus()
                    return false
                }
            }
            else {
                str = document.frm_810XSL.DTM_01.value.toString();
                if (str.substr(0, 3) != "007") {
                    alert("Please Enter Date/Time Reference with Qualifier '007'")
                    frm_810XSL.DTM_ADDBtn.focus()
                    return false
                }

            }
        }
    }
    else {
        var count = 0;
        var str;
        str = document.frm_810XSL.ITD_02.value.toString();
        if (str.substr(0, 1) == "7") {
            if (isArray(frm_810XSL.DTM_01) == true) {
                for (i = 0; i < frm_810XSL.DTM_01.length; i++) {
                    str = document.frm_810XSL.DTM_01[i].value.toString();
                    if (str.substr(0, 3) == "007")
                        count = parseInt(count) + 1;
                }
                if (parseInt(count) == 0) {
                    alert("Please Enter Date/Time Reference with Qualifier '007'")
                    frm_810XSL.DTM_ADDBtn.focus()
                    return false
                }
            }
            else {
                str = document.frm_810XSL.DTM_01.value.toString();
                if (str.substr(0, 3) != "007") {
                    alert("Please Enter Date/Time Reference with Qualifier '007'")
                    frm_810XSL.DTM_ADDBtn.focus()
                    return false
                }

            }
        }
    }


    //FOB

    if (document.frm_810XSL.FOB_01.value == "") {
        alert("Please Enter FOB Details")
        hrefFob.focus()
        return false
    }

    ////product service id
    /*if(isArray(frm_810XSL.IT1_IT1_02) == true)
    {
    for(i=0;i<frm_810XSL.IT1_IT1_02.length;i++)
    {	
    if(document.frm_810XSL.IT1_PID_05[i].value !='' && frm_810XSL.IT1_PID_05[i].value.charCodeAt() != 13)
    {
    var sVal	=	document.frm_810XSL.IT1_PID_05[i].value
    var iLen	=	sVal.length
    var newval=""
    if(iLen > 80)
    {
    alert("Maxmium length for item description field is 80")
    newval=sVal.substring(0,80)
    frm_810XSL.IT1_PID_05[i].value=newval
    frm_810XSL.IT1_PID_05[i].focus()
    return false
    }
    }	
    }
    }	
    else
    {
    if(document.frm_810XSL.IT1_PID_05.value !='' && frm_810XSL.IT1_PID_05.value.charCodeAt() != 13)
    {
    var sVal	=	document.frm_810XSL.IT1_PID_05.value
    var iLen	=	sVal.length
    var newval=""
    if(iLen > 80)
    {
    alert("Maxmium length for item description field is 80")
    newval=sVal.substring(0,80)
    frm_810XSL.IT1_PID_05.value=newval					
    frm_810XSL.IT1_PID_05.focus()
    return false
    }
    }	
    }*/
    if (isArray(frm_810XSL.IT1_IT1_02) == true) {
        for (i = 0; i < frm_810XSL.IT1_IT1_02.length; i++) {
            ///************************************************
            ///Product Service ID & Qualifier

            if (frm_810XSL.IT1_IT1_02[i].value == '') {
                alert("Item Detail\n-->Please Enter Quantity For Item No:" + (i + 1))
                frm_810XSL.IT1_IT1_02[i].focus()
                return false
            }
            if (frm_810XSL.IT1_IT1_03[i].value == '') {
                alert("Item Detail\n-->Please Enter Measurement Code For Item No:" + (i + 1))
                itemHref[i].focus()
                return false
            }
            /*if(frm_810XSL.IT1_IT1_03[i].value=="CA" && (frm_810XSL.IT1_PO4_01[i].value=="" && frm_810XSL.IT1_PO4_14[i].value==""))
            {
            alert ("Please Enter Item Physical Details")
            itemHref[i].focus()
            return false
            } */
            /*if(frm_810XSL.IT1_IT1_03[i].value=="EA" && (frm_810XSL.IT1_PO4_01[i].value!="" || frm_810XSL.IT1_PO4_14[i].value!=""))
            {
            if(frm_810XSL.IT1_PO4_01[i].value!="")
            {
            alert ("Please Not Enter Packs")
            itemHref[i].focus()
            return false
            }
            if(frm_810XSL.IT1_PO4_14[i].value!="")
            {
            alert ("Please Not Enter Inner Packs")
            itemHref[i].focus()
            return false
            }		
            } */
            if (frm_810XSL.IT1_IT1_04[i].value == '') {
                alert("Item Detail\n--->Please Enter Unit Price For Item No:" + (i + 1))
                itemHref[i].focus()
                return false
            }
            if (frm_810XSL.IT1_IT1_06[i].value != '' && frm_810XSL.IT1_IT1_07[i].value == '') {
                alert("Please Enter 1st Product / Service id qualifier\n--->Item Level")
                itemHref[i].focus()
                return false
            }
            if (frm_810XSL.IT1_IT1_06[i].value == '' && frm_810XSL.IT1_IT1_07[i].value != '') {
                alert("Please Enter 1st Product / Service id\n--->Item Level ")
                itemHref[i].focus()
                return false
            }
            if (frm_810XSL.IT1_IT1_08[i].value != '' && frm_810XSL.IT1_IT1_09[i].value == '') {
                alert("Please Enter 2nd Product / Service id qualifier\n--->Item Level")
                itemHref[i].focus()
                return false
            }
            if (frm_810XSL.IT1_IT1_08[i].value == '' && frm_810XSL.IT1_IT1_09[i].value != '') {
                alert("Please Enter 2nd Product / Service id\n--->Item Level ")
                itemHref[i].focus()
                return false
            }
            if (frm_810XSL.IT1_PO4_01[i].value != "" || frm_810XSL.IT1_PO4_14[i].value != "") {
                if (frm_810XSL.IT1_PO4_01[i].value == "") {
                    alert("Please  Enter Packs")
                    itemHref[i].focus()
                    return false
                }
                if (frm_810XSL.IT1_PO4_14[i].value == "") {
                    alert("Please  Enter Inner Packs")
                    itemHref[i].focus()
                    return false
                }
            }




        }
    }
    else {

        if (frm_810XSL.IT1_IT1_02.value == '') {
            alert("Item Detail\n-->Please Enter Quantity ")
            frm_810XSL.IT1_IT1_02.focus()
            return false
        }
        if (frm_810XSL.IT1_IT1_03.value == '') {
            alert("Item Detail\n-->Please Enter Measurement Code")
            itemHref.focus()
            return false
        }
        /*if(frm_810XSL.IT1_IT1_03.value=="CA" && (frm_810XSL.IT1_PO4_01.value=="" && frm_810XSL.IT1_PO4_14.value==""))
        {
        alert ("Please Enter Item Physical Details")
        itemHref.focus()
        return false
        }  
        if(frm_810XSL.IT1_IT1_03.value=="EA" && (frm_810XSL.IT1_PO4_01.value!="" || frm_810XSL.IT1_PO4_14.value!=""))
        {
        if(frm_810XSL.IT1_PO4_01.value!="")
        {
        alert ("Please Not Enter Packs")
        itemHref.focus()
        return false
        }
        if(frm_810XSL.IT1_PO4_14.value!="")
        {
        alert ("Please Not Enter Inner Packs")
        itemHref.focus()
        return false
        }		
        }  */
        if (frm_810XSL.IT1_IT1_04.value == '') {
            alert("Item Detail\n--->Please Enter Unit Price")
            itemHref.focus()
            return false
        }
        if (frm_810XSL.IT1_IT1_06.value != '' && frm_810XSL.IT1_IT1_07.value == '') {
            alert("Please Enter 1st Product / Service id qualifier\n--->Item Level")
            itemHref.focus()
            return false
        }
        if (frm_810XSL.IT1_IT1_06.value == '' && frm_810XSL.IT1_IT1_07.value != '') {
            alert("Please Enter 1st Product / Service id\n--->Item Level ")
            itemHref.focus()
            return false
        }

        if (frm_810XSL.IT1_IT1_08.value != '' && frm_810XSL.IT1_IT1_09.value == '') {
            alert("Please Enter 2nd Product / Service id qualifier\n--->Item Level")
            itemHref.focus()
            return false
        }
        if (frm_810XSL.IT1_IT1_08.value == '' && frm_810XSL.IT1_IT1_09.value != '') {
            alert("Please Enter 2nd Product / Service id\n--->Item Level ")
            itemHref.focus()
            return false
        }
        if (frm_810XSL.IT1_PO4_01.value != "" || frm_810XSL.IT1_PO4_14.value != "") {
            if (frm_810XSL.IT1_PO4_01.value == "") {
                alert("Please  Enter Packs")
                itemHref.focus()
                return false
            }
            if (frm_810XSL.IT1_PO4_14.value == "") {
                alert("Please  Enter Inner Packs")
                itemHref.focus()
                return false
            }
        }
    }
    //CAD
    /*	 if(document.frm_810XSL.CAD_04.value == "")
    {
    alert("Please Enter Carrier Details")
    hrefCAD.focus()
    return false
    }	*/
    //ISS
    if (document.frm_810XSL.ISS_01.value == "" && document.frm_810XSL.ISS_03.value == "") {
        alert("Please Enter Invoice Shipment Details")
        hrefISS.focus()
        return false
    }

    return true
}	

