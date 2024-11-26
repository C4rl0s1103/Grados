<html>
     <head>
        <link rel="stylesheet" type="text/css"  href="empresas.css"/>
        <title>Empresas </title>
     </head>
       <body>
     <p><xsl:value-of select="empresas/empresa/nombre"/></p>
     <p><xsl:value-of select="empresas/empresa/web"/></p>
       </body>
</html>
