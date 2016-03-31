<xsl:stylesheet version="1.0"
				xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:date="http://exslt.org/dates-and-times"
                xmlns:d="http://docbook.org/ns/docbook"
                exclude-result-prefixes="date">

  <!-- imports the original docbook stylesheet -->
  <xsl:import href="urn:docbkx:stylesheet"/>

  <!-- set bellow all your custom xsl configuration -->
	<xsl:import href="demo_titlepages.xsl" />
	  

  <!--
    AsciiDoc compatibility
  -->

  <xsl:template match="processing-instruction('asciidoc-br')">
    <fo:block/>
  </xsl:template>

  <xsl:template match="processing-instruction('asciidoc-hr')">
    <fo:block space-after="1em">
      <fo:leader leader-pattern="rule" rule-thickness="0.5pt" rule-style="solid" leader-length.minimum="100%"/>
    </fo:block>
  </xsl:template>

  <xsl:template match="processing-instruction('asciidoc-pagebreak')">
    <fo:block break-after='page'/>
  </xsl:template>

 


	  <!-- <xsl:param name="paper.type" select="'A4'" /> -->
	  <xsl:param name="chapter.autolabel" select="'1'" />
	  <xsl:param name="section.autolabel" select="'1'" />
	  <xsl:param name="section.label.includes.component.label" select="'1'" />
	  <xsl:param name="body.font.master" select="'12'" />
	  <xsl:param name="header.image.filename" select="'AsciiDoctorLogoSmall.jpeg'" />
	  <xsl:param name="region.before.extent">2cm</xsl:param>
	  <xsl:param name="header.column.widths">2 0 4</xsl:param>
	  <xsl:param name="footer.column.widths">1 4 1</xsl:param>
	  <xsl:param name="awl.company.confidential" select="'Company Confidential'"/>
	  <xsl:param name="awl.internal" select="'Internal'"/>
	  
	  <xsl:param name="local.l10n.xml" select="document('')"/>
	  
	  <l:i18n xmlns:l="http://docbook.sourceforge.net/xmlns/l10n/1.0">
	    <l:l10n language="en">
	      <l:gentext key="Revision" text="Version: "/>
	      <l:gentext key="revision" text="Version: "/>
	    </l:l10n>
	  </l:i18n>
	  
	  <xsl:attribute-set name="header.content.properties">
	    <xsl:attribute name="font-family">Helvetica</xsl:attribute>
	    <xsl:attribute name="font-size">10pt</xsl:attribute>
	  </xsl:attribute-set>
	  
	  <xsl:attribute-set name="footer.content.properties">
	    <xsl:attribute name="font-family">Helvetica</xsl:attribute>
	    <xsl:attribute name="font-size">10pt</xsl:attribute>
	  </xsl:attribute-set>
	  
	  <xsl:attribute-set name="component.title.properties">
	    <xsl:attribute name="color">#003058</xsl:attribute>
	    <xsl:attribute name="font-size">
	      <xsl:value-of select="$body.font.master * 2.0"/>
	      <xsl:text>pt</xsl:text>
	    </xsl:attribute>
	  </xsl:attribute-set>

	  <xsl:attribute-set name="section.title.properties">
	    <xsl:attribute name="color">#003058</xsl:attribute>
	  </xsl:attribute-set>
 
	  <xsl:attribute-set name="section.title.level1.properties">
	    <xsl:attribute name="space-before.minimum">30pt</xsl:attribute>
 	    <xsl:attribute name="space-before.optimum">35pt</xsl:attribute>
	    <xsl:attribute name="space-before.maximum">45pt</xsl:attribute>
	    <xsl:attribute name="font-size">
	      <xsl:value-of select="$body.font.master * 1.4"/>
	      <xsl:text>pt</xsl:text>
	    </xsl:attribute>
	  </xsl:attribute-set>
	  
	  <xsl:attribute-set name="section.title.level2.properties">
	    <xsl:attribute name="font-size">
	      <xsl:value-of select="$body.font.master * 1.2"/>
	      <xsl:text>pt</xsl:text>
	    </xsl:attribute>
	  </xsl:attribute-set>
	  
	  <xsl:attribute-set name="section.title.level3.properties">
	    <xsl:attribute name="font-size">
	      <xsl:value-of select="$body.font.master * 1.0"/>
	      <xsl:text>pt</xsl:text>
	    </xsl:attribute>
	  </xsl:attribute-set>
	  
	  <xsl:attribute-set name="section.title.level4.properties">
	    <xsl:attribute name="font-size">
	      <xsl:value-of select="$body.font.master * 1.0"/>
	      <xsl:text>pt</xsl:text>
	    </xsl:attribute>
	    <xsl:attribute name="color">#3080A8</xsl:attribute>
	  </xsl:attribute-set>
	  
	  <xsl:attribute-set name="section.title.level5.properties">
	    <xsl:attribute name="font-size">
	      <xsl:value-of select="$body.font.master * 1.0"/>
	      <xsl:text>pt</xsl:text>
	      <xsl:attribute name="color">#3080A8</xsl:attribute>
	    </xsl:attribute>
	  </xsl:attribute-set>
  
	  <xsl:attribute-set name="abstract.properties">
	      <xsl:attribute name="font-style">italic</xsl:attribute>
              <xsl:attribute name="start-indent">0.0cm</xsl:attribute>
              <xsl:attribute name="end-indent">0.0cm</xsl:attribute>
			<xsl:attribute name="line-height">
	         	<xsl:value-of select="$body.font.master * 1.2"/>
	         	<xsl:text>pt</xsl:text>
			</xsl:attribute>
	      <xsl:attribute name="font-size">
	         <xsl:value-of select="$body.font.master * 1.2"/>
	         <xsl:text>pt</xsl:text>
	      </xsl:attribute>
	  </xsl:attribute-set>
	  
	<!--  <xsl:param name="generate.toc"/> 
          <xsl:param name="process.empty.source.toc" select="1"/> --> 
	  
	  <xsl:attribute-set name="abstract.title.properties">
		<xsl:attribute name="space-before.optimum">60pt</xsl:attribute>
		<xsl:attribute name="space-before.minimum">50pt</xsl:attribute>
		<xsl:attribute name="space-before.maximum">70pt</xsl:attribute>
           </xsl:attribute-set>
	  
	  <xsl:attribute-set name="revhistory.table.cell.properties">
	    <xsl:attribute name="border">0.5pt solid gray</xsl:attribute>
	    <xsl:attribute name="padding">3pt</xsl:attribute>
	    <!-- <xsl:attribute name="background-color">#EEEEFE</xsl:attribute> -->
	    <!-- <xsl:attribute name="width">50%</xsl:attribute> -->
	  </xsl:attribute-set>
	  
	  <xsl:attribute-set name="revhistory.table.properties">
	    <xsl:attribute name="border">0.5pt solid gray</xsl:attribute>
	    <!-- <xsl:attribute name="background-color">#EEEEFE</xsl:attribute>
	    <xsl:attribute name="width">50%</xsl:attribute> -->
	    <xsl:attribute name="space-before">0.7em</xsl:attribute>
	    <xsl:attribute name="space-after">0.7em</xsl:attribute>
	    <xsl:attribute name="font-family">Helvetica</xsl:attribute>
	    <xsl:attribute name="font-size">
	      <xsl:value-of select="$body.font.master * 0.75"/>
	      <xsl:text>pt</xsl:text>
	    </xsl:attribute>
	  </xsl:attribute-set>

    <xsl:attribute-set name="formal.title.properties">
      <xsl:attribute name="color">#003058</xsl:attribute>
    </xsl:attribute-set>
	  
	  <xsl:attribute-set name="table.properties"
	    use-attribute-sets="formal.object.properties">
	    <xsl:attribute name="font-family">Helvetica</xsl:attribute>
	    <xsl:attribute name="font-size">
	      <xsl:value-of select="$body.font.master * 0.8"/>
	      <xsl:text>pt</xsl:text>
	    </xsl:attribute>
	  </xsl:attribute-set>

	  <xsl:attribute-set name="list.item.spacing">
	    <xsl:attribute name="space-before.optimum">0.0em</xsl:attribute>
	    <xsl:attribute name="space-before.minimum">0.0em</xsl:attribute>
	    <xsl:attribute name="space-before.maximum">0.2em</xsl:attribute>
	  </xsl:attribute-set>
	  
	<xsl:attribute-set name="list.block.properties">
		<xsl:attribute name="margin-left">
		<xsl:choose>
			<xsl:when test="count(ancestor::listitem)">inherit</xsl:when>
			<xsl:otherwise>1.5em</xsl:otherwise>
		</xsl:choose>
		</xsl:attribute>
	</xsl:attribute-set>
