<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:xslthl="http://xslthl.sf.net"
	xmlns="http://www.w3.org/1999/xhtml"
	exclude-result-prefixes="xslthl"
	version="1.0">

	<xsl:import href="urn:docbkx:stylesheet/highlight.xsl"/>

	<xsl:template
		match="xslthl:keyword"
		mode="xslthl">
		<strong class="hl-keyword" style="color:#7F0055;">
			<xsl:apply-templates mode="xslthl" />
		</strong>
	</xsl:template>
	<xsl:template
		match="xslthl:string"
		mode="xslthl">
		<span class="hl-string">
			<span style="color:#2A00FF;">
				<xsl:apply-templates mode="xslthl" />
			</span>
		</span>
	</xsl:template>
	<xsl:template
		match="xslthl:comment"
		mode="xslthl">
		<span
			class="hl-comment"
			style="color: #3F7F5F;">
			<xsl:apply-templates mode="xslthl" />
		</span>
	</xsl:template>
	<xsl:template
		match="xslthl:directive"
		mode="xslthl">
		<span
			class="hl-directive"
			style="color: maroon">
			<xsl:apply-templates mode="xslthl" />
		</span>
	</xsl:template>
	<xsl:template
		match="xslthl:tag"
		mode="xslthl">
		<strong
			class="hl-tag"
			style="color: #7F0055">
			<xsl:apply-templates mode="xslthl" />
		</strong>
	</xsl:template>
	<xsl:template
		match="xslthl:attribute"
		mode="xslthl">
		<span
			class="hl-attribute"
			style="color: #F5844C">
			<xsl:apply-templates mode="xslthl" />
		</span>
	</xsl:template>
	<xsl:template
		match="xslthl:value"
		mode="xslthl">
		<span
			class="hl-value"
			style="color: #2A00FF">
			<xsl:apply-templates mode="xslthl" />
		</span>
	</xsl:template>
	<xsl:template
		match="xslthl:html"
		mode="xslthl">
		<span
			class="hl-html"
			style="color: navy; font-weight: bold">
			<xsl:apply-templates mode="xslthl" />
		</span>
	</xsl:template>
	<xsl:template
		match="xslthl:xslt"
		mode="xslthl">
		<strong style="color: #0066FF">
			<xsl:apply-templates mode="xslthl" />
		</strong>
	</xsl:template>
	<!-- Not emitted since XSLTHL 2.0 -->
	<xsl:template
		match="xslthl:section"
		mode="xslthl">
		<strong>
			<xsl:apply-templates mode="xslthl" />
		</strong>
	</xsl:template>
	<xsl:template
		match="xslthl:number"
		mode="xslthl">
		<span class="hl-number">
			<xsl:apply-templates mode="xslthl" />
		</span>
	</xsl:template>
	<xsl:template
		match="xslthl:annotation"
		mode="xslthl">
		<em>
			<span
				class="hl-annotation"
				style="color: gray">
				<xsl:apply-templates mode="xslthl" />
			</span>
		</em>
	</xsl:template>
	<!-- Not sure which element will be in final XSLTHL 2.0 -->
	<xsl:template
		match="xslthl:doccomment|xslthl:doctype"
		mode="xslthl">
		<strong
			class="hl-tag"
			style="color: blue">
			<xsl:apply-templates mode="xslthl" />
		</strong>
	</xsl:template>
</xsl:stylesheet>
