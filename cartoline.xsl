<?xml version="1.0" encoding="UTF-8" ?> 
<xsl:stylesheet version="2.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" version="1.0" indent="yes"/> 
    <xsl:template match="/">
        <html>
        <head>
        <link rel="stylesheet" type="text/css" href="style.css" />
        <script src="js.js"></script>

        <title>
            <xsl:value-of select="TEI/teiHeader/fileDesc/titleStmt/title" />
        </title>
        </head>
        <body>
      
            <div id="header">
                <h1> Cartoline dal passato </h1>
                <ul id="menu">
	                <li id="menu0"><a href="cartoline.html"> Home</a></li>
	                <li id="menu1"><a>Cartolina n.40</a></li>
	                <li id="menu2"><a>Cartolina n.50</a></li>
	                <li id="menu3"><a>Cartolina n.223</a></li>
	                <li id="menu4"><a href="#about">About</a></li>
                </ul>
            </div>

            <div id="intro">
	            <p>"<b>Cartoline dal passato</b>" è un progetto realizzato per l'esame di Codifica di testi della facoltà di Informatica Umanisitica dell'Università di Pisa.<br/>
	            Consiste nella <b>digitalizzazione di cartoline</b> appartenenti a una collezione comprendente 227 pezzi conservata nel <b>Museo Civico Etnografico "Giovanni Podenzana"</b>, Sezione dei cimeli garibaldini e della Prima Guerra Mondiale.<br/>
	            Qui di seguito troverete l'edizione digitale delle cartoline n.<b>40</b>, n.<b>50</b> e n.<b>223</b>.<br/><br/>
	            <b>Indicazioni:</b> Trascinate il cursore sul retro della cartolina per leggere il contenuto corrispondente.</p>
	        </div>

	        <br/>

            <xsl:template match="note"> 
            </xsl:template> 

            


        </body>
        </html>
    </xsl:template>

</xsl:stylesheet>