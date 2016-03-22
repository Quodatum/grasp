xquery version "1.0" encoding "utf-8";

import module namespace impl = "http://basex.org/http" at "../main/xquery/lib-basex.xqy"; 

import module namespace gsp = "http://www.w3.org/TR/sparql11-http-rdf-update/" at "../main/xquery/lib-gsp.xqy"; 

import module namespace test = "http://www.w3.org/TR/sparql11-protocol/test" at "resources/xquery/test.xqy"; 
import module namespace http = "http://expath.org/ns/http-client";
declare namespace st = "http://www.w3.org/2007/SPARQL/protocol-types#";

declare default function namespace "http://www.w3.org/2005/xpath-functions";
let $query:='SELECT * {{?s ?p ?o}} LIMIT 10'
let $request as element() := 
	<request xmlns="http://expath.org/ns/http-client" method="post" 
	href="http://localhost:3030/test/query?query={encode-for-uri($query)}">
		<header name="accept" value="application/sparql-results+xml"/>
		<header name="user-agent" value="xqy-sparql-protocol-client/0.3"/>
		<header name="content-type" value="application/x-www-form-urlencoded"/>
		<header name="encoding" value="UTF-8"/>
	</request>
return
	http:send-request($request)
(:	impl:http-request($request):)