<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

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
      <xsl:if test="./field/@name = 'prov_source'">
       <dc:source>
  		<xsl:attribute name="rdf:resource">
         <xsl:value-of select="./field[@name='prov_source']" />
        </xsl:attribute>
        <xsl:if test="./field/@name = 'prov_site_long'">
         <dc:title><xsl:value-of select="./field[@name='prov_site_long']" /></dc:title>
        </xsl:if>
        <xsl:if test="./field/@name = 'prov_site_short'">
         <dc:alternative><xsl:value-of select="./field[@name='prov_site_short']" /></dc:alternative>
        </xsl:if>
        <xsl:if test="./field/@name = 'prov_site_address'">
         <dc:source><xsl:value-of select="./field[@name='prov_site_address']" /></dc:source>
        </xsl:if>
        <xsl:if test="./field/@name = 'prov_site_tag'">
         <dc:description><xsl:value-of select="./field[@name='prov_site_tag']" /></dc:description>
        </xsl:if>
       </dc:source>
      </xsl:if>
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
        <dc:date><xsl:value-of select="./field[@name='date_begin']" /></dc:date>
       </bio:Birth>
      </xsl:if>
      <xsl:if test="./field/@name = 'date_end'">
       <bio:Death>
        <dc:date><xsl:value-of select="./field[@name='date_end']" /></dc:date>
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
      <xsl:for-each select="./field">
       <xsl:if test="./@name = 'document_history'">
        <dc:hasVersion><xsl:value-of select="." /></dc:hasVersion>
       </xsl:if>
      </xsl:for-each>
      <xsl:if test="./field/@name = 'provider_source'">
       <dc:source>
  		<xsl:attribute name="rdf:resource">
         <xsl:value-of select="./field[@name='provider_source']" />
        </xsl:attribute>
       </dc:source>
      </xsl:if>
      <xsl:if test="./field/@name = 'prov_doc_last_update'">
       <dc:dateSubmitted>
       	<dc:date>
       	 <xsl:value-of select="./field[@name='prov_doc_last_update']" />
       	</dc:date>
       </dc:dateSubmitted>
      </xsl:if>
     </foaf:Person>
    </xsl:if>
  </xsl:for-each>
</rdf:RDF>
</xsl:template>
</xsl:stylesheet>
