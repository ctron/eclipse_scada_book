<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE xsl:stylesheet [
]>

<xsl:stylesheet version="1.0"
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
	<xsl:import href="../../docbook-xsl-1.78.1/epub3/chunk.xsl" />
	
	<!-- fixes some validation errors, no idea why -->
	<xsl:param name="root.is.a.chunk" select="0"/>
	
</xsl:stylesheet>
