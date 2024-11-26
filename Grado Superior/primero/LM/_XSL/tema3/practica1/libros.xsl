<?xml version="1.0" encoding="iso-8859-1"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<html>
    <head>
        <title>         </title>
        <link rel="stylesheet" type="text/css"  href="libros.css"/>
    </head>
    <body>
            <p><xsl:value-of select="listalibros/libros/titulo"/></p>
            <p><xsl:value-of select="listalibros/libros/autor"/></p>
        </body>
    </html>
</xsl:template>
</xsl:stylesheet>