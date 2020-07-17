<?xml version="1.0" encoding="UTF-8" ?> 
    <xsl:stylesheet version="1.0"
        xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
        xmlns:tei="http://www.tei-c.org/ns/1.0"
        xmlns="http://www.w3.org/1999/xhtml">
    <xsl:output method="html" encoding="UTF-8" indent="yes"/>
    <xsl:preserve-space elements="p div" />
    
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

                <xsl:element name="div">
                    <xsl:attribute name="id">header</xsl:attribute>
                    <xsl:element name="h1">
                        <xsl:value-of select="//tei:title"/>
                    </xsl:element>
                    <xsl:element name="ul">
                        <xsl:attribute name="id">menu</xsl:attribute>
                        <xsl:element name="li">
                            <xsl:attribute name="id">menu0</xsl:attribute>
                            <xsl:element name="a">
                                <xsl:attribute name="href">main.html</xsl:attribute>
                                Home
                            </xsl:element>
                        </xsl:element>
                        <xsl:element name="li">
                            <xsl:attribute name="id">menu1</xsl:attribute>
                            Cartolina n.40
                        </xsl:element>
                        <xsl:element name="li">
                            <xsl:attribute name="id">menu2</xsl:attribute>
                            Cartolina n.50
                        </xsl:element>
                        <xsl:element name="li">
                            <xsl:attribute name="id">menu3</xsl:attribute>
                            Cartolina n.223
                        </xsl:element>
                        <xsl:element name="li">
                            <xsl:attribute name="id">menu4</xsl:attribute>
                            <xsl:element name="a">
                                <xsl:attribute name="href">#about</xsl:attribute>
                                About
                            </xsl:element>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>

                <xsl:element name="div">
                    <xsl:attribute name="id">intro</xsl:attribute>
                    <xsl:apply-templates select="//tei:projectDesc"/>
                </xsl:element>


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
                            <xsl:variable name="retro" select="tei:facsimile//tei:graphic/@url"/>
                            <xsl:variable name="num" select="tei:facsimile/tei:surface/@n"/>
                            <xsl:element name="img">
                                <xsl:attribute name="src"><xsl:value-of select="$retro"/></xsl:attribute>
                                <xsl:attribute name="id">mappa<xsl:value-of select="$num"/></xsl:attribute>
                                <xsl:attribute name="usemap">#map<xsl:value-of select="$num"/></xsl:attribute>
                            </xsl:element>
                            <xsl:element name="map">
                                <xsl:attribute name="name">map<xsl:value-of select="$num"/></xsl:attribute>
                                <xsl:apply-templates select="tei:facsimile//tei:zone"/>
                            </xsl:element>
                            <xsl:element name="div">
                                <xsl:attribute name="class">retro</xsl:attribute>
                                <xsl:apply-templates select="tei:text//tei:div[@type='retro']"/>
                            </xsl:element>
                            <xsl:choose>
                                <xsl:when test="$car='C1' or $car='C3'">
                                    <xsl:element name="div">
                                        <xsl:attribute name="id">informazioni</xsl:attribute>
                                        <h2>Informazioni</h2>
                                        <xsl:element name="div">
                                            <xsl:attribute name="class">info</xsl:attribute>
                                            <h3>Persone</h3>
                                            <xsl:apply-templates select="tei:teiHeader//tei:listPerson//tei:persName"/>
                                        </xsl:element>
                                        <xsl:element name="div">
                                            <xsl:attribute name="class">info</xsl:attribute>
                                            <h3>Luoghi</h3>
                                            <xsl:apply-templates select="tei:teiHeader//tei:listPlace//tei:placeName"/>
                                        </xsl:element>
                                        <xsl:element name="div">
                                            <xsl:attribute name="class">info</xsl:attribute>
                                            <h3>Interpretazioni</h3>
                                            <xsl:apply-templates select="tei:text//tei:choice"/>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:when>
                                <xsl:otherwise>
                                    <xsl:element name="div">
                                        <xsl:attribute name="id">informazioni2</xsl:attribute>
                                        <h2>Informazioni</h2>
                                        <xsl:element name="div">
                                            <xsl:attribute name="class">info2</xsl:attribute>
                                            <h3>Persone</h3>
                                            <xsl:apply-templates select="tei:teiHeader//tei:listPerson//tei:persName"/>
                                        </xsl:element>
                                        <xsl:element name="div">
                                            <xsl:attribute name="class">info2</xsl:attribute>
                                            <h3>Luoghi</h3>
                                            <xsl:apply-templates select="tei:teiHeader//tei:listPlace//tei:placeName"/>
                                        </xsl:element>
                                    </xsl:element>
                                </xsl:otherwise>
                            </xsl:choose>
                        </xsl:element>
                    </xsl:element>
                </xsl:for-each>

                <xsl:element name="div">
                    <xsl:attribute name="id">about</xsl:attribute>
                    <xsl:element name="div">
                        <xsl:attribute name="id">about1</xsl:attribute>
                        <h3>Edizione digitale:</h3>
                        <xsl:element name="p">
                            <xsl:apply-templates select="//tei:respStmt"/>
                        </xsl:element>
                    </xsl:element>
                    <xsl:element name="div">
                        <xsl:attribute name="id">about2</xsl:attribute>
                        <h3>Informazioni di pubblicazione e distribuzione:</h3>
                        <xsl:element name="p">
                            <xsl:value-of select="//tei:availability/tei:p"/><xsl:value-of select="//tei:publicationStmt//tei:addrLine[@xml:id='labCD']"/>
                        </xsl:element>
                    </xsl:element>
                </xsl:element>
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

    <xsl:template match="tei:zone">
        <xsl:element name="area">       
            <xsl:attribute name="shape">rect</xsl:attribute>
            <xsl:attribute name="coords">
                <xsl:value-of select="@ulx"/>,<xsl:value-of select="@uly"/>,<xsl:value-of select="@lrx"/>,<xsl:value-of select="@lry"/>
            </xsl:attribute>
            <xsl:attribute name="id"><xsl:value-of select="@xml:id"/></xsl:attribute>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:persName">
        <xsl:element name="p">     
           <xsl:apply-templates/><br/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:placeName">
        <xsl:element name="p">    
           <xsl:apply-templates/><br/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:choice">
        <xsl:element name="p">    
           <b><xsl:value-of select="tei:abbr"/></b>: <xsl:value-of select="tei:expan"/>
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
            Editore: <xsl:value-of select="tei:div[@type='destination']//tei:stamp[@type='tipografia1']//tei:mentioned"/>
        </xsl:element>
        <xsl:element name="p">
            <xsl:attribute name="id">s<xsl:value-of select="$var"/></xsl:attribute>
            <xsl:value-of select="tei:div[@type='destination']//tei:stamp[@type='tipografia2']//tei:mentioned"/>
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
            <xsl:apply-templates select="//tei:expan"/>
            <xsl:value-of select="tei:div[@type='destination']//tei:address"/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:expan">
        <xsl:element name="p">
            <xsl:attribute name="id">expan</xsl:attribute>
            <xsl:value-of select="."/>
        </xsl:element>
    </xsl:template>

    <xsl:template match="tei:respStmt">
        <xsl:element name="p">    
           <xsl:apply-templates/>
        </xsl:element>
    </xsl:template>

</xsl:stylesheet>
