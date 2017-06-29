<%@ language="VBscript"%>
<%response.Buffer=true%>
<!---------#Include File="../../../IncludeFile/adovbs.inc"---->
<!--#Include File="../../../IncludeFile/Connection.asp"-->
<!--#Include File="../../../IncludeFile/Globalaspfunction.asp"-->
<%

If trim(Session("UserID")) = "" then
		Response.Redirect "../../../Default.asp"
End IF

%>
<%


iTrdRelId = trim(Request.Form("hid_NewTrdRel"))
	''Getting Production/Test
sFileStatus=f_GetISA15Value("810",iTrdRelId)		
if iTrdRelId = "" then
	Response.Redirect "/Edi/LiveEdi/OutBox.asp"
end if
%>
<HTML>
	<HEAD>
		<META NAME="GENERATOR" Content="Microsoft Visual Studio 6.0">
		<link rel="stylesheet" type="text/css" href="../../../Includefile/infocon-global.css">
			<SCRIPT LANGUAGE="javascript" src="js/Format.js"></SCRIPT>
			<SCRIPT LANGUAGE="javascript" src="js/Validate_810.js"></SCRIPT>
			<SCRIPT LANGUAGE="javascript" src="js/810New.js"> </SCRIPT>
	</HEAD>
	<%	
	
	
