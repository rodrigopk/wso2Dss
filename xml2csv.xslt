<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="iso-8859-1"/>

<xsl:strip-space elements="*" />

 <xsl:template match="node()|@*" name="identity">
  <xsl:copy>
   <xsl:apply-templates select="node()|@*"/>
  </xsl:copy>
 </xsl:template>

 <xsl:template match="/">
   <xsl:text>id,name,email,role</xsl:text>
   <xsl:text>&#xa;</xsl:text>
   <xsl:call-template name="identity"/>
 </xsl:template>

<xsl:template match="/*/child::*">
 <xsl:for-each select="child::*">
  <xsl:if test="position() != last()"><xsl:value-of select="normalize-space(.)"/>,</xsl:if>
  <xsl:if test="position()  = last()"><xsl:value-of select="normalize-space(.)"/><xsl:text> 
</xsl:text></xsl:if>
</xsl:for-each>
</xsl:template>

</xsl:stylesheet>