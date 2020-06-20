<?xml version="1.0" encoding="UTF-8" ?> 
    <xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/> 
    
    <xsl:template match="/">
        <html>
            <head>

                <title>
                    <xsl:value-of select="//tei:title"/>
                </title>

                <link rel="stylesheet" type="text/css" href="style.css" />
                <link href="https://fonts.googleapis.com/css?family=Quicksand" rel="stylesheet"/>
                <link href="https://fonts.googleapis.com/css?family=Varela+Round" rel="stylesheet"/>

                <script src="script.js"></script>

            </head>

            <body>

                <div id="header">
                    <h1> Cartoline dal passato </h1>

                    <ul id="menu">
	                    <li id="menu0"><a href="main.html"> Home</a></li>
	                    <li id="menu1"><a>Cartolina n.40</a></li>
	                    <li id="menu2"><a>Cartolina n.50</a></li>
	                    <li id="menu3"><a>Cartolina n.223</a></li>
	                    <li id="menu4"><a href="#about">About</a></li>
                    </ul>
                </div>

	            <div id="intro">
	                <p>
                        "<b>Cartoline dal passato</b>" è un progetto realizzato per l'esame di Codifica di testi della facoltà di Informatica Umanisitica dell'Università di Pisa.
	                    Consiste nella <b>digitalizzazione di cartoline</b> appartenenti a una collezione comprendente 227 pezzi conservata nel <b>Museo Civico Etnografico "Giovanni Podenzana"</b>, Sezione dei cimeli garibaldini e della Prima Guerra Mondiale.<br/>
	                    Qui di seguito troverete l'edizione digitale delle cartoline n.<b>40</b>, n.<b>50</b> e n.<b>223</b>.<br/>
	                    <b>Indicazioni:</b> Trascinare il cursore sul retro della cartolina per leggere il contenuto corrispondente.
                    </p>
	            </div>

                <xsl:for-each select="//tei:TEI">
                    <xsl:variable name="car" select="@xml:id"/>
                    <xsl:element name="div">
                        <xsl:attribute name="id">cartolina_<xsl:value-of select="$car"/></xsl:attribute>
                        <h2>Cartolina n.<xsl:value-of select="tei:text//tei:div[@type='details']//tei:idno"/></h2>
                        <xsl:element name="div">
                            <xsl:attribute name="id">tasti</xsl:attribute>
                            <xsl:element name="button">
                                <xsl:attribute name="id">fronteT<xsl:value-of select="$car"/></xsl:attribute>
                                <xsl:attribute name="class">tasti</xsl:attribute>
                                fronte
                            </xsl:element>
                            <xsl:element name="button">
                                <xsl:attribute name="id">retroT<xsl:value-of select="$car"/></xsl:attribute>
                                <xsl:attribute name="class">tasti</xsl:attribute>
                                retro
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="div">
                            <xsl:attribute name="id">fronte<xsl:value-of select="$car"/></xsl:attribute>
                            <xsl:apply-templates select="tei:text//tei:graphic"/>
                            <xsl:element name="div">
                                <xsl:attribute name="class">fronte</xsl:attribute>
                                <xsl:apply-templates select="tei:teiHeader//tei:bibl"/>
                                <xsl:apply-templates select="tei:text//tei:figure"/>
                                <xsl:if test="$car='C1' or $car='C3'">
                                    <xsl:apply-templates select="tei:teiHeader//tei:notesStmt"/>
                                </xsl:if>
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="div">
                            <xsl:attribute name="id">retro<xsl:value-of select="$car"/></xsl:attribute>
                            <xsl:apply-templates select="tei:facsimile/tei:surface"/>
                            <xsl:element name="div">
                                <xsl:attribute name="class">retro</xsl:attribute>
                                <xsl:apply-templates select="tei:text//tei:div[@type='retro']"/>
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>

                <div id="about">
                
	                <div id="about1">
		                <h2>About</h2>

		                <h3>Edizione digitale:</h3>

                        <p>
                            <b><xsl:value-of select="//tei:resp[@xml:id='trascr']"/>: </b><xsl:value-of select="//tei:name[@xml:id='CC']"/>, <xsl:value-of select="//tei:name[@xml:id='EP']"/><br/>
		                    <b><xsl:value-of select="//tei:resp[@xml:id='ente']"/>: </b><xsl:value-of select="//tei:name[@xml:id='CSP']"/><br/>
		                    <b><xsl:value-of select="//tei:resp[@xml:id='cod']"/>: </b><xsl:value-of select="//tei:name[@xml:id='TC']"/><br/>
		                    <b><xsl:value-of select="//tei:resp[@xml:id='comp']"/>: </b><xsl:value-of select="//tei:name[@xml:id='TC']"/><br/>
		                    <b><xsl:value-of select="//tei:resp[@xml:id='resp']"/>: </b><xsl:value-of select="//tei:name[@xml:id='GP']"/>, <xsl:value-of select="//tei:name[@xml:id='ES']"/><br/>
		                    <b><xsl:value-of select="//tei:resp[@xml:id='funz']"/>: </b><xsl:value-of select="//tei:name[@xml:id='MR']"/>
                        </p>
                    </div>

	                <div id="about2">

	                    <h3>Informazioni di pubblicazione e distribuzione:</h3>

                        <p>
                            <xsl:value-of select="//tei:availability/tei:p"/><xsl:value-of select="//tei:publicationStmt//tei:addrLine[@xml:id='labCD']"/>
                        </p>

                    </div>
                </div>
            </body>
        </html>
    </xsl:template>

    <xsl:template match="tei:bibl">
        <xsl:element name="p">
            <b>Titolo: </b><xsl:value-of select="tei:title[@type='custom']"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:figure">
        <xsl:element name="p">
            <b>Descrizione: </b><xsl:value-of select="tei:figDesc"/>
        </xsl:element>        
    </xsl:template>

    <xsl:template match="tei:notesStmt">
        <xsl:element name="p">
            <xsl:value-of select="tei:note"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:graphic">
        <xsl:variable name="fronte" select="@url"/>
        <xsl:element name="img">
            <xsl:attribute name="id">fotoF</xsl:attribute>
            <xsl:attribute name="src"><xsl:value-of select="$fronte"/></xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:facsimile/tei:surface">
        <xsl:variable name="retro" select="tei:graphic/@url"/>
        <xsl:variable name="num" select="@n"/>
        <xsl:for-each select=".">
            <xsl:element name="img">
                <xsl:attribute name="src"><xsl:value-of select="$retro"/></xsl:attribute>
                <xsl:attribute name="id">mappa<xsl:value-of select="$num"/></xsl:attribute>
                <xsl:attribute name="usemap">#map<xsl:value-of select="$num"/></xsl:attribute>
            </xsl:element>
            <xsl:element name="map">
                <xsl:attribute name="name">map<xsl:value-of select="$num"/></xsl:attribute>
                <xsl:if test="$num='40'">
                    <xsl:apply-templates select="//tei:TEI[@xml:id='C1']//tei:zone"/>
                </xsl:if>
                <xsl:if test="$num='50'">
                    <xsl:apply-templates select="//tei:TEI[@xml:id='C2']//tei:zone"/>
                </xsl:if>
                <xsl:if test="$num='223'">
                    <xsl:apply-templates select="//tei:TEI[@xml:id='C3']//tei:zone"/>
                </xsl:if>
            </xsl:element>
        </xsl:for-each>
    </xsl:template>

    <xsl:template match="tei:zone">
        <xsl:element name="area">       
            <xsl:attribute name="shape">rect</xsl:attribute>
            <xsl:attribute name="coords">
                <xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/>
            </xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:text//tei:div[@type='retro']">
        <xsl:variable name="var" select="@n"/>
        <xsl:element name="p">
            <xsl:attribute name="id">n<xsl:value-of select="$var"/></xsl:attribute>
            Codice identificativo: <xsl:value-of select="tei:div[@type='details']//tei:idno"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:attribute name="id">d<xsl:value-of select="$var"/></xsl:attribute>
            <xsl:value-of select="tei:div[@type='message']/tei:dateline"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:attribute name="id">m<xsl:value-of select="$var"/></xsl:attribute>
            <xsl:value-of select="tei:div[@type='message']/tei:p"/><br/>
            <xsl:value-of select="tei:div[@type='message']/tei:signed"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:attribute name="id">e<xsl:value-of select="$var"/></xsl:attribute>
            Editore: <xsl:value-of select="tei:div[@type='destination']//tei:stamp[@type='tipography1']//tei:mentioned"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:attribute name="id">s<xsl:value-of select="$var"/></xsl:attribute>
            <xsl:value-of select="tei:div[@type='destination']//tei:stamp[@type='tipography2']//tei:mentioned"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:attribute name="id">t<xsl:value-of select="$var"/></xsl:attribute>
            Timbro (parzialmente leggibile):<br/>
            <xsl:value-of select="tei:div[@type='destination']//tei:stamp[@type='postmark']//tei:mentioned"/>
            <xsl:value-of select="tei:div[@type='destination']//tei:stamp[@type='postmark']//tei:date"/>
        </xsl:element>
        <xsl:if test="$var='3'">
            <xsl:element name="p">
                <xsl:attribute name="id">c<xsl:value-of select="$var"/></xsl:attribute>
                <xsl:value-of select="//tei:TEI[@xml:id='C3']//tei:div[@type='destination']//tei:stamp[@xml:id='ce']"/>
            </xsl:element>
        </xsl:if>
        <xsl:element name="p">
            <xsl:attribute name="id">f<xsl:value-of select="$var"/></xsl:attribute>
            <xsl:value-of select="tei:div[@type='destination']//tei:stamp[@type='postage']"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:attribute name="id">i<xsl:value-of select="$var"/></xsl:attribute>
            <xsl:value-of select="tei:div[@type='destination']//tei:address"/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>