%>
	<BODY Topmargin=0 LeftMargin=0 onfocus ="editHREF();accessExtPrice();"  onload="DisplayStatus();editHREF();accessExtPrice();frm_810XSL.txt_CustomerName.value='<%=session("CustomerName")%>';">
		<!-- #include file="../../../IncludeFile/CustomLiveEDItop.inc"-->
		<Form Action="Process810.asp" Method="post" name="frm_810XSL">
			<input type="hidden" name="hid_ProcessMode" value="New"> <input type="hidden" name="hid_TrdRelId" value="<%=iTrdRelId%>">
			<input type="hidden" name="hid_FileStatus" value="<%=sFileStatus%>"> <INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_01" value="">
			<INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_02" value=""> <INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_03" value="">
			<INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_04" value=""> <INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_05" value="">
			<INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_06" value=""> <INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_07" value="">
			<INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_08" value=""> <INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_09" value="">
			<INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_10" value=""> <INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_11" value="">
			<INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_12" value=""> <INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_13" value="">
			<INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_14" value=""> <INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_15" value="">
			<INPUT TYPE="HIDDEN" Class="inputtext" name="ISA_16" value=""> <INPUT TYPE="HIDDEN" Class="inputtext" name="GS_01" value="">
			<INPUT TYPE="HIDDEN" Class="inputtext" name="GS_02" value=""> <INPUT TYPE="HIDDEN" Class="inputtext" name="GS_03" value="">
			<INPUT TYPE="HIDDEN" Class="inputtext" name="GS_04" value=""> <INPUT TYPE="HIDDEN" Class="inputtext" name="GS_05" value="">
			<INPUT TYPE="HIDDEN" Class="inputtext" name="GS_06" value=""> <INPUT TYPE="HIDDEN" Class="inputtext" name="GS_07" value="">
			<INPUT TYPE="HIDDEN" Class="inputtext" name="GS_08" value="">
			<%''ST %>
			<Table width='99%' align="center" Border='0' ID='invoiceTable'>
				<TR>
					<TD colspan="3" nowrap="true">
						<Font size="4"><B>INVOICE</B> </Font>for <B>PO No : </B><INPUT TYPE="text" name="BIG_04" size="25" maxlength="22" Class="inputtext" ID="Text1"></INPUT>
						<B>Dated : </B><INPUT TYPE="text" name="BIG_03" Class="inputtext" size="10" maxlength='10' ID="Text2"></INPUT>
					</TD>
					<TD align="right" width="50%">
						<Input style="width:60" value="Print" class="inputbutton" type="button" name="cmdPrint"
							onclick="return OnPrint();" ID="Button1" /> <Input style="width:60" value="Validate" class="inputbutton" type="button" name="cmdValidate"
							onclick="return OnValidate();" ID="Button2" /> <Input style="width:60" value="Save" class="inputbutton" type="button" name="cmdSave" onclick="return OnInvSubmit()"
							ID="Button3" />
					</TD>
				</TR>
				<TR>
					<TD width="10%">
						<B>Invoice No</B>
					</TD>
					<TD width="1%" align="center">
						<B>:</B>
					</TD>
					<TD>
						<Input type="text" class="InputText" name="BIG_02" maxlength="15" size="18" ID="Text3">
							<font color="silver">Maximum 15 Characters</font> </Input>
					</TD>
					<td align="right">
                      <br />
                      <font color="red">
                        <INPUT TYPE="text" name="opt_Status" size="25" style="color:red;text-align:center;border-bottom:0;border-top:0;border-left:0;border-right:0;"
							readonly="true" Class="inputText"></INPUT>
                      </font>
                    </td>
				</TR>
				<TR>
					<TD>
						<b>Date</b>
					</TD>
					<TD align="center">
						<b>:</b>
					</TD>
					<TD>
						<INPUT TYPE="text" name="BIG_01" Class="inputtext" SIZE="10" MAXLENGTH="10" ID="Text4"></INPUT>
						<font color="silver">(MM/DD/YYYY)</font>
					<td Align="right"></td>
					</TD>
				</TR>
                	<TD nowrap="true" width="1%">
					<B>Transaction Type</B>
					<a id="InvType" onMouseOver="window.status='';return true" href="javascript:popWin('PopUp/Inv_InvoiceType.asp','EditShipToDetails','700','200','')">[Edit]</a>
				</TD>
				<TD>
					<B width="1%">:</B>
				</TD>
				<TD colspan = "3">
					<INPUT TYPE="text" Name="BIG_07_DESC" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" size="70" readonly="true" Class="inputtext">
						
					</INPUT>
					<INPUT TYPE="HIDDEN" NAME="BIG_07">
						
					</INPUT>
				</TD>
			</Table>
			<Table width='100%' Border='0' ID="Table1">
				<TR>
					<TD colspan="3" align="center">
						<Input type="text" class="InputText" name="txt_Message" size="50" READONLY="TRUE" style="text-align:center;color:red;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px;display:None"
							ID="Text5"></Input>
					</TD>
				</TR>
			</Table>
			<HR style="color:#000000;width:99%" />
			<Table Border="0" width="99%" Align="center" bordercolor="black" cellspacing="1" cellpadding="0"
				ID="Table2">
				<TR>
					<TD colspan="2" valign="top">
						<Fieldset style="BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; BORDER-BOTTOM-WIDTH: 1px; BORDER-RIGHT-WIDTH: 1px;Border-Color:Black;WIDTH:100%">
							<TABLE width="100%" Align="Left" Border="0" ID="Table3">
								<TR bgcolor="#EDEDED">
									<TD width="100%" colspan="2">
										<FONT color="#000000"><B>Customer</B> </FONT>
									</TD>
								</TR>
								<TR>
									<TD>
										<Input type="text" name="txt_CustomerName" class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
											readonly="true" size="45" ID="Text6" />
									</TD>
								</TR>
							</TABLE>
						</Fieldset>
					</TD>
				</TR>
				<TR>
					<TD>
						<font color="white">'</font>
					</TD>
				</TR>
				<TR>
					<TD valign="top">
						<Fieldset style="BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; BORDER-BOTTOM-WIDTH: 1px; BORDER-RIGHT-WIDTH: 1px;Border-Color:#000000;WIDTH:98%">
							<TABLE width="100%" Align="Left" Border="0" cellpadding="1" cellspacing="1" ID="Table4">
								<TR bgcolor="#EDEDED">
									<TD width="70%">
										<FONT color="#000000"><B>SU - Supplier/Manufacturer</B> </FONT>
									</TD>
									<TD Align="center">
										<a onMouseOver="window.status='';return true" href="javascript:popWin('PopUp/Inv_N1.asp','EditN1Details','650','230','1')"
											id="hrefSu">[Edit]</a> <a onMouseOver="window.status='';return true" href="javascript:setBlank('Su');">
											[Reset]</a>
									</TD>
								</TR>
								<TR>
									<TD colspan="2" width="50%">
										<div id="Su"></div>
									</TD>
								</TR>
							</TABLE>
						</Fieldset>
					</TD>
					<TD valign="top">
						<Fieldset style="BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; BORDER-BOTTOM-WIDTH: 1px; BORDER-RIGHT-WIDTH: 1px;Border-Color:#000000;WIDTH:100%">
							<TABLE width="100%" Align="Left" Border="0" cellpadding="1" cellspacing="1" ID="Table5">
								<TR bgcolor="#EDEDED">
									<TD width="70%">
										<FONT color="#000000"><B>ST - Ship To</B> </FONT>
									</TD>
									<TD Align="right">
										<a onMouseOver="window.status='';return true" href="javascript:popWin('PopUp/Inv_N1.asp','EditN1Details','650','490','2')"
											id="hrefSt">[Edit]</a> <a onMouseOver="window.status='';return true" href="javascript:setBlank('St');">
											[Reset]</a>
									</TD>
								</TR>
								<TR>
									<TD colspan="2">
										<div id="St"></div>
									</TD>
								</TR>
							</TABLE>
						</Fieldset>
					</TD>
				</TR>
				<TR>
					<TD>
						<font color="white">'</font>
					</TD>
				</TR>
			</Table>
			<Table width='99%' Border='0' align="center" Cellspacing="1" ID="Table6">
				<TR>
					<TD>
						<Table Border="1" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
							ID="Table7">
							<TR>
								<TD>
									<Table Border="0" width="100%" bordercolor="black" id="RefTable">
										<TR bgcolor="#EDEDED">
											<TD colspan="2" width="89%">
												<Font color="#000000"><B>Reference</B> </Font>
											</TD>
											<TD Align="right">
												<input type="Button" onclick="PopWinNew('PopUp/INV_REFRENCE.asp','EditReferenceDetails','670','150','0')"
													value="ADD" class="inputButton" id="REF_ADDBtn" NAME="REF_ADDBtn" />
											</TD>
										</TR>
									</Table>
								</TD>
							</TR>
						</Table>
					</TD>
				</TR>
			</Table>
			<br />
			<Table Border="0" width="99%" Align="center" bordercolor="black" cellspacing="1" cellpadding="0"
				ID="Table8">
				<TR>
					<TD colspan="2" id="td_ITDHeader">
						<Table Border="1" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
							ID="Table9">
							<TR>
								<TD>
									<Table Border="0" width="100%" cellpadding="3" cellspacing="3" ID='ITDTable_Header' style="border-collapse:collapse">
										<TR BGCOLOR="#EDEDED">
											<TD width="90%" VALIGN="TOP">
												<Font Color="#000000"><B>Terms of sale</B> </Font>
											</TD>
											<TD align='right'>
												<input type='button' value='ADD' class='inputButton' onclick="PopWinNew('PopUp/INV_Terms.asp','EditShipToDetails','660','330','0')"
													ID="ITD_ADDBtn" NAME="ITD_ADDBtn" />
											</TD>
										</TR>
									</Table>
								</TD>
							</TR>
						</Table>
					</TD>
				</TR>
			</Table>
			<br />
			<Table width='99%' Border='0' align="center" Cellspacing="1" ID="Table10">
				<TR>
					<TD ID="td_Dtm">
						<Table Border="1" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
							ID="Table11">
							<TR>
								<TD>
									<Table Border="0" width="100%" bordercolor="black" id="DateTimeTable">
										<TR bgcolor="#EDEDED">
											<TD colspan="2" width="89%">
												<Font color="#000000"><B>Date/Time Details</B> </Font>
											</TD>
											<TD Align="right">
												<input type="Button" onclick="PopWinNew('PopUp/Inv_Date.asp','EditDTM','500','150','0')"
													value="ADD" class="inputButton" id="DTM_ADDBtn" NAME="DTM_ADDBtn" />
											</TD>
										</TR>
									</Table>
								</TD>
							</TR>
						</Table>
					</TD>
				</TR>
			</Table>
			<br />
			<Table align="center" Border="1" width="99%" bordercolor="black" cellspacing="0" Cellpadding="1"
				style="Border-Collapse:Collapse" ID="Table12">
				<TR>
					<TD>
						<Table Border="0" width="100%" bordercolor="black" cellpadding="0" cellspacing="0" style="Border-Collapse:Collapse"
							ID="Table13">
							<TR bgcolor="#EDEDED">
								<TD width="70%">
									<B><Font Color="#000000">FOB Instructions</Font> </B>
								</TD>
								<TD Align="right" nowrap="true">
									<a onMouseOver="window.status='';return true" href="javascript:popWin('PopUp/Inv_FOB.asp','EditFOBDetail',500,150,'')"
										id="hrefFob">[Edit]</a> <a onMouseOver="window.status='';return true" href="javascript:doNull('FOB_01','TR_fob1','Fob');">
										[Reset]</a>
								</TD>
							</TR>
							<TR>
								<TD Colspan="2">
									<Table Border="0" width="100%" bordercolor="black" ID="Table14">
										<TR id="TR_fob1" style="display:none">
											<TD>Shipment Method of Payment</TD>
											<TD>
												<B>:</B>
											</TD>
											<TD>
												<Input type="text" name="FOB_01" class="inputtext" size="35" style="border-left:0;border-top:0;border-bottom:0;border-right:0"
													ID="Text7"></Input>
											</TD>
										</TR>
									</Table>
								</TD>
							</TR>
						</Table>
					</TD>
				</TR>
			</Table>
			<br />
			<Table width='99%' align="center" Border='0' Cellspacing="1" ID="Table15">
				<TR>
					<TD>
						<Table Border="0" width="100%" align="center" bordercolor="black" cellspacing="0" cellpadding="0"
							ID="Table16">
							<TR>
								<TD>
									<b>ITEM DETAILS</b>
								</TD>
								<TD Align="Right">
									<Input type="Button" class="InputButton" value="ADD NEW ITEM" onClick="addItemWithExsiting(ItemTable,'PopUp/INV_ITEM.ASP','EditItemDetail',700,700,'0')"
										ID="Button4" NAME="Button4" />
								</TD>
							</TR>
						</Table>
					</TD>
				</TR>
			</Table>
			<Table Border="0" width="99%" align="center" bordercolor="black" cellspacing="0" Cellpadding="1"
				style="Border-Collapse:Collapse" ID="Table17">
				<TR>
					<TD>
						<Table id="ItemTable" Value="1" width="100%" align="center" border="1" style="Border-Collapse:Collapse"
							bordercolor="black" cellpadding="0" cellspacing="4">
							<TR>
								<TD id="td_Item_Detail">
									<Table width="100%" Border="0" bordercolor="black" Align="Center" cellspacing="0" Cellpadding="1"
										style="Border-Collapse:Collapse" ID="Table18">
										<TR bgcolor="#5225BA">
											<TD width="30%">
												<Font color="#FFFFFF"><B>Item </B>- <input type="text" name="IT1_IT1_01" class="inputText" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px;BackGround-Color:#5225BA;Text:White;Color:White"
														readonly="true" ID="Text8"></input> </Font>
											</TD>
											<TD width="13%" nowrap="true" align="center">
												<Font color="#FFFFFF"><B>Quantity / Mea.</B> </Font>
											</TD>
											<TD width="10%" align="center">
												<Font color="#FFFFFF"><B>Unit Price</B> </Font>
											</TD>
											<TD width="13%" nowrap="true" align="center">
												<Font color="#FFFFFF"><B>Ext Price</B> </Font>
											</TD>
											<TD width="10%" nowrap="true" align="center">
												<Font color="#FFFFFF"><B>Edit</B> </Font>
											</TD>
										</TR>
										<TR>
											<TD>
												<!--<textarea rows="3" cols="50" name="IT1_PID_PID_05" ID="Textarea1"></textarea>-->
											</TD>
											<TD align="right">
												<INPUT TYPE="text" style="TEXT-ALIGN: right" Class="inputtext" size="9" name="IT1_IT1_02"
													maxlength="15" onKeyup="accessExtPrice(); return checkIsNan(frm_810XSL.IT1_IT1_02)"
													ID="Text9"></INPUT> <INPUT TYPE="TEXT" Class="inputtext" name="IT1_IT1_03" SIZE="3" style="text-align:center;border-bottom:0;border-top:0;border-left:0;border-right:0;"
													readonly="true" ID="Text10"></INPUT>
											</TD>
											<TD align="center">
												<INPUT TYPE="text" name="IT1_IT1_04" style="text-align:center;border-bottom:0;border-top:0;border-left:0;border-right:0;"
													readonly="true" Class="inputText" size="10" ID="Text11"></INPUT>
											</TD>
											<TD id="ExtPrice" align="center"></TD>
											<TD Align="center" id="itemHref">Edit</TD>
										</TR>
										<TR>
											<TD colspan="5" ID="td_PSID_Detail">
												<Table border="0" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
													ID="Table19">
													<TR BGCOLOR="#EDEDED" ID="Psid_Row" style="display:none">
														<TD width="49%">
															<font color="000000"><b>Service / Product ID Qualifier</b> </font>
														</TD>
														<TD>
															<font color="000000"><b>Service / Product ID</b> </font>
														</TD>
													</TR>
													<TR>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_06" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																size="72" readonly="true" ID="Text12"></INPUT>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_07" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="50" ID="Text13"></INPUT>
														</TD>
													</TR>
													<TR>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_08" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																size="60" readonly="true" ID="Text14"></INPUT>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_09" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="50" ID="Text15"></INPUT>
														</TD>
													</TR>
													<TR>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_10" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																size="60" readonly="true" ID="Text16"></INPUT>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_11" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="50" ID="Text17"></INPUT>
														</TD>
													</TR>
													<TR>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_12" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																size="60" readonly="true" ID="Text18"></INPUT>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_13" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="50" ID="Text19"></INPUT>
														</TD>
													</TR>
													<TR>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_14" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																size="60" readonly="true" ID="Text20"></INPUT>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_15" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="50" ID="Text21"></INPUT>
														</TD>
													</TR>
													<TR>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_16" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																size="60" readonly="true" ID="Text22"></INPUT>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_17" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="50" ID="Text23"></INPUT>
														</TD>
													</TR>
													<TR>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_18" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																size="60" readonly="true" ID="Text24"></INPUT>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_19" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="50" ID="Text25"></INPUT>
														</TD>
													</TR>
													<TR>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_20" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																size="60" readonly="true" ID="Text26"></INPUT>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_21" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="50" ID="Text27"></INPUT>
														</TD>
													</TR>
												</Table>
											</TD>
										</TR>
										<TR>
												<TD colspan="5" ID="td_PID_Detail">
													<Table border="0" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse">
														<TR BGCOLOR="#EDEDED" ID="PID_Row" style="display:none">
															
															<TD width="100%" colspan="6">
																<font color="000000">
																	<b>Product/Item Description</b>
																</font>
															</TD>
														</TR>
														<TR id="TR_PID_Row1"  style="display:none">
															
															<TD width="15%" nowrap='true'>
																<B>Type</B>
															</TD>
															<TD width='1%'>
																<b>:</b>
															</TD>
															<TD width='25%' align='left'>
																<INPUT TYPE="text" name="IT1_PID_01" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="20" readonly="true">
																	
																</INPUT>
															</TD>
															<TD width="10%" nowrap='true'>
																<B>Description </B>
															</TD>
															<TD width='1%'>
																<b>:</b>
															</TD>
															<TD width='25%' align='left'>
																<INPUT TYPE="TEXT" Class="inputtext" size='50' maxlength='17' name="IT1_PID_05" readonly="true"
																	style="Border-Top:0;Border-Bottom:0;Border-Left:0;Border-Right:0;">
																	
																</INPUT>
															</TD>
														</TR>
													</Table>
												</TD>
											</TR>
										<TR>
											<TD colspan="5" ID="td_PO4_Detail">
												<Table border="0" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
													ID="Table20">
													<TR BGCOLOR="#EDEDED" id="po4_row" style="display:none">
														<TD width="100%" colspan="6">
															<font color="000000"><b>Item Physical Details</b> </font>
														</TD>
													</TR>
													<TR id="po4_row_head1" style="display:none">
														<TD nowrap="true" width="5%">
															<font color="000000"><B>Pack</B> </font>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_PO4_01" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="10" ID="Text28"></INPUT>
														</TD>
														<TD nowrap="true" width="10%">
															<font color="000000"><B>Inner Pack</B> </font>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_PO4_14" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="10" ID="Text29"></INPUT>
														</TD>
													</TR>
												</Table>
											</TD>
										</TR>
										<TR>
											<TD colspan="5" ID="td_SAC_Detail">
												<Table border="0" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
													ID="Table21">
													<TR BGCOLOR="#EDEDED" ID="sac_row" style="display:none">
														<TD colspan="9">
															<b>Allowance/Charge Information</b>
														</TD>
													</TR>
													<TR id="sac_row1" style="display:none">
														<TD width="10%">
															<font color="000000"><b>Indicator</b> </font>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_01" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="15" ID="Text30"></INPUT>
														</TD>
														<TD>
															<font color="000000"><b>Code</b> </font>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_02" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="45" ID="Text31"></INPUT>
														</TD>
														<TD>
															<font color="000000"><b>Amount</b> </font>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD align="left">
															<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_05" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="10" ID="Text32"></INPUT>
														</TD>
													</TR>
													<TR id="sac_row2" style="display:none">
														<TD width="15%">
															<font color="000000"><b>Percent Qualifier</b> </font>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_06" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="20" ID="Text33"></INPUT>
														</TD>
														<TD>
															<font color="000000"><b>Percent</b> </font>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_07" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="6" ID="Text34"></INPUT>
														</TD>
														<TD>
															<font color="000000"><b>Handling Code</b> </font>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_12" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="20" ID="Text35"></INPUT>
														</TD>
													</TR>
													<TR id="sac_row3" style="display:none">
														<TD>
															<font color="000000"><b>Rate</b> </font>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD align="left">
															<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_08" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="10" ID="Text36"></INPUT>
														</TD>
														<TD>
															<font color="000000"><b>Quantity</b> </font>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_10" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="6" ID="Text37"></INPUT>
														</TD>
														<TD>
															<font color="000000"><b>Measurement Code</b> </font>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_09" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="10" ID="Text38"></INPUT>
														</TD>
													</TR>
												</Table>
											</TD>
										</TR>
									</Table>
								</TD>
							</TR>
						</Table>
					</TD>
				</TR>
			</Table>
			<br />
			<Table width="99%" Border="1" bordercolor="black" Align="Center" style="border-collapse:collapse"
				cellpadding="2" cellspacing="0" ID="Table22">
				<TR>
					<TD width="35%" align="right">
						<B>Item Total :</B>
					</TD>
					<!--<Input TYpe="hidden" name="txtSacLineTotal" />
				<Input TYpe="hidden" name="hid_SacLineTotal" />
				<Input TYpe="hidden" name="hid_SacSummaryTotal" />
				<Input TYpe="hidden" name="hid_ItemLineTotal" />
				<Input TYpe="hidden" name="hid_SacHeaderTotal" />-->
					<TD width="13%" ID="TQTY" align="right"></TD>
					<TD width="10%" ID="TPrice" align="right"></TD>
					<TD width="18%" ID="TExtPrice" align="right"></TD>
					<TD width="10%"></TD>
				</TR>
				<TR id="SacLineTotal_Row" style="display:none">
					<TD align="right">
						<B>Allowance / Charges Total :</B>
					</TD>
					<TD Colspan="2"></TD>
					<TD id="TD_SacLineTotal" Align="right"></TD>
					<TD></TD>
				</TR>
				<TR ID="SacLineHeaderTotal_Row" style="display:none">
					<TD align="right">
						<B>Total :</B>
					</TD>
					<TD Colspan="2"></TD>
					<TD id="TD_SacLineHeaderTotal" Align="right"></TD>
					<TD></TD>
				</TR>
			</Table>
			<Table border="0" width="99%" align="center" bordercolor="black" cellspacing="0" Cellpadding="1"
				style="Border-Collapse:Collapse;" ID="Table23">
				<TR id="tr_Summary">
					<TD>
						<B>Summary</B>
					</TD>
				</TR>
				<TR>
					<TD ID="td_TXI_SUMMARY">
						<Table Border="0" width="100%" Align="center" bordercolor="black" cellspacing="1" cellpadding="0"
							ID="Table24">
							<TR>
								<TD colspan="2" id="td_TXIHeader">
									<Table Border="1" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
										ID="Table25">
										<TR>
											<TD>
												<Table Border="0" width="100%" cellpadding="3" cellspacing="3" ID='TXITable_Header' style="border-collapse:collapse">
													<TR BGCOLOR="#EDEDED">
														<TD width="90%" VALIGN="TOP">
															<Font Color="#000000"><B>Tax Information</B> </Font>
														</TD>
														<TD align='right'>
															<input type='button' value='ADD' class='inputButton' onclick="PopWinNew('PopUp/INV_Tax.asp','EditTaxDetails','660','230','0')"
																ID="Tax_ADDBtn" NAME="Tax_ADDBtn" />
														</TD>
													</TR>
												</Table>
											</TD>
										</TR>
									</Table>
								</TD>
							</TR>
						</Table>
					</TD>
				</TR>
				<TR>
					<TD>
						<font color="white">'</font>
					</TD>
				</TR>
				<TR>
					<TD ID="td_CAD_SUMMARY">
						<Table Border="1" Width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
							BGCOLOR="#EDEDED" ID="Table26">
							<TR BGCOLOR="#EDEDED">
								<TD width="90%">
									<Table Border="0" Width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
										id='CadTable_Header'>
										<TR>
											<TD>
												<Font Color="#000000"><B>Carrier Detail</B> </Font>
											</TD>
											<TD align="right">
												<A href="JavaScript:popWin('PopUp/Inv_CAD.asp','EditCarrierDetails','670','280','0')"
													id="hrefCAD">[Edit]</A> <A id="td_CAD_SUMR" href="javascript:doNull('CAD_01,CAD_04,CAD_05,CAD_07,CAD_08','TR_CAD_Row1,TR_CAD_Row3,TR_CAD_Row2','CarrierDetail')">
													[Reset]</A>
											</TD>
										</TR>
										<TR BGCOLOR="#FFFFFF">
											<TD colspan="2">
												<Table Border="0" Width="100%" bordercolor="black" cellspacing="2" Cellpadding="1" style="Border-Collapse:Collapse"
													ID="Table27">
													<TR id="TR_CAD_Row1" style="display:none">
														<TD nowrap="true">
															<B>Type Code:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																readonly="true" size="15" name="CAD_01" ID="Text39"></INPUT>
														</TD>
														<TD nowrap="true">
															<B>Standard Carrier Alpha Code :</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																readonly="true" size="15" name="CAD_04" ID="Text40"></INPUT>
														</TD>
													</TR>
													<TR id="TR_CAD_Row3" style="display:none">
														<TD>
															<B>Routing :</B>
														</TD>
														<TD colspan="3">
															<INPUT TYPE="text" Class="inputtext" style="TEXT-ALIGN:left;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																readonly="true" size="45" name="CAD_05" ID="Text41"></INPUT>
														</TD>
													</TR>
													<TR id="TR_CAD_Row2" style="display:none">
														<TD>
															<B>Reference ID Qualifier :</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="CAD_07" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																readonly="true" size="25" ID="Text42"></INPUT>
														</TD>
														<TD nowrap="true">
															<B>Reference ID :</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" style="TEXT-ALIGN:left;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																readonly="true" size="50" name="CAD_08" ID="Text43"></INPUT>
														</TD>
													</TR>
												</Table>
											</TD>
										</TR>
									</Table>
								</TD>
							</TR>
						</Table>
					</TD>
				</TR>
				<TR>
					<TD>
						<font color="white">'</font>
					</TD>
				</TR>
				<TR>
					<TD ID="td_SAC_SUMMARY">
						<Table Border="1" Width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
							BGCOLOR="#EDEDED" ID="Table28">
							<TR>
								<TD width="90%">
									<Table Border="0" Width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
										id='SacTable_Header'>
										<TR BGCOLOR="#EDEDED">
											<TD>
												<Font Color="#000000"><B>Allowance / Charge </B></Font>
											</TD>
											<TD align='right'>
												<input type='button' value='ADD' class='inputButton' onclick="PopWinNew('PopUp/Inv_SAC.asp','EditTaxDetails','660','500','0')"
													ID="SAC_ADDBtn" NAME="SAC_ADDBtn" />
											</TD>
										</TR>
									</Table>
								</TD>
							</TR>
						</Table>
					</TD>
				</TR>
				<TR>
					<TD>
						<font color="white">'</font>
					</TD>
				</TR>
				<TR>
					<TD ID="td_ISS_SUMMARY">
						<Table Border="1" Width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
							BGCOLOR="#EDEDED" ID="Table29">
							<TR BGCOLOR="#EDEDED">
								<TD width="90%">
									<Table Border="0" Width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
										id='ISSTable_Summary'>
										<TR>
											<TD>
												<Font Color="#000000"><B>Invoice Shipment Summary</B> </Font>
											</TD>
											<TD align="right">
												<A href="JavaScript:popWin('PopUp/Inv_ISS.asp','EditISSToDetails','650','250','0')"
													id="hrefISS">[Edit]</A> <A id="ISSTable_Header" href="javascript:doNull('ISS_01,ISS_02,ISS_03,ISS_04','TR_ISS_01','ISS')">
													[Reset]</A>
											</TD>
										</TR>
										<TR BGCOLOR="#FFFFFF">
											<TD colspan="2">
												<Table Border="0" Width="100%" bordercolor="black" cellspacing="2" Cellpadding="1" style="Border-Collapse:Collapse"
													ID="Table30">
													<TR id="TR_ISS_01" style="display:none">
														<TD nowrap="true">
															<b>Unit Shipped</b>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Name="ISS_01" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																size="25" readonly="true" Class="inputtext" ID="Text44"></INPUT>
														</TD>
														<TD nowrap="true">
															<b>Mea. Code</b>
														</TD>
														<TD width="1%" align="center">
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																readonly="true" size="15" name="ISS_02" ID="Text45"></INPUT>
														</TD>
														<TD nowrap="true">
															<b>Weight</b>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Name="ISS_03" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																size="25" readonly="true" Class="inputtext" ID="Text46"></INPUT>
														</TD>
														<TD nowrap="true">
															<b>Mea. Code</b>
														</TD>
														<TD width="1%" align="center">
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																readonly="true" size="15" name="ISS_04" ID="Text47"></INPUT>
														</TD>
													</TR>
												</Table>
											</TD>
										</TR>
									</Table>
								</TD>
							</TR>
						</Table>
					</TD>
				</TR>
			</Table>
		</Form>
		<!----#Include File="../../../IncludeFile/infocon-global-footerEDILive.stm"--->
	</BODY>
</HTML>
