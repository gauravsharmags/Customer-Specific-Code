<?xml version='1.0' ?>
<xsl:stylesheet xmlns:xsl='http://www.w3.org/TR/WD-xsl' result-ns='html'>
	<xsl:template match='/'>
		<xsl:apply-templates />
	</xsl:template>
	<xsl:template match='*'>
		<xsl:apply-templates />
	</xsl:template>
	<xsl:template match='text()'>
		<xsl:apply-templates select='.' />
	</xsl:template>
	<xsl:template match='Interchange-Control'>
		<xsl:for-each select="SegmentRef[@ID = 'ISA']">
			<INPUT TYPE="hidden" Class="inputtext" name="ISA_01">
				<xsl:attribute name="value">
					<xsl:value-of select='Element[@Pos ="01"]/@Value' />
				</xsl:attribute>
			</INPUT>
			<INPUT TYPE="hidden" Class="inputtext" name="ISA_02">
				<xsl:attribute name="value">
					<xsl:value-of select='Element[@Pos ="02"]/@Value' />
				</xsl:attribute>
			</INPUT>
			<INPUT TYPE="hidden" Class="inputtext" name="ISA_03">
				<xsl:attribute name="value">
					<xsl:value-of select='Element[@Pos ="03"]/@Value' />
				</xsl:attribute>
			</INPUT>
			<INPUT TYPE="hidden" Class="inputtext" name="ISA_04">
				<xsl:attribute name="value">
					<xsl:value-of select='Element[@Pos ="04"]/@Value' />
				</xsl:attribute>
			</INPUT>
			<INPUT TYPE="hidden" Class="inputtext" name="ISA_11">
				<xsl:attribute name="value">
					<xsl:value-of select='Element[@Pos ="11"]/@Value' />
				</xsl:attribute>
			</INPUT>
			<INPUT TYPE="hidden" Class="inputtext" name="ISA_12">
				<xsl:attribute name="value">
					<xsl:value-of select='Element[@Pos ="12"]/@Value' />
				</xsl:attribute>
			</INPUT>
			<INPUT TYPE="hidden" Class="inputtext" name="ISA_14">
				<xsl:attribute name="value">
					<xsl:value-of select='Element[@Pos ="14"]/@Value' />
				</xsl:attribute>
			</INPUT>
			<INPUT TYPE="hidden" Class="inputtext" name="ISA_16">
				<xsl:attribute name="value">
					<xsl:value-of select='Element[@Pos ="16"]/@Value' />
				</xsl:attribute>
			</INPUT>
		</xsl:for-each>
		<xsl:apply-templates select="Functional-Group-Control" />
	</xsl:template>
	<xsl:template match='Functional-Group-Control'>
		<xsl:for-each select="SegmentRef[@ID = 'GS']">
			<INPUT TYPE="hidden" Class="inputtext" name="GS_01">
				<xsl:attribute name="value">
					<xsl:value-of select='Element[@Pos ="01"]/@Value' />
				</xsl:attribute>
			</INPUT>
			<INPUT TYPE="hidden" Class="inputtext" name="GS_07">
				<xsl:attribute name="value">
					<xsl:value-of select='Element[@Pos ="07"]/@Value' />
				</xsl:attribute>
			</INPUT>
			<INPUT TYPE="hidden" Class="inputtext" name="GS_08">
				<xsl:attribute name="value">
					<xsl:value-of select='Element[@Pos ="08"]/@Value' />
				</xsl:attribute>
			</INPUT>
		</xsl:for-each>
		<xsl:apply-templates select="Transaction-Set-Control" />
	</xsl:template>
	<xsl:template match='Transaction-Set-Control'>
		<xsl:for-each select="SegmentRef[@ID = 'ST']">
			<INPUT TYPE="hidden" Class="inputtext" name="ST_02">
				<xsl:attribute name="value">
					<xsl:value-of select='Element[@Pos ="02"]/@Value' />
				</xsl:attribute>
			</INPUT>
		</xsl:for-each>
		<Table width='99%' align="center" Border='0' ID='invoiceTable'>
			<TR>
				<TD colspan="3" nowrap="true">
					<Font size="4">
						<B>INVOICE</B>
					</Font>
					for <B>PO No : </B>
					<INPUT TYPE="text" name="BIG_04" size="25" maxlength="22" Class="inputtext">
						<xsl:for-each select="SegmentRef[@ID='BIG']">
							<xsl:for-each select="Element[@Pos ='04']">
								<xsl:attribute name="value">
									<xsl:value-of select="@Value" />
								</xsl:attribute>
							</xsl:for-each>
						</xsl:for-each>
					</INPUT>
							<B>Dated : </B>
					<INPUT TYPE="text" name="BIG_03" Class="inputtext" size="10" maxlength='10'>
						<xsl:for-each select="SegmentRef[@ID='BIG']">
							<xsl:for-each select="Element[@Pos ='03']">
								<xsl:attribute name="value">
									<xsl:value-of select="@Value" />
								</xsl:attribute>
							</xsl:for-each>
						</xsl:for-each>
					</INPUT>
					
				</TD>
				<TD align="right" width="50%">
					<Input style="width:60" value="Print" class="inputbutton" type="button" name="cmdPrint"
						onclick="return OnPrint();" />
					<Input style="width:60" value="Validate" class="inputbutton" type="button" name="cmdValidate"
						onclick="return OnValidate();" />
					<Input style="width:60" value="Save" class="inputbutton" type="button" name="cmdSave" onclick="return OnInvSubmit()" />
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
					<Input type="text" class="InputText" name="BIG_02" maxlength="15" size="18">
						<xsl:for-each select="SegmentRef[@ID='BIG']">
							<xsl:for-each select="Element[@Pos ='02']">
								<xsl:attribute name="value">
									<xsl:value-of select="@Value" />
								</xsl:attribute>
							</xsl:for-each>
						</xsl:for-each>
						<font color="silver">
							Maximum 15 Characters</font>
					</Input>
				</TD>
				</TR>
				
      <TR>
        <TD>
					<b>Date</b>
				</TD>
				<TD align="center">
					<b>:</b>
				</TD>
				<TD>
					<INPUT TYPE="text" name="BIG_01" Class="inputtext" SIZE="10" MAXLENGTH="10">
						<xsl:for-each select="SegmentRef[@ID='BIG']">
							<xsl:for-each select="Element[@Pos ='01']">
								<xsl:attribute name="value">
									<xsl:value-of select="@Value" />
								</xsl:attribute>
							</xsl:for-each>
						</xsl:for-each>
					</INPUT>
					<font color="silver">(MM/DD/YYYY)</font>
					<td Align="right"></td>
				</TD>
			</TR>
		</Table>
		<Table width='100%' Border='0'>
			<TR >
				<TD nowrap="true" width="1%">
					<B>Invoice Type </B>
					<a id="InvType" onMouseOver="window.status='';return true" href="javascript:popWin('PopUp/Inv_InvoiceType.asp','EditShipToDetails','700','200','')">[Edit]</a>
				</TD>
				<TD>
					<B width="1%">:</B>
				</TD>
				<TD>
					<INPUT TYPE="text" Name="BIG_07_DESC"  style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px" size="70" readonly="true" Class="inputtext">
						<xsl:for-each select="SegmentRef[@ID='BIG']">
							<xsl:for-each select="Element[@Pos ='07']">
								<xsl:attribute name="value">
									<xsl:value-of select="@Desc" />
								</xsl:attribute>
							</xsl:for-each>
						</xsl:for-each>
					</INPUT>
					<INPUT TYPE="HIDDEN" NAME="BIG_07" value="PR">
						<xsl:for-each select="SegmentRef[@ID='BIG']">
							<xsl:for-each select="Element[@Pos ='07']">
								<xsl:attribute name="value">
									<xsl:value-of select="@Value" />
								</xsl:attribute>
							</xsl:for-each>
						</xsl:for-each>					
					</INPUT>
				</TD>
				
			</TR>
			<TR>
        <td align="right" id="td_Test_Prod_id">
          <br />
          <font color="red">
            <INPUT TYPE="text" name="opt_Status" size="25" style="color:red;text-align:center;border-bottom:0;border-top:0;border-left:0;border-right:0;"
								readonly="true" Class="inputText">
				<xsl:for-each select="../../SegmentRef[@ID = 'ISA']">
					<xsl:attribute name="value">
						<xsl:value-of select='Element[@Pos ="15"]/@Value' />
					</xsl:attribute>
				</xsl:for-each>
			</INPUT>
          </font>
        </td>
      </TR>
			<TR>
				<TD colspan="3" align="center">
					<Input type="text" class="InputText" name="txt_Message" size="50" READONLY="TRUE" style="text-align:center;color:red;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px;display:None"></Input>
				</TD>
			</TR>
		</Table>
		<HR style="color:#000000;width:99%" />
		<Table Border="0" width="99%" Align="center" bordercolor="black" cellspacing="1" cellpadding="0">
			<TR>
				<TD colspan="2" valign="top">
					<Fieldset style="BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; BORDER-BOTTOM-WIDTH: 1px; BORDER-RIGHT-WIDTH: 1px;Border-Color:Black;WIDTH:100%">
						<TABLE width="100%" Align="Left" Border="0">
							<TR bgcolor="#EDEDED">
								<TD width="100%" colspan="2">
									<FONT color="#000000">
										<B>Customer</B>
									</FONT>
								</TD>
							</TR>
							<TR>
								<TD>
									<Input type="text" name="txt_CustomerName" class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
										readonly="true" size="45" />
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
						<TABLE width="100%" Align="Left" Border="0" cellpadding="1" cellspacing="1">
							<TR bgcolor="#EDEDED">
								<TD width="70%">
									<FONT color="#000000">
										<B>SU - Supplier/Manufacturer</B>
									</FONT>
								</TD>
								<TD Align="center">
									<a onMouseOver="window.status='';return true" href="javascript:popWin('PopUp/Inv_N1.asp','EditN1Details','650','230','1')"
										id="hrefSu">[Edit]</a>
									<a onMouseOver="window.status='';return true" href="javascript:setBlank('Su');"> [Reset]</a>
								</TD>
							</TR>
							<TR>
								<TD colspan="2" width="50%">
									<div id="Su">
										<xsl:for-each select="N1-LOOP">
											<xsl:if test="SegmentRef[@ID='N1']/Element[(@Pos='01' $and$ @Value ='SU') ]">
												<TABLE width="100%" Align="Left" Border="0" cellspacing='0' cellpadding='0'>
													<TR>
														<xsl:if test="SegmentRef[@ID='N1']/Element[@Pos='03' $and$ (@Value ='1' $or$ @Value ='9' $or$ @Value ='UL')]">
															<TD Colspan="2">
																<INPUT TYPE="text" name="Delemeter" value="ID [" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	size="3" readonly="true" />
																<INPUT size="2" TYPE="text" name="N1_N1_031" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true">
																	<xsl:for-each select="SegmentRef[@ID='N1']/Element[@Pos = '03' $and$ @Value!='']">
																		<xsl:attribute name="value">
																			<xsl:value-of select='@Value' />
																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
																<INPUT TYPE="text" name="Delemeter" value="]=" size="1" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true" />
																<INPUT TYPE="text" name="N1_N1_041" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true">
																	<xsl:for-each select="SegmentRef[@ID='N1']/Element[@Pos = '04' $and$ @Value!='']">
																		<xsl:attribute name="value">
																			<xsl:value-of select='@Value' />
																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
															</TD>
														</xsl:if>
													</TR>
													<TR>
														<xsl:if test="SegmentRef[@ID='N1']/Element[(@Pos='01' $and$ @Value !='') ]">
															<TD Colspan="2">
																<INPUT TYPE="text" name="N1_N1_021" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true" size="50">
																	<xsl:for-each select="SegmentRef[@ID='N1']/Element[@Pos = '02' $and$ @Value!='']">
																		<xsl:attribute name="value">
																			<xsl:value-of select='@Value' />
																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
															</TD>
														</xsl:if>
													</TR>
												</TABLE>
											</xsl:if>
										</xsl:for-each>
									</div>
								</TD>
							</TR>
						</TABLE>
					</Fieldset>
				</TD>
				<TD valign="top">
					<Fieldset style="BORDER-TOP-WIDTH: 1px; BORDER-LEFT-WIDTH: 1px; BORDER-BOTTOM-WIDTH: 1px; BORDER-RIGHT-WIDTH: 1px;Border-Color:#000000;WIDTH:100%">
						<TABLE width="100%" Align="Left" Border="0" cellpadding="1" cellspacing="1">
							<TR bgcolor="#EDEDED">
								<TD width="70%">
									<FONT color="#000000">
										<B>ST - Ship To</B>
									</FONT>
								</TD>
								<TD Align="right">
									<a onMouseOver="window.status='';return true" href="javascript:popWin('PopUp/Inv_N1.asp','EditN1Details','650','490','2')"
										id="hrefSt">[Edit]</a>
									<a onMouseOver="window.status='';return true" href="javascript:setBlank('St');"> [Reset]</a>
								</TD>
							</TR>
							<TR>
								<TD colspan="2">
									<div id="St">
										<xsl:for-each select="N1-LOOP">
											<xsl:if test="SegmentRef[@ID='N1']/Element[(@Pos='01' $and$ @Value ='ST') ]">
												<TABLE width="100%" Align="Left" Border="0" cellspacing='0' cellpadding='0'>
													<TR>
														<xsl:if test="SegmentRef[@ID='N1']/Element[(@Pos='03' $and$ (@Value ='UL')) ]">
															<TD Colspan="2">
																<INPUT TYPE="text" name="Delemeter" value="ID [" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	size="3" readonly="true" />
																<INPUT size="2" TYPE="text" name="N1_N1_032" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true">
																	<xsl:for-each select="SegmentRef[@ID='N1']/Element[@Pos = '03' $and$ @Value!='']">
																		<xsl:attribute name="value">
																			<xsl:value-of select='@Value' />
																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
																<INPUT TYPE="text" name="Delemeter" value="]=" size="1" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true" />
																<INPUT TYPE="text" name="N1_N1_042" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true">
																	<xsl:for-each select="SegmentRef[@ID='N1']/Element[@Pos = '04' $and$ @Value!='']">
																		<xsl:attribute name="value">
																			<xsl:value-of select='@Value' />
																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
															</TD>
														</xsl:if>
													</TR>
													<TR>
														<xsl:if test="SegmentRef[@ID='N1']/Element[(@Pos='02' $and$ @Value !='') ]">
															<TD Colspan="2">
																<INPUT TYPE="text" name="N1_N1_022" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true" size="50">
																	<xsl:for-each select="SegmentRef[@ID='N1']/Element[@Pos = '02']">
																		<xsl:attribute name="value">
																			<xsl:value-of select='@Value' />
																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
															</TD>
														</xsl:if>
													</TR>
													<TR>
														<xsl:if test="SegmentRef[@ID='N3']/Element[(@Pos='01' $and$ @Value !='') ]">
															<TD Colspan="2">
																<INPUT TYPE="text" name="N1_N3_012" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true" size="50">
																	<xsl:for-each select="SegmentRef[@ID='N3']/Element[@Pos = '01']">
																		<xsl:attribute name="value">
																			<xsl:value-of select='@Value' />
																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
															</TD>
														</xsl:if>
													</TR>
													<TR>
														<xsl:if test="SegmentRef[@ID='N3']/Element[(@Pos='02' $and$ @Value !='') ]">
															<TD Colspan="2">
																<INPUT TYPE="text" name="N1_N3_022" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true" size="50">
																	<xsl:for-each select="SegmentRef[@ID='N3']/Element[@Pos = '02']">
																		<xsl:attribute name="value">
																			<xsl:value-of select='@Value' />
																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
															</TD>
														</xsl:if>
													</TR>
													<TR>
														<xsl:if test="SegmentRef[@ID='N4']/Element[(@Pos='01' $and$ @Value !='') $or$ (@Pos='02' $and$ @Value !='') $or$ (@Pos='03' $and$ @Value !='')]">
															<TD colspan="2">
																<xsl:for-each select="SegmentRef[@ID='N4']/Element[@Pos = '01']">
																	<xsl:value-of select='@Value' />
																</xsl:for-each>
																<xsl:for-each select="SegmentRef[@ID='N4']/Element[@Pos = '02' $and$ @Value!='']">
																			, <xsl:value-of select='@Value' />
																</xsl:for-each>
																<xsl:for-each select="SegmentRef[@ID='N4']/Element[@Pos = '03' $and$ @Value!='']">
																	, <xsl:value-of select='@Value' />
																</xsl:for-each>
																<xsl:for-each select="SegmentRef[@ID='N4']/Element[@Pos = '04' $and$ @Value!='']">
																		, <xsl:value-of select='@Value' />
																	</xsl:for-each>
																<INPUT TYPE="hidden" name="N1_N4_012" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true" size="25">
																	<xsl:for-each select="SegmentRef[@ID='N4']/Element[@Pos = '01']">
																		<xsl:attribute name="value">
																			<xsl:value-of select='@Value' />
																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
																<INPUT TYPE="hidden" name="N1_N4_022" size="2" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true">
																	<xsl:for-each select="SegmentRef[@ID='N4']/Element[@Pos = '02' $and$ @Value!='']">
																		<xsl:attribute name="value">
																			<xsl:value-of select='@Value' />
																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
																<INPUT TYPE="hidden" name="N1_N4_032" size="10" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true">
																	<xsl:for-each select="SegmentRef[@ID='N4']/Element[@Pos = '03' $and$ @Value!='']">
																		<xsl:attribute name="value">
																			<xsl:value-of select='@Value' />
																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
																<INPUT TYPE="hidden" name="N1_N4_042" size="10" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true">
																	<xsl:for-each select="SegmentRef[@ID='N4']/Element[@Pos = '04' $and$ @Value!='']">
																		<xsl:attribute name="value">
																			<xsl:value-of select='@Value' />
																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
															</TD>
														</xsl:if>
													</TR>
												</TABLE>
											</xsl:if>
										</xsl:for-each>
									</div>
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
		<!--<Table align="center" Border="1" width="99%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse">
			<TR>
				<TD>
					<Table Border="0" width="100%" bordercolor="black" cellpadding="0" cellspacing="0" style="Border-Collapse:Collapse">
						<TR bgcolor="#EDEDED">
							<TD width="70%">
								<B>
									<Font Color="#000000">Currency</Font>
								</B>
							</TD>
							<TD Align="right" nowrap="true">
								<a onMouseOver="window.status='';return true" href="javascript:popWin('PopUp/Inv_Currency.asp','EditCurrencyDetail',500,150,'')" id="hrefCurr">	[Edit]</a>
								<a onMouseOver="window.status='';return true" href="javascript:doNull('CUR_01,CUR_02','TR_cur1,TR_cur2','Currency');">	[Reset]</a>
							</TD>
						</TR>
						<TR>
							<TD Colspan="2">
								<Table Border="0" width="100%" bordercolor="black">
									<TR id="TR_cur1">
										<xsl:choose>
											<xsl:when test="SegmentRef[@ID='CUR']/Element[(@Pos = '01' $and$ @Value = 'BY')]">
												<xsl:attribute name="style">display:inline</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="style">display:none</xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<TD>Entity Identifier Code</TD>
										<TD>
											<B>:</B>
										</TD>
										<TD>
											<Input type="text" name="CUR_01" class="inputtext" size="25" style="border-left:0;border-top:0;border-bottom:0;border-right:0">
												<xsl:for-each select="SegmentRef[@ID='CUR']/Element[@Pos = '01' $and$ @Value='BY']">
													<xsl:attribute name="value">
														<xsl:value-of select='@Value' />
													</xsl:attribute>
												</xsl:for-each>
											</Input>
										</TD>
									</TR>
									<TR id="TR_cur2">
										<xsl:choose>
											<xsl:when test="SegmentRef[@ID='CUR']/Element[(@Pos = '02' $and$ @Value != '')]">
												<xsl:attribute name="style">display:inline</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="style">display:none</xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<TD>Currency Code</TD>
										<TD>
											<B>:</B>
										</TD>
										<TD align="left">
											<Input type="text" name="CUR_02" class="inputtext" style="border-left:0;border-top:0;border-bottom:0;border-right:0">
												<xsl:for-each select="SegmentRef[@ID='CUR']/Element[@Pos = '02' $and$ @Value!='']">
													<xsl:attribute name="value">
														<xsl:value-of select='@Value' />
													</xsl:attribute>
												</xsl:for-each>
											</Input>
										</TD>
									</TR>
								</Table>
							</TD>
						</TR>
					</Table>
				</TD>
			</TR>
		</Table>-->
		<Table width='99%' Border='0' align="center" Cellspacing="1">
			<TR>
				<TD>
					<Table Border="1" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse">
						<TR>
							<TD>
								<Table Border="0" width="100%" bordercolor="black" id="RefTable">
									<TR bgcolor="#EDEDED">
										<TD colspan="2" width="89%">
											<Font color="#000000">
												<B>Reference</B>
											</Font>
										</TD>
										<TD Align="right">
											<input type="Button" onclick="PopWinNew('PopUp/INV_REFRENCE.asp','EditReferenceDetails','670','150','0')"
												value="ADD" class="inputButton" id="REF_ADDBtn" />
										</TD>
									</TR>
									<xsl:for-each select="SegmentRef[@ID = 'REF']">
										<xsl:if test="Element[@Pos = '01' $and$  (@Value = 'IA' $or$ @Value = 'DP' $or$ @Value = 'MR')]">
											<TR>
												<TD>
													<Input type="text" Name="REF_01" Class="inputText" readonly="true" style="Border-Top:0;Border-Bottom:0;Border-Left:0;Border-Right:0;"
														size="67">
														<xsl:attribute name="value">
															<xsl:for-each select="Element[@Pos = '01']">
																<xsl:choose>
																	<xsl:when test="@Value[value()='IA']">IA Internal Vendor Number</xsl:when>
																	<xsl:when test="@Value[value()='DP']">DP Department Number</xsl:when>
																	<xsl:when test="@Value[value()='MR']">MR Merchandise Type Code</xsl:when>
																</xsl:choose>
															</xsl:for-each>
														</xsl:attribute>
													</Input>
												</TD>
												<TD>
													<Input type="text" Name="REF_02" Class="inputText" readonly="true" style="Border-Top:0;Border-Bottom:0;Border-Left:0;Border-Right:0;"
														SIZE="35">
														<xsl:for-each select='Element[@Pos = "02"]'>
															<xsl:attribute name="value">
																<xsl:value-of select='@Value' />
															</xsl:attribute>
														</xsl:for-each>
													</Input>
												</TD>
												<TD id="ReferenceHREF" Align="center"></TD>
											</TR>
										</xsl:if>
									</xsl:for-each>
								</Table>
							</TD>
						</TR>
					</Table>
				</TD>
			</TR>
		</Table>
		<br />
		<Table Border="0" width="99%" Align="center" bordercolor="black" cellspacing="1" cellpadding="0">
			<TR>
				<TD colspan="2" id="td_ITDHeader">
					<Table Border="1" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse">
						<TR>
							<TD>
								<Table Border="0" width="100%" cellpadding="3" cellspacing="3" ID='ITDTable_Header' style="border-collapse:collapse">
									<TR BGCOLOR="#EDEDED">
										<TD width="90%" VALIGN="TOP">
											<Font Color="#000000">
												<B>Terms of sale</B>
											</Font>
										</TD>
										<TD align='right'>
											<input type='button' value='ADD' class='inputButton' onclick="PopWinNew('PopUp/INV_Terms.asp','EditShipToDetails','660','330','0')"
												ID="ITD_ADDBtn" />
										</TD>
									</TR>
									<xsl:for-each select="SegmentRef[@ID = 'ITD']">
										<TR BGCOLOR="#FFFFFF">
											<TD colspan="3">
												<Table Border="0" Width="100%" bordercolor="black" cellspacing="2" Cellpadding="1" style="Border-Collapse:Collapse">
													<TR id="TR_ITD_01">
														<xsl:choose>
															<xsl:when test="Element[(@Pos = '01' $and$ @Value!='') $or$ (@Pos = '02' $and$ @Value!='') $or$ (@Pos = '03' $and$ @Value!='')]">
																<xsl:attribute name="style">
																display:inline
															</xsl:attribute>
															</xsl:when>
															<xsl:otherwise>
																<xsl:attribute name="style">
																display:none
															</xsl:attribute>
															</xsl:otherwise>
														</xsl:choose>
														<TD nowrap="true">
															<b>Type Code</b>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Name="ITD_01" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																size="25" readonly="true" Class="inputtext">
																<xsl:attribute name="value">
																	<xsl:for-each select="Element[@Pos='01' $and$ (@Value='02' $or$ @Value='05' $or$ @Value='08')]">
																		<xsl:choose>
																			<xsl:when test="@Value[value()='02']">02 End of Month</xsl:when>
																			<xsl:when test="@Value[value()='05']">05 Discount Not Applicable</xsl:when>
																			<xsl:when test="@Value[value()='08']">08 Basic Discount Offered</xsl:when>
																		</xsl:choose>
																	</xsl:for-each>
																</xsl:attribute>
															</INPUT>
														</TD>
														<TD nowrap="true">
															<b>Discount Percent</b>
														</TD>
														<TD width="1%" align="center">
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Name="ITD_03" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																size="4" readonly="true" Class="inputtext">
																<xsl:for-each select="Element[@Pos='03']">
																	<xsl:attribute name="value">
																		<xsl:value-of select='@Value' />
																	</xsl:attribute>
																</xsl:for-each>
															</INPUT>
														</TD>
														<TD nowrap="true">
															<b>Basis Date Code</b>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Name="ITD_02" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																size="20" readonly="true" Class="inputtext">
																<xsl:attribute name="value">
																	<xsl:for-each select="Element[@Pos='02' $and$ (@Value='1' $or$ @Value='3' $or$ @Value='7' $or$ @Value='15')]">
																		<xsl:choose>
																			<xsl:when test="@Value[value()='1']">1 Ship Date</xsl:when>
																			<xsl:when test="@Value[value()='3']">3 Invoice Date</xsl:when>
																			<xsl:when test="@Value[value()='7']">7 Effective Date</xsl:when>
																			<xsl:when test="@Value[value()='15']">15 Receipt of Goods</xsl:when>
																		</xsl:choose>
																	</xsl:for-each>
																</xsl:attribute>
															</INPUT>
														</TD>
														<TD id='ITDHref' align="right"></TD>
													</TR>
													<TR id='TR_ITD_02'>
														<xsl:choose>
															<xsl:when test="Element[(@Pos = '07' $and$ @Value != '') $or$ (@Pos = '05' $and$ @Value != '') $or$ (@Pos = '08' $and$ @Value != '')]">
																<xsl:attribute name="style">display:inline</xsl:attribute>
															</xsl:when>
															<xsl:otherwise>
																<xsl:attribute name="style">display:none</xsl:attribute>
															</xsl:otherwise>
														</xsl:choose>
														<TD nowrap="true">
															<b>Discount Days Due</b>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Name="ITD_05" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																size="4" readonly="true" Class="inputtext">
																<xsl:for-each select="Element[@Pos='05']">
																	<xsl:attribute name="value">
																		<xsl:value-of select='@Value' />
																	</xsl:attribute>
																</xsl:for-each>
															</INPUT>
														</TD>
														<TD nowrap="true">
															<b>Net Days</b>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Name="ITD_07" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																size="4" readonly="true" Class="inputtext">
																<xsl:for-each select="Element[@Pos='07']">
																	<xsl:attribute name="value">
																		<xsl:value-of select='@Value' />
																	</xsl:attribute>
																</xsl:for-each>
															</INPUT>
														</TD>
														<TD nowrap="true">
															<b>Discount Amount</b>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Name="ITD_08" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																size="10" readonly="true" Class="inputtext">
																<xsl:for-each select="Element[@Pos='08']">
																	<xsl:attribute name="value">
																		<xsl:value-of select='@Value' />
																	</xsl:attribute>
																</xsl:for-each>
															</INPUT>
														</TD>
													</TR>
													<TR id='TR_ITD_03'>
														<xsl:choose>
															<xsl:when test="Element[(@Pos = '12' $and$ @Value != '')]">
																<xsl:attribute name="style">display:inline</xsl:attribute>
															</xsl:when>
															<xsl:otherwise>
																<xsl:attribute name="style">display:none</xsl:attribute>
															</xsl:otherwise>
														</xsl:choose>
														<TD nowrap="true">
															<b>Description</b>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD colspan="7">
															<INPUT TYPE="text" Name="ITD_12" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																size="80" readonly="true" Class="inputtext">
																<xsl:for-each select="Element[@Pos='12']">
																	<xsl:attribute name="value">
																		<xsl:value-of select='@Value' />
																	</xsl:attribute>
																</xsl:for-each>
															</INPUT>
														</TD>
													</TR>
												</Table>
											</TD>
										</TR>
									</xsl:for-each>
								</Table>
							</TD>
						</TR>
					</Table>
				</TD>
			</TR>
		</Table>
		<br />
		<Table width='99%' Border='0' align="center" Cellspacing="1">
			<TR>
				<TD ID="td_Dtm">
					<Table Border="1" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse">
						<TR>
							<TD>
								<Table Border="0" width="100%" bordercolor="black" id="DateTimeTable">
									<TR bgcolor="#EDEDED">
										<TD colspan="2" width="89%">
											<Font color="#000000">
												<B>Date/Time Details</B>
											</Font>
										</TD>
										<TD Align="right">
											<input type="Button" onclick="PopWinNew('PopUp/Inv_Date.asp','EditDTM','500','150','0')"
												value="ADD" class="inputButton" id="DTM_ADDBtn" />
										</TD>
									</TR>
									<xsl:for-each select="SegmentRef[@ID = 'DTM']">
										<xsl:if test="Element[@Pos = '01' $and$  (@Value = '011' $or$ @Value = '007')]">
											<TR>
												<TD>
													<Input type="text" Name="DTM_01" Class="inputText" readonly="true" style="Border-Top:0;Border-Bottom:0;Border-Left:0;Border-Right:0;"
														size="67">
														<xsl:attribute name="value">
															<xsl:for-each select="Element[@Pos = '01']">
																<xsl:choose>
																	<xsl:when test="@Value[value()='011']">011 Shipped</xsl:when>
																	<xsl:when test="@Value[value()='007']">007 Effective</xsl:when>
																	<xsl:otherwise>
																		<xsl:value-of select='@Value' />
																	</xsl:otherwise>
																</xsl:choose>
															</xsl:for-each>
														</xsl:attribute>
													</Input>
												</TD>
												<TD>
													<Input type="text" Name="DTM_02" Class="inputText" readonly="true" style="Border-Top:0;Border-Bottom:0;Border-Left:0;Border-Right:0;"
														SIZE="15">
														<xsl:for-each select='Element[@Pos = "02"]'>
															<xsl:attribute name="value">
																<xsl:value-of select='@Value' />
															</xsl:attribute>
														</xsl:for-each>
													</Input>
												</TD>
												<TD id="DTMHref" Align="center"></TD>
											</TR>
										</xsl:if>
									</xsl:for-each>
								</Table>
							</TD>
						</TR>
					</Table>
				</TD>
			</TR>
		</Table>
		<br />
		<Table align="center" Border="1" width="99%" bordercolor="black" cellspacing="0" Cellpadding="1"
			style="Border-Collapse:Collapse">
			<TR>
				<TD>
					<Table Border="0" width="100%" bordercolor="black" cellpadding="0" cellspacing="0" style="Border-Collapse:Collapse">
						<TR bgcolor="#EDEDED">
							<TD width="70%">
								<B>
									<Font Color="#000000">FOB Instructions</Font>
								</B>
							</TD>
							<TD Align="right" nowrap="true">
								<a onMouseOver="window.status='';return true" href="javascript:popWin('PopUp/Inv_FOB.asp','EditFOBDetail',500,150,'')"
									id="hrefFob">	[Edit]</a>
								<a onMouseOver="window.status='';return true" href="javascript:doNull('FOB_01','TR_fob1','Fob');">	[Reset]</a>
							</TD>
						</TR>
						<TR>
							<TD Colspan="2">
								<Table Border="0" width="100%" bordercolor="black">
									<TR id="TR_fob1">
										<xsl:choose>
											<xsl:when test="SegmentRef[@ID='FOB']/Element[@Pos = '01' $and$ (@Value = 'CC' $or$ @Value = 'PP')]">
												<xsl:attribute name="style">display:inline</xsl:attribute>
											</xsl:when>
											<xsl:otherwise>
												<xsl:attribute name="style">display:none</xsl:attribute>
											</xsl:otherwise>
										</xsl:choose>
										<TD>Shipment Method of Payment</TD>
										<TD>
											<B>:</B>
										</TD>
										<TD>
											<Input type="text" name="FOB_01" class="inputtext" size="35" style="border-left:0;border-top:0;border-bottom:0;border-right:0">
												<xsl:for-each select="SegmentRef[@ID='FOB']/Element[@Pos = '01' $and$ (@Value = 'CC' $or$ @Value = 'PP')]">
													<xsl:attribute name="value">
														<xsl:choose>
															<xsl:when test="@Value[value()='CC']">CC Collect</xsl:when>
															<xsl:when test="@Value[value()='PP']">PP Prepaid(By Seller)</xsl:when>
														</xsl:choose>
													</xsl:attribute>
												</xsl:for-each>
											</Input>
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
		<Table width='99%' align="center" Border='0' Cellspacing="1">
			<TR>
				<TD>
					<Table Border="0" width="100%" align="center" bordercolor="black" cellspacing="0" cellpadding="0">
						<TR>
							<TD>
								<b>ITEM DETAILS</b>
							</TD>
							<TD Align="Right">
								<Input type="Button" class="InputButton" value="ADD NEW ITEM" onClick="addItemWithExsiting(ItemTable,'PopUp/INV_ITEM.ASP','EditItemDetail',700,700,'0')" />
							</TD>
						</TR>
					</Table>
				</TD>
			</TR>
		</Table>
		<Table Border="0" width="99%" align="center" bordercolor="black" cellspacing="0" Cellpadding="1"
			style="Border-Collapse:Collapse">
			<TR>
				<TD>
					<Table id="ItemTable" Value="1" width="100%" align="center" border="1" style="Border-Collapse:Collapse"
						bordercolor="black" cellpadding="0" cellspacing="4">
						<xsl:for-each select='IT1-LOOP'>
							<xsl:if test="SegmentRef[@ID = 'IT1']">
								<TR>
									<TD id="td_Item_Detail">
										<Table width="100%" Border="0" bordercolor="black" Align="Center" cellspacing="0" Cellpadding="1"
											style="Border-Collapse:Collapse">
											<TR bgcolor="#5225BA">
												<TD width="30%">
													<Font color="#FFFFFF">
															<B>Item </B> - 
															<input type="text" name="IT1_IT1_01" class="inputText" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px;BackGround-Color:#5225BA;Text:White;Color:White"
															readonly="true"></input>
														</Font>
												</TD>
												<TD width="13%" nowrap="true" align="center">
													<Font color="#FFFFFF">
														<B>Quantity / Mea.</B>
													</Font>
												</TD>
												<TD width="10%" align="center">
													<Font color="#FFFFFF">
														<B>Unit Price</B>
													</Font>
												</TD>
												<TD width="13%" nowrap="true" align="center">
													<Font color="#FFFFFF">
														<B>Ext Price</B>
													</Font>
												</TD>
												<TD width="10%" nowrap="true" align="center">
													<Font color="#FFFFFF">
														<B>Edit</B>
													</Font>
												</TD>
											</TR>
											<TR>
												<TD>
													<!--<textarea rows="3" cols="50" name="IT1_PID_PID_05">
														<xsl:for-each select='PID-LOOP/SegmentRef[@ID="PID"]/Element[@Pos = "05"]'>
															<xsl:value-of select='@Value' />
														</xsl:for-each>
													</textarea>-->
												</TD>
												<TD align="right">
													<INPUT TYPE="text" style="TEXT-ALIGN: right" Class="inputtext" size="9" name="IT1_IT1_02"
														maxlength="15" onKeyup="accessExtPrice(); return checkIsNan(frm_810XSL.IT1_IT1_02)">
														<xsl:for-each select="SegmentRef[@ID='IT1']/Element[@Pos = '02']">
															<xsl:attribute name="value">
																<xsl:value-of select='@Value' />
															</xsl:attribute>
														</xsl:for-each>
													</INPUT>
													<INPUT TYPE="TEXT" Class="inputtext" name="IT1_IT1_03" SIZE="3" style="text-align:center;border-bottom:0;border-top:0;border-left:0;border-right:0;"
														readonly="true">
														<xsl:for-each select="SegmentRef[@ID='IT1']/Element[@Pos = '03']">
															<xsl:attribute name="value">
																<xsl:value-of select='@Value' />
															</xsl:attribute>
														</xsl:for-each>
													</INPUT>
												</TD>
												<TD align="center">
													<INPUT TYPE="text" name="IT1_IT1_04" style="text-align:center;border-bottom:0;border-top:0;border-left:0;border-right:0;"
														readonly="true" Class="inputText" size="10">
														<xsl:for-each select="SegmentRef[@ID='IT1']/Element[@Pos='04']">
															<xsl:attribute name="value">
																<xsl:value-of select='@Value' />
															</xsl:attribute>
														</xsl:for-each>
													</INPUT>
												</TD>
												<TD id="ExtPrice" align="center"></TD>
												<TD Align="center" id="itemHref">Edit</TD>
											</TR>
											<TR>
												<TD colspan="5" ID="td_PSID_Detail">
													<Table border="0" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse">
														<TR BGCOLOR="#EDEDED" ID="Psid_Row">
															<xsl:choose>
																<xsl:when test="SegmentRef/Element[(@Pos = '06' $and$ @Value != '') $or$ (@Pos = '08' $and$ @Value != '')]">
																	<xsl:attribute name="style">display:inline</xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="style">display:none</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>
															<TD width="49%">
																<font color="000000">
																	<b>Service / Product ID Qualifier</b>
																</font>
															</TD>
															<TD>
																<font color="000000">
																	<b>Service / Product ID</b>
																</font>
															</TD>
														</TR>
														<xsl:for-each select="SegmentRef[@ID = 'IT1']">
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="06" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_06" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="72" readonly="true">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos="06" $and$ @Value!=""]'>
																						<xsl:choose>
																							<xsl:when test="@Value[value()='CH']">CH Country of Origin Code</xsl:when>
																							<xsl:when test="@Value[value()='EN']">EN EAN/UCC-13</xsl:when>
																							<xsl:when test="@Value[value()='IN']">IN Buyers Item Number</xsl:when>
																							<xsl:when test="@Value[value()='LT']">LT Lot Number</xsl:when>
																							<xsl:when test="@Value[value()='UI']">UI UPC Consumer Package Code(1-5-5)</xsl:when>
																							<xsl:when test="@Value[value()='UK']">UK GTIN 14-digit Data Structure</xsl:when>
																							<xsl:when test="@Value[value()='UP']">UP UCC-12</xsl:when>
																							<xsl:when test="@Value[value()='ZZ']">ZZ Mutually Defined</xsl:when>
																						</xsl:choose>
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_06" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="72" readonly="true"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="06" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_07" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos = "07"]'>
																						<xsl:value-of select='@Value' />
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_07" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="08" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_08" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos="08" $and$ @Value!=""]'>
																						<xsl:choose>
																							<xsl:when test="@Value[value()='CH']">CH Country of Origin Code</xsl:when>
																							<xsl:when test="@Value[value()='EN']">EN EAN/UCC-13</xsl:when>
																							<xsl:when test="@Value[value()='IN']">IN Buyers Item Number</xsl:when>
																							<xsl:when test="@Value[value()='LT']">LT Lot Number</xsl:when>
																							<xsl:when test="@Value[value()='UI']">UI UPC Consumer Package Code(1-5-5)</xsl:when>
																							<xsl:when test="@Value[value()='UK']">UK GTIN 14-digit Data Structure</xsl:when>
																							<xsl:when test="@Value[value()='UP']">UP UCC-12</xsl:when>
																							<xsl:when test="@Value[value()='ZZ']">ZZ Mutually Defined</xsl:when>
																						</xsl:choose>
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_08" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="08" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_09" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos = "09"]'>
																						<xsl:value-of select='@Value' />
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_09" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="10" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_10" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos="10" $and$ @Value!=""]'>
																						<xsl:choose>
																							<xsl:when test="@Value[value()='CH']">CH Country of Origin Code</xsl:when>
																							<xsl:when test="@Value[value()='EN']">EN EAN/UCC-13</xsl:when>
																							<xsl:when test="@Value[value()='IN']">IN Buyers Item Number</xsl:when>
																							<xsl:when test="@Value[value()='LT']">LT Lot Number</xsl:when>
																							<xsl:when test="@Value[value()='UI']">UI UPC Consumer Package Code(1-5-5)</xsl:when>
																							<xsl:when test="@Value[value()='UK']">UK GTIN 14-digit Data Structure</xsl:when>
																							<xsl:when test="@Value[value()='UP']">UP UCC-12</xsl:when>
																							<xsl:when test="@Value[value()='ZZ']">ZZ Mutually Defined</xsl:when>
																						</xsl:choose>
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_10" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="10" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_11" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos = "11"]'>
																						<xsl:value-of select='@Value' />
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_11" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="12" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_12" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos="12" $and$ @Value!=""]'>
																						<xsl:choose>
																							<xsl:when test="@Value[value()='CH']">CH Country of Origin Code</xsl:when>
																							<xsl:when test="@Value[value()='EN']">EN EAN/UCC-13</xsl:when>
																							<xsl:when test="@Value[value()='IN']">IN Buyers Item Number</xsl:when>
																							<xsl:when test="@Value[value()='LT']">LT Lot Number</xsl:when>
																							<xsl:when test="@Value[value()='UI']">UI UPC Consumer Package Code(1-5-5)</xsl:when>
																							<xsl:when test="@Value[value()='UK']">UK GTIN 14-digit Data Structure</xsl:when>
																							<xsl:when test="@Value[value()='UP']">UP UCC-12</xsl:when>
																							<xsl:when test="@Value[value()='ZZ']">ZZ Mutually Defined</xsl:when>
																						</xsl:choose>
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_12" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="12" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_13" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos = "13"]'>
																						<xsl:value-of select='@Value' />
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_13" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="14" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_14" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos="14" $and$ @Value!=""]'>
																						<xsl:choose>
																							<xsl:when test="@Value[value()='CH']">CH Country of Origin Code</xsl:when>
																							<xsl:when test="@Value[value()='EN']">EN EAN/UCC-13</xsl:when>
																							<xsl:when test="@Value[value()='IN']">IN Buyers Item Number</xsl:when>
																							<xsl:when test="@Value[value()='LT']">LT Lot Number</xsl:when>
																							<xsl:when test="@Value[value()='UI']">UI UPC Consumer Package Code(1-5-5)</xsl:when>
																							<xsl:when test="@Value[value()='UK']">UK GTIN 14-digit Data Structure</xsl:when>
																							<xsl:when test="@Value[value()='UP']">UP UCC-12</xsl:when>
																							<xsl:when test="@Value[value()='ZZ']">ZZ Mutually Defined</xsl:when>
																						</xsl:choose>
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_14" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="14" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_15" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos = "15"]'>
																						<xsl:value-of select='@Value' />
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_15" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="16" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_16" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos="16" $and$ @Value!=""]'>
																						<xsl:choose>
																							<xsl:when test="@Value[value()='CH']">CH Country of Origin Code</xsl:when>
																							<xsl:when test="@Value[value()='EN']">EN EAN/UCC-13</xsl:when>
																							<xsl:when test="@Value[value()='IN']">IN Buyers Item Number</xsl:when>
																							<xsl:when test="@Value[value()='LT']">LT Lot Number</xsl:when>
																							<xsl:when test="@Value[value()='UI']">UI UPC Consumer Package Code(1-5-5)</xsl:when>
																							<xsl:when test="@Value[value()='UK']">UK GTIN 14-digit Data Structure</xsl:when>
																							<xsl:when test="@Value[value()='UP']">UP UCC-12</xsl:when>
																							<xsl:when test="@Value[value()='ZZ']">ZZ Mutually Defined</xsl:when>
																						</xsl:choose>
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_16" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="16" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_17" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos = "17"]'>
																						<xsl:value-of select='@Value' />
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_17" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="18" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_18" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos="18" $and$ @Value!=""]'>
																						<xsl:choose>
																							<xsl:when test="@Value[value()='CH']">CH Country of Origin Code</xsl:when>
																							<xsl:when test="@Value[value()='EN']">EN EAN/UCC-13</xsl:when>
																							<xsl:when test="@Value[value()='IN']">IN Buyers Item Number</xsl:when>
																							<xsl:when test="@Value[value()='LT']">LT Lot Number</xsl:when>
																							<xsl:when test="@Value[value()='UI']">UI UPC Consumer Package Code(1-5-5)</xsl:when>
																							<xsl:when test="@Value[value()='UK']">UK GTIN 14-digit Data Structure</xsl:when>
																							<xsl:when test="@Value[value()='UP']">UP UCC-12</xsl:when>
																							<xsl:when test="@Value[value()='ZZ']">ZZ Mutually Defined</xsl:when>
																						</xsl:choose>
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_18" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="18" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_19" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos = "19"]'>
																						<xsl:value-of select='@Value' />
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_19" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="20" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_20" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos="20" $and$ @Value!=""]'>
																						<xsl:choose>
																							<xsl:when test="@Value[value()='CH']">CH Country of Origin Code</xsl:when>
																							<xsl:when test="@Value[value()='EN']">EN EAN/UCC-13</xsl:when>
																							<xsl:when test="@Value[value()='IN']">IN Buyers Item Number</xsl:when>
																							<xsl:when test="@Value[value()='LT']">LT Lot Number</xsl:when>
																							<xsl:when test="@Value[value()='UI']">UI UPC Consumer Package Code(1-5-5)</xsl:when>
																							<xsl:when test="@Value[value()='UK']">UK GTIN 14-digit Data Structure</xsl:when>
																							<xsl:when test="@Value[value()='UP']">UP UCC-12</xsl:when>
																							<xsl:when test="@Value[value()='ZZ']">ZZ Mutually Defined</xsl:when>
																						</xsl:choose>
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_20" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="20" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<INPUT TYPE="text" name="IT1_IT1_21" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50">
																				<xsl:attribute name="value">
																					<xsl:for-each select='Element[@Pos = "21"]'>
																						<xsl:value-of select='@Value' />
																					</xsl:for-each>
																				</xsl:attribute>
																			</INPUT>
																		</xsl:when>
																		<xsl:otherwise>
																			<INPUT TYPE="text" Class="inputtext" name="IT1_IT1_21" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50"></INPUT>
																		</xsl:otherwise>
																	</xsl:choose>
																</TD>
															</TR>
                              <TR>
                                <TD>
                                  <xsl:choose>
                                    <xsl:when test='Element[@Pos="22" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
                                      <INPUT TYPE="text" name="IT1_IT1_22" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true">
                                        <xsl:attribute name="value">
                                          <xsl:for-each select='Element[@Pos="22" $and$ @Value!=""]'>
                                            <xsl:choose>
                                              <xsl:when test="@Value[value()='CH']">CH Country of Origin Code</xsl:when>
                                              <xsl:when test="@Value[value()='EN']">EN EAN/UCC-13</xsl:when>
                                              <xsl:when test="@Value[value()='IN']">IN Buyers Item Number</xsl:when>
                                              <xsl:when test="@Value[value()='LT']">LT Lot Number</xsl:when>
                                              <xsl:when test="@Value[value()='UI']">UI UPC Consumer Package Code(1-5-5)</xsl:when>
                                              <xsl:when test="@Value[value()='UK']">UK GTIN 14-digit Data Structure</xsl:when>
                                              <xsl:when test="@Value[value()='UP']">UP UCC-12</xsl:when>
                                              <xsl:when test="@Value[value()='ZZ']">ZZ Mutually Defined</xsl:when>
                                            </xsl:choose>
                                          </xsl:for-each>
                                        </xsl:attribute>
                                      </INPUT>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <INPUT TYPE="text" Class="inputtext" name="IT1_IT1_22" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true"></INPUT>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </TD>
                                <TD>
                                  <xsl:choose>
                                    <xsl:when test='Element[@Pos="22" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
                                      <INPUT TYPE="text" name="IT1_IT1_23" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50">
                                        <xsl:attribute name="value">
                                          <xsl:for-each select='Element[@Pos = "23"]'>
                                            <xsl:value-of select='@Value' />
                                          </xsl:for-each>
                                        </xsl:attribute>
                                      </INPUT>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <INPUT TYPE="text" Class="inputtext" name="IT1_IT1_23" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50"></INPUT>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </TD>
                              </TR>
                              <TR>
                                <TD>
                                  <xsl:choose>
                                    <xsl:when test='Element[@Pos="24" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
                                      <INPUT TYPE="text" name="IT1_IT1_22" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true">
                                        <xsl:attribute name="value">
                                          <xsl:for-each select='Element[@Pos="24" $and$ @Value!=""]'>
                                            <xsl:choose>
                                              <xsl:when test="@Value[value()='CH']">CH Country of Origin Code</xsl:when>
                                              <xsl:when test="@Value[value()='EN']">EN EAN/UCC-13</xsl:when>
                                              <xsl:when test="@Value[value()='IN']">IN Buyers Item Number</xsl:when>
                                              <xsl:when test="@Value[value()='LT']">LT Lot Number</xsl:when>
                                              <xsl:when test="@Value[value()='UI']">UI UPC Consumer Package Code(1-5-5)</xsl:when>
                                              <xsl:when test="@Value[value()='UK']">UK GTIN 14-digit Data Structure</xsl:when>
                                              <xsl:when test="@Value[value()='UP']">UP UCC-12</xsl:when>
                                              <xsl:when test="@Value[value()='ZZ']">ZZ Mutually Defined</xsl:when>
                                            </xsl:choose>
                                          </xsl:for-each>
                                        </xsl:attribute>
                                      </INPUT>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <INPUT TYPE="text" Class="inputtext" name="IT1_IT1_24" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="60" readonly="true"></INPUT>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </TD>
                                <TD>
                                  <xsl:choose>
                                    <xsl:when test='Element[@Pos="24" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
                                      <INPUT TYPE="text" name="IT1_IT1_25" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50">
                                        <xsl:attribute name="value">
                                          <xsl:for-each select='Element[@Pos = "25"]'>
                                            <xsl:value-of select='@Value' />
                                          </xsl:for-each>
                                        </xsl:attribute>
                                      </INPUT>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <INPUT TYPE="text" Class="inputtext" name="IT1_IT1_25" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				readonly="true" size="50"></INPUT>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                </TD>
                              </TR>
														</xsl:for-each>
													</Table>
												</TD>
											</TR>
											<TR>
												<TD colspan="5" ID="td_PID_Detail">
													<Table border="0" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse">
														<TR BGCOLOR="#EDEDED" ID="PID_Row">
															<xsl:choose>
																<xsl:when test="PID-LOOP/SegmentRef[@ID = 'PID']/Element[(@Pos='01' $and$ @Value!='') $or$ (@Pos='05' $and$ @Value!='')]">
																	<xsl:attribute name="style">display:inline</xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="style">display:none</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>
															<TD width="100%" colspan="6">
																<font color="000000">
																	<b>Product/Item Description</b>
																</font>
															</TD>
														</TR>
														<TR id="TR_PID_Row1">
															<xsl:choose>
																<xsl:when test="PID-LOOP/SegmentRef[@ID = 'PID']/Element[(@Pos='01' $and$ @Value!='') $or$ (@Pos='05' $and$ @Value!='')]">
																	<xsl:attribute name="style">display:inline</xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="style">display:none</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>
															<TD width="15%" nowrap='true'>
																<B>Type</B>
															</TD>
															<TD width='1%'>
																<b>:</b>
															</TD>
															<TD width='15%' align='left'>
																<INPUT TYPE="text" name="IT1_PID_01" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																				size="20" readonly="true">
																	<xsl:for-each select="PID-LOOP/SegmentRef[@ID='PID']/Element[@Pos = '01' $and$ @Value!= '']">
																		<xsl:attribute name="value">
																			<xsl:choose>
																				<xsl:when test="@Value[value()='F']">F Free-form</xsl:when>

																				<xsl:otherwise>
																					<xsl:value-of select='@Value' />
																				</xsl:otherwise>
																			</xsl:choose>

																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
															</TD>
															<TD width="10%" nowrap='true'>
																<B>Description </B>
															</TD>
															<TD width='1%'>
																<b>:</b>
															</TD>
															<TD width='30%' align='left'>
																<INPUT TYPE="TEXT" Class="inputtext" size='50' maxlength='17' name="IT1_PID_05" readonly="true"
																	style="Border-Top:0;Border-Bottom:0;Border-Left:0;Border-Right:0;">
																	<xsl:for-each select="PID-LOOP/SegmentRef[@ID='PID']/Element[@Pos = '05' $and$ @Value!= '']">
																		<xsl:attribute name="value">
																			<xsl:value-of select='@Value' />
																		</xsl:attribute>
																	</xsl:for-each>
																</INPUT>
															</TD>
														</TR>
													</Table>
												</TD>
											</TR>
											<TR>
												<TD colspan="5" ID="td_PO4_Detail">
													<Table border="0" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse">
														<TR BGCOLOR="#EDEDED" id="po4_row">
															<xsl:choose>
																<xsl:when test='SegmentRef[@ID="PO4"]/Element[(@Pos="01" $and$ @Value!="") $or$ (@Pos="14" $and$ @Value!="")]'>
																	<xsl:attribute name="style">display:inline</xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="style">display:none</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>
															<TD width="100%" colspan="6">
																<font color="000000">
																	<b>Item Physical Details</b>
																</font>
															</TD>
														</TR>
														<TR id="po4_row_head1">
															<xsl:choose>
																<xsl:when test='SegmentRef[@ID="PO4"]/Element[(@Pos="01" $and$ @Value!="") $or$ (@Pos="14" $and$ @Value!="")]'>
																	<xsl:attribute name="style">display:inline</xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="style">display:none</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>
															<TD nowrap="true" width="5%">
																<font color="000000">
																	<B>Pack</B>
																</font>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD>
																<xsl:choose>
																	<xsl:when test='SegmentRef[@ID="PO4"]/Element[@Pos="01" $and$ @Value!=""]'>
																		<INPUT TYPE="text" name="IT1_PO4_01" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="10">
																			<xsl:attribute name="value">
																				<xsl:for-each select='SegmentRef[@ID="PO4"]/Element[@Pos = "01"]'>
																					<xsl:value-of select='@Value' />
																				</xsl:for-each>
																			</xsl:attribute>
																		</INPUT>
																	</xsl:when>
																	<xsl:otherwise>
																		<INPUT TYPE="text" Class="inputtext" name="IT1_PO4_01" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="10"></INPUT>
																	</xsl:otherwise>
																</xsl:choose>
															</TD>
															<TD nowrap="true" width="10%">
																<font color="000000">
																	<B>Inner Pack</B>
																</font>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD>
																<xsl:choose>
																	<xsl:when test='SegmentRef[@ID="PO4"]/Element[@Pos="14" $and$ @Value!=""]'>
																		<INPUT TYPE="text" name="IT1_PO4_14" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="10">
																			<xsl:attribute name="value">
																				<xsl:for-each select='SegmentRef[@ID="PO4"]/Element[@Pos = "14"]'>
																					<xsl:value-of select='@Value' />
																				</xsl:for-each>
																			</xsl:attribute>
																		</INPUT>
																	</xsl:when>
																	<xsl:otherwise>
																		<INPUT TYPE="text" Class="inputtext" name="IT1_PO4_14" style="display:none;text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="10"></INPUT>
																	</xsl:otherwise>
																</xsl:choose>
															</TD>
														</TR>
													</Table>
												</TD>
											</TR>
											<TR>
												<TD colspan="5" ID="td_SAC_Detail">
													<Table border="0" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse">
														<TR BGCOLOR="#EDEDED" ID="sac_row">
															<xsl:choose>
																<xsl:when test='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[(@Pos="01" $and$ @Value!="") $or$ (@Pos="02" $and$ @Value!="") $or$ (@Pos="05" $and$ @Value!="") $or$ (@Pos="06" $and$ @Value!="") $or$ (@Pos="07" $and$ @Value!="") $or$ (@Pos="08" $and$ @Value!="") $or$ (@Pos="12" $and$ @Value!="") $or$ (@Pos="15" $and$ @Value!="")]'>
																	<xsl:attribute name="style">display:inline</xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="style">display:none</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>
															<TD colspan="9">
																<b>
															 Allowance/Charge Information</b>
															</TD>
														</TR>
														<TR id="sac_row1">
															<xsl:choose>
																<xsl:when test='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[(@Pos="01" $and$ @Value!="") $or$ (@Pos="02" $and$ @Value!="") $or$ (@Pos="05" $and$ @Value!="")]'>
																	<xsl:attribute name="style">display:inline</xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="style">display:none</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>
															<TD width="10%">
																<font color="000000">
																	<b>Indicator</b>
																</font>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD>
																<xsl:choose>
																	<xsl:when test='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos="01" $and$ (@Value="A" $or$ @Value="C")]'>
																		<INPUT TYPE="text" name="IT1_SAC_SAC_01" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="15">
																			<xsl:attribute name="value">
																				<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "01"]'>
																					<xsl:choose>
																						<xsl:when test="@Value[value()='A']">A Allowance</xsl:when>
																						<xsl:when test="@Value[value()='C']">C Charge</xsl:when>
																					</xsl:choose>
																				</xsl:for-each>
																			</xsl:attribute>
																		</INPUT>
																	</xsl:when>
																	<xsl:otherwise>
																		<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_01" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="15"></INPUT>
																	</xsl:otherwise>
																</xsl:choose>
															</TD>
															<TD>
																<font color="000000">
																	<b>Code</b>
																</font>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD>
																<xsl:choose>
																	<xsl:when test='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos="02" $and$ @Value!=""]'>
																		<INPUT TYPE="text" name="IT1_SAC_SAC_02" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="45">
																			<xsl:attribute name="value">
																				<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "02"]'>
																					<xsl:value-of select='@Value' />
																				</xsl:for-each>
																			</xsl:attribute>
																		</INPUT>
																	</xsl:when>
																	<xsl:otherwise>
																		<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_02" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="45"></INPUT>
																	</xsl:otherwise>
																</xsl:choose>
															</TD>
															<TD>
																<font color="000000">
																	<b>Amount</b>
																</font>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD align="left">
																<xsl:choose>
																	<xsl:when test='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos="05" $and$ @Value!=""]'>
																		<INPUT TYPE="text" name="IT1_SAC_SAC_05" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="10">
																			<xsl:attribute name="value">
																				<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "05"]'>
																					<xsl:value-of select='@Value' />
																				</xsl:for-each>
																			</xsl:attribute>
																		</INPUT>
																	</xsl:when>
																	<xsl:otherwise>
																		<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_05" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="10"></INPUT>
																	</xsl:otherwise>
																</xsl:choose>
															</TD>
														</TR>
														<TR id="sac_row2">
															<xsl:choose>
																<xsl:when test='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[(@Pos="06" $and$ @Value!="") $or$ (@Pos="07" $and$ @Value!="") $or$ (@Pos="12" $and$ @Value!="")]'>
																	<xsl:attribute name="style">display:inline</xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="style">display:none</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>
															<TD width="15%">
																<font color="000000">
																	<b>Percent Qualifier</b>
																</font>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD>
																<xsl:choose>
																	<xsl:when test='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos="06" $and$ (@Value="1" $or$ @Value="2" $or$ @Value="3" $or$ @Value="4" $or$ @Value="5" $or$ @Value="6" $or$ @Value="7")]'>
																		<INPUT TYPE="text" name="IT1_SAC_SAC_06" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="20">
																			<xsl:attribute name="value">
																				<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "06"]'>
																					<xsl:choose>
																						<xsl:when test="@Value[value()='1']">1 Item List Cost</xsl:when>
																						<xsl:when test="@Value[value()='2']">2 Item Net Cost</xsl:when>
																						<xsl:when test="@Value[value()='3']">3 Discount/Gross</xsl:when>
																						<xsl:when test="@Value[value()='4']">4 Discount/Net</xsl:when>
																						<xsl:when test="@Value[value()='5']">5 Base Price per Unit</xsl:when>
																						<xsl:when test="@Value[value()='6']">6 Base Price Amount</xsl:when>
																						<xsl:when test="@Value[value()='7']">7 Base Price Amount Less Privious Discount</xsl:when>
																					</xsl:choose>
																				</xsl:for-each>
																			</xsl:attribute>
																		</INPUT>
																	</xsl:when>
																	<xsl:otherwise>
																		<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_06" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="20"></INPUT>
																	</xsl:otherwise>
																</xsl:choose>
															</TD>
															<TD>
																<font color="000000">
																	<b>Percent</b>
																</font>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD>
																<xsl:choose>
																	<xsl:when test='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos="07" $and$ @Value!=""]'>
																		<INPUT TYPE="text" name="IT1_SAC_SAC_07" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="6">
																			<xsl:attribute name="value">
																				<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "07"]'>
																					<xsl:value-of select='@Value' />
																				</xsl:for-each>
																			</xsl:attribute>
																		</INPUT>
																	</xsl:when>
																	<xsl:otherwise>
																		<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_07" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="6"></INPUT>
																	</xsl:otherwise>
																</xsl:choose>
															</TD>
															<TD>
																<font color="000000">
																	<b>Handling Code</b>
																</font>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD>
																<xsl:choose>
																	<xsl:when test='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos="12" $and$ (@Value="02" $or$ @Value="06")]'>
																		<INPUT TYPE="text" name="IT1_SAC_SAC_12" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="20">
																			<xsl:attribute name="value">
																				<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "12"]'>
																					<xsl:choose>
																						<xsl:when test="@Value[value()='02']">02 Off Invoice</xsl:when>
																						<xsl:when test="@Value[value()='06']">06 Paid by Customer</xsl:when>
																					</xsl:choose>
																				</xsl:for-each>
																			</xsl:attribute>
																		</INPUT>
																	</xsl:when>
																	<xsl:otherwise>
																		<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_12" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="20"></INPUT>
																	</xsl:otherwise>
																</xsl:choose>
															</TD>
														</TR>
														<TR id="sac_row3">
															<xsl:choose>
																<xsl:when test='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[(@Pos="08" $and$ @Value!="") $or$ (@Pos="9" $and$ @Value!="") $or$ (@Pos="10" $and$ @Value!="")]'>
																	<xsl:attribute name="style">display:inline</xsl:attribute>
																</xsl:when>
																<xsl:otherwise>
																	<xsl:attribute name="style">display:none</xsl:attribute>
																</xsl:otherwise>
															</xsl:choose>
															<TD>
																<font color="000000">
																	<b>Rate</b>
																</font>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD align="left">
																<xsl:choose>
																	<xsl:when test='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos="08" $and$ @Value!=""]'>
																		<INPUT TYPE="text" name="IT1_SAC_SAC_08" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="10">
																			<xsl:attribute name="value">
																				<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "08"]'>
																					<xsl:value-of select='@Value' />
																				</xsl:for-each>
																			</xsl:attribute>
																		</INPUT>
																	</xsl:when>
																	<xsl:otherwise>
																		<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_08" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="10"></INPUT>
																	</xsl:otherwise>
																</xsl:choose>
															</TD>
															<TD>
																<font color="000000">
																	<b>Quantity</b>
																</font>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD>
																<xsl:choose>
																	<xsl:when test='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos="10" $and$ @Value!=""]'>
																		<INPUT TYPE="text" name="IT1_SAC_SAC_10" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="6">
																			<xsl:attribute name="value">
																				<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "10"]'>
																					<xsl:value-of select='@Value' />
																				</xsl:for-each>
																			</xsl:attribute>
																		</INPUT>
																	</xsl:when>
																	<xsl:otherwise>
																		<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_10" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="6"></INPUT>
																	</xsl:otherwise>
																</xsl:choose>
															</TD>
															<TD>
																<font color="000000">
																	<b>Measurement Code</b>
																</font>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD>
																<xsl:choose>
																	<xsl:when test='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos="09" $and$ (@Value="CA" $or$ @Value="EA")]'>
																		<INPUT TYPE="text" name="IT1_SAC_SAC_09" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="10">
																			<xsl:attribute name="value">
																				<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "09"]'>
																					<xsl:choose>
																						<xsl:when test="@Value[value()='CA']">CA Case</xsl:when>
																						<xsl:when test="@Value[value()='EA']">EA Each</xsl:when>
																					</xsl:choose>
																				</xsl:for-each>
																			</xsl:attribute>
																		</INPUT>
																	</xsl:when>
																	<xsl:otherwise>
																		<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_09" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																			readonly="true" size="10"></INPUT>
																	</xsl:otherwise>
																</xsl:choose>
															</TD>
														</TR>
													</Table>
												</TD>
											</TR>
										</Table>
									</TD>
								</TR>
							</xsl:if>
						</xsl:for-each>
					</Table>
				</TD>
			</TR>
		</Table>
		<br />
		<Table width="99%" Border="1" bordercolor="black" Align="Center" style="border-collapse:collapse"
			cellpadding="2" cellspacing="0">
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
					<B>Allowance / Charges Total  :</B>
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
			style="Border-Collapse:Collapse;">
			<TR id="tr_Summary">
				<TD>
					<B>Summary</B>
				</TD>
			</TR>
			<TR>
				<TD ID="td_TXI_SUMMARY">
					<Table Border="0" width="100%" Align="center" bordercolor="black" cellspacing="1" cellpadding="0">
						<TR>
							<TD colspan="2" id="td_TXIHeader">
								<Table Border="1" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse">
									<TR>
										<TD>
											<Table Border="0" width="100%" cellpadding="3" cellspacing="3" ID='TXITable_Header' style="border-collapse:collapse">
												<TR BGCOLOR="#EDEDED">
													<TD width="90%" VALIGN="TOP">
														<Font Color="#000000">
															<B>Tax Information</B>
														</Font>
													</TD>
													<TD align='right'>
														<input type='button' value='ADD' class='inputButton' onclick="PopWinNew('PopUp/INV_Tax.asp','EditTaxDetails','660','230','0')"
															ID="Tax_ADDBtn" />
													</TD>
												</TR>
												<xsl:for-each select="SegmentRef[@ID = 'TXI']">
													<TR BGCOLOR="#FFFFFF">
														<TD colspan="3">
															<Table Border="0" Width="100%" bordercolor="black" cellspacing="2" Cellpadding="1" style="Border-Collapse:Collapse">
																<TR id="TR_TXI_01">
																	<xsl:choose>
																		<xsl:when test="Element[(@Pos = '01' $and$ @Value!='') $or$ (@Pos = '02' $and$ @Value!='') $or$ (@Pos = '03' $and$ @Value!='')]">
																			<xsl:attribute name="style">
																			display:inline
																		</xsl:attribute>
																		</xsl:when>
																		<xsl:otherwise>
																			<xsl:attribute name="style">
																			display:none
																		</xsl:attribute>
																		</xsl:otherwise>
																	</xsl:choose>
																	<TD nowrap="true">Type Code</TD>
																	<TD>
																		<B>:</B>
																	</TD>
																	<TD>
																		<INPUT TYPE="text" Name="TXI_01" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																			size="20" readonly="true" Class="inputtext">
																			<xsl:for-each select="Element[@Pos='01' $and$ (@Value='BE' $or$ @Value='GS' $or$ @Value='PG')]">
																				<xsl:attribute name="value">
																					<xsl:choose>
																						<xsl:when test="@Value[value()='BE']">BE Harmonized Sales Tax</xsl:when>
																						<xsl:when test="@Value[value()='GS']">GS Goods and Service Tax</xsl:when>
																						<xsl:when test="@Value[value()='PG']">PG State or Province Tax on Goods</xsl:when>
																					</xsl:choose>
																				</xsl:attribute>
																			</xsl:for-each>
																		</INPUT>
																	</TD>
																	<TD nowrap="true">Monetory Amount</TD>
																	<TD width="1%" align="center">
																		<B>:</B>
																	</TD>
																	<TD>
																		<INPUT TYPE="text" Name="TXI_02" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																			size="12" readonly="true" Class="inputtext">
																			<xsl:for-each select="Element[@Pos='02']">
																				<xsl:attribute name="value">
																					<xsl:value-of select='@Value' />
																				</xsl:attribute>
																			</xsl:for-each>
																		</INPUT>
																	</TD>
																	<TD nowrap="true">Percent</TD>
																	<TD>
																		<B>:</B>
																	</TD>
																	<TD>
																		<INPUT TYPE="text" Name="TXI_03" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																			size="10" readonly="true" Class="inputtext">
																			<xsl:for-each select="Element[@Pos='03']">
																				<xsl:attribute name="value">
																					<xsl:value-of select='@Value' />
																				</xsl:attribute>
																			</xsl:for-each>
																		</INPUT>
																	</TD>
                                  <TD nowrap="true"></TD>
                                  <TD></TD>
                                  <TD>
                                    <INPUT TYPE="text"  style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																			size="10" readonly="true" Class="inputtext">
                                      
                                    </INPUT>
                                  </TD>
																	<TD align="right" id='TXIHref'></TD>
																</TR>
                                <TR id='TR_TXI_02'>
                                  <xsl:choose>
                                    <xsl:when test="Element[(@Pos = '04' $and$ @Value != '') $or$ (@Pos = '05' $and$ @Value != '') $or$ (@Pos = '09' $and$ @Value != '')]">
                                      <xsl:attribute name="style">display:inline</xsl:attribute>
                                    </xsl:when>
                                    <xsl:otherwise>
                                      <xsl:attribute name="style">display:none</xsl:attribute>
                                    </xsl:otherwise>
                                  </xsl:choose>
                                  <TD nowrap="true">Jurisdiction Code Qual.</TD>
                                  <TD>
                                    <B>:</B>
                                  </TD>
                                  <TD>
                                    <INPUT TYPE="text" Name="TXI_04" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																			size="20" readonly="true" Class="inputtext">
                                      <xsl:for-each select="Element[@Pos='04' $and$ @Value='SP']">
                                        <xsl:attribute name="value">
                                          <xsl:choose>
                                            <xsl:when test="@Value[value()='SP']">SP State or Province</xsl:when>
                                          </xsl:choose>
                                        </xsl:attribute>
                                      </xsl:for-each>
                                    </INPUT>
                                  </TD>
                                  <TD nowrap="true">Jurisdiction Code</TD>
                                  <TD>
                                    <B>:</B>
                                  </TD>
                                  <TD>
                                    <INPUT TYPE="text" Name="TXI_05" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																			size="12" readonly="true" Class="inputtext">
                                      <xsl:for-each select="Element[@Pos='05']">
                                        <xsl:attribute name="value">
                                          <xsl:value-of select='@Value' />
                                        </xsl:attribute>
                                      </xsl:for-each>
                                    </INPUT>
                                  </TD>
                                  <TD nowrap="true">Basis For Percent</TD>
                                  <TD>
                                    <B>:</B>
                                  </TD>
                                  <TD>
                                    <INPUT TYPE="text" Name="TXI_08" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																			size="15" readonly="true" Class="inputtext">
                                      <xsl:for-each select="Element[@Pos='08']">
                                        <xsl:attribute name="value">
                                          <xsl:value-of select='@Value' />
                                        </xsl:attribute>
                                      </xsl:for-each>
                                    </INPUT>
                                  </TD>
                                </TR>
                                <TR id='TR_TXI_03'>
																	<TD nowrap="true">Tax ID Number</TD>
																	<TD>
																		<B>:</B>
																	</TD>
																	<TD>
																		<INPUT TYPE="text" Name="TXI_09" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																			size="15" readonly="true" Class="inputtext">
																			<xsl:for-each select="Element[@Pos='09']">
																				<xsl:attribute name="value">
																					<xsl:value-of select='@Value' />
																				</xsl:attribute>
																			</xsl:for-each>
																		</INPUT>
																	</TD>
																</TR>
															</Table>
														</TD>
													</TR>
												</xsl:for-each>
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
						BGCOLOR="#EDEDED">
						<TR BGCOLOR="#EDEDED">
							<TD width="90%">
								<Table Border="0" Width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
									id='CadTable_Header'>
									<TR>
										<TD>
											<Font Color="#000000">
												<B>Carrier Detail</B>
											</Font>
										</TD>
										<TD align="right">
											<A href="JavaScript:popWin('PopUp/Inv_CAD.asp','EditCarrierDetails','670','280','0')"
												id="hrefCAD">[Edit]</A>
											<A id="td_CAD_SUMR" href="javascript:doNull('CAD_01,CAD_04,CAD_05,CAD_07,CAD_08','TR_CAD_Row1,TR_CAD_Row3,TR_CAD_Row2','CarrierDetail')">[Reset]</A>
										</TD>
									</TR>
									<TR BGCOLOR="#FFFFFF">
										<TD colspan="2">
											<Table Border="0" Width="100%" bordercolor="black" cellspacing="2" Cellpadding="1" style="Border-Collapse:Collapse">
												<TR id="TR_CAD_Row1">
													<xsl:choose>
														<xsl:when test="SegmentRef[@ID = 'CAD']/Element[(@Pos = '04' $and$ @Value != '') $or$ (@Pos = '01' $and$ @Value != '')]">
															<xsl:attribute name="style">display:inline</xsl:attribute>
														</xsl:when>
														<xsl:otherwise>
															<xsl:attribute name="style">display:none</xsl:attribute>
														</xsl:otherwise>
													</xsl:choose>
													<TD nowrap="true">
														<B>Type Code:</B>
													</TD>
													<TD>
														<INPUT TYPE="text"  Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
															readonly="true" size="15" name="CAD_01">
                              <xsl:for-each select="SegmentRef[@ID = 'CAD']/Element[@Pos = '01' $and$ @Value!='']">
                                <xsl:attribute name="value">
                                  <xsl:choose>
                                    <xsl:when test="@Value[value()='T']">T Best Way</xsl:when>
                                  </xsl:choose>
                                </xsl:attribute>
                              </xsl:for-each>
														</INPUT>
													</TD>
													<TD nowrap="true">
														<B>Standard Carrier Alpha Code :</B>
													</TD>
													<TD>
														<INPUT TYPE="text" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
															readonly="true" size="15" name="CAD_04">
															<xsl:attribute name="value">
																<xsl:for-each select="SegmentRef[@ID = 'CAD']/Element[@Pos = '04']">
																	<xsl:value-of select='@Value' />
																</xsl:for-each>
															</xsl:attribute>
														</INPUT>
													</TD>
												</TR>
												<TR id="TR_CAD_Row3">
													<xsl:choose>
														<xsl:when test="SegmentRef[@ID = 'CAD']/Element[(@Pos = '05' $and$ @Value != '')]">
															<xsl:attribute name="style">display:inline</xsl:attribute>
														</xsl:when>
														<xsl:otherwise>
															<xsl:attribute name="style">display:none</xsl:attribute>
														</xsl:otherwise>
													</xsl:choose>
													<TD>
														<B>Routing :</B>
													</TD>
													<TD colspan="3">
														<INPUT TYPE="text" Class="inputtext" style="TEXT-ALIGN:left;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
															readonly="true" size="45" name="CAD_05">
															<xsl:for-each select="SegmentRef[@ID = 'CAD']/Element[@Pos = '05']">
																<xsl:attribute name="value">
																	<xsl:value-of select='@Value' />
																</xsl:attribute>
															</xsl:for-each>
														</INPUT>
													</TD>
												</TR>
												<TR id="TR_CAD_Row2">
													<xsl:choose>
														<xsl:when test="SegmentRef[@ID = 'CAD']/Element[(@Pos = '07' $and$ @Value != '') $or$ (@Pos = '08' $and$ @Value != '')]">
															<xsl:attribute name="style">display:inline</xsl:attribute>
														</xsl:when>
														<xsl:otherwise>
															<xsl:attribute name="style">display:none</xsl:attribute>
														</xsl:otherwise>
													</xsl:choose>
													<TD>
														<B>Reference ID Qualifier :</B>
													</TD>
													<TD>
														<INPUT TYPE="text" Class="inputtext" name="CAD_07" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
															readonly="true" size="25">
															<xsl:for-each select="SegmentRef[@ID = 'CAD']/Element[@Pos = '07' $and$ (@Value='BM' $or$ @Value='CN')]">
																<xsl:attribute name="value">
																	<xsl:choose>
																		<xsl:when test="@Value[value()='BM']">BM Bill of Lading Number</xsl:when>
																		<xsl:when test="@Value[value()='CN']">CN Carriers Reference Number</xsl:when>
																	</xsl:choose>
																</xsl:attribute>
															</xsl:for-each>
														</INPUT>
													</TD>
													<TD nowrap="true">
														<B>Reference ID :</B>
													</TD>
													<TD>
														<INPUT TYPE="text" Class="inputtext" style="TEXT-ALIGN:left;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
															readonly="true" size="50" name="CAD_08">
															<xsl:for-each select="SegmentRef[@ID = 'CAD']/Element[@Pos = '08']">
																<xsl:attribute name="value">
																	<xsl:value-of select='@Value' />
																</xsl:attribute>
															</xsl:for-each>
														</INPUT>
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
						BGCOLOR="#EDEDED">
						<TR>
							<TD width="90%">
								<Table Border="0" Width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
									id='SacTable_Header'>
									<TR BGCOLOR="#EDEDED">
										<TD>
											<Font Color="#000000">
												<B>Allowance / Charge </B>
											</Font>
										</TD>
										<TD align='right'>
											<input type='button' value='ADD' class='inputButton' onclick="PopWinNew('PopUp/Inv_SAC.asp','EditTaxDetails','660','500','0')"
												ID="SAC_ADDBtn" />
										</TD>
									</TR>
									<xsl:for-each select="SAC-LOOP/SegmentRef[@ID = 'SAC']">
										<TR BGCOLOR="#FFFFFF">
											<TD colspan="2">
												<Table Border="0" Width="100%" bordercolor="black" cellspacing="2" Cellpadding="1" style="Border-Collapse:Collapse">
													<TR id="TR_SAC_Row1">
														<xsl:choose>
															<xsl:when test="Element[(@Pos = '01' $and$ @Value != '') $or$ (@Pos = '05' $and$ @Value != '') $or$ (@Pos = '02' $and$ @Value != '')]">
																<xsl:attribute name="style">display:inline</xsl:attribute>
															</xsl:when>
															<xsl:otherwise>
																<xsl:attribute name="style">display:none</xsl:attribute>
															</xsl:otherwise>
														</xsl:choose>
														<TD nowrap="true">
															<B>Indicator</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																readonly="true" size="15" name="SAC_SAC_01">
																<xsl:attribute name="value">
																	<xsl:for-each select="Element[@Pos = '01']">
																		<xsl:choose>
																			<xsl:when test="@Value[value()='A']">A Allowance</xsl:when>
																			<xsl:when test="@Value[value()='C']">C Charge</xsl:when>
																			<xsl:when test="@Value[value()='N']">N No Allowance no Charge</xsl:when>
																			<xsl:otherwise>
																				<xsl:value-of select='@Value' />
																			</xsl:otherwise>
																		</xsl:choose>
																	</xsl:for-each>
																</xsl:attribute>
															</INPUT>
														</TD>
														<TD>
															<B>Code</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" style="TEXT-ALIGN:left;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																readonly="true" size="45" name="SAC_SAC_02">
																<xsl:for-each select="Element[@Pos = '02']">
																	<xsl:attribute name="value">
																		<xsl:value-of select='@Value' />
																	</xsl:attribute>
																</xsl:for-each>
															</INPUT>
														</TD>
														<TD>
															<B>Amount</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" name="SAC_SAC_05" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																readonly="true" size="15">
																<xsl:for-each select="Element[@Pos = '05']">
																	<xsl:attribute name="value">
																		<xsl:value-of select='@Value' />
																	</xsl:attribute>
																</xsl:for-each>
															</INPUT>
														</TD>
														<TD id='SACHref'></TD>
													</TR>
													<TR id="TR_SAC_Row2">
														<xsl:choose>
															<xsl:when test="Element[(@Pos = '06' $and$ @Value != '') $or$ (@Pos = '07' $and$ @Value != '') $or$ (@Pos = '08' $and$ @Value != '')]">
																<xsl:attribute name="style">display:inline</xsl:attribute>
															</xsl:when>
															<xsl:otherwise>
																<xsl:attribute name="style">display:none</xsl:attribute>
															</xsl:otherwise>
														</xsl:choose>
														<TD>
															<b>Percent Qualifier</b>
														</TD>
														<TD>
															<INPUT TYPE="text" name="SAC_SAC_06" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="40">
																<xsl:attribute name="value">
																	<xsl:for-each select='Element[@Pos = "06"]'>
																		<xsl:choose>
																			<xsl:when test="@Value[value()='1']">1 Item List Cost</xsl:when>
																			<xsl:when test="@Value[value()='2']">2 Item Net Cost</xsl:when>
																			<xsl:when test="@Value[value()='3']">3 Discount/Gross</xsl:when>
																			<xsl:when test="@Value[value()='4']">4 Discount/Net</xsl:when>
																			<xsl:when test="@Value[value()='5']">5 Base Price per Unit</xsl:when>
																			<xsl:when test="@Value[value()='6']">6 Base Price Amount</xsl:when>
																			<xsl:when test="@Value[value()='7']">7 Base Price Amount Less Previous Discount</xsl:when>
																		</xsl:choose>
																	</xsl:for-each>
																</xsl:attribute>
															</INPUT>
														</TD>
														<TD>
															<font color="000000">
																<b>Percent</b>
															</font>
														</TD>
														<TD>
															<INPUT TYPE="text" name="SAC_SAC_07" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="6">
																<xsl:attribute name="value">
																	<xsl:for-each select='Element[@Pos = "07"]'>
																		<xsl:value-of select='@Value' />
																	</xsl:for-each>
																</xsl:attribute>
															</INPUT>
														</TD>
														<TD>
															<font color="000000">
																<b>Rate</b>
															</font>
														</TD>
														<TD>
															<INPUT TYPE="text" name="SAC_SAC_08" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="7">
																<xsl:attribute name="value">
																	<xsl:for-each select='Element[@Pos = "08"]'>
																		<xsl:value-of select='@Value' />
																	</xsl:for-each>
																</xsl:attribute>
															</INPUT>
														</TD>
													</TR>
													<TR id="TR_SAC_Row3">
														<xsl:choose>
															<xsl:when test="Element[(@Pos = '10' $and$ @Value != '') $or$ (@Pos = '09' $and$ @Value != '') $or$ (@Pos = '12' $and$ @Value != '')]">
																<xsl:attribute name="style">display:inline</xsl:attribute>
															</xsl:when>
															<xsl:otherwise>
																<xsl:attribute name="style">display:none</xsl:attribute>
															</xsl:otherwise>
														</xsl:choose>
														<TD>
															<b>UOM</b>
														</TD>
														<TD>
															<INPUT TYPE="text" name="SAC_SAC_09" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="10">
																<xsl:attribute name="value">
																	<xsl:for-each select='Element[@Pos = "09"]'>
																		<xsl:choose>
																			<xsl:when test="@Value[value()='CA']">CA Case</xsl:when>
																			<xsl:when test="@Value[value()='EA']">EA Each</xsl:when>
																		</xsl:choose>
																	</xsl:for-each>
																</xsl:attribute>
															</INPUT>
														</TD>
														<TD nowrap="true">
															<B>Handling Code</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" style="TEXT-ALIGN:left;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																readonly="true" size="30" name="SAC_SAC_12">
																<xsl:for-each select="Element[@Pos = '12']">
																	<xsl:attribute name="value">
																		<xsl:value-of select='@Value' />
																	</xsl:attribute>
																</xsl:for-each>
															</INPUT>
														</TD>
														<TD>
															<font color="000000">
																<b>Quantity</b>
															</font>
														</TD>
														<TD>
															<INPUT TYPE="text" name="SAC_SAC_10" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="7">
																<xsl:attribute name="value">
																	<xsl:for-each select='Element[@Pos = "10"]'>
																		<xsl:value-of select='@Value' />
																	</xsl:for-each>
																</xsl:attribute>
															</INPUT>
														</TD>
													</TR>
													<TR id="TR_SAC_Row4">
														<xsl:choose>
															<xsl:when test="Element[(@Pos = '14' $and$ @Value != '') $or$ (@Pos = '16' $and$ @Value != '') $or$ (@Pos = '13' $and$ @Value != '')]">
																<xsl:attribute name="style">display:inline</xsl:attribute>
															</xsl:when>
															<xsl:otherwise>
																<xsl:attribute name="style">display:none</xsl:attribute>
															</xsl:otherwise>
														</xsl:choose>
														<TD>
															<b>Reference ID</b>
														</TD>
														<TD>
															<INPUT TYPE="text" name="SAC_SAC_13" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="40">
																<xsl:attribute name="value">
																	<xsl:for-each select='Element[@Pos = "13"]'>
																		<xsl:value-of select='@Value' />
																	</xsl:for-each>
																</xsl:attribute>
															</INPUT>
														</TD>
														<TD>
															<font color="000000">
																<b>Option No.</b>
															</font>
														</TD>
														<TD>
															<INPUT TYPE="text" name="SAC_SAC_14" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;"
																readonly="true" size="25">
																<xsl:attribute name="value">
																	<xsl:for-each select='Element[@Pos = "14"]'>
																		<xsl:value-of select='@Value' />
																	</xsl:for-each>
																</xsl:attribute>
															</INPUT>
														</TD>
														<TD nowrap="true">
															<B>Language Code</B>
														</TD>
														<TD>
															<INPUT TYPE="text" Class="inputtext" style="TEXT-ALIGN:left;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																readonly="true" size="15" name="SAC_SAC_16">
																<xsl:attribute name="value">
																	<xsl:for-each select='Element[@Pos = "16"]'>
																		<xsl:value-of select='@Value' />
																	</xsl:for-each>
																</xsl:attribute>
															</INPUT>
														</TD>
													</TR>
													<TR id="TR_SAC_Row5">
														<xsl:choose>
															<xsl:when test="Element[@Pos = '15' $and$ @Value != '']">
																<xsl:attribute name="style">display:inline</xsl:attribute>
															</xsl:when>
															<xsl:otherwise>
																<xsl:attribute name="style">display:none</xsl:attribute>
															</xsl:otherwise>
														</xsl:choose>
														<TD nowrap="true">
															<B>Description</B>
														</TD>
														<TD colspan="5">
															<INPUT TYPE="text" Class="inputtext" style="TEXT-ALIGN:left;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																readonly="true" size="80" name="SAC_SAC_15">
																<xsl:for-each select="Element[@Pos = '15']">
																	<xsl:attribute name="value">
																		<xsl:value-of select='@Value' />
																	</xsl:attribute>
																</xsl:for-each>
															</INPUT>
														</TD>
													</TR>
												</Table>
											</TD>
										</TR>
									</xsl:for-each>
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
						BGCOLOR="#EDEDED">
						<TR BGCOLOR="#EDEDED">
							<TD width="90%">
								<Table Border="0" Width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
									id='ISSTable_Summary'>
									<TR>
										<TD>
											<Font Color="#000000">
												<B>Invoice Shipment Summary</B>
											</Font>
										</TD>
										<TD align="right">
											<A href="JavaScript:popWin('PopUp/Inv_ISS.asp','EditISSToDetails','650','250','0')"
												id="hrefISS">[Edit]</A>
											<A id="ISSTable_Header" href="javascript:doNull('ISS_01,ISS_02,ISS_03,ISS_04','TR_ISS_01','ISS')">[Reset]</A>
										</TD>
									</TR>
									<TR BGCOLOR="#FFFFFF">
										<TD colspan="2">
											<Table Border="0" Width="100%" bordercolor="black" cellspacing="2" Cellpadding="1" style="Border-Collapse:Collapse">
												<TR id="TR_ISS_01">
													<xsl:choose>
														<xsl:when test="ISS-LOOP/SegmentRef[@ID = 'ISS']/Element[(@Pos = '01' $and$ @Value!='') $or$ (@Pos = '02' $and$ @Value!='') $or$ (@Pos = '03' $and$ @Value!='') $or$ (@Pos = '04' $and$ @Value!='')]">
															<xsl:attribute name="style">display:inline</xsl:attribute>
														</xsl:when>
														<xsl:otherwise>
															<xsl:attribute name="style">display:none</xsl:attribute>
														</xsl:otherwise>
													</xsl:choose>
													<TD nowrap="true">
														<b>Unit Shipped</b>
													</TD>
													<TD>
														<B>:</B>
													</TD>
													<TD>
														<INPUT TYPE="text" Name="ISS_01" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
															size="25" readonly="true" Class="inputtext">
															<xsl:for-each select="ISS-LOOP/SegmentRef[@ID = 'ISS']/Element[@Pos='01' $and$ @Value!='']">
																<xsl:attribute name="value">
																	<xsl:value-of select='@Value' />
																</xsl:attribute>
															</xsl:for-each>
														</INPUT>
													</TD>
													<TD nowrap="true">
														<b>Mea. Code</b>
													</TD>
													<TD width="1%" align="center">
														<B>:</B>
													</TD>
													<TD>
														<INPUT TYPE="text" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
															readonly="true" size="15" name="ISS_02">
															<xsl:attribute name="value">
																<xsl:for-each select="ISS-LOOP/SegmentRef[@ID = 'ISS']/Element[@Pos = '02']">
																	<xsl:choose>
																		<xsl:when test="@Value[value()='CA']">CA Case</xsl:when>
																		<xsl:when test="@Value[value()='EA']">EA Each</xsl:when>
																	</xsl:choose>
																</xsl:for-each>
															</xsl:attribute>
														</INPUT>
													</TD>
													<TD nowrap="true">
														<b>Weight</b>
													</TD>
													<TD>
														<B>:</B>
													</TD>
													<TD>
														<INPUT TYPE="text" Name="ISS_03" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
															size="25" readonly="true" Class="inputtext">
															<xsl:for-each select="ISS-LOOP/SegmentRef[@ID = 'ISS']/Element[@Pos='03' $and$ @Value!='']">
																<xsl:attribute name="value">
																	<xsl:value-of select='@Value' />
																</xsl:attribute>
															</xsl:for-each>
														</INPUT>
													</TD>
													<TD nowrap="true">
														<b>Mea. Code</b>
													</TD>
													<TD width="1%" align="center">
														<B>:</B>
													</TD>
													<TD>
														<INPUT TYPE="text" Class="inputtext" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
															readonly="true" size="15" name="ISS_04">
															<xsl:attribute name="value">
																<xsl:for-each select="ISS-LOOP/SegmentRef[@ID = 'ISS']/Element[@Pos = '04']">
																	<xsl:choose>
																		<xsl:when test="@Value[value()='KG']">KG Kilogram</xsl:when>
																		<xsl:when test="@Value[value()='LB']">LB Pound</xsl:when>
																	</xsl:choose>
																</xsl:for-each>
															</xsl:attribute>
														</INPUT>
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
	</xsl:template>
</xsl:stylesheet>