xquery version "3.0" encoding "utf-8";

import module namespace gsp = "http://www.w3.org/TR/sparql11-http-rdf-update/" at
		"main/xquery/lib-gsp.xqy"; 

import module namespace test = "http://www.w3.org/TR/sparql11-protocol/test" at 
		"test/resources/xquery/test.xqy"; 

declare namespace st 	= "http://www.w3.org/2007/SPARQL/protocol-types#";

declare default function namespace "http://www.w3.org/2005/xpath-functions";

(: Returns the named graph. :)
gsp:retrieve-named-graph-metainfo($test:DATA_ENDPOINT_URI, 'http://www.books.com/harry-potter')
