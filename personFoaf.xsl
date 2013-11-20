<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<rdf:RDF
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:bio="http://vocab.org/bio/0.1/"
  xmlns:dc="http://purl.org/dc/elements/1.1/" 
  xmlns:dcterms="http://purl.org/dc/terms/">
  <xsl:for-each select="add/doc">
   <xsl:if test="./field[@name='type'] = 'Person'">
     <foaf:Person>
      <xsl:if test="./field/@name = 'name'">
       <foaf:name><xsl:value-of select="./field[@name='name']" /></foaf:name>
      </xsl:if>
      <xsl:if test="./field/@name = 'given_name'">
       <foaf:firstName><xsl:value-of select="./field[@name='given_name']" /></foaf:firstName>
      </xsl:if>
      <xsl:if test="./field/@name = 'family_name'">
       <foaf:surname><xsl:value-of select="./field[@name='family_name']" /></foaf:surname>
      </xsl:if>
      <xsl:if test="./field/@name = 'date_begin'">
       <bio:Birth>
        <bio:date><xsl:value-of select="./field[@name='date_begin']" /></bio:date>
       </bio:Birth>
      </xsl:if>
      <xsl:if test="./field/@name = 'date_end'">
       <bio:Death>
        <bio:date><xsl:value-of select="./field[@name='date_end']" /></bio:date>
       </bio:Death>
      </xsl:if>
      <xsl:if test="./field/@name = 'bio'">
       <bio:biography><xsl:value-of select="./field[@name='bio']" /></bio:biography>
      </xsl:if>
      <xsl:if test="./field/@name = 'occupation'">
       <bio:Employment>
         <rdfs:label>
           <xsl:value-of select="./field[@name='occupation']" />
         </rdfs:label>
        </bio:Employment>
      </xsl:if>
      <xsl:if test="./field/@name = 'docid'">
       <dc:identifier><xsl:value-of select="./field[@name='docid']" /></dc:identifier>
      </xsl:if>
      <xsl:if test="./field/@name = 'prov_source'">
       <dc:source><xsl:value-of select="./field[@name='prov_source']" /></dc:source>
      </xsl:if>
     </foaf:Person>
    </xsl:if>
  </xsl:for-each>
</rdf:RDF>

</xsl:template>

</xsl:stylesheet>