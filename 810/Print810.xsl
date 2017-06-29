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
		<xsl:for-each select='SegmentRef[@ID = "ISA"]'>
			<xsl:for-each select='Element'>
				<INPUT TYPE="HIDDEN" Class="inputtext">
					<xsl:attribute name="name">
						<xsl:eval>"ISA_"</xsl:eval>
						<xsl:value-of select='@Pos' />
					</xsl:attribute>
					<xsl:attribute name="value">
						<xsl:value-of select='@Value' />
					</xsl:attribute>
				</INPUT>
			</xsl:for-each>
		</xsl:for-each>
		<xsl:apply-templates select="Functional-Group-Control" />
	</xsl:template>
	<xsl:template match='Functional-Group-Control'>
		<xsl:for-each select='SegmentRef[@ID = "GS"]'>
			<INPUT TYPE="HIDDEN" Class="inputtext">
				<xsl:attribute name="name">
					<xsl:eval>"GS_06"</xsl:eval>
				</xsl:attribute>
				<xsl:for-each select='Element[@Pos = "06"]'>
					<xsl:attribute name="value">
						<xsl:value-of select='@Value' />
					</xsl:attribute>
				</xsl:for-each>
			</INPUT>
			<INPUT TYPE="HIDDEN" Class="inputtext">
				<xsl:attribute name="name">
					<xsl:eval>"GS_08"</xsl:eval>
				</xsl:attribute>
				<xsl:for-each select='Element[@Pos = "08"]'>
					<xsl:attribute name="value">
						<xsl:value-of select='@Value' />
					</xsl:attribute>
				</xsl:for-each>
			</INPUT>
		</xsl:for-each>
		<xsl:apply-templates select="Transaction-Set-Control" />
	</xsl:template>
	<xsl:template match='Transaction-Set-Control'>
		<Table width='100%' Border='0'>
			<TR>
				<TD colspan="3" nowrap="true">
					<Font size="4">
						<B>INVOICE</B>
					</Font>
					for <B>PO No : </B>
					
						<xsl:for-each select="SegmentRef[@ID='BIG']">
						<xsl:for-each select="Element[@Pos ='04']">
							<xsl:value-of select="@Value" />
						</xsl:for-each>
					</xsl:for-each>
					
							<B>Dated : </B>
					
						<xsl:for-each select="SegmentRef[@ID='BIG']">
						<xsl:for-each select="Element[@Pos ='03']">
							<xsl:value-of select="@Value" />
						</xsl:for-each>
					</xsl:for-each>
					
					
				</TD>
			</TR>
			<TR>
				<TD width="8%" nowrap="true">
					<B>Invoice No</B>
				</TD>
				<TD width="1%">
					<B>:</B>
				</TD>
				<TD width="20%" nowrap="true">
					<xsl:for-each select="SegmentRef[@ID='BIG']">
						<xsl:for-each select="Element[@Pos ='02']">
							<xsl:value-of select="@Value" />
						</xsl:for-each>
					</xsl:for-each>
				</TD>
				<td Align="right"></td>
			</TR>
			<TR>
				<TD nowrap="true">
					<B>Invoice Date</B>
				</TD>
				<TD>
					<B>:</B>
				</TD>
				<TD nowrap="true">
					<xsl:for-each select="SegmentRef[@ID='BIG']">
						<xsl:for-each select="Element[@Pos ='01']">
							<xsl:value-of select="@Value" />
						</xsl:for-each>
					</xsl:for-each>
				</TD>
				<td Align="right"></td>
			</TR>
      <TR >
				<TD nowrap="true" width="1%">
					<B>Invoice Type </B>
					
				</TD>
				<TD>
					<B width="1%">:</B>
				</TD>
        <TD>
          <INPUT TYPE="text" Name="BIG_07_DESC" style="BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
						size="70" readonly="true" Class="inputtext">
            <xsl:for-each select="SegmentRef[@ID='BIG']">
              <xsl:for-each select="Element[@Pos ='07']">
                <xsl:attribute name="value">
                  <xsl:value-of select="@Desc" />
                </xsl:attribute>
              </xsl:for-each>
            </xsl:for-each>
          </INPUT>
          <INPUT TYPE="HIDDEN" NAME="BIG_07">
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
		</Table>
		<Table Border="0" width="99%" Align="center" bordercolor="black" cellspacing="1" cellpadding="0">
			<TR>
				<TD colspan="2" valign="top">
					<TABLE width="100%" Align="Left" Border="0" cellpadding="3">
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
				</TD>
			</TR>
			<TR>
				<TD>
					<font color="white">'</font>
				</TD>
			</TR>
			<TR>
				<TD valign="top">
					<TABLE width="100%" Align="Left" Border="0" cellpadding="3" cellspacing="0">
						<TR bgcolor="#EDEDED">
							<TD width="70%">
								<FONT color="#000000">
									<B>SU - Supplier/Manufacturer</B>
								</FONT>
							</TD>
							<TD Align="center"></TD>
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
																
																
																	ID [<xsl:for-each select="SegmentRef[@ID='N1']/Element[@Pos = '03' $and$ @Value!='']">
																<xsl:value-of select='@Value' />
															</xsl:for-each>]=
																
																
																
																	<xsl:for-each select="SegmentRef[@ID='N1']/Element[@Pos = '04' $and$ @Value!='']">
																<xsl:value-of select='@Value' />
															</xsl:for-each>
																
															</TD>
													</xsl:if>
												</TR>
												<TR>
													<xsl:if test="SegmentRef[@ID='N1']/Element[(@Pos='01' $and$ @Value !='') ]">
														<TD Colspan="2">
															<xsl:for-each select="SegmentRef[@ID='N1']/Element[@Pos = '02' $and$ @Value!='']">
																<xsl:value-of select='@Value' />
															</xsl:for-each>
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
				</TD>
				<TD valign="top">
					<TABLE width="100%" Align="Left" Border="0" cellpadding="3" cellspacing="0">
						<TR bgcolor="#EDEDED">
							<TD width="70%">
								<FONT color="#000000">
									<B>ST - Ship To</B>
								</FONT>
							</TD>
							<TD Align="right"></TD>
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
																
																
																	ID [<xsl:for-each select="SegmentRef[@ID='N1']/Element[@Pos = '03' $and$ @Value!='']">
																<xsl:value-of select='@Value' />
															</xsl:for-each>]=
																
																
																
																	<xsl:for-each select="SegmentRef[@ID='N1']/Element[@Pos = '04' $and$ @Value!='']">
																<xsl:value-of select='@Value' />
															</xsl:for-each>
																
															</TD>
													</xsl:if>
												</TR>
												<TR>
													<xsl:if test="SegmentRef[@ID='N1']/Element[(@Pos='02' $and$ @Value !='') ]">
														<TD Colspan="2">
															<xsl:for-each select="SegmentRef[@ID='N1']/Element[@Pos = '02']">
																<xsl:value-of select='@Value' />
															</xsl:for-each>
														</TD>
													</xsl:if>
												</TR>
												<TR>
													<xsl:if test="SegmentRef[@ID='N3']/Element[(@Pos='01' $and$ @Value !='') ]">
														<TD Colspan="2">
															<xsl:for-each select="SegmentRef[@ID='N3']/Element[@Pos = '01']">
																<xsl:value-of select='@Value' />
															</xsl:for-each>
														</TD>
													</xsl:if>
												</TR>
												<TR>
													<xsl:if test="SegmentRef[@ID='N3']/Element[(@Pos='02' $and$ @Value !='') ]">
														<TD Colspan="2">
															<xsl:for-each select="SegmentRef[@ID='N3']/Element[@Pos = '02']">
																<xsl:value-of select='@Value' />
															</xsl:for-each>
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
				</TD>
			</TR>
			<TR>
				<TD>
					<font color="white">'</font>
				</TD>
			</TR>
		</Table>
		<xsl:if test="SegmentRef[@ID = 'REF']/Element[@Pos = '01' $and$  (@Value = 'IA' $or$ @Value = 'DP' $or$ @Value = 'MR')]">
			<Table width='99%' Border='0' align="center" Cellspacing="1">
				<TR>
					<TD>
						<Table Border="0" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse">
							<TR>
								<TD>
									<Table Border="0" width="100%" bordercolor="black" id="RefTable" cellpadding="3" cellspacing="0">
										<TR bgcolor="#EDEDED">
											<TD colspan="2" width="89%">
												<Font color="#000000">
													<B>Reference</B>
												</Font>
											</TD>
											<TD Align="right"></TD>
										</TR>
										<xsl:for-each select="SegmentRef[@ID = 'REF']">
											<xsl:if test="Element[@Pos = '01' $and$  (@Value = 'IA' $or$ @Value = 'DP' $or$ @Value = 'MR')]">
												<TR>
													<TD>
														<xsl:for-each select="Element[@Pos = '01']">
															<xsl:choose>
																<xsl:when test="@Value[value()='IA']">IA Internal Vendor Number</xsl:when>
																<xsl:when test="@Value[value()='DP']">DP Department Number</xsl:when>
																<xsl:when test="@Value[value()='MR']">MR Merchandise Type Code</xsl:when>
															</xsl:choose>
														</xsl:for-each>
													</TD>
													<TD>
														<xsl:for-each select='Element[@Pos = "02"]'>
															<xsl:value-of select='@Value' />
														</xsl:for-each>
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
		</xsl:if>
		<xsl:if test="SegmentRef[@ID = 'ITD']/Element[(@Pos = '01' $and$ @Value!='') $or$ (@Pos = '02' $and$ @Value!='') $or$ (@Pos = '03' $and$ @Value!='') $or$ (@Pos = '07' $and$ @Value != '') $or$ (@Pos = '05' $and$ @Value != '') $or$ (@Pos = '08' $and$ @Value != '')]">
			<Table Border="0" width="99%" Align="center" bordercolor="black" cellspacing="1" cellpadding="0">
				<TR>
					<TD colspan="2" id="td_ITDHeader">
						<Table Border="0" width="100%" bordercolor="black" cellspacing="0" Cellpadding="0" style="Border-Collapse:Collapse">
							<TR>
								<TD>
									<Table Border="0" width="100%" cellpadding="3" cellspacing="0" ID='ITDTable_Header' style="border-collapse:collapse">
										<TR BGCOLOR="#EDEDED">
											<TD width="90%" VALIGN="TOP">
												<Font Color="#000000">
													<B>Terms of sale</B>
												</Font>
											</TD>
											<TD align='right'></TD>
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
															<TD nowrap="true">
																<xsl:for-each select="Element[@Pos='01' $and$ (@Value='02' $or$ @Value='05' $or$ @Value='08')]">
																	<xsl:choose>
																		<xsl:when test="@Value[value()='02']">02 End of Month</xsl:when>
																		<xsl:when test="@Value[value()='05']">05 Discount Not Applicable</xsl:when>
																		<xsl:when test="@Value[value()='08']">08 Basic Discount Offered</xsl:when>
																	</xsl:choose>
																</xsl:for-each>
															</TD>
															<TD nowrap="true">
																<b>Discount Percent</b>
															</TD>
															<TD width="1%" align="center">
																<B>:</B>
															</TD>
															<TD nowrap="true">
																<xsl:for-each select="Element[@Pos='03']">
																	<xsl:value-of select='@Value' />
																</xsl:for-each>
															</TD>
															<TD nowrap="true">
																<b>Basis Date Code</b>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD nowrap="true">
																<xsl:for-each select="Element[@Pos='02' $and$ (@Value='1' $or$ @Value='3' $or$ @Value='7' $or$ @Value='15')]">
																	<xsl:choose>
																		<xsl:when test="@Value[value()='1']">1 Ship Date</xsl:when>
																		<xsl:when test="@Value[value()='3']">3 Invoice Date</xsl:when>
																		<xsl:when test="@Value[value()='7']">7 Effective Date</xsl:when>
																		<xsl:when test="@Value[value()='15']">15 Receipt of Goods</xsl:when>
																	</xsl:choose>
																</xsl:for-each>
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
															<TD nowrap="true" width="15%">
																<b>Discount Days Due</b>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD width="15%">
																<xsl:for-each select="Element[@Pos='05']">
																	<xsl:value-of select='@Value' />
																</xsl:for-each>
															</TD>
															<TD nowrap="true" width="10%">
																<b>Net Days</b>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD width="15%">
																<xsl:for-each select="Element[@Pos='07']">
																	<xsl:value-of select='@Value' />
																</xsl:for-each>
															</TD>
															<TD nowrap="true" width="15%">
																<b>Discount Amount</b>
															</TD>
															<TD>
																<B>:</B>
															</TD>
															<TD>
																<xsl:for-each select="Element[@Pos='08']">
																	<xsl:value-of select='@Value' />
																</xsl:for-each>
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
																<xsl:for-each select="Element[@Pos='12']">
																	<xsl:value-of select='@Value' />
																</xsl:for-each>
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
		</xsl:if>
		<xsl:if test="SegmentRef[@ID = 'DTM']/Element[@Pos = '01' $and$  @Value!= '']">
			<Table width='99%' Border='0' align="center" Cellspacing="1">
				<TR>
					<TD ID="td_Dtm">
						<Table Border="0" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse">
							<TR>
								<TD>
									<Table Border="0" width="100%" bordercolor="black" cellpadding="3" cellspacing="0" id="DateTimeTable">
										<TR bgcolor="#EDEDED">
											<TD colspan="2" width="89%">
												<Font color="#000000">
													<B>Date/Time Details</B>
												</Font>
											</TD>
											<TD Align="right"></TD>
										</TR>
										<xsl:for-each select="SegmentRef[@ID = 'DTM']">
											<xsl:if test="Element[@Pos = '01' $and$  (@Value = '011' $or$ @Value = '007')]">
												<TR>
													<TD>
														<xsl:for-each select="Element[@Pos = '01']">
															<xsl:choose>
																<xsl:when test="@Value[value()='011']">011 Shipped</xsl:when>
																<xsl:when test="@Value[value()='007']">007 Effective</xsl:when>
																<xsl:otherwise>
																	<xsl:value-of select='@Value' />
																</xsl:otherwise>
															</xsl:choose>
														</xsl:for-each>
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
		</xsl:if>
		<xsl:if test="SegmentRef[@ID='FOB']/Element[@Pos = '01' $and$ @Value!= '']">
			<Table align="center" Border="0" width="99%" bordercolor="black" cellspacing="0" Cellpadding="1"
				style="Border-Collapse:Collapse">
				<TR>
					<TD>
						<Table Border="0" width="100%" bordercolor="black" cellpadding="3" cellspacing="0" style="Border-Collapse:Collapse">
							<TR bgcolor="#EDEDED">
								<TD width="70%">
									<B>
										<Font Color="#000000">FOB Instructions</Font>
									</B>
								</TD>
								<TD Align="right" nowrap="true"></TD>
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
												<xsl:for-each select="SegmentRef[@ID='FOB']/Element[@Pos = '01' $and$ (@Value = 'CC' $or$ @Value = 'PP')]">
													<xsl:choose>
														<xsl:when test="@Value[value()='CC']">CC Collect</xsl:when>
														<xsl:when test="@Value[value()='PP']">PP Prepaid(By Seller)</xsl:when>
													</xsl:choose>
												</xsl:for-each>
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
		</xsl:if>
		<Table width='99%' align="center" Border='0' Cellspacing="1">
			<TR>
				<TD>
					<Table Border="0" width="100%" align="center" bordercolor="black" cellspacing="0" cellpadding="0">
						<TR>
							<TD>
								<b>ITEM DETAILS</b>
							</TD>
							<TD Align="Right"></TD>
						</TR>
					</Table>
				</TD>
			</TR>
		</Table>
		<Table Border="0" width="99%" align="center" bordercolor="black" cellspacing="0" Cellpadding="1"
			style="Border-Collapse:Collapse">
			<TR>
				<TD>
					<Table id="ItemTable" Value="1" width="100%" align="center" border="0" style="Border-Collapse:Collapse"
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
											</TR>
											<TR>
												<TD>
													<!--<xsl:for-each select='PID-LOOP/SegmentRef[@ID="PID"]/Element[@Pos = "05"]'>
														<xsl:value-of select='@Value' />
													</xsl:for-each>-->
												</TD>
												<TD align="right">
													<INPUT TYPE="text" style="text-align:center;border-bottom:0;border-top:0;border-left:0;border-right:0;"
														readonly="true" Class="inputtext" size="9" name="IT1_IT1_02" maxlength="15">
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
											</TR>
											<TR>
												<TD colspan="4" ID="td_PSID_Detail">
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
																		</xsl:when>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="06" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<xsl:for-each select='Element[@Pos = "07"]'>
																				<xsl:value-of select='@Value' />
																			</xsl:for-each>
																		</xsl:when>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="08" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
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
																		</xsl:when>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="08" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<xsl:for-each select='Element[@Pos = "09"]'>
																				<xsl:value-of select='@Value' />
																			</xsl:for-each>
																		</xsl:when>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="10" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
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
																		</xsl:when>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="10" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<xsl:for-each select='Element[@Pos = "11"]'>
																				<xsl:value-of select='@Value' />
																			</xsl:for-each>
																		</xsl:when>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="12" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
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
																		</xsl:when>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="12" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<xsl:for-each select='Element[@Pos = "13"]'>
																				<xsl:value-of select='@Value' />
																			</xsl:for-each>
																		</xsl:when>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="14" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
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
																		</xsl:when>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="14" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<xsl:for-each select='Element[@Pos = "15"]'>
																				<xsl:value-of select='@Value' />
																			</xsl:for-each>
																		</xsl:when>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="16" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
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
																		</xsl:when>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="16" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<xsl:for-each select='Element[@Pos = "17"]'>
																				<xsl:value-of select='@Value' />
																			</xsl:for-each>
																		</xsl:when>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="18" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
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
																		</xsl:when>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="18" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<xsl:for-each select='Element[@Pos = "19"]'>
																				<xsl:value-of select='@Value' />
																			</xsl:for-each>
																		</xsl:when>
																	</xsl:choose>
																</TD>
															</TR>
															<TR>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="20" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
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
																		</xsl:when>
																	</xsl:choose>
																</TD>
																<TD>
																	<xsl:choose>
																		<xsl:when test='Element[@Pos="20" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
																			<xsl:for-each select='Element[@Pos = "21"]'>
																				<xsl:value-of select='@Value' />
																			</xsl:for-each>
																		</xsl:when>
																	</xsl:choose>
																</TD>
															</TR>
                              <TR>
                                <TD>
                                  <xsl:choose>
                                    <xsl:when test='Element[@Pos="22" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
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
                                    </xsl:when>
                                  </xsl:choose>
                                </TD>
                                <TD>
                                  <xsl:choose>
                                    <xsl:when test='Element[@Pos="22" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
                                      <xsl:for-each select='Element[@Pos = "23"]'>
                                        <xsl:value-of select='@Value' />
                                      </xsl:for-each>
                                    </xsl:when>
                                  </xsl:choose>
                                </TD>
                              </TR>
                              <TR>
                                <TD>
                                  <xsl:choose>
                                    <xsl:when test='Element[@Pos="24" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
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
                                    </xsl:when>
                                  </xsl:choose>
                                </TD>
                                <TD>
                                  <xsl:choose>
                                    <xsl:when test='Element[@Pos="24" $and$ (@Value="EN" $or$ @Value="IN" $or$ @Value="UI" $or$ @Value="UP" $or$ @Value="CH" $or$ @Value="LT" $or$ @Value="UK" $or$ @Value="ZZ")]'>
                                      <xsl:for-each select='Element[@Pos = "25"]'>
                                        <xsl:value-of select='@Value' />
                                      </xsl:for-each>
                                    </xsl:when>
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
												<TD colspan="4" ID="td_PO4_Detail">
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
																		<xsl:for-each select='SegmentRef[@ID="PO4"]/Element[@Pos = "01"]'>
																			<xsl:value-of select='@Value' />
																		</xsl:for-each>
																	</xsl:when>
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
																		<xsl:for-each select='SegmentRef[@ID="PO4"]/Element[@Pos = "14"]'>
																			<xsl:value-of select='@Value' />
																		</xsl:for-each>
																	</xsl:when>
																</xsl:choose>
															</TD>
														</TR>
													</Table>
												</TD>
											</TR>
											<TR>
												<TD colspan="4" ID="td_SAC_Detail">
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
																		<INPUT TYPE="text" name="IT1_SAC_SAC_01" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;" readonly="true" size="15">
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
																		<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_01" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;" readonly="true" size="15"></INPUT>
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
																		<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "02"]'>
																			<xsl:value-of select='@Value' />
																		</xsl:for-each>
																	</xsl:when>
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
																		<INPUT TYPE="text" name="IT1_SAC_SAC_05" Class="inputtext" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;" readonly="true" size="10">
																			<xsl:attribute name="value">
																				<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "05"]'>
																					<xsl:value-of select='@Value' />
																				</xsl:for-each>
																			</xsl:attribute>
																		</INPUT>
																	</xsl:when>
																	<xsl:otherwise>
																		<INPUT TYPE="text" Class="inputtext" name="IT1_SAC_SAC_05" style="text-align:left;border-bottom:0;border-top:0;border-left:0;border-right:0;" readonly="true" size="10"></INPUT>
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
																	</xsl:when>
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
																		<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "07"]'>
																			<xsl:value-of select='@Value' />
																		</xsl:for-each>
																	</xsl:when>
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
																		<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "12"]'>
																			<xsl:choose>
																				<xsl:when test="@Value[value()='02']">02 Off Invoice</xsl:when>
																				<xsl:when test="@Value[value()='06']">06 Paid by Customer</xsl:when>
																			</xsl:choose>
																		</xsl:for-each>
																	</xsl:when>
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
																		<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "08"]'>
																			<xsl:value-of select='@Value' />
																		</xsl:for-each>
																	</xsl:when>
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
																		<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "10"]'>
																			<xsl:value-of select='@Value' />
																		</xsl:for-each>
																	</xsl:when>
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
																		<xsl:for-each select='SAC-LOOP/SegmentRef[@ID="SAC"]/Element[@Pos = "09"]'>
																			<xsl:choose>
																				<xsl:when test="@Value[value()='CA']">CA Case</xsl:when>
																				<xsl:when test="@Value[value()='EA']">EA Each</xsl:when>
																			</xsl:choose>
																		</xsl:for-each>
																	</xsl:when>
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
			<xsl:if test="SegmentRef[@ID = 'TXI']/Element[(@Pos = '01' $and$ @Value!='') $or$ (@Pos = '02' $and$ @Value!='') $or$ (@Pos = '03' $and$ @Value!='') $or$ (@Pos = '04' $and$ @Value != '') $or$ (@Pos = '05' $and$ @Value != '') $or$ (@Pos = '09' $and$ @Value != '')]">
        <TR>
          <TD ID="td_TXI_SUMMARY">
            <Table Border="0" width="100%" Align="center" bordercolor="black" cellspacing="1" cellpadding="0">
              <TR>
                <TD colspan="2" id="td_TXIHeader">
                  <Table Border="0" width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse">
                    <TR>
                      <TD>
                        <Table Border="0" width="100%" cellpadding="3" cellspacing="3" ID='TXITable_Header' style="border-collapse:collapse">
                          <TR BGCOLOR="#EDEDED">
                            <TD width="90%" VALIGN="TOP">
                              <Font Color="#000000">
                                <B>Tax Information</B>
                              </Font>
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
                                  <TR id='TR_TXI_3'>
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
			</xsl:if>
			<xsl:if test="SegmentRef[@ID = 'CAD']/Element[(@Pos = '07' $and$ @Value!='') $or$ (@Pos = '01' $and$ @Value != '') $or$ (@Pos = '04' $and$ @Value != '') $or$ (@Pos = '05' $and$ @Value != '') $or$ (@Pos = '08' $and$ @Value != '')]">
				<TR>
					<TD ID="td_CAD_SUMMARY">
						<Table Border="0" Width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
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
                              <xsl:for-each select="SegmentRef[@ID = 'CAD']/Element[@Pos = '01' $and$ @Value!='']">
                                  <xsl:choose>
                                    <xsl:when test="@Value[value()='T']">T Best Way</xsl:when>
                                  </xsl:choose>
                              </xsl:for-each>
														</TD>
														<TD nowrap="true">
															<B>Standard Carrier Alpha Code :</B>
														</TD>
														<TD>
															<xsl:for-each select="SegmentRef[@ID = 'CAD']/Element[@Pos = '04']">
																<xsl:value-of select='@Value' />
															</xsl:for-each>
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
															<xsl:for-each select="SegmentRef[@ID = 'CAD']/Element[@Pos = '05']">
																<xsl:value-of select='@Value' />
															</xsl:for-each>
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
															<xsl:for-each select="SegmentRef[@ID = 'CAD']/Element[@Pos = '07' $and$ (@Value='BM' $or$ @Value='CN')]">
																<xsl:choose>
																	<xsl:when test="@Value[value()='BM']">BM Bill of Lading Number</xsl:when>
																	<xsl:when test="@Value[value()='CN']">CN Carriers Reference Number</xsl:when>
																</xsl:choose>
															</xsl:for-each>
														</TD>
														<TD nowrap="true">
															<B>Reference ID :</B>
														</TD>
														<TD>
															<xsl:for-each select="SegmentRef[@ID = 'CAD']/Element[@Pos = '08']">
																<xsl:value-of select='@Value' />
															</xsl:for-each>
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
			</xsl:if>
			<xsl:if test="SAC-LOOP/SegmentRef[@ID = 'SAC']/Element[(@Pos = '01' $and$ @Value != '') $or$ (@Pos = '05' $and$ @Value != '') $or$ (@Pos = '02' $and$ @Value != '') $or$ (@Pos = '06' $and$ @Value != '') $or$ (@Pos = '07' $and$ @Value != '') $or$ (@Pos = '08' $and$ @Value != '') $or$ (@Pos = '10' $and$ @Value != '') $or$ (@Pos = '09' $and$ @Value != '') $or$ (@Pos = '12' $and$ @Value != '')]">
				<TR>
					<TD ID="td_SAC_SUMMARY">
						<Table Border="0" Width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
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
											<TD align='right'></TD>
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
																	readonly="true" name="SAC_SAC_02">
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
																	readonly="true">
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
																<xsl:for-each select='Element[@Pos = "08"]'>
																	<xsl:value-of select='@Value' />
																</xsl:for-each>
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
																<xsl:for-each select='Element[@Pos = "09"]'>
																	<xsl:choose>
																		<xsl:when test="@Value[value()='CA']">CA Case</xsl:when>
																		<xsl:when test="@Value[value()='EA']">EA Each</xsl:when>
																	</xsl:choose>
																</xsl:for-each>
															</TD>
															<TD nowrap="true">
																<B>Handling Code</B>
															</TD>
															<TD>
																<INPUT TYPE="text" Class="inputtext" style="TEXT-ALIGN:left;BORDER-RIGHT: 0px; BORDER-TOP: 0px; BORDER-LEFT: 0px; BORDER-BOTTOM: 0px"
																	readonly="true" name="SAC_SAC_12">
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
																<xsl:for-each select='Element[@Pos = "10"]'>
																	<xsl:value-of select='@Value' />
																</xsl:for-each>
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
																<xsl:for-each select='Element[@Pos = "13"]'>
																	<xsl:value-of select='@Value' />
																</xsl:for-each>
															</TD>
															<TD>
																<font color="000000">
																	<b>Option No.</b>
																</font>
															</TD>
															<TD>
																<xsl:for-each select='Element[@Pos = "14"]'>
																	<xsl:value-of select='@Value' />
																</xsl:for-each>
															</TD>
															<TD nowrap="true">
																<B>Language Code</B>
															</TD>
															<TD>
																<xsl:for-each select='Element[@Pos = "16"]'>
																	<xsl:value-of select='@Value' />
																</xsl:for-each>
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
																<xsl:for-each select="Element[@Pos = '15']">
																	<xsl:value-of select='@Value' />
																</xsl:for-each>
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
			</xsl:if>
			<xsl:if test="ISS-LOOP/SegmentRef[@ID = 'ISS']/Element[(@Pos = '01' $and$ @Value != '') $or$ (@Pos = '02' $and$ @Value != '') $or$ (@Pos = '03' $and$ @Value != '') $or$ (@Pos = '04' $and$ @Value != '')]">
				<TR>
					<TD>
						<font color="white">'</font>
					</TD>
				</TR>
				<TR>
					<TD ID="td_ISS_SUMMARY">
						<Table Border="0" Width="100%" bordercolor="black" cellspacing="0" Cellpadding="1" style="Border-Collapse:Collapse"
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
											<TD align="right"></TD>
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
															<xsl:for-each select="ISS-LOOP/SegmentRef[@ID = 'ISS']/Element[@Pos='01' $and$ @Value!='']">
																<xsl:value-of select='@Value' />
															</xsl:for-each>
														</TD>
														<TD nowrap="true">
															<b>Mea. Code</b>
														</TD>
														<TD width="1%" align="center">
															<B>:</B>
														</TD>
														<TD>
															<xsl:for-each select="ISS-LOOP/SegmentRef[@ID = 'ISS']/Element[@Pos = '02']">
																<xsl:choose>
																	<xsl:when test="@Value[value()='CA']">CA Case</xsl:when>
																	<xsl:when test="@Value[value()='EA']">EA Each</xsl:when>
																</xsl:choose>
															</xsl:for-each>
														</TD>
														<TD nowrap="true">
															<b>Weight</b>
														</TD>
														<TD>
															<B>:</B>
														</TD>
														<TD>
															<xsl:for-each select="ISS-LOOP/SegmentRef[@ID = 'ISS']/Element[@Pos='03' $and$ @Value!='']">
																<xsl:value-of select='@Value' />
															</xsl:for-each>
														</TD>
														<TD nowrap="true">
															<b>Mea. Code</b>
														</TD>
														<TD width="1%" align="center">
															<B>:</B>
														</TD>
														<TD>
															<xsl:for-each select="ISS-LOOP/SegmentRef[@ID = 'ISS']/Element[@Pos = '04']">
																<xsl:choose>
																	<xsl:when test="@Value[value()='KG']">KG Kilogram</xsl:when>
																	<xsl:when test="@Value[value()='LB']">LB Pound</xsl:when>
																</xsl:choose>
															</xsl:for-each>
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
			</xsl:if>
		</Table>
	</xsl:template>
</xsl:stylesheet>