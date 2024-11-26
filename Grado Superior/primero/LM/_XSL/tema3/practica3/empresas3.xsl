<html>
    <head>
        <title>         </title>
        <link rel="stylesheet" type="text/css"  href="empresas3.css"/>
    </head>
    <body>
        <xsl:for-each select="empresas/empresa">
            <p class="rojo"><xsl:value-of select="nombre"/></p>    
            <p class="azul"><xsl:value-of select="web"/></p>    
        </xsl:for-each>
    </body>
</html>