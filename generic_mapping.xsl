<?xml version="1.0" encoding="ISO-8859-1"?>

<xsl:stylesheet version="1.0"
xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="/">
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:huni="http://localhost/">
  <xsl:for-each select="add/doc">
   <xsl:if test="./field[@name='type'] = 'Act' or ./field[@name='type'] = 'Artefact'
   		or ./field[@name='type'] = 'Bibliography' or ./field[@name='type'] = 'Collection'
   		 or ./field[@name='type'] = 'Concept' or ./field[@name='type'] = 'Event'
   		  or ./field[@name='type'] = 'Film' or ./field[@name='type'] = 'Organisation'
   		   or ./field[@name='type'] = 'Person' or ./field[@name='type'] = 'Place'
   		    or ./field[@name='type'] = 'Production' or ./field[@name='type'] = 'Venue'
   		     or ./field[@name='type'] = 'Videos'">
     <xsl:element name="{concat('huni:', ./field[@name='type'])}">
      <xsl:for-each select="./field">
       <xsl:if test="@name = 'prov_source' or @name = 'prov_site_short' or @name = 'prov_site_address'
        or @name = 'prov_site_long' or @name = 'prov_site_tag' or @name = 'docid'
         or @name = 'prov_doc_last_update' or @name = 'document_history' or @name = 'provider_source'
          or @name = 'name' or @name = 'description' or @name = 'date_begin' or @name = 'date_end' 
           or @name = 'address' or @name = 'suburb' or @name = 'given_name' or @name = 'family_name' 
            or @name = 'bio' or @name = 'occupation' or @name = 'latitude' or @name = 'longitude'">
    	 <xsl:element name="{concat('huni:', @name)}">
    		<xsl:value-of select="." />
    	 </xsl:element>
       </xsl:if>
      </xsl:for-each>
     </xsl:element>
    </xsl:if>
  </xsl:for-each>
</rdf:RDF>

</xsl:template>

</xsl:stylesheet>
