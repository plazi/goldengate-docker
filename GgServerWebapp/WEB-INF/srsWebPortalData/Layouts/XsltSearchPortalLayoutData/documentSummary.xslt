<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:output method="xml" version="1.0" encoding="UTF-8" indent="yes"/>
	
	<!--xsl:template match="/results[not(./result)]">
		<table class="documentResultTable">
			<tr>
				<td class="searchErrorMessage">Your search did not return any results, sorry.</td>
			</tr>
		</table>
	</xsl:template-->
	
	<xsl:template match="/results">
		<table class="mainTable" width="100%">
			<xsl:choose>
				<xsl:when test="./result">
					<tr>
						<td class="mainTableHeader">Summary View for Document '<xsl:value-of select="./result[1]/@masterDocTitle"/>' (<xsl:value-of select="./@resultSize"/> Treatments)</td>
					</tr>
					<tr>
						<td class="mainTableBody">
							<table class="documentTable">
								<tr>
									<td class="documentTableHeader" colspan="2">Publication Data, Additional Information (status, external links, etc)</td>
								</tr>
								<tr>
									<td class="documentDataLabel">document citation</td>
									<td class="documentData">
										<xsl:value-of select="./result[1]/@docAuthor"/>, <xsl:value-of select="./result[1]/@docDate"/>, <xsl:value-of select="./result[1]/@masterDocTitle"/>, <xsl:value-of select="./result[1]/@docOrigin"/>: <xsl:value-of select="./result[1]/@masterPageNumber"/>-<xsl:value-of select="./result[1]/@masterLastPageNumber"/>
									</td>
								</tr>
								<tr>
									<td class="documentDataLabel">publication ID</td>
									<td class="documentData"><xsl:choose>
										<xsl:when test="./result[1]/subResults/bibRef/@extId"><xsl:choose>
											<xsl:when test="./result[1]/subResults/bibRef/@extIdType = 'DOI' and not(starts-with(./result[1]/subResults/bibRef/@extId, 'http://'))">http://dx.doi.org/</xsl:when>
											<xsl:when test="contains('ZooBank-Pub ZBK-Pub', ./result[1]/subResults/bibRef/@extIdType) and not(starts-with(./result[1]/subResults/bibRef/@extId, 'urn:lsid:'))">urn:lsid:zoobank.org:pub:</xsl:when>
										</xsl:choose><xsl:value-of select="./result[1]/subResults/bibRef/@extId"/></xsl:when>
										<xsl:when test="./result[1]/@ID-DOI"><xsl:value-of select="./result[1]/@ID-DOI"/></xsl:when>
										<xsl:when test="./result[1]/@ID-HNS-Pub"><xsl:value-of select="./result[1]/@ID-HNS-Pub"/></xsl:when>
										<xsl:when test="./result[1]/@ID-Pensoft-Pub"><xsl:value-of select="./result[1]/@ID-Pensoft-Pub"/></xsl:when>
										<xsl:when test="./result[1]/@ID-ZooBank-Pub"><xsl:value-of select="./result[1]/@ID-ZooBank-Pub"/></xsl:when>
										<xsl:when test="./result[1]/@ID-ZooBank"><xsl:value-of select="./result[1]/@ID-ZooBank"/></xsl:when>
										<xsl:when test="./result[1]/@ID-ZBK-Pub"><xsl:value-of select="./result[1]/@ID-ZBK-Pub"/></xsl:when>
										<xsl:when test="./result[1]/@ID-ZBK"><xsl:value-of select="./result[1]/@ID-ZBK"/></xsl:when>
										<xsl:when test="./result[1]/@ID-GNUB"><xsl:value-of select="./result[1]/@ID-GNUB"/></xsl:when>
										<xsl:when test="./result[1]/@ID-HDL"><xsl:value-of select="./result[1]/@ID-HDL"/></xsl:when>
										<xsl:when test="./result[1]/@ID-Handle"><xsl:value-of select="./result[1]/@ID-Handle"/></xsl:when>
										<xsl:when test="./result[1]/@extId"><xsl:value-of select="./result[1]/@extId"/></xsl:when>
										<xsl:when test="./result[1]/@*[starts-with(name(), 'ID-')]"><xsl:value-of select="./result[1]/@*[starts-with(name(), 'ID-')]"/></xsl:when>
									</xsl:choose></td>
								</tr>
								<tr>
									<td class="documentDataLabel">link to original citation</td>
									<td class="documentData">
										<xsl:choose>
											<xsl:when test="./result[1]/@docSource"><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="./result[1]/@docSource"/></xsl:attribute><xsl:value-of select="./result[1]/@docSource"/></a></xsl:when>
											<xsl:when test="./result[1]/@ID-DOI and starts-with(./result[1]/@ID-DOI, 'http')"><a target="_blank"><xsl:attribute name="href"><xsl:value-of select="./result[1]/@ID-DOI"/></xsl:attribute><xsl:value-of select="./result[1]/@ID-DOI"/></a></xsl:when>
											<xsl:when test="./result[1]/@ID-DOI"><a target="_blank"><xsl:attribute name="href">http://dx.doi.org/<xsl:value-of select="./result[1]/@ID-DOI"/></xsl:attribute>http://dx.doi.org/<xsl:value-of select="./result[1]/@ID-DOI"/></a></xsl:when>
											<!--xsl:when test="./result[1]/subResults/bibRef/@extId and ./result[1]/subResults/bibRef/@extIdType = 'DOI'"><xsl:if test="not(starts-with(./result[1]/subResults/bibRef/@extId, 'http://'))">http://dx.doi.org/</xsl:if><xsl:value-of select="./result[1]/subResults/bibRef/@extId"/></xsl:when-->
											<xsl:when test="./result[1]/subResults/bibRef/@extId and ./result[1]/subResults/bibRef/@extIdType = 'DOI'"><a target="_blank"><xsl:choose>
												<xsl:when test="starts-with(./result[1]/subResults/bibRef/@extId, 'http://')"><xsl:attribute name="href"><xsl:value-of select="./result[1]/subResults/bibRef/@extId"/></xsl:attribute><xsl:value-of select="./result[1]/subResults/bibRef/@extId"/></xsl:when>
												<xsl:otherwise><xsl:attribute name="href">http://dx.doi.org/<xsl:value-of select="./result[1]/subResults/bibRef/@extId"/></xsl:attribute>http://dx.doi.org/<xsl:value-of select="./result[1]/subResults/bibRef/@extId"/></xsl:otherwise>
											</xsl:choose></a></xsl:when>
											<xsl:otherwise><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
								<tr>
									<td class="documentDataLabel">document provided by</td>
									<td class="documentData"><xsl:choose>
										<xsl:when test="./result[1]/@checkinUser = 'pensoft'">
											<xsl:choose>
												<xsl:when test="translate(substring-before(./result[1]/@docOrigin, ' '), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'zookeys'"><xsl:element name="a"><xsl:attribute name="href">http://www.pensoft.net/journals/zookeys</xsl:attribute><xsl:attribute name="target">_blank</xsl:attribute>ZooKeys</xsl:element> by </xsl:when>
												<xsl:when test="translate(substring-before(./result[1]/@docOrigin, ' '), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'phytokeys'"><xsl:element name="a"><xsl:attribute name="href">http://www.pensoft.net/journals/phytokeys</xsl:attribute><xsl:attribute name="target">_blank</xsl:attribute>PhytoKeys</xsl:element> by </xsl:when>
												<xsl:when test="translate(substring-before(./result[1]/@docOrigin, ' '), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'mycokeys'"><xsl:element name="a"><xsl:attribute name="href">http://www.pensoft.net/journals/mycokeys</xsl:attribute><xsl:attribute name="target">_blank</xsl:attribute>MycoKeys</xsl:element> by </xsl:when>
												<xsl:when test="translate(substring-before(./result[1]/@docOrigin, ' '), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'comparative'"><xsl:element name="a"><xsl:attribute name="href">http://www.pensoft.net/journals/compcytogen</xsl:attribute><xsl:attribute name="target">_blank</xsl:attribute>Comparative Cytogenetics</xsl:element> by </xsl:when>
												<xsl:when test="translate(substring-before(./result[1]/@docOrigin, ' '), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'international'"><xsl:element name="a"><xsl:attribute name="href">http://www.pensoft.net/journals/ijm</xsl:attribute><xsl:attribute name="target">_blank</xsl:attribute>International Journal of Myriapodology</xsl:element> by </xsl:when>
												<xsl:when test="translate(substring-before(./result[1]/@docOrigin, ' '), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'journal'"><xsl:element name="a"><xsl:attribute name="href">http://www.pensoft.net/journals/jhr</xsl:attribute><xsl:attribute name="target">_blank</xsl:attribute>Journal of Hymenoptera Research </xsl:element> by </xsl:when>
												<xsl:when test="translate(substring-before(./result[1]/@docOrigin, ' '), 'ABCDEFGHIJKLMNOPQRSTUVWXYZ', 'abcdefghijklmnopqrstuvwxyz') = 'biodiversity'"><xsl:element name="a"><xsl:attribute name="href">http://www.pensoft.net/journals/bdj</xsl:attribute><xsl:attribute name="target">_blank</xsl:attribute>Biodiversity Data Journal </xsl:element> by </xsl:when>
											</xsl:choose><xsl:element name="a"><xsl:attribute name="href">http://www.pensoft.net</xsl:attribute><xsl:attribute name="target">_blank</xsl:attribute>Pensoft</xsl:element>
										</xsl:when>
										<xsl:otherwise><xsl:value-of select="concat(translate(substring(./result[1]/@checkinUser, 1, 1), 'abcdefghijklmnopqrstuvwxyz', 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'), substring(./result[1]/@checkinUser, 2))"/></xsl:otherwise>
									</xsl:choose></td>
								</tr>
								<tr>
									<td class="documentDataLabel">additional versions</td>
									<td class="documentData">
										<xsl:element name="a">
											<xsl:attribute name="href">./dwca/<xsl:value-of select="./result[1]/@masterDocId"/>.zip</xsl:attribute>
											<xsl:attribute name="target">_blank</xsl:attribute>
											DarwinCore Archive
										</xsl:element>
										<!--xsl:choose>
											<xsl:when test="./result[1]/@checkinUser = 'pensoft'"><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</xsl:when>
											<xsl:otherwise>
												<xsl:element name="a">
													<xsl:attribute name="href">./dwca/<xsl:value-of select="./result[1]/@masterDocId"/>.zip</xsl:attribute>
													<xsl:attribute name="target">_blank</xsl:attribute>
													DarwinCore Archive
												</xsl:element>
											</xsl:otherwise>
										</xsl:choose-->
									</td>
								</tr>
								<tr>
									<td class="documentDataLabel">distribution map</td>
									<td class="documentData">
										<xsl:choose>
											<xsl:when test="./externalLink[./@category = 'visualization']">
												<xsl:for-each select="./externalLink[./@category = 'visualization']">
													<xsl:apply-templates select="."/>
													<xsl:if test="./following-sibling::externalLink[./@category = 'visualization']">
														<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;<xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
													</xsl:if>
												</xsl:for-each>
											</xsl:when>
											<xsl:otherwise><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;</xsl:otherwise>
										</xsl:choose>
									</td>
								</tr>
							</table>
							<table class="documentTable">
								<tr><td class="documentTableHeader" colspan="4">List of Individual Treatments</td></tr>
								<tr>
									<td class="documentTableHeader">Scientific Name</td>
									<td class="documentTableHeader">Status</td>
									<td class="documentTableHeader">Pages</td>
									<td class="documentTableHeader">GoogleMaps</td>
								</tr>
								<!--xsl:apply-templates select="./result"/-->
								<xsl:for-each select="./result">
									<xsl:sort data-type="number" select="./@pageNumber" />
									<xsl:apply-templates select="."/>
								</xsl:for-each>
							</table>
						</td>
					</tr>
				</xsl:when>
				<xsl:otherwise>
					<tr>
						<td class="searchErrorMessage">This Document doesn't Seem to Exist in Plazi, Sorry!</td>
					</tr>
				</xsl:otherwise>
			</xsl:choose>
		</table>
	</xsl:template>
	
	<xsl:template match="result">
		<tr>
			<td class="documentTableBody" width="300">
				<a>
					<xsl:attribute name="href">./html/<xsl:value-of select="./@docId"/></xsl:attribute>
					<xsl:choose>
						<xsl:when test="./subResults/taxonomicName[./@isNomenclature][1]/@genus">
							<xsl:value-of select="./subResults/taxonomicName[./@isNomenclature][1]/@genus"/>
							<xsl:if test="./subResults/taxonomicName[./@isNomenclature][1]/@subGenus"> (<xsl:value-of select="./subResults/taxonomicName[./@isNomenclature][1]/@subGenus"/>)</xsl:if>
							<xsl:if test="./subResults/taxonomicName[./@isNomenclature][1]/@species"><xsl:value-of select="' '"/><xsl:value-of select="./subResults/taxonomicName[./@isNomenclature][1]/@species"/></xsl:if>
							<xsl:if test="./subResults/taxonomicName[./@isNomenclature][1]/@subSpecies"> subsp. <xsl:value-of select="./subResults/taxonomicName[./@isNomenclature][1]/@subSpecies"/></xsl:if>
							<xsl:if test="./subResults/taxonomicName[./@isNomenclature][1]/@variety"> var. <xsl:value-of select="./subResults/taxonomicName[./@isNomenclature][1]/@variety"/></xsl:if>
						</xsl:when>
						<xsl:when test="./subResults/taxonomicName[./@isNomenclature][1] and ./subResults/taxonomicName[./@isNomenclature][1]/text()">
							<xsl:value-of select="./subResults/taxonomicName[./@isNomenclature][1]"/>
						</xsl:when>
						<xsl:otherwise>
							<xsl:choose>
								<xsl:when test="./subResults/taxonomicName[1]/@genus">
									<xsl:value-of select="./subResults/taxonomicName[1]/@genus"/>
									<xsl:if test="./subResults/taxonomicName[1]/@subGenus"> (<xsl:value-of select="./subResults/taxonomicName[1]/@subGenus"/>)</xsl:if>
									<xsl:if test="./subResults/taxonomicName[1]/@species"><xsl:value-of select="' '"/><xsl:value-of select="./subResults/taxonomicName[1]/@species"/></xsl:if>
									<xsl:if test="./subResults/taxonomicName[1]/@subSpecies"> subsp. <xsl:value-of select="./subResults/taxonomicName[1]/@subSpecies"/></xsl:if>
									<xsl:if test="./subResults/taxonomicName[1]/@variety"> var. <xsl:value-of select="./subResults/taxonomicName[1]/@variety"/></xsl:if>
								</xsl:when>
								<xsl:when test="./subResults/taxonomicName[1] and ./subResults/taxonomicName[1]/text()">
									<xsl:value-of select="./subResults/taxonomicName[1]"/>
								</xsl:when>
								<xsl:otherwise>
									&lt;View Treatment&gt;
								</xsl:otherwise>
							</xsl:choose>
						</xsl:otherwise>
					</xsl:choose>
				</a>
			</td>
			<td class="documentTableBody" width="100">
				<xsl:value-of select="./subResults/taxonomicName[./@isNomenclature][1]/@status"/><xsl:text disable-output-escaping="yes">&amp;</xsl:text>nbsp;
			</td>
			<td class="documentTableBody" width="100" align="center"><xsl:value-of select="./@pageNumber"/><xsl:if test="not(./@pageNumber = ./@lastPageNumber)">-<xsl:value-of select="./@lastPageNumber"/></xsl:if></td>
			<td class="documentTableBody" width="200">
				<span class="externalLinkTableBody">
					<xsl:apply-templates select="./externalLink[./@linkerClassName = 'de.uka.ipd.idaho.goldenGateServer.plazi.materialsCitations.GoogleMapsLinker']"/>
				</span>
			</td>
		</tr>
	</xsl:template>
	
	<xsl:template match="externalLink">
		<a>
			<xsl:attribute name="title"><xsl:value-of select="./@title"/></xsl:attribute>
			<xsl:attribute name="target">_blank</xsl:attribute>
			<xsl:choose>
				<xsl:when test="./@href">
					<xsl:attribute name="href"><xsl:value-of select="./@href"/></xsl:attribute>
				</xsl:when>
				<xsl:otherwise>
					<xsl:attribute name="onclick"><xsl:value-of select="./@onclick"/></xsl:attribute>
				</xsl:otherwise>
			</xsl:choose>
			<xsl:choose>
				<xsl:when test="./@iconUrl">
					<img>
						<xsl:attribute name="alt"><xsl:value-of select="./@label"/></xsl:attribute>
						<xsl:attribute name="src"><xsl:value-of select="./@iconUrl"/></xsl:attribute>
					</img>
				</xsl:when>
				<xsl:otherwise>
					<xsl:value-of select="./@label"/>
				</xsl:otherwise>
			</xsl:choose>
		</a>
	</xsl:template>
</xsl:stylesheet>
