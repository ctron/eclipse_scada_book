<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	
  <xsl:import href="urn:docbkx:stylesheet" />
		
  <xsl:import href="highlight.xsl"/>
  <xsl:import href="../../../target/docbkx/template/titlepage/titlepage.epub3.xsl"/>

  <xsl:include href="../common.xsl"/>
  <xsl:include href="../common-html.xsl"/>

  <xsl:param name="toc.section.depth">3</xsl:param>
  
  <xsl:param name="section.label.includes.component.label">1</xsl:param>
  
  <xsl:param name="table.borders.with.css">1</xsl:param>
  <xsl:param name="default.table.frame">none</xsl:param>
  
  <xsl:param name="table.frame.border.style">solid</xsl:param>
  <xsl:param name="table.frame.border.thickness">2pt</xsl:param>
  <xsl:param name="table.frame.border.color">#AAAAAA</xsl:param>
  
  <xsl:param name="table.cell.border.color">white</xsl:param>
  <xsl:param name="table.cell.border.thickness">2.5pt</xsl:param>
  
</xsl:stylesheet>