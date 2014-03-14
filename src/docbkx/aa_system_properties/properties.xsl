<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns="http://docbook.org/ns/docbook" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:sp="urn:java:systemProperties"
	xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xi="http://www.w3.org/2001/XInclude" 
	xsi:schemaLocation="http://docbook.org/ns/docbook http://docbook.org/xml/5.0/xsd/docbook.xsd"
	>
	
	<xsl:output indent="yes" encoding="UTF-8"/>
	
   <xsl:template match="@*|node()">
        <xsl:copy>
            <xsl:apply-templates select="@*|node()" />
        </xsl:copy>
    </xsl:template>
	
	<xsl:template match="/">
	<section xmlns="http://docbook.org/ns/docbook" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:xi="http://www.w3.org/2001/XInclude" 
	xsi:schemaLocation="http://docbook.org/ns/docbook http://docbook.org/xml/5.0/xsd/docbook.xsd"
	version="5.0">

	<title>System properties</title>
	
	<para>
	The following is a non-complete list of system properties.
	</para>
	
	<variablelist>
		<xsl:apply-templates mode="toc" select="//sp:property">
			<xsl:sort select="@id" />
		</xsl:apply-templates>
	</variablelist>
	
	<xsl:apply-templates mode="detail" select="//sp:property">
		<xsl:sort select="@id" />
	</xsl:apply-templates>

</section>
	</xsl:template>
	
	<xsl:template match="sp:properties">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="sp:description">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="sp:default">
		<xsl:apply-templates/>
	</xsl:template>
	
	<xsl:template match="sp:property" mode="toc" >
		<varlistentry>
			<term><property>
				<xsl:element name="xref">
					<xsl:attribute name="linkend">
						<xsl:value-of select="concat('property_' , @id)"></xsl:value-of>
					</xsl:attribute>
				</xsl:element>
			 </property> – <xsl:value-of select="@type"/></term>
			<listitem>
				<para><xsl:value-of select="@short"/></para>
			</listitem>
		</varlistentry>
	</xsl:template>
	
	<xsl:template match="sp:property" mode="detail" >
		<xsl:element name="simplesect">
			<xsl:attribute name="xreflabel">
				<xsl:value-of select="@id"/>
			</xsl:attribute>
			<xsl:attribute name="xml:id">
				<xsl:value-of select="concat('property_',@id )"></xsl:value-of>
			</xsl:attribute>
			<xsl:element name="title">
				<xsl:value-of select="@id"/>
			</xsl:element>
			<para>
				<xsl:value-of select="@short"/>
			</para>
			<xsl:if test="@type | sp:default | @default">
				<variablelist>
					<xsl:if test="@type">
						<varlistentry>
							<term>Value Type</term>
							<listitem>
							<para><xsl:value-of select="@type"/></para>
							</listitem>
						</varlistentry>
					</xsl:if>
					<xsl:choose>
						<xsl:when test="sp:default">
						<varlistentry>
							<term>Default value</term>
							<listitem>
							<xsl:apply-templates select="sp:default"/>
							</listitem>					
						</varlistentry>
						</xsl:when>
						<xsl:when test="@default">
						<varlistentry>
							<term>Default value</term>
							<listitem>
							<para><xsl:value-of select="@default"/></para>
							</listitem>					
						</varlistentry>
						</xsl:when>
					</xsl:choose>
				</variablelist>
			</xsl:if>
			<xsl:apply-templates select="sp:description"/>
		</xsl:element>
	</xsl:template>
	
</xsl:stylesheet>