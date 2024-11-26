<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet 
	xmlns:xsl="http://www.w3.org/1999/XSL/Transform" 
	version="1.0">
<xsl:template match="/">
<html>
 <head>
	<title>Nota</title>
 
	<link rel="stylesheet" type="text/css"  
		  href="note.css"/>
 </head>
 <body>
	<p><xsl:value-of select="note/to"/></p>
	<p><xsl:value-of select="note/from"/></p>
	<p><xsl:value-of select="note/heading"/></p>
	<p><xsl:value-of select="note/body"/></p>
 </body>
</html>
</xsl:template>
</xsl:stylesheet>