<!--	
	<xsl:template name="table.of.contents.titlepage" priority="1">
  <fo:block xsl:use-attribute-sets="section.title.level1.properties"
            space-before="2in"
            space-before.conditionality="retain"
            space-after="12pt"
            border-bottom="0.5pt solid black">
    <xsl:call-template name="gentext">
      <xsl:with-param name="key" select="'TableofContents'"/>
    </xsl:call-template>
  </fo:block>
</xsl:template>
-->
	  <xsl:template name="header.content">
	    <xsl:param name="pageclass" select="''"/>
	    <xsl:param name="sequence" select="''"/>
	    <xsl:param name="position" select="''"/>
	    <xsl:param name="gentext-key" select="''"/>
	    
	    <fo:block>
	      <!-- sequence can be odd, even, first, blank -->
	      <!-- position can be left, center, right -->
	      <xsl:choose>
	        <!-- <xsl:when test="$sequence = 'odd' and $position = 'left'">
	          <fo:retrieve-marker retrieve-class-name="section.head.marker"
	                              retrieve-position="first-including-carryover"
	                              retrieve-boundary="page-sequence"/>
	        </xsl:when> -->
	        <xsl:when test="$pageclass = 'titlepage'">
	        </xsl:when>
	        <xsl:when test="$pageclass = 'lot' and $position = 'right'">
	          <xsl:apply-templates select="." mode="object.title.markup"/>
	        </xsl:when>
	        <xsl:when test="$pageclass = 'lot' and $position = 'left'">
	          <fo:external-graphic content-height="0.8cm">
	            <xsl:attribute name="src">
	              <xsl:call-template name="fo-external-image">
	                <xsl:with-param name="filename" select="$header.image.filename"/>
	              </xsl:call-template>
	            </xsl:attribute>
	          </fo:external-graphic>
	        </xsl:when>
	        <xsl:when test="$pageclass = 'body' and $position = 'right'">
	          <xsl:apply-templates select="." mode="object.title.markup"/>
	        </xsl:when>
	        <xsl:when test="$pageclass = 'body' and $position = 'left'">
	          <fo:external-graphic content-height="0.8cm">
	            <xsl:attribute name="src">
	              <xsl:call-template name="fo-external-image">
	                <xsl:with-param name="filename" select="$header.image.filename"/>
	              </xsl:call-template>
	            </xsl:attribute>
	          </fo:external-graphic>
	        </xsl:when>
	        <xsl:when test="$pageclass = 'back' and $position = 'right'">
	          <xsl:apply-templates select="." mode="object.title.markup"/>
	        </xsl:when>
	        <xsl:when test="$pageclass = 'back' and $position = 'left'">
	          <fo:external-graphic content-height="0.8cm">
	            <xsl:attribute name="src">
	              <xsl:call-template name="fo-external-image">
	                <xsl:with-param name="filename" select="$header.image.filename"/>
	              </xsl:call-template>
	            </xsl:attribute>
	          </fo:external-graphic>
	        </xsl:when>
	      </xsl:choose>
	    </fo:block>            
	  </xsl:template>

	  <xsl:template name="footer.content">
	    <xsl:param name="pageclass" select="''"/>
	    <xsl:param name="sequence" select="''"/>
	    <xsl:param name="position" select="''"/>
	    <xsl:param name="gentext-key" select="''"/>
	    
	    <fo:block>
	      <!-- sequence can be odd, even, first, blank -->
	      <!-- position can be left, center, right -->
	      <xsl:choose>
	        <!-- <xsl:when test="$sequence = 'odd' and $position = 'left'">
	          <fo:retrieve-marker retrieve-class-name="section.head.marker"
	                              retrieve-position="first-including-carryover"
	                              retrieve-boundary="page-sequence"/>
	        </xsl:when> -->
	        <xsl:when test="$pageclass = 'titlepage'">
	        </xsl:when>
	        <xsl:when test="$pageclass = 'lot' and $position = 'left'">
	          <xsl:call-template name="datetime.format">
	            <xsl:with-param name="date" select="date:date-time()"/>
	            <xsl:with-param name="format" select="'Y-m-d'"/>
	          </xsl:call-template>        
	        </xsl:when>
	        <xsl:when test="$pageclass = 'lot' and $position = 'center'">
	          <xsl:value-of select="$awl.internal"/>
	        </xsl:when>
	        <xsl:when test="$pageclass = 'lot' and $position = 'right'">
	          <xsl:text>Page </xsl:text>
	          <fo:page-number/>
	          <!-- <xsl:text> of </xsl:text>
	          <fo:page-number-citation ref-id="END-OF-DOCUMENT"/> -->
	        </xsl:when>
	        <xsl:when test="$pageclass = 'body' and $position = 'left'">
	          <xsl:call-template name="datetime.format">
	            <xsl:with-param name="date" select="date:date-time()"/>
	            <xsl:with-param name="format" select="'Y-m-d'"/>
	          </xsl:call-template>        
	        </xsl:when>
	        <xsl:when test="$pageclass = 'body' and $position = 'center'">
	          <xsl:value-of select="$awl.internal"/>
	        </xsl:when>
	        <xsl:when test="$pageclass = 'body' and $position = 'right'">
	          <xsl:text>Page </xsl:text>
	          <fo:page-number/>
	          <!-- <xsl:text> of </xsl:text>
	          <fo:page-number-citation ref-id="END-OF-DOCUMENT"/> -->
	        </xsl:when>
	        <xsl:when test="$pageclass = 'back' and $position = 'left'">
	          <xsl:call-template name="datetime.format">
	            <xsl:with-param name="date" select="date:date-time()"/>
	            <xsl:with-param name="format" select="'Y-m-d'"/>
	          </xsl:call-template>        
	        </xsl:when>
	        <xsl:when test="$pageclass = 'back' and $position = 'center'">
	          <xsl:value-of select="$awl.internal"/>
	        </xsl:when>
	        <xsl:when test="$pageclass = 'back' and $position = 'right'">
	          <xsl:text>Page </xsl:text>
	          <fo:page-number/>
	          <!-- <xsl:text> of </xsl:text>
	          <fo:page-number-citation ref-id="END-OF-DOCUMENT"/> -->
	        </xsl:when>
	      </xsl:choose>
	    </fo:block>            
	  </xsl:template>

	<xsl:template match="d:revhistory" mode="titlepage.mode">

	  <xsl:variable name="explicit.table.width">
	    <xsl:call-template name="pi.dbfo_table-width"/>
	  </xsl:variable>

	  <xsl:variable name="table.width">
	    <xsl:choose>
	      <xsl:when test="$explicit.table.width != ''">
	        <xsl:value-of select="$explicit.table.width"/>
	      </xsl:when>
	      <xsl:when test="$default.table.width = ''">
	        <xsl:text>100%</xsl:text>
	      </xsl:when>
	      <xsl:otherwise>
	        <xsl:value-of select="$default.table.width"/>
	      </xsl:otherwise>
	    </xsl:choose>
	  </xsl:variable>

	  <!-- 20111223 mpo Chgd to 4 columns side-by-side -->
	 <fo:table table-layout="fixed" width="{$table.width}" xsl:use-attribute-sets="revhistory.table.properties">
	    <fo:table-column column-number="1" column-width="proportional-column-width(1.5)"/>
	    <fo:table-column column-number="2" column-width="proportional-column-width(1.5)"/>
	    <fo:table-column column-number="3" column-width="proportional-column-width(1)"/>
	    <fo:table-column column-number="4" column-width="proportional-column-width(4)"/>
	    <fo:table-body start-indent="0pt" end-indent="0pt">
	      <fo:table-row>
	        <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="revhistory.table.cell.properties">
	          <fo:block xsl:use-attribute-sets="revhistory.title.properties">
	      <xsl:choose>
	        <xsl:when test="d:title|d:info/d:title">
	    <xsl:apply-templates select="d:title|d:info/d:title" mode="titlepage.mode"/>
	        </xsl:when>
	        <xsl:otherwise>
	    <xsl:call-template name="gentext">
	      <xsl:with-param name="key" select="'RevHistory'"/>
	    </xsl:call-template>
	        </xsl:otherwise>
	      </xsl:choose>
	    </fo:block>
	        </fo:table-cell>
	      </fo:table-row>
	      <xsl:apply-templates select="*[not(self::d:title)]" mode="titlepage.mode"/>
	    </fo:table-body>
	  </fo:table>

	</xsl:template>

	<xsl:template match="d:revhistory/d:revision" mode="titlepage.mode">
	  <xsl:variable name="revnumber" select="d:revnumber"/>
	  <xsl:variable name="revdate"   select="d:date"/>
	  <xsl:variable name="revauthor" select="d:authorinitials|d:author"/>
	  <xsl:variable name="revremark" select="d:revremark|d:revdescription"/>
	  <fo:table-row>
	    <fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
	      <fo:block>
	        <xsl:if test="$revnumber">
	          <xsl:call-template name="gentext">
	            <xsl:with-param name="key" select="'Revision'"/>
	          </xsl:call-template>
	          <xsl:call-template name="gentext.space"/>
	          <xsl:apply-templates select="$revnumber[1]" mode="titlepage.mode"/>
	        </xsl:if>
	      </fo:block>
	    </fo:table-cell>
	    <fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
	      <fo:block>
	        <xsl:apply-templates select="$revdate[1]" mode="titlepage.mode"/>
	      </fo:block>
	    </fo:table-cell>
	    <fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
	      <fo:block>
	        <xsl:for-each select="$revauthor">
	          <xsl:apply-templates select="." mode="titlepage.mode"/>
	          <xsl:if test="position() != last()">
	            <xsl:text>, </xsl:text>
	          </xsl:if>
	        </xsl:for-each>
	      </fo:block>
	    </fo:table-cell>
	    <!-- include revremark as 4th column in table, rather that separate line in original -->
	    <fo:table-cell xsl:use-attribute-sets="revhistory.table.cell.properties">
	      <fo:block>
	        <xsl:apply-templates select="$revremark[1]" mode="titlepage.mode"/>
	      </fo:block>
	    </fo:table-cell>
	  </fo:table-row>
	</xsl:template>

  

  <!--
    Important links:
    - http://www.sagehill.net/docbookxsl/
    - http://docbkx-tools.sourceforge.net/
  -->

</xsl:stylesheet>